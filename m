From: Amos Jeffries <squid3@treenet.co.nz>
Subject: Re: Gateway with Iptables
Date: Mon, 29 Oct 2007 21:20:41 +1300
Message-ID: <472597D9.1050003@treenet.co.nz>
References: <472568A2.3040002@liqwidkrystal.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <472568A2.3040002@liqwidkrystal.com>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: Tarak Ranjan <tarak.ranjan@liqwidkrystal.com>
Cc: netfilter@vger.kernel.org

Tarak Ranjan wrote:
> Hi List,
> i have a proxy server, when i enable the proxy my mail clients are no=
t=20
> able to send/receive mail. here is my iptables. please help me with t=
he=20
> necessary changes.
>=20
> #####################################################################=
########=20
>=20
>=20
> # Internet Interface
> INET_IFACE=3D"eth1"
> INET_ADDRESS=3D"x.x.x.x"
> # Local Interface Information
> LOCAL_IFACE=3D"eth0"
> LOCAL_IP=3D"192.168.1.3"
> LOCAL_NET=3D"192.168.1.0/24"
> LOCAL_BCAST=3D"192.168.1.255"
> # Localhost Interface
> LO_IFACE=3D"lo"
> LO_IP=3D"127.0.0.1"
> #SQUID
> SQUID_SERVER=3D=93192.168.1.3?
> SQUID_PORT=3D"8080"
> echo "SSH Blocking.........."
> $IPT -A INPUT -p tcp -s 192.168.1.210 -d 0/0 --dport 22 -j ACCEPT
> $IPT -A INPUT -p tcp -s 192.168.1.123 -d 0/0 --dport 22 -j ACCEPT
> $IPT -A INPUT -p tcp -s 192.168.1.37 -d 0/0 --dport 22 -j ACCEPT
> $IPT -A FORWARD -i $LOCAL_IFACE -o $INET_IFACE -p tcp -s 192.168.1.12=
3=20
> -d 0/0 --dport 22 -j ACCEPT
> $IPT -A FORWARD -i $LOCAL_IFACE -o $INET_IFACE -p tcp -s 192.168.1.37=
 -d=20
> 0/0 --dport 22 -j ACCEPT
> #$IPT -A FORWARD -i $LOCAL_IFACE -o $INET_IFACE -p tcp -s 192.168.1.3=
7=20
> -d 0/0 --dport 22 -j ACCEPT
> $IPT -A FORWARD -i $LOCAL_IFACE -o $INET_IFACE -p tcp -s 192.168.1.21=
0=20
> -d 0/0 --dport 22 -j ACCEPT
> $IPT -A FORWARD -i $LOCAL_IFACE -o $INET_IFACE -p tcp -s 192.168.1.0/=
24=20
> -d 0/0 --dport 22 -j DROP
> #$IPT -A OUTPUT -i $LOCAL_IFACE -o $INET_IFACE -p tcp -s 192.168.1.38=
 -d=20
> 0/0 --dport 22 -j ACCEP
>=20
> $IPT -A FORWARD -p tcp -s 0/0 -d x.x.x.y/32 --destination-port 25 --s=
yn=20
> -j ACCEPT
> #$IPT -t nat -A PREROUTING -i eth1 -p tcp --dport 25 -j DNAT --to=20
> 192.168.1.100:25
> #$IPT -A FORWARD -p tcp -d 192.168.1.100 --dport 25 -j ACCEPT
> $IPT -A INPUT -p tcp -s 0/0 --dport 22 -j DROP
> $IPT -A INPUT -p tcp -s 0/0 --dport 3306 -j DROP
> #$IPT -A FORWARD -p tcp -d 0/0 -s 0/0 --dport 80 -j DROP
> $IPT -A INPUT -p tcp -s 0/0 --dport 111 -j DROP
> $IPT -A INPUT -p tcp -s 0/0 --dport 199 -j DROP
> $IPT -A INPUT -p tcp -s 0/0 --dport 443 -j ACCEPT
> #
> # This chain is used with a private network to prevent forwarding for
> # requests on specific protocols. Applied to the FORWARD rule from
> # the internal network. Ends with an ACCEPT
>=20
> # Block IRC
> $IPT -A tcp_outbound -p TCP -s 0/0 --destination-port 194 -j REJECT
>=20
> # Block Outbound Telnet
> $IPT -A tcp_outbound -p TCP -s 0/0 --destination-port 23 -j REJECT
>=20
> # Block SSH
> $IPT -A tcp_outbound -p TCP -s 0/0 --destination-port 22 -j REJECT
>=20
> # Block Usenet Access
> $IPT -A tcp_outbound -p TCP -s 0/0 --destination-port 119 -j REJECT
>=20
>=20
> # No match, so ACCEPT
> $IPT -A tcp_outbound -p TCP -s 0/0 -j ACCEPT
>=20
> # Allow all on localhost interface
> $IPT -A INPUT -p ALL -i $LO_IFACE -j ACCEPT
>=20
> # Drop bad packets
> $IPT -A INPUT -p ALL -j bad_packets
> $IPT -A INPUT -p ALL -d 224.0.0.1 -j DROP
> # The rule to# Rules for the private network (accessing gateway syste=
m=20
> itself)
> $IPT -A INPUT -p ALL -i $LOCAL_IFACE -s $LOCAL_NET -j ACCEPT
> $IPT -A INPUT -p ALL -i $LOCAL_IFACE -d $LOCAL_BCAST -j ACCEPT
>=20
>=20
> # Inbound Internet Packet Rules
>=20
> # Accept Established Connections
> $IPT -A INPUT -p ALL -i $INET_IFACE -m state --state ESTABLISHED,RELA=
TED \
> -j ACCEPT
>=20
> # broadcast protocols.
> $IPT -A INPUT -m pkttype --pkt-type broadcast -j DROP
>=20
> # Log packets that still don't match
> $IPT -A INPUT -j LOG --log-prefix "fp=3DINPUT:99 a=3DDROP "
> # Used if forwarding for a private network
>=20
> # Drop bad packets
> $IPT -A FORWARD -p ALL -j bad_packets
>=20
> # Accept TCP packets we want to forward from internal sources
> $IPT -A FORWARD -p tcp -i $LOCAL_IFACE -j tcp_outbound
>=20
> # Accept UDP packets we want to forward from internal sources
> $IPT -A FORWARD -p udp -i $LOCAL_IFACE -j udp_outbound
>=20
> # If not blocked, accept any other packets from the internal interfac=
e
> $IPT -A FORWARD -p ALL -i $LOCAL_IFACE -j ACCEPT
>=20
> # Deal with responses from the internet
> $IPT -A FORWARD -i $INET_IFACE -m state --state ESTABLISHED,RELATED \
> -j ACCEPT
>=20
> # Log packets that still don't match
> $IPT -A FORWARD -j LOG --log-prefix "fp=3DFORWARD:99 a=3DDROP "
> #####################################################################=
#######=20
>=20
> #Redirect all 80 port request to 8080 SQUID PROXY Added By TARAK
> # DNAT port 80 request comming from LAN systems to squid 3128=20
> ($SQUID_PORT) aka transparent proxy
>=20

I believe you need to exempt the traffic from squid (local machine IPA)=
=20
from the REDIRECT about here.

$IPT -A PREROUTING -p tcp -s $SQUID_SERVER --dport 80 -j ACCEPT

=2E.. And use "http port 8080 transparent" in the squid.conf

> #$IPT -t nat -A PREROUTING -p tcp -i eth1 --dport 80 -j REDIRECT=20
> --to-ports $SQUID_PORT
> #$IPT -t nat -A POSTROUTING -o eth1 -s $LOCAL_NET -j MASQUERADE
> #$IPT -A FORWARD -s $LOCAL_NET -d $SQUID_SERVER -i eth1 -o eth0 -p tc=
p=20
> --dport $SQUID_PORT -j ACCEPT
> $IPT -t nat -A PREROUTING -i eth1 -p tcp --dport 80 -j REDIRECT=20
> --to-port $SQUID_PORT
> #####################################################################=
##########=20
>=20
> $IPT -A OUTPUT -m state -p icmp --state INVALID -j DROP
> $IPT -A OUTPUT -p ALL -s $LOCAL_IP -j ACCEPT
> $IPT -A OUTPUT -p ALL -o $LOCAL_IFACE -j ACCEPT
>=20
> # To internet
> $IPT -A OUTPUT -p ALL -o $INET_IFACE -j ACCEPT
>=20
> # Log packets that still don't match
> $IPT -A OUTPUT -j LOG --log-prefix "fp=3DOUTPUT:99 a=3DDROP "
>=20
>=20

Amos
