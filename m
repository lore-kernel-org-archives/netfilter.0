From: "Aaron S. Joyner" <aaron@joyner.ws>
Subject: Multiple subnets of the same IP space, different VLANs, same box...
Date: Tue, 15 Feb 2005 12:17:05 -0500
Message-ID: <42122E91.2000707@joyner.ws>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org, vlan@lanforge.com

Okay, first let me admit that what I'm trying to do is a bit on the 
weird side, and stems from some historical requirements that I can not 
easily change.  Having said that, here's the scoop.

I have numerous subnets, which are all identical.  Each has devices in 
the 10.1.1.0/24 range that need to talk to a server at 10.1.1.1.  All 
subnets for the sake of argument will be Class C ranges.  (1)  They are 
all connected through Cisco switches, via 802.1q VLANs, back to a single 
Linux box.  Each subnet comes in on a virtual interface (courtesy of 
vconfig), such as eth1.10, eth1.11, etc.  I need to be able to respond 
to each of those interfaces as 10.1.1.1, with (so far) only ICMP and UDP 
traffic.

At first, I'd hoped to be able to simply assign that same IP, 10.1.1.1, 
over and over to each of the VLAN interfaces, and everything would work 
itself out.  Unfortunately, that doesn't work.  It works fine for the 
first box, but not for the second.  The second IP, on the second VLAN, 
is unable to correctly ARP with the second client.  I can beat the ARP 
problem temporarily by forcing a ping out the VLAN interface (ping -I 
eth1.11 10.1.1.2, for example), or by adding a static ARP entry, but 
even after ARP is handled, traffic simply doesn't flow up the IP stack 
(or more realistically I think it's not flowing back *down* the IP stack 
correctly).

In discussing this problem with a friend, he suggests that the problem 
is that when Linux attempts to take a packet from the responding service 
(ICMP from the kernel, or tftp from tftpd, for example), it starts fresh 
to determine how to send out that packet, attempts to look up the 
destination in the ARP cache, regardless of the interface it came in on, 
and sends to the first entry it finds.  I currently believe that this is 
why the simple / ideal solution I describe above is failing.

I've considered that some magic with iptables DNAT, SNAT, or REDIRECT 
targets, perhaps combined with the mangle table's ROUTE target, may 
allow this to be possible, but I can't wrap my head around how to get 
the packets properly mangled, and I'm still not 100% convinced that will 
bypass the ARP problem.  Another possible (very ugly) solution would be 
to run virtual machines attached to each of those VLAN interfaces, which 
would separate out the problem of one "box" having lots of identical IP 
addresses and ARP entries, but it seems like an amazing waste of resources.

Any input anyone can offer about possible solutions, or even providing 
further insight into the problem, would be most appreciated.  :)

Aaron S. Joyner

(1) IP addresses have, of course, been changed to protect the innocent.

