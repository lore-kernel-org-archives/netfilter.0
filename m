From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: SCTP ASSOCIATION FAILOVER ISSUE
Date: Wed, 16 Jun 2010 09:12:34 +0200 (CEST)
Message-ID: <alpine.LSU.2.01.1006160910410.6077@obet.zrqbmnf.qr>
References: <AANLkTikiIc1_KD6JmKgOw9_x0lUHYTtLsPjqQLDmtxEI@mail.gmail.com> <4C184763.4040700@trash.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C184763.4040700@trash.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Patrick McHardy <kaber@trash.net>
Cc: manoj s <ms.email0@gmail.com>, netfilter@vger.kernel.org


On Wednesday 2010-06-16 05:39, Patrick McHardy wrote:
>>
>>The IP tables rule to perform SNAT is: -A POSTROUTING -o bond2 -j SNAT 
>>--to-source 10.19.146.147 When a blade failover occurs, the above rule 
>>is applied to the newly active blade to continue SNAT. The failed 
>>blade is rebooted immediately.
>>[...]
>> This behavior of not SNAT'ing continues until we re-establish the
>> association. When the association is re-established, the NAT'ing
>> takes place and the source address at bond2 of Bld14 shows up as
>> 10.19.146.147 which is the desired address.
>>
>> The question therefore is, why does SNAT for SCTP not take place
>> until the association is re-established upon a failover?
>
> You're probably not quick enough applying the SNAT rule. Once the
> first packet has passed through Bld14, the connection tracking
> entry is already set up without NAT and the SNAT rule doesn't apply
> anymore.

As I see it, conntrackd is just what's needed in this case.
