From: Henning Schmiedehausen <hps@intermeta.de>
Subject: Netfilter meets PBR - I'm starting to tear my hairs out...
Date: Thu, 12 Aug 2004 12:33:29 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1092306809.2797.45.camel@forge.intermeta.de>
Reply-To: hps@intermeta.de
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: netfilter@lists.netfilter.org

Hi,

I have a question concerning the interaction between iptables and
iproute2. I seem to miss some crucial point in the concepts... Let me
explain:

I have a router with four interfaces:


ppp0  - 	DSL uplink with dynamic IP address
eth0  - 	regular uplink with fixed IP address
eth1  -		network with official ip addresses
eth2  -		network with private addresses and official
                addreses

The idea is now that everything that has an official ip address
is routed through the eth0 link (the addresses are from the range of
this ISP) and the private addresses are NATed and routed through ppp0.

for illustration:

ppp0:	dynamic
eth0:	100.100.100.1/30
eth1:	100.100.101.1/24
eth2:	100.100.102.1/24
	192.168.8.1/24

This is a regular Fedora Core 1 box with all updates installed. It
reports itself as

Linux router 2.4.22-1.2199.nptl #1 Wed Aug 4 12:21:48 EDT 2004 i686 i686 i386 GNU/Linux

I use iptables-1.2.9-1.0 and iproute-2.4.7-13.2 as delivered by the Fedora Project.

I did the following thing with /sbin/iproute

# /sbin/ip route show
<DSL Provider Address> dev ppp0  proto kernel  scope link  src <dynamic DSL address>

100.100.100.1/30 dev eth0  scope link
100.100.101.1/24 dev eth1  scope link
100.100.102.1/24 dev eth2  scope link
192.168.8.0/24 dev eth2  proto kernel  scope link  src 192.168.8.1
127.0.0.0/8 dev lo  scope link
default via 100.100.100.2 dev eth0

Now I added PBR:

echo "200 VLAN2" >> /etc/iproute2/rt_tables

/sbin/ip route add default dev ppp0 table VLAN2
/sbin/ip rule add from 192.168.8.0/24 table VLAN2

which seems to work:

/sbin/ip route list table VLAN2
default dev ppp0  scope link

/sbin/ip rule list
0:      from all lookup local
32765:  from 192.168.8.0/24 lookup VLAN2
32766:  from all lookup main
32767:  from all lookup default

When I ping from a host attached to eth2:

# tcpdump -i eth0
100.100.102.2 > internet_host: icmp: echo request
internet_host > 100.100.102.2: icmp: echo reply
100.100.102.2 > internet_host: icmp: echo request
internet_host > 100.100.102.2: icmp: echo reply

# tcpdump -i ppp0
192.168.8.2 > internet_host: icmp: echo request
192.168.8.2 > internet_host: icmp: echo request

(obviously no answer yet)

Now I add masquerading:

/sbin/iptables  -t nat -A POSTROUTING -o ppp0  -s 192.168.8.0/24 -j MASQUERADE
/sbin/iptables  -t nat -A POSTROUTING -j ACCEPT

After this, there is silence on ppp0. No more packets pass through the
link.

Instead, the kernel starts to spit out:

Aug 12 12:19:36 router kernel: MASQUERADE: Route sent us somewhere else.
Aug 12 12:19:41 router kernel: NET: 4 messages suppressed.
Aug 12 12:19:41 router kernel: MASQUERADE: Route sent us somewhere else.
Aug 12 12:19:46 router kernel: NET: 4 messages suppressed.
Aug 12 12:19:46 router kernel: MASQUERADE: Route sent us somewhere else.
Aug 12 12:19:51 router kernel: NET: 4 messages suppressed.
Aug 12 12:19:51 router kernel: MASQUERADE: Route sent us somewhere else.
Aug 12 12:19:56 router kernel: NET: 4 messages suppressed.
Aug 12 12:19:56 router kernel: MASQUERADE: Route sent us somewhere else.

The fun thing now is, that if I flush the chain again and do

/sbin/iptables  -t nat -A POSTROUTING -o ppp0 -s 192.168.8.0/24 -j SNAT --to-source=<dynamic DSL address>
/sbin/iptables  -t nat -A POSTROUTING -j ACCEPT

then the PBR works. I see the packets going out the ppp0 link:

# tcpdump -i ppp0
<dynamic dsl address> > internet_host: icmp: echo request
internet_host > <dynamic dsl address>: icmp: echo reply
<dynamic dsl address> > internet_host: icmp: echo request
internet_host > <dynamic dsl address>: icmp: echo reply

Unfortunately I cannot use this in production, because the link will
have to go up and down and I cannot rewrite the configuration scripts
(which use masquerade).

So, what am I doing wrong? As far as I can understand, the MASQUERADE
target is equal to the SNAT target, except that it takes the ip address
for NATing from the interface and tears down the connections if the
interface loses its link. Or not? Or have I simply stumbled over a well
known bug in the RedHat kernel (which seems to be 2.4.22 + lots of
patches from post-2.4.22)? Or am I just missing some concept that I need
to add to my tables?

I'd appreciate Cc'ing me as I am not a regular subscriber to this list.

	Regards
		Henning

-- 
Dipl.-Inf. (Univ.) Henning P. Schmiedehausen          INTERMETA GmbH
hps@intermeta.de        +49 9131 50 654 0   http://www.intermeta.de/
 
RedHat Certified Engineer -- Jakarta Turbine Development  -- hero for hire
   Linux, Java, perl, Solaris -- Consulting, Training, Development

"Fighting for one's political stand is an honorable action, but re-
 fusing to acknowledge that there might be weaknesses in one's
 position - in order to identify them so that they can be remedied -
 is a large enough problem with the Open Source movement that it
 deserves to be on this list of the top five problems."
                       --Michelle Levesque, "Fundamental Issues with
                                    Open Source Software Development"


