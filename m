From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: Masqureading issues... packets go over wrong link
Date: Mon, 16 Aug 2004 15:36:33 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF5679483@alderaan.smgtec.com>
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
To: dravya <dravya@magma.ca>, Netfilter mailing list <netfilter@lists.netfilter.org>

#1 is used when you are routing packets to/from a network behind the
firewall, so in the diagram:

(D* Internet1) -|
                |-firewall-(S* Internal1)
(D* Internet2) -|

Internal1 outgoing traffic will be evenly balanced between Internet1 and
Internet2. These rules don't equalize or properly route traffic
originating from the firewall itself


#2 is used when you want to evenly balance the traffic coming from the
firewall machine only.

(D* Internet1) -|
                |-(S* firewall)-Internal1
(D* Internet2) -|

If you're trying to deal with balancing inbound connections, this is a
completely different ballgame. It's dependent on how much you'd like to
spend, your ISP, and each channel's bandwidth.


>> MY_POLICY_ETH0=3D1
>> MY_POLICY_ETH1=3D2
>> MY_POLICY_DEFAULT=3D2
>=20
> Where exactly do I define the above policies?

This policy just equates to the Linux internal MARK variable. All
packets are assigned a MARK value inside the kernel. In this situation,
we use it in netfilter to tell iproute2 how to route the packet.
iproute2 cannot properly route the packet without netfilter telling it
how. This is described briefly in previous emails. You can define any
u16(?) number as your policy. The only hitch is that both netfilter and
iproute2 must have the same number. I will setup a REALLY simple example
of how this works.

#
# ip route list table 1
#
1.1.1.1/24 dev ppp0  scope link=20
2.2.2.2/24 dev ppp1  scope link=20
10.0.0.0/8 dev eth0 scope link
127.0.0.0/8 dev lo  scope link=20
default via 1.1.1.254 dev ppp0


#
# ip route list table 2
#
1.1.1.1/24 dev ppp0  scope link=20
2.2.2.2/24 dev ppp1  scope link=20
10.0.0.0/8 dev eth0 scope link
127.0.0.0/8 dev lo  scope link=20
default via 2.2.2.254 dev ppp1

#
# ip rule list # ** This is where our routing policy lines up with our
netfilter MARK rule **
#
29148:  from all fwmark 1 lookup 1=20
29149:  from all fwmark 2 lookup 2
32766:  from all lookup main=20
32767:  from all lookup 253

#
# cat firewall_script
#
iptables -t mangle -A PREROUTING -j CONNMARK --restore-mark
iptables -t mangle -A PREROUTING -m mark ! --mark 0 -j ACCEPT
iptables -t mangle -A PREROUTING -m mark ! --mark 0 -p tcp --dport 80 -j
MARK 1
iptables -t mangle -A PREROUTING -m mark ! --mark 0 -j MARK 2
iptables -t mangle -A PREROUTING -j CONNMARK --save-mark
iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE
iptables -t nat -A POSTROUTING -o ppp1 -j MASQUERADE

When anyone from the 10.0.0.0/24 subnet tries to send data through this
gateway/firewall, the firewall needs to decide what path to take.
Instead of letting iproute2 use the default interface, we use the MARK
rules to explicitly say where the packets are going.=20
So, the example makes:
	All traffic on TCP port 80 use the iproute2 table #1
	All traffic not on TCP port 80 use the iproute2 table #2

This has nothing to do with load-balancing, but I hope it shold explain
how policy routing works in Linux.

>> iptables -t mangle -A PREROUTING -j CONNMARK --save-mark
>=20
>> iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
>> iptables -t nat -A POSTROUTING -o eth1 -j MASQUERADE
>=20
> and even though we are marking the packets, we need to MASQUERADE it?
> Wasn't the original problem with Masquerading? How does this solve
> the problem of packets going on the wrong link? I thought marking the
> packets was a substitute for Masquerading. Is my thinking all wrong???

The problem isn't solely with MASQUERADE. MASQ doesn't assign the ip
address of the interface. It assigns the IP address that linux routing
wants it to take.
Preforming all this policy routing 'stuff' forces all traffic that's
'supposed' to use an interface to do so.

If I'm dealing with an FTP session, I can have 1-n different ports open
at any time. If I have your ruleset, there's no stopping linux routing
from spitting that FTP session out of both ppp interfaces. Since its
equalized, you'd have half the packets travelling over each outbound
interface.  Inbound, all the traffic would flow back through the same
ppp interface.=20

> and only one routing table with two default routes??

Having one routing table means that the Linux routing core has the last
word in how all packets are routed. When you start using 'ip rule add'
and 'ip route add .. table n' you give yourself a little more control by
allowing yourself to divide the traffic into smaller segments instead of
just a single path for all routing decisions. This is the power of
source routing. It allows you to sculpt the flow of packets through your
router/firewall.

My work firewall uses four rule buckets.

Internet line1
	Used for everything unless explicitly specified elsewhere
Internet line2
	Used for transmitting protocol xyz data
Customer1
	Internet1 but with a different src IP address
	Since it uses a locked src IP which isn't the default NAT IP as
Line 1, it gets its own table
Customer2
	Internet1 but yet another src IP address
	Since it uses a locked src IP which isn't the default NAT IP as
Line 1, it gets its own table


