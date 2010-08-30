From: Jonathan Tripathy <jonnyt@abpni.co.uk>
Subject: Re: IPv6 routing
Date: Mon, 30 Aug 2010 12:10:26 +0100
Message-ID: <4C7B91A2.50707@abpni.co.uk>
References: <4C7B8741.3030908@abpni.co.uk> <4C7B89EB.7090807@abpni.co.uk> <alpine.LNX.2.01.1008301242380.15716@obet.zrqbmnf.qr> <4C7B8BD2.1060009@abpni.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C7B8BD2.1060009@abpni.co.uk>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org


>
> On 30/08/10 11:43, Jan Engelhardt wrote:
>> On Monday 2010-08-30 12:37, Jonathan Tripathy wrote:
>>> 06:29:37.241590 IP6 2001:470:1f09:dc5::1>  ff02::1:ff00:2: ICMP6, 
>>> neighbor
>>> solicitation, who has 2001:470:1f09:dc5::2, length 32
>>> 06:29:37.241800 IP6 2001:470:1f09:dc5::2>  2001:470:1f09:dc5::1: ICMP6,
>>> neighbor advertisement, tgt is 2001:470:1f09:dc5::2, length 32
>>>
>>> It seems like netfilter isn't marking the advertisements as 
>>> "related" to the
>>> solicitation request. I think that this is becuase the request was 
>>> sent to
>>> ff02::1:ff00:2, but the reply came from 2001:470:1f09:dc5::2.
>> advertisements need not strictly be a reply to a solicit.
>
> So how would I go about adding rules then that allows this?
>
Ok everyone, I think I found the answer. Just allow -p icmpv6

Does that sound safe enough?

On a side note: netfilter currently has arptables to stop arp cache 
poisoning. Is there any similar thing for NDP poisoning? I can prevent 
the actual flow of non-icmpv6 IP traffic to a host by using ip6tables on 
my bridge device (which sits in the middle of all hosts), however this 
won't stop DOS attacks..

Cheers
