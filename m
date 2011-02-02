From: Jonathan Tripathy <jonnyt@abpni.co.uk>
Subject: Re: IPv6 filtering
Date: Wed, 02 Feb 2011 09:35:28 +0000
Message-ID: <4D492560.1070609@abpni.co.uk>
References: <4D487D69.7000808@abpni.co.uk> <201102020000.58388.guido-nf@thisisnotatest.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <201102020000.58388.guido-nf@thisisnotatest.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Guido Winkelmann <guido-nf@thisisnotatest.de>
Cc: netfilter@vger.kernel.org


On 01/02/11 23:00, Guido Winkelmann wrote:
> On Tuesday 01 February 2011 22:38:49 you wrote:
>> With IPv6, does anyone have any experience on how to do this? I know we
>> can use ip6tables, but isn't there some trickery with NDP (Which
>> replaces ARP)?
> There shouldn't be, just as long as you only filter on the source address of
> outgoing packets, and not on the destination of incoming ones. The NDP request
> packets go to weird multicast addresses that depend on the address being
> requested. I haven't totally figured out the scheme yet (haven't really
> tried).
I really do need to filter by both the source and destination IP 
addresses. Amongst other things, I want to make sure that packets 
destined for another VPS never arrive at the wrong VPS. This can happen 
when the Linux bridge is "re-learning" the MAC Address mappings.

It is wise to allow *all icmpv6* traffic destined for the multicast 
address to the destined VPS?
> Answer packets for NDP always have a valid IPv6 address from the answering
> host as their source address. Also, they're IPv6 packets like any other and
> not a separate protocol as with ARP+IPv4.
Yes, however there is nothing currently like arptables for IPv6 that I 
know of. Even though the NDP answers may have a correct source IP, 
surely the payload could provide wrong (i.e. malicious) data...
> Note that hosts using IPv6 will usually have at least two autoconfigured
> addresses, and it's sometimes hard to predict which one will be used as source
> address for outgoing packets, especially if the number of configured addresses
> grows. You must not block any of those.
I'm willing to give up the auto-config features of IPv6. We can just 
manually put the address in the respective config file. It's no big deal 
really.
> Also see my message from yesterday on that subject, please. I'm having
> problems with filtering IPv6 from VPSes as well, and if you find a solution
> that works with large numbers of vpses, I would appreciate it if you could
> share it.
>
> 	Guido
