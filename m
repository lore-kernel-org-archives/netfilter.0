From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Weird TCP flags?
Date: Fri, 12 Dec 2003 21:21:37 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200312122121.37954.Antony@Soft-Solutions.co.uk>
References: <003101c3c065$f61ad790$13fea8c0@melita.com> <200312121438.24448.Antony@Soft-Solutions.co.uk> <200312121105.19702.JALaramie@Loudoun-Fairfax.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200312121105.19702.JALaramie@Loudoun-Fairfax.com>
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
To: Netfilter <netfilter@lists.netfilter.org>

On Friday 12 December 2003 4:05 pm, Jeffrey Laramie wrote:

> The TTL of his packet was about 60 secs lower than what I usually see which
> makes Chris's explanation sound likely. How does TTL get calculated? Does
> each host set a new TTL for it's packets or does it calculate it from the
> time of the original SYN packet?

No, TTL doesn't mean "TIME to live" any more (it did when the Internet was 
being invented, but pretty soon the meaning changed and TTL no longer has 
anything to do with time).

TTL is actually a "maximum hop count", specifying the number of routers (and 
remember, a netfilter firewall is a router too) a packet is allowed to pass 
through before it "expires" and gets thrown away (with an ICMP "TTL expired" 
packet being returned to the source address on the packet which just 
expired).

The easiest way (I think) to explain how this is used is to consider the 
traceroute program and what it does:

traceroute sends out three packets to some destination address with TTL=1.

The first router they come to decrements the TTL (all routers do this) and if 
the TTL is now = 0, the router discards the packet, and returns an ICMP "TTL 
expired" to the source address (ie: the machine which started the traceroute 
command).   The source address for this ICMP packet is that of the router, 
which is how the traceroute program tells you the address (and, by reverse 
DNS, also the name) of the first router the packet went through.

Then traceroute sends three packets to the same destination address, this time 
with TTL = 2.

The first router decrements the TTL and passes the packets on (because that's 
what routers do, and TTL is not = 0).

The second router decrements TTL, finds that it now = 0, and responds with the 
ICMP packet (this time from the source address of the second router, so 
traceroute can tell you that, too).

traceroute then just keeps on sending out packets with higher and higher TTLs, 
waiting for all the ICMP responses to come back, and successive packets get 
further and further, until traceroute receives either a "port unreachable" or 
a genuine response packet, which means that the packets reached the real 
destination.   Then traceroute stops, and you have a record of all the 
routers the packets went through on their way to the destination.

traceroute normally sends UDP packets to port numbers which are unlikely to be 
listening (therefore the expected response from the final destination is ICMP 
port unreachable).

Note that due to dynamic routing across the Internet, there's no guarantee 
that every packet will follow the same route on its way to the destination, 
so traceroute outputs can be misleading, but it's a good start.

Hope this helps explain a bit about TTL.....

Antony.


-- 
The truth is rarely pure, and never simple.

 - Oscar Wilde

                                                     Please reply to the list;
                                                           please don't CC me.


