From: Ian Batterbee <ian.batterbee@aut.ac.nz>
Subject: Re: Broadcast layer2 forwarding (ff:ff:ff:ff:ff:ff)
Date: Tue, 07 Jan 2003 11:36:20 +1300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E1A04E4.5090502@aut.ac.nz>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Tim.Shook@itt.com
Cc: netfilter@lists.netfilter.org

> If the MAC addresses on these are standard, manufacturer assigned addresses,
> everything works fine.  If I manipulate the MACs with ifconfig and set them
> to ALMOST any other MAC, everything works fine, however when I set the MAC
> to a layer 2 broadcast (FF:FF:FF:FF:FF:FF), IPTables stops forwarding the
> packet. 
> 
> Now, the question is:
> 
> Where is this packet being trapped and dropped?  Is it in the kernel
> (routing)? Or is IPtables dropping it?  Is the Ethernet card dropping it?


It could be dropped in a number of places - even at the transmitting 
station which may not ever actually transmit it.

I know for sure that a a cisco router will complain (but still forward 
it just in case) about source mac addresses being multicast (multicast 
includes broadcast) - ie, if the last (right hand) bit of the first byte 
of the MAC address as a human reads is set to 1 (which is the first bit 
the NIC sees because of byte order reversal)

If you want to pinpoint the fault, the first thing to do would be to 
disable iptables and see what happens to the packet without it. You 
could also check ifconfig or /proc/net/dev to see if the transmit 
packet/byte counters actually increment.

I know you said you are working with a bizarre setup, but I can't 
imagine any situation where you would actually want a multicast source 
MAC to be used. Even if it works on your network, it could easily be 
silently dropped by  switches or routers on another network.

 From cisco.com (summarised)

Using a broadcast or multicast MAC address as the source MAC for a frame 
is not standards-compliant behavior. However, the switch still forwards 
traffic sourced from a multicast MAC address.

Typically, such frames are transmitted from a traffic generator (for 
example, SmartBits) or third party devices that share a multicast MAC 
address (for example, load balancing firewall or server products).




