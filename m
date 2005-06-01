From: Pete Toscano <pete-netfilter@verisignlabs.com>
Subject: Problem with DNAT & Larger UDP Packets
Date: Wed, 01 Jun 2005 14:36:44 -0400
Message-ID: <429E003C.5090907@verisignlabs.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hello,

Please pardon me if this has been covered in the archives.  (Pointers
would be much appreciated if so.)

I have a nameserver behind a Linux firewall.  The firewall is running
FC2 (1.2.9-2.3.1).  I have a simple rule that maps any UDP or TCP port
53 traffic to IP A on the public side to private IP B on the internal
side.  We've been getting complaints from someone about not having
larger queries answered, so I started looking into things.

I figure that hping2 would give me the flexibility to craft packets of
varying sizes and allow me to do the traceroute thing to where where
packets are being dumped.  If the packets get through to the nameserver,
I'd just get a FormErr back.

If, from C (which is on the public side), I do this:

hping -2 -p 53 -c 2 --traceroute -t 12 -d 1350 A

and do a tcpdump on both the public and private interface on my
firewall, I see this on the public side:

14:30:04.609125 IP C.2859 > A.domain:  22616 updateDA% [b2&3=0x5858]
[22616a] [22616q] [22616n] [22616au][|domain]
14:30:04.609191 IP A > C: icmp 556: time exceeded in-transit
14:30:05.607656 IP C.2860 > A.domain:  22616 updateDA% [b2&3=0x5858]
[22616a] [22616q] [22616n] [22616au][|domain]
14:30:05.608273 IP A.domain > C.2860:  22616 updateDA FormErr- [0q]
0/0/0 (12)
14:30:05.675272 IP C > A: icmp 48: C udp port 2860 unreachable

I see this on the private side:

14:30:05.607681 IP C.2860 > B.domain:  22616 updateDA% [b2&3=0x5858]
[22616a] [22616q] [22616n] [22616au][|domain]
14:30:05.608258 IP B.domain > C.2860:  22616 updateDA FormErr- [0q]
0/0/0 (12)
14:30:05.675291 IP C > B: icmp 48: 64.151.105.12 udp port 2860 unreachable

This is all as I'd expect.  If I increase the data payload size to 1351,
I see the same thing as above on the public side, less the last two
packets.  On the public side, I see nothing.

Anybody have any idea about what's going on?

Thanks,
pete

