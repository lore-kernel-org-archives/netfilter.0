From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: CLUSTERIP: no conntrack error
Date: Mon, 26 Jul 2010 13:00:58 +0200 (CEST)
Message-ID: <alpine.LSU.2.01.1007261300020.323@obet.zrqbmnf.qr>
References: <AANLkTinWzfnYgN0vTECKfgYxUPYynPr0OHVfgEbZyRfj@mail.gmail.com> <alpine.LSU.2.01.1007251834380.14790@obet.zrqbmnf.qr> <4C4D64FC.7070304@netfilter.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C4D64FC.7070304@netfilter.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: Edison Figueira <efjgrub@gmail.com>, netfilter@vger.kernel.org

On Monday 2010-07-26 12:35, Pablo Neira Ayuso wrote:
> On 25/07/10 18:34, Jan Engelhardt wrote:
>> On Wednesday 2010-07-14 00:18, Edison Figueira wrote:
>>
>>> I configured CLUSTERIP in two boxes to make balancing proxy, and
>>> apparently it all worked but I get several messages from "CLUSTERIP:
>>> no conntrack.
>>>
>>> Does anyone know what this message means?
>>
>> Means packets are tagged as INVALID.
>
> Indeed. You have to add a rule to drop invalid packets before the CLUSTERIP
> rule to avoid this message.

Hm, couldn't we just drop the message? There are many other components 
in Netfilter that silently bail out when nf_ct_get returns NULL, like 
xt_connlimit.
