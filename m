From: Daniel David Benson <dan@spoontail.com>
Subject: Interrupts and netfilter
Date: Mon, 30 Jun 2003 09:09:13 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0306300855040.30415-100000@dudester.spoontail.com>
Mime-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org



The other night I blocked a source of high volume small size traffic
(i.e., lot's of small packets).  I noticed ksoftirqd_CPU0 starting 
to run out of control -- essentially making all other traffic 
going through this firewall suffer.  We are using 2.4.18 and Intel
cards:

Intel(R) PRO/1000 Network Driver - version 5.0.43-k1
Copyright (c) 1999-2003 Intel Corporation.
PCI: Assigned IRQ 7 for device 01:02.0
divert: allocating divert_blk for eth1
eth1: Intel(R) PRO/1000 Network Connection
PCI: Assigned IRQ 3 for device 01:04.0
divert: allocating divert_blk for eth2
eth2: Intel(R) PRO/1000 Network Connection
e1000: eth1 NIC Link is Up 100 Mbps Full Duplex
e1000: eth2 NIC Link is Up 100 Mbps Full Duplex

I know we can adjust certain IRQ queues on the card.  Is this 
what other people have done?  Are other people seeing this 
problem?

Thanks!

-Dan



