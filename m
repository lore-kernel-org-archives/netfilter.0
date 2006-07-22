From: Guillaume <silencer@free-4ever.net>
Subject: Re: Help with IPtables and NAT
Date: Sat, 22 Jul 2006 10:23:11 +0200
Message-ID: <44C1E06F.1080803@free-4ever.net>
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

James Marcinek a =E9crit :
> Hello Everyone,
>=20
> I've been running my Red Hat box as a router for my small network for=20
> the past couple of years with no problems (if it works don't fix it). I=
=20
> have another live IP address that I would like use. I would like any=20
> traffic destined for this 'new' address to forward (DNAT) traffic to a=20
> system in my intranet. I don't want to blindly allow all traffic, just=20
> certain ones based off of rules. I have attempted to do this a couple o=
f=20
> time but without success. Below is my current topology (real IP's have=20
> been substituted for 172.10.10.x addresses:
>=20
>=20
>=20
>                                                                       =20
>                   Internet
>                                                                      =20
>                          |
>                                                                       =20
>                         |
>                                                                       =20
>                         |
>                                                                       =20
>           -------------------------
>                                                                       =20
>           | 172.10.10.1 eth0        |
>                                                                       =20
>           |                                    |
>                                                                       =20
>           |                                    |
>                                                                       =20
>           | 192.168.0.1 eth1         |
>                                                                       =20
>           -------------------------
>                                                                       =20
>                          |
>                                                                       =20
>                          |
>                                                                       =20
>                          |
>                                                                       =20
>                 Intranet (private network)
>=20
>=20
> Here's what I would like to have:
>=20
>                                                                       =20
>                   Internet
>                                                                      =20
>                          |
>                                                                       =20
>                         |
>                                                                       =20
>                         |
>                                                                       =20
>           -------------------------
>                                                                       =20
>           | 172.10.10.1 eth0        |
>                                                                       =20
>           | 172.10.10.2 eth0:0     |
>                                                                       =20
>           |                                    |
>                                                                       =20
>           | 192.168.0.1 eth1        |
>                                                                       =20
>           -------------------------
>                                                                       =20
>                          |
>                                                                       =20
>                          |
>                                                                       =20
>                          |
>                                                                       =20
>                 Intranet (private network)
>                                                                       =20
>                          |
>                                                                       =20
>                         =20
> ----------------------------------------->172.10.10.2 traffic to=20
> 192.168.0.2
>=20
> I have bound the 2 IP addresses to the external NIC on my system (RHEL=20
> 4). I have attempted at modifying the script and have reverted to my=20
> original to start over. Here's my current config:
>=20
> # First drop everything (lets you open what you want)
> iptables -P INPUT DROP
> iptables -P OUTPUT DROP
> iptables -P FORWARD DROP
>=20
> # User-defined chain for ACCEPTed TCP packets
> iptables -N okay
> iptables -A okay -p TCP --syn -j ACCEPT
> iptables -A okay -p TCP -m state --state ESTABLISHED,RELATED -j ACCEPT
> iptables -A okay -p TCP -j DROP
>=20
> # INPUT chain rules
> iptables -A INPUT -p ALL -i eth1 -s 192.168.0.0/24 -j ACCEPT
> iptables -A INPUT -p ALL -i lo -s 127.0.0.1 -j ACCEPT
> iptables -A INPUT -p ALL -i lo -s 192.168.0.1 -j ACCEPT
> iptables -A INPUT -p ALL -i lo -s 172.10.10.1 -j ACCEPT
> iptables -A INPUT -p ALL -i eth1 -d 192.168.0.255 -j ACCEPT
>=20
> # Rules for incoming packets from the Internet
>=20
> # Packets for established connections
> iptables -A INPUT -p ALL -d 172.10.10.1 -m state --state=20
> ESTABLISHED,RELATED -j ACCEPT
>=20
> # TCP rules
> iptables -A INPUT -p TCP -i eth0 -s 0/0 --destination-port 21 -j okay
> iptables -A INPUT -p TCP -i eth0 -s 0/0 --destination-port 22 -j okay
> iptables -A INPUT -p TCP -i eth0 -s 0/0 --destination-port 25 -j okay
> iptables -A INPUT -p TCP -i eth0 -s 0/0 --destination-port 80 -j okay
> iptables -A INPUT -p TCP -i eth0 -s 0/0 --destination-port 443 -j okay
> iptables -A INPUT -p TCP -i eth0 -s 0/0 --destination-port 953 -j okay
> iptables -A INPUT -p TCP -i eth0 -s 0/0 --destination-port 993 -j okay
>=20
> # UDP rules
> iptables -A INPUT -p UDP -i eth0 -s 0/0 --destination-port 53 -j ACCEPT
> iptables -A INPUT -p UDP -i eth0 -s 0/0 --destination-port 2074 -j ACCE=
PT
> iptables -A INPUT -p UDP -i eth0 -s 0/0 --destination-port 4000 -j ACCE=
PT
> iptables -A INPUT -p UDP -i eth0 -s 0/0 --destination-port 953 -j ACCEP=
T
>=20
> # ICMP rules
>=20
> # FORWARD chain rules
> iptables -A FORWARD -i eth1 -j ACCEPT
> iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
>=20
>=20
> # OUTPUT chain rules
> iptables -A OUTPUT -p ALL -s 127.0.0.1 -j ACCEPT
> iptables -A OUTPUT -p ALL -s 192.168.0.1 -j ACCEPT
> iptables -A OUTPUT -p ALL -s 172.10.10.1 -j ACCEPT
>=20
> # POSTROUTING
> iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to-source 172.10.10.1
>=20
> ###################
>=20
> This has been working fine for me. I've been modifying it and things=20
> haven't been going well for me I have to say. Would I would like to do=20
> is forward any traffic that is going to eth0:0 and send it to an=20
> internal system. I don't want everything open on this system. This is m=
y=20
> latest concoction:
>=20
> # First drop everything (lets you open what you want)
> iptables -P INPUT DROP
> iptables -P OUTPUT DROP
> iptables -P FORWARD DROP
> iptables -t nat -P PREROUTING DROP
> iptables -t nat -P POSTROUTING DROP
>=20
> # PREROUTING chain rules
> # iptables -t nat -i PREROUTING 1 -d 172.10.10.2 -j LOG --loglevel debu=
g
> iptables -t nat -A PREROUTING -d 172.10.10.2 -p tcp --dport 80 -j DNAT=20
> --to-dest 192.168.0.2
> iptables -t nat -A PREROUTING -d 172.10.10.2 -p tcp --dport 443 -j DNAT=
=20
> --to-dest 192.168.0.2
> iptables -t nat -A PREROUTING -d 172.10.10.2 -p tcp --dport 21 -j DNAT=20
> --to-dest 192.168.0.2
> iptables -t nat -A PREROUTING -d 172.10.10.2 -p tcp --dport 22 -j DNAT=20
> --to-dest 192.168.0.2
> iptables -t nat -A PREROUTING -d 172.10.10.2 -p tcp --dport 25 -j DNAT=20
> --to-dest 192.168.0.2
> iptables -t nat -A PREROUTING -d 172.10.10.2 -p tcp --dport 953 -j DNAT=
=20
> --to-dest 192.168.0.2
> iptables -t nat -A PREROUTING -d 172.10.10.2 -p tcp --dport 993 -j DNAT=
=20
> --to-dest 192.168.0.2
> iptables -t nat -A PREROUTING -d 172.10.10.2 -p udp --dport 53 -j DNAT=20
> --to-dest 192.168.0.2
> iptables -t nat -A PREROUTING -d 172.10.10.2 -p udp --dport 53 -j DNAT=20
> --to-dest 192.168.0.2
>=20
> # User-defined chain for ACCEPTed TCP packets
> iptables -N okay
> iptables -A okay -p TCP --syn -j ACCEPT
> iptables -A okay -p TCP -m state --state ESTABLISHED,RELATED -j ACCEPT
> iptables -A okay -p TCP -j DROP
>=20
> # INPUT chain rules
> iptables -A INPUT -p ALL -i eth1 -s 192.168.0.0/24 -j ACCEPT
> iptables -A INPUT -p ALL -i lo -s 127.0.0.1 -j ACCEPT
> iptables -A INPUT -p ALL -i lo -s 192.168.0.1 -j ACCEPT
> iptables -A INPUT -p ALL -i lo -s 172.10.10.1 -j ACCEPT
> iptables -A INPUT -p ALL -i lo -s 172.10.10.2 -j ACCEPT
> iptables -A INPUT -p ALL -i eth1 -d 192.168.0.255 -j ACCEPT
>=20
> # Rules for incoming packets from the Internet
>=20
> # Packets for established connections
> iptables -A INPUT -p ALL -d 172.10.10.1 -m state --state=20
> ESTABLISHED,RELATED -j ACCEPT
> iptables -A INPUT -p ALL -d 172.10.10.2 -m state --state=20
> ESTABLISHED,RELATED -j ACCEPT
>=20
> # TCP rules
> iptables -A INPUT -p TCP -i eth0 -s 0/0 --destination-port 21 -j okay
> iptables -A INPUT -p TCP -i eth0 -s 0/0 --destination-port 22 -j okay
> iptables -A INPUT -p TCP -i eth0 -s 0/0 --destination-port 25 -j okay
> iptables -A INPUT -p TCP -i eth0 -s 0/0 --destination-port 80 -j okay
> iptables -A INPUT -p TCP -i eth0 -s 0/0 --destination-port 443 -j okay
> iptables -A INPUT -p TCP -i eth0 -s 0/0 --destination-port 953 -j okay
> iptables -A INPUT -p TCP -i eth0 -s 0/0 --destination-port 993 -j okay
>=20
> # UDP rules
> iptables -A INPUT -p UDP -i eth0 -s 0/0 --destination-port 53 -j ACCEPT
> iptables -A INPUT -p UDP -i eth0 -s 0/0 --destination-port 2074 -j ACCE=
PT
> iptables -A INPUT -p UDP -i eth0 -s 0/0 --destination-port 4000 -j ACCE=
PT
> iptables -A INPUT -p UDP -i eth0 -s 0/0 --destination-port 953 -j ACCEP=
T
>=20
> # ICMP rules
>=20
> # FORWARD chain rules
> iptables -A FORWARD -i eth1 -j ACCEPT
> iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
>=20
> # iptables -A FORWARD -i eth0 -d 192.168.0.2 -j ACCEPT
>=20
> # OUTPUT chain rules
> iptables -A OUTPUT -p ALL -s 127.0.0.1 -j ACCEPT
> iptables -A OUTPUT -p ALL -s 192.168.0.1 -j ACCEPT
> iptables -A OUTPUT -p ALL -s 172.10.10.1 -j ACCEPT
> # iptables -A OUTPUT -p ALL -s 172.10.10.2 -j ACCEPT
> iptables -t nat -A OUTPUT -d 172.10.10.2 -p ALL -j DNAT --to-destinatio=
n=20
> 192.168.0.2
>=20
> # POSTROUTING
> iptables -t nat -A POSTROUTING -s 192.168.0.2 -j SNAT --to-source=20
> 172.10.10.2
> iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to-source 172.10.10.1
>=20
> I put all of the ports that I want allowed to go to the internal system=
=20
> in the PREROUTING table. Is this the right way to do it? I would hope=20
> that somebody can look at this and tell me what I'm doing wrong and wha=
t=20
> I'm missing.
>=20
> Thanks,
>=20
> James
>=20
>=20
>=20

Hi

I think you 2 problems in your rules:
  - The chains in NAT table must not be set to drop. NO filtering in nat=20
table.
  - You forgot to add the rules to autorise traffic coming from eth0:0=20
to your internal host. After a DNAT rule, you need to explicitely=20
autorise the corresponding traffic.
Ab i think, I've don't read any rule related to that.

For example, you set this rule:
iptables -t nat -A PREROUTING -d 172.10.10.2 -p tcp --dport 80 -j DNAT=20
--to-dest 192.168.0.2
You must set this rule:
iptables -t filter -A FORWARD -i eth0:0 -p tcp -d 192.168.0.2 --dport 80=20
-j ACCEPT
And the same for all incoming traffics.

Regards
Guillaume


--=20
Guillaume
E-mail: silencer_<at>_free-4ever_<dot>_net
Blog: http://guillaume.free-4ever.net
----
Site: http://www.free-4ever.net

