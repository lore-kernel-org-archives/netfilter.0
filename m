From: Jan Engelhardt <jengelh@inai.de>
Subject: Re: Using Netfilter with high bandwidth
Date: Tue, 25 Sep 2012 13:30:20 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1209251324520.8321@nerf07.vanv.qr>
References: <56bebadff4785d716c997d7aba22b9dd@linuxwall.info> <alpine.LNX.2.01.1209010028550.27474@frira.zrqbmnf.qr>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.01.1209010028550.27474@frira.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julien Vehent <julien@linuxwall.info>
Cc: netfilter <netfilter@vger.kernel.org>, brouer@redhat.com


On Saturday 2012-09-01 00:39, Jan Engelhardt wrote:
>On Friday 2012-08-31 21:38, Julien Vehent wrote:
>
>>At work, we're building a new office, and we are considering
>>building our own edge firewalls instead of giving bucket loads of
>>money to the big guys. We're a Linux shop, so it makes sense to
>>build those new firewall/vpn boxes using Linux. But we are
>>concerned about performances and complexity. I make a simple
>>diagram of what we want below. We would have a point to point WAN
>>connection between the two networks, and then an uplink on each
>>side.
>>
>>[...]
>>* What type of network cards will handle 1GBPS and 10GBPS
>>(eventually) ? Any recommendation on the hardware ?
>
>Those with multiqueue. Intel is known to have some offerings, check
>there (I don't have the chip numbers at hand).

The chip/card I was thinking of (lspci output):

02:00.0 Ethernet controller [0200]:
Broadcom Corporation NetXtreme II BCM5716 Gigabit Ethernet [14e4:163b] (rev 20)
        Subsystem: Dell Device [1028:02a5]
                Product Name: Broadcom NetXtreme II Ethernet Controller
                Read-only fields:
                        [PN] Part number: BCM95716C1
                        [V0] Vendor specific: 5.0.13

This card has 8 queues according to /proc/interrupts.

>> kernel/system to fit our needs. Some distros are more network oriented than
>> others, is there anything that would stand out for our setup ?
>
>openSUSE is the only known one to offer the complete Netfilter package 
>spectrum.
