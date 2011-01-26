From: Ludovico Cavedon <cavedon@cs.ucsb.edu>
Subject: invoking nat POSTROUTING *after* bridging decision
Date: Wed, 26 Jan 2011 11:11:36 -0800
Message-ID: <4D4071E8.2010908@cs.ucsb.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,

I have a machine which has two interfaces bridged together (eth0 and
eth1, on br0), plus a third interface eth2 on a separate network.

I would like to masquerade traffic from the eth2 network only if it sent
over eth0, and not if it is sent over eth1.

My problem is that the -t nat POSTROUTING rule is invoked after the
routing decision, before the packet enters the bridge. (i.e. with output
interface br0).

Is there any way to postpone the call to POSTROUTING after the bridging
decision has been been, or have the POSTROUTING chain called twice?

Thank you in advance,
Cheers,
Ludovico

PS:
For sake of completeness, I was able to get the NAT to work, by using a
POSTRUTING rules based on IP address, rather than output interfaces, as
I know which hosts are connected to each interface (eth0 or eth1).
However, if I run tcpdump in br0, I see outgoing packets with source IP
address masqueraded, but incoming packets have already been
un-masqueraded, making it annoyingly asymmetric...
