From: =?ISO-8859-1?Q?Fran=E7ois_Delawarde?=
 <fdelawarde@wirelessmundi.com>
Subject: SIP, NAT and Load Balancing problems
Date: Tue, 12 Dec 2006 19:15:50 +0100
Message-ID: <457EF1D6.3060701@wirelessmundi.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
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

Hello all,

I have a linux machine with a SIP server (Asterisk) and 2 WAN interfaces=20
(NATed) configured to do load balancing. I experienced problems with the=20
SIP/RTP protocols and load balancing, because when initiating a call to=20
an external SIP Host, a new RTP flow starts from the server to the Host,=20
that sometimes uses another default route (due to the nexthop=20
configuration). As i have two different public IPs, the external host=20
gets confused while receiving flows from different IPs, and doesn't work=20
(or sometimes we only have one-way communication).

            __________
           |          |-eth1---|Router ISP 1|---WAN 1
LAN---eth0-|SIP Server|
           |__________|-eth2---|Router ISP 2|---WAN 2


What I basicly want is to force all traffic from my SIP server to pass=20
by a unique WAN interface (eth2), or to find a solution that would force=20
multiple sessions from the same IP to use the same WAN interface.=20
Reading various forums and mailing lists, I decided to try to do "output=20
re-routing" to all traffic sent to the wrong interface:

(5060 is SIP port and 10000-20000 are the possible RTP ports)

1. using FWMARK and iproute2:

iptables -t mangle -A OUTPUT -o eth1 -p udp --sport 5060 -j MARK=20
--set-mark 0x101
iptables -t mangle -A OUTPUT -o eth1 -p udp --sport 10000:20000 -j MARK=20
--set-mark 0x101
ip rule add prio 101 fwmark 0x101 table 101
ip route add default via 192.168.2.1 dev eth2 src 192.168.2.2 table 101
iptables -t nat -A POSTROUTING -o eth1 -j MASQUERADE
iptables -t nat -A POSTROUTING -o eth2 -j MASQUERADE

The redirection is working, but the source port is changed by the=20
MASQUERADE, and this doesn't work with SIP/RTP, which contain reply=20
information (ip/port) inside its packets.


2. iptables ROUTE target:

iptables -t mangle -A OUTPUT -o eth1 -p udp --dport 5060 -j ROUTE --oif=20
eth2 --gw 192.168.2.1 --continue
iptables -t mangle -A OUTPUT -o eth1 -p udp --dport 10000:20000 -j ROUTE=20
--oif eth2 --gw 192.168.2.1 --continue
iptables -t nat -A POSTROUTING -o eth1 -j MASQUERADE
iptables -t nat -A POSTROUTING -o eth2 -j MASQUERADE

Even with SNAT or MASQUERADE rules, the source IP of the packet is not=20
changed when using these ROUTE targets, the router connected to eth2=20
then drops the packets.


Below you can find my network configuration (rules, routes and=20
addresses). Anyone has an idea of how i could resolve this problem?

Thanks,
Fran=E7ois.

