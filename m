From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: Serious NAT problem
Date: Mon, 29 Mar 2004 11:59:53 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF5122F31@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Karol Tomala <ktomala@tgc.pl>, netfilter@lists.netfilter.org

Karol Tomala wrote:
> Hello!
> I have a question regarding netfilter. I have been looking for an
> answer for two days and I'm hopeless. That's why I have decided to
> ask for help here.
>=20
> I have a Mandrake Linux 9.2.1 internal router acting as a
> natbox/firewall. It has three NIC's:
> eth0 -> x.y.z.x (DMZ interface) [Doesn't matter for this issue]
> eth1 -> 172.18.12.0/255.255.252.0 (LAN interface)
> eth2 -> 10.128.2.64/255.255.255.224 (Client network)
>=20
> Here's a liitle graph showing the connections:
>=20
> [ Cisco 1700 ]        [ NATBOX/FIREWALL ]
> [ 10.128.2.65 ] <---> { eth2 }   { eth1 } <---> { LAN: 172.18.12.0 }
>=20
> Eth2 interface has IP number 10.128.2.66.
> Eth1 interface has IP number 172.18.15.125.
>=20
> I want to connect client's Cisco 1700 router via eth2 network.
> However I don't want a 1:1 NAT. I would like to NAT a few hosts from
> 172.18. network to 10.128.2. so client could easily connect to some
> of our servers without having access to the rest of our LAN.
>=20
> I have a host 172.18.5.2 that should be NAT'ed to 10.128.2.70. All
> traffic going to 10.128.2.70 should reach 172.18.5.2 transparently.
>=20
> I have been trying to configure NAT without much success.
>=20
> This is a part of my configuration:
>=20
> ### Netfilter
> echo 1 > /proc/sys/net/ipv4/ip_forward
> echo 0 > /proc/sys/net/ipv4/icmp_echo_ignore_all
>=20
> # Add route to 172.18.5.0/29 network
> ip route add 172.18.5.0/29 gw 172.18.15.254 dev eth1
>=20
> # Only for testing, will be changed when NAT works
> iptables -t filter -P INPUT ACCEPT
> iptables -t filter -P OUTPUT ACCEPT
> iptables -t filter -P FORWARD ACCEPT
>=20
> # NAT
> iptables -t nat -A POSTROUTING -o eth2 -s 172.18.5.2 -j SNAT
> --to-source=20
> 10.128.2.70
> iptables -t nat -A PREROUTING -i eth2 -d 10.128.2.70 -j DNAT
> --to-destination 172.18.5.2
>=20
> [cut]
>=20
> Unfortunatelly it's not working. I have lost two days on it, browsing
> through google and found nothing much helpful.
>=20
> I would like to achieve exactly the same as you can do in Cisco IOS
> with issuing command:
> ip nat inside static host 172.18.5.2 host 10.128.2.70
>=20
> I don't want to assign VLAN on my eth2 NIC with IP 10.128.2.70.
> (Reason for this is that NATBOX is acting as a firewall/natbox/vpn
> router and I would have to assign thousands of VLANs on my NICs). I
> would like the host 172.18.5.2 to be seen as 10.128.2.70 in the
> client's network.=20
>=20
> I can ping the Cisco router on 10.128.2.65 from 10.128.2.66 via eth2.
> I can ping 172.18.5.2 from 172.18.15.125 via eth1. Unfortunatelly NAT
> is not working. Pinging 10.128.2.70 from eth2 gives Destination Host
> Unreachable. tcpdump -i eth2 gives "arp who-has 10.128.2.70 tell
> 10.128.2.66". Nothing else happens. I cannot telnet to 10.128.2.70,
> but I can telnet to it by 172.18.5.2 IP number.
>=20
> What am I doing wrong? Please help me. I'm hopeless and don't know
> what to do. :(

1. If the default gateway on the 172 network is not your firewall, then
this will break, because replies to the 10 network will trickle through
your default router, not this firewall.

2. The DNAT rule is all you need if you just want to establishe
conntections TO the 172 network. The SNAT rule is all you need to
establishe connections TO the 10 network.

3. You must either bind the .70 address to your eth2, or you have to
proxy arp the address to the interface. Otherwise, requests for .70 in
the 10 network will return failure. EG:
ip addr add 10.128.2.70/16 dev eth2

