From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: IPv6 filtering
Date: Wed, 2 Feb 2011 05:11:21 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1102020207390.25701@obet.zrqbmnf.qr>
References: <4D487D69.7000808@abpni.co.uk> <201102020000.58388.guido-nf@thisisnotatest.de>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <201102020000.58388.guido-nf@thisisnotatest.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Guido Winkelmann <guido-nf@thisisnotatest.de>
Cc: Jonathan Tripathy <jonnyt@abpni.co.uk>, netfilter@vger.kernel.org


On Wednesday 2011-02-02 00:00, Guido Winkelmann wrote:
>On Tuesday 01 February 2011 22:38:49 you wrote:
>
>>that each VPS can only use the IP and MAC addresses      
>>assigned to them.
>>With IPv6, does anyone have any experience on how to do this? I
>>know we can use ip6tables, but isn't there some trickery with NDP
>>(Which replaces ARP)?
>
>There shouldn't be, just as long as you only filter on the source 
>address of outgoing packets, and not on the destination of incoming 
>ones. The NDP request packets go to weird multicast addresses

That "weird multicast address" is just broadcast so to speak, there is 
nothing weird about it.

>Answer packets for NDP always have a valid IPv6 address from the answering 
>host as their source address. Also, they're IPv6 packets like any other and 
>not a separate protocol as with ARP+IPv4.

>Note that hosts using IPv6 will usually have at least two autoconfigured 
>addresses

Can you back up this statement?
