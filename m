From: Ralf Spenneberg <lists@spenneberg.org>
Subject: Re: Adding Telnet to a Working Setup
Date: 29 Aug 2003 09:11:54 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1062141113.1605.13.camel@kermit>
References: <023a01c36ca1$54a1f320$0500a8c0@emph05>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <023a01c36ca1$54a1f320$0500a8c0@emph05>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: alyn@emph.com
Cc: Netfilter <netfilter@lists.netfilter.org>

Hi,

Am Mit, 2003-08-27 um 15.44 schrieb Alyn Ashworth:
> I have a working iptables setup that uses the following script, and that =
I
> would like to change to allow telnet connexions from the local network
> (eth0) but nor from ppp0.
Going where? To the firewall or the external network?
>  Can anyone suggest the best way to do this
> (politely and in words of one sylable, please!), and I would also welcome
> any other comments on my script....
>=20
> #=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3DSCRIPT STARTS=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> # Load modules
> modprobe ip_tables
> modprobe ip_conntrack
> modprobe ip_conntrack_ftp
>=20
> # (1) Policies (default)
> iptables -P INPUT DROP
> iptables -P OUTPUT DROP
> iptables -P FORWARD DROP
>=20
> # (2) User-defined chain for ACCEPTed TCP packets - called okay
> iptables -N okay
> #next line would allow new connections
> #iptables -A okay -p TCP --syn -j ACCEPT
> iptables -A okay -p TCP -m state --state ESTABLISHED,RELATED -j ACCEPT
> iptables -A okay -p TCP -j DROP
>=20
> # (3) INPUT chain rules
>=20
> # Rules for incoming pakets from LAN
> iptables -A INPUT -p ALL -i eth0 -s 192.168.0.0/16 -j ACCEPT
Last rule allow telnet access to the firewall.

> iptables -A INPUT -p ALL -i lo -s 127.0.0.1 -j ACCEPT
> iptables -A INPUT -p ALL -i lo -s 192.168.0.0/16 -j ACCEPT
You do not need the last rule. Replace the last two with:
iptables -A INPUT -i lo -j ACCEPT
You trust everything on loopback.

>=20
> #Rules for incoming packets from the Internet
>=20
> #Packets for established connexions
> iptables -A INPUT -p ALL -i ppp0 -m state --state ESTABLISHED,RELATED -j
> ACCEPT
>=20
> #TCP rules (not used as pres as no services running over net)
>=20
> #UDP rules
> iptables -A INPUT -p UDP -i ppp0 -s 0/0 --destination-port 53 -j ACCEPT
> iptables -A INPUT -p UDP -i ppp0 -s 0/0 --destination-port 2074 -j ACCEPT
> iptables -A INPUT -p UDP -i ppp0 -s 0/0 --destination-port 4000 -j ACCEPT
>=20
> #ICMP rules
> iptables -A INPUT -p ICMP -i ppp0 -s 0/0 --icmp-type 8 -j ACCEPT
> iptables -A INPUT -p ICMP -i ppp0 -s 0/0 --icmp-type 11 -j ACCEPT
>=20
> # (4) FORWARD chain rules
> # Accept packets we want to forward
> iptables -A FORWARD -i eth0 -s 192.168.0.0/16 -j ACCEPT
> iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
Last two rules allow telnet access to the internet.

> # (5) OUTPUT chain rules
> # only output packets with local addreses (no spoofing)
> iptables -A OUTPUT -p ALL -s 127.0.0.1 -j ACCEPT
> iptables -A OUTPUT -p ALL -s 192.168.0.88 -j ACCEPT
> iptables -A OUTPUT -p ALL -s 192.168.0.0/24 -j ACCEPT
I do not know who 192.168.0.88 is. If it is the firewall, then this rule
 allows the firewall to answer to telnet, dns, whatever requests. Anyway,
you probably should add
iptables -A OUTPUT -m state --state RELATED,ESTABLISHED -m ACCEPT
This allows the firewall to answer all valid (see above) requests.
But I would strongly recommend to read some documents on (especially
stateful) firewalling, to understand whats going on.

> # (6) POSTROUTING chain rules
> iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE

Cheers,

Ralf
--=20
Ralf Spenneberg
RHCE, RHCX

Book: Intrusion Detection f=FCr Linux Server   http://www.spenneberg.com
IPsec-Howto				     http://www.ipsec-howto.org
Honeynet Project Mirror:                     http://honeynet.spenneberg.org

