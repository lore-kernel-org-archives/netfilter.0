From: Marek Kierdelewicz <marek@piasta.pl>
Subject: Re: iptables use only one cpu core.
Date: Fri, 26 Feb 2010 08:07:20 +0100
Message-ID: <20100226080720.3a25159d@catlap>
References: <BLU149-W31E11A0A84D21AC4C9F3B7853F0@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <BLU149-W31E11A0A84D21AC4C9F3B7853F0@phx.gbl>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: MontyRee <chulmin2@hotmail.com>
Cc: netfilter@vger.kernel.org

>Hi all.

Hello
 
>When I send lots of queries to the iptables enabled NAT system, 
>I found that NAT system use only 1 cpu core even this system has 4
>cores. So the (TPS)performance result was not good. 
 
You probably use just one nic that is singlequeue and capable of
directing interrupts to one core. There are two good solutions:

1) Put n*NICs into the box, where n-number of cores. Distribute traffic
between those nics (Etherchannel on switch + bonding[1] on Linux side).
Then use smp affinity settings to bind different nics (irqs) to
different Cores. It can be done with simple script below:

ETH0_IRQ=`cat /proc/interrupts|grep eth0|cut -d: -f1`
ETH1_IRQ=`cat /proc/interrupts|grep eth1|cut -d: -f1`
ETH2_IRQ=`cat /proc/interrupts|grep eth2|cut -d: -f1`
ETH3_IRQ=`cat /proc/interrupts|grep eth3|cut -d: -f1`
echo 1 > /proc/irq/$ETH0_IRQ/smp_affinity
echo 2 > /proc/irq/$ETH1_IRQ/smp_affinity
echo 4 > /proc/irq/$ETH2_IRQ/smp_affinity
echo 8 > /proc/irq/$ETH3_IRQ/smp_affinity

2) Use intel nic with chip >=82575 (igb driver) [2]. Those nics support
MULTIQUEUE. In your case can have 4 separate irq-rx vectors on one
nic. Basicly hardware on NIC chip is doing the same the
bonding/etherchannel done in 1).

[1]http://www.linuxfoundation.org/collaborate/workgroups/networking/bonding
[2]http://download.intel.com/design/network/applnots/319935.pdf

