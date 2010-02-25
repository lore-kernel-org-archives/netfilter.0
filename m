From: Jiri Pirko <jpirko@redhat.com>
Subject: Re: [question] ipt_CLUSTERIP and address length
Date: Thu, 25 Feb 2010 13:13:47 +0100
Message-ID: <20100225121346.GE2667@psychotron.lab.eng.brq.redhat.com>
References: <20100225101257.GC2667@psychotron.lab.eng.brq.redhat.com>
 <4B864F9A.90207@trash.net>
 <alpine.LSU.2.01.1002251201360.4362@obet.zrqbmnf.qr>
 <20100225113751.GD2667@psychotron.lab.eng.brq.redhat.com>
 <alpine.LSU.2.01.1002251301500.11377@obet.zrqbmnf.qr>
Mime-Version: 1.0
Return-path: <netfilter-devel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <alpine.LSU.2.01.1002251301500.11377@obet.zrqbmnf.qr>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Engelhardt <jengelh@medozas.de>
Cc: Patrick McHardy <kaber@trash.net>, netfilter-devel@vger.kernel.org, coreteam@netfilter.org, netfilter@vger.kernel.org

Thu, Feb 25, 2010 at 01:05:06PM CET, jengelh@medozas.de wrote:
>
>On Thursday 2010-02-25 12:37, Jiri Pirko wrote:
>>>
>>>Is there an _actual_ use case however? Is it suddenly possible
>>>to use EUI-64s? Or a run on IPX? :-)
>>
>>Well for example Infiniband has 20-bytes address. But I do not know much about
>>this kinds of hw & iptables use. I'm just looking at code and wondering :)
>
>First have IPv4/v6 running over InfiniBand, then we can talk ;-)
>
>I did something like that once, but what it came down to was that
>an Ethernet layer was inserted between Myrinet and IPv4.
>(`ip link` will show.)

Ok, fair enough :)
