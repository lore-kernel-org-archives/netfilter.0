From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Help with IPtables and NAT
Date: Sat, 22 Jul 2006 02:58:46 +0200
Message-ID: <44C17846.4080403@plouf.fr.eu.org>
References: <44C16109.20704@jemconsult.biz>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <44C16109.20704@jemconsult.biz>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

Hello,

James Marcinek a =E9crit :
[...]
> This is my latest concoction:
>=20
> # First drop everything (lets you open what you want)
> iptables -P INPUT DROP
> iptables -P OUTPUT DROP
> iptables -P FORWARD DROP

So far so good.

> iptables -t nat -P PREROUTING DROP
> iptables -t nat -P POSTROUTING DROP

This is wrong, *very* wrong. The 'nat' table is not intended to do any=20
filtering, so you don't want to set the default policy of any nat chain=20
to DROP. Trust me. (Sometimes I wonder why the DROP default policy is=20
allowed in the nat chains.)

> # PREROUTING chain rules
> # iptables -t nat -i PREROUTING 1 -d 172.10.10.2 -j LOG --loglevel debu=
g
> iptables -t nat -A PREROUTING -d 172.10.10.2 -p tcp --dport 80 -j DNAT=20
> --to-dest 192.168.0.2
> iptables -t nat -A PREROUTING -d 172.10.10.2 -p tcp --dport 443 -j DNAT=
=20
> --to-dest 192.168.0.2
[and so on]

Since you want to DNAT 172.10.10.2 to 192.168.0.2, I suggest you write a=20
single rule for all protocols and ports :

iptables -t nat -A PREROUTING -d 172.10.10.2 -j DNAT --to 192.168.0.2

Then you add rules in the filter FORWARD chain to do the filtering, just=20
like you did in the filter INPUT chain.

> iptables -t nat -A PREROUTING -d 172.10.10.2 -p udp --dport 53 -j DNAT=20
> --to-dest 192.168.0.2
> iptables -t nat -A PREROUTING -d 172.10.10.2 -p udp --dport 53 -j DNAT=20
> --to-dest 192.168.0.2

Here you have twice the same rule. Shouldn't one be for TCP (DNS can use=20
either TCP our UDP) ?

> # User-defined chain for ACCEPTed TCP packets
> iptables -N okay
> iptables -A okay -p TCP --syn -j ACCEPT
> iptables -A okay -p TCP -m state --state ESTABLISHED,RELATED -j ACCEPT
> iptables -A okay -p TCP -j DROP

It does not really matter, but I don't fully understant the purpose of=20
this chain.

> # INPUT chain rules
> iptables -A INPUT -p ALL -i eth1 -s 192.168.0.0/24 -j ACCEPT
> iptables -A INPUT -p ALL -i lo -s 127.0.0.1 -j ACCEPT
> iptables -A INPUT -p ALL -i lo -s 192.168.0.1 -j ACCEPT
> iptables -A INPUT -p ALL -i lo -s 172.10.10.1 -j ACCEPT
> iptables -A INPUT -p ALL -i lo -s 172.10.10.2 -j ACCEPT

You forgot the whole 127.0.0.0/8 subnet which can be used on the=20
loopback interface. Anyway, why don't you just allow all traffic on the=20
loopback interface ?

> iptables -A INPUT -p ALL -i eth1 -d 192.168.0.255 -j ACCEPT

Useless : 192.168.0.255 belongs to 192.168.0.0/24.

> # Rules for incoming packets from the Internet
>=20
> # Packets for established connections
> iptables -A INPUT -p ALL -d 172.10.10.1 -m state --state=20
> ESTABLISHED,RELATED -j ACCEPT
> iptables -A INPUT -p ALL -d 172.10.10.2 -m state --state=20
> ESTABLISHED,RELATED -j ACCEPT

If all traffic on 172.10.10.2 is redirected to 192.168.0.2, this last=20
rule becomes useless.

> # TCP rules
[...]

> # UDP rules
> iptables -A INPUT -p UDP -i eth0 -s 0/0 --destination-port 53 -j ACCEPT
[...]

As DNS can also use TCP, I'd expect a rule accepting TCP port 53.

> # ICMP rules
>=20
> # FORWARD chain rules
> iptables -A FORWARD -i eth1 -j ACCEPT
> iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
>=20
> # iptables -A FORWARD -i eth0 -d 192.168.0.2 -j ACCEPT

Ok, you don't want to accept all traffic redirected to 192.168.0.2. So=20
you have to add rules to accept some protocols/ports. E.g. :

iptables -A FORWARD -i eth0 -d 192.168.0.2 -p tcp --dport 80 -j ACCEPT

> # OUTPUT chain rules
> iptables -A OUTPUT -p ALL -s 127.0.0.1 -j ACCEPT
> iptables -A OUTPUT -p ALL -s 192.168.0.1 -j ACCEPT
> iptables -A OUTPUT -p ALL -s 172.10.10.1 -j ACCEPT

Same remark as above about 127.0.0.0/8.
By the way, why do you need to filter the source address in OUTPUT ?=20
This could break things like the REJECT target if you used it.

> # iptables -A OUTPUT -p ALL -s 172.10.10.2 -j ACCEPT
> iptables -t nat -A OUTPUT -d 172.10.10.2 -p ALL -j DNAT --to-destinatio=
n=20
> 192.168.0.2
>=20
> # POSTROUTING
> iptables -t nat -A POSTROUTING -s 192.168.0.2 -j SNAT --to-source=20
> 172.10.10.2
> iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to-source 172.10.10.1

