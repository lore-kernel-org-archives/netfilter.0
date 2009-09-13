From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Blocking DHCP with ebtables
Date: Sun, 13 Sep 2009 21:52:00 +0200
Message-ID: <4AAD4D60.6000401@plouf.fr.eu.org>
References: <4AAC026A.9000208@softhome.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4AAC026A.9000208@softhome.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hello,

Eddie a =E9crit :
[...]
> # Drop everything and build up Input and Output to accept IP and ARP
> ebtables -P FORWARD DROP
> ebtables -P INPUT DROP
> ebtables -P OUTPUT DROP
> ebtables -A INPUT -p IPv4 -j ACCEPT
> ebtables -A INPUT -p ARP -j ACCEPT
> ebtables -A INPUT --log-level info --log-ip --log-prefix EBFW
> ebtables -A OUTPUT -p IPv4 -j ACCEPT
> ebtables -A OUTPUT -p ARP -j ACCEPT
> ebtables -A OUTPUT --log-level info --log-ip --log-arp --log-prefix E=
BFW=20
> -j DROP

Why log IP and ARP info after accepting IP and ARP packets ? Obviously,
only non-(IP or ARP) packets would reach the log rules, so there is no
IP or ARP information to log.

> #drop DHCP broadcast
> ebtables -A FORWARD -d ff:ff:ff:ff:ff:ff/ff:ff:ff:ff:ff:ff -p IPv4=20
> --ip-prot udp --ip-dport 67:68 --log-level info --log-ip --log-prefix=
=20
> EBFWbc -j DROP

What is this rule for ? The second rule below already matches all DHCP
traffic.

> ebtables -A FORWARD -p ipv4 --ip-proto tcp --ip-destination-port 67:6=
8=20
> --log-level info --log-ip --log-prefix EBFWtcp -j DROP

What is this rule for ? DHCP uses only UDP, not TCP.

> ebtables -A FORWARD -p ipv4 --ip-proto udp --ip-destination-port 67:6=
8=20
> --log-level info --log-ip --log-prefix EBFWudp -j DROP

[...]
> Sep 12 19:05:09 firewall kernel: EBFWbc IN=3Dtap0 OUT=3Deth1 MAC sour=
ce =3D=20
> 00:10:dc:e3:2e:64 MAC dest =3D ff:ff:ff:ff:ff:ff proto =3D 0x0800 IP=20
> SRC=3D192.168.8.22 IP DST=3D255.255.255.255, IP tos=3D0x00, IP proto=3D=
17 SPT=3D68=20
> DPT=3D67
> Sep 12 19:05:09 firewall dhcpd: DHCPINFORM from 192.168.8.22 via br0
[...]
> ebtables seems to want to block the packets, but dhcpd gets them anyw=
ay=20
> and responds.  Note that on both sides of the connection have dhcpd=20
> running on br0, on with different ranges. (both eth1 and tap0 are=20
> bridged to br0)

As in iptables, the FORWARD chain sees only bridged packets. Packets
received by the local host go through the INPUT chain, and
locally-generated packets go through the OUTPUT table.

The broadcast DHCP request is both bridged through the FORWARD chain an=
d
received locally through the INPUT chain. Your ruleset drops only the
copy in the FORWARD chain, not the one in the INPUT chain which is
received by the local dhcpd. The locally-generated DHCP reply is sent
through the OUTPUT chain and is not dropped either.

Bottom line : you must drop DHCP traffic on the TAP interface in the
INPUT and OUTPUT chains too. Or drop it on the "main side".
