From: Roberto Suarez Soto <robe@allenta.com>
Subject: High ksoftirqd CPU load, high latency
Date: Fri, 02 Mar 2012 10:51:26 +0100
Message-ID: <4F50981E.8020107@allenta.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi,

	we've got a load problem in a firewall we administer, and we believe it could 
be related to iptables. But we don't know for sure, and don't know either how 
to confirm or deny it. I'm quite at a loss, and would like to get the list's 
opinion/ideas/voodoo magic/hints on the issue. Thanks in advance!

	The symptoms are:

	- High ksoftirqd load in one CPU (the one assigned to the LAN ethernet's IRQ)
	- High network latency in the LAN, even from another box in the same switch
	- Growing system load (up to 6) until ksoftirqd load decreases

	About the system:

	- Two-node cluster, active/passive (problem reproduced in any of the boxes 
that is active at that moment)
	- Running Debian Squeeze (kernel 2.6.32-5-686-bigmem)
	- Two Intel Xeon CPUs, 8GB RAM, no other services but firewalling
	- Four network interfaces: WAN, LAN and cluster sync (a bit more about this 
later)
	- Two Intel 82571EB NICs (e1000e driver, PCI card) and Broadcom BCM5708 
(bnx2, on board), connected to 100Mbps switches
	- NICs are: Intel for WAN, Broadcom for LAN and cluster sync
	- All NICs appear as "PCI-MSI-Edge" in /proc/interrupts

	netfilter stats:

	- nf_conntrack_buckets is 16384
	- nf_conntrack_max is 1048576
	- nf_conntrack_count is usually around 25k-30k
	- About 2200 iptables rules, 800 of them for NAT (I read somewhere that NAT 
is an expensive process, that's why I'm remarking that)

	As the problem seems to arise in the CPU assigned to the LAN NIC (according 
to /proc/interrupts), we tried two things:

	- Changed coalescing values with ethtool, to send more frames per IRQ (didn't 
hurt, but didn't solve the problem either)
	- Created a "bond0" in balance-rr mode, aggregating the previous LAN NIC and 
one of the Intels that wasn't in use (less IRQ calls in /proc/interrupts, but 
didn't fix the problem; also, there's now an "events" process in peak times 
that also occupies CPU and I think wasn't there before, but I'm a bit paranoid 
and could be wrong)

	A few statistics when the problem appears:

	- Packet count is around 3k-4k per second (counting both NICs), both incoming 
and outgoing (i.e., 3k-4k incoming, 3k-4k outgoing)
	- Traffic is around 3MBytes/s (counting both NICs), both incoming and outgoing
	- Packet drops rise to 200-300 per second (counting both NICs), usually is 0

	Strange things that I've seen:

	- There are higher packet and traffic counts in other moments (4k-5k pps; 5-8 
MBytes/s), and the problem doesn't appear
	- Using "sar -I 98,99" (being those the interrupts for the NICs in the bond), 
I've seen that the IRQ count per second seems to be 0 most of the time, only 
rising from time to time; I suppose it's because of the coalescing values, but 
I found it strange anyway
	- Though now there's a bond, ksoftirqd seems to be heavy only in one CPU; I 
haven't confirmed it 100%, but it seems it's in the one assigned to the 
Broadcom NIC; /proc/interrupts doesn't report a high IRQ usage, so I don't 
know what can be causing that

	Could this problem be related to iptables? I've trimmed a few rules 
(previously there were almost 3000), but it keeps happening. And I don't 
believe those are too many rules, anyway.

	Also, is there anything else I can do to debug the problem? Unfortunately, 
this is a production firewall and I can't do anything that means an outtage 
without serious justification. But maybe there's something that gives us a 
better idea of where the bottleneck is.

	Thanks,

-- 
         Roberto Suarez Soto                             Allenta Consulting
         robe@allenta.com                                   www.allenta.com
                                                            +34 881 922 600
