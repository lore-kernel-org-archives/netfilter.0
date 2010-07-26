From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: CLUSTERIP: no conntrack error
Date: Mon, 26 Jul 2010 19:05:08 +0200
Message-ID: <4C4DC044.8060105@netfilter.org>
References: <AANLkTinWzfnYgN0vTECKfgYxUPYynPr0OHVfgEbZyRfj@mail.gmail.com> <alpine.LSU.2.01.1007251834380.14790@obet.zrqbmnf.qr> <4C4D64FC.7070304@netfilter.org> <alpine.LSU.2.01.1007261300020.323@obet.zrqbmnf.qr> <4C4D6CDB.2060900@netfilter.org> <alpine.LSU.2.01.1007261313070.4128@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LSU.2.01.1007261313070.4128@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: Edison Figueira <efjgrub@gmail.com>, netfilter@vger.kernel.org

On 26/07/10 13:13, Jan Engelhardt wrote:
> 
> On Monday 2010-07-26 13:09, Pablo Neira Ayuso wrote:
>>>>>
>>>>> Means packets are tagged as INVALID.
>>>>
>>>> Indeed. You have to add a rule to drop invalid packets before the CLUSTERIP
>>>> rule to avoid this message.
>>>
>>> Hm, couldn't we just drop the message? There are many other components
>>> in Netfilter that silently bail out when nf_ct_get returns NULL, like
>>> xt_connlimit.
>>
>> Yes, it's a good idea for the short run.
>>
>> In the long run, we should deprecate CLUSTERIP since it has been superseded by
>> the cluster match. However, I wanted to document the new approach before doing
>> so (I found no spare time to do it).
>>
>> IIRC, the message is only displayed if netfilter debugging is enabled.
> 
> pr_info it says.

Then, it would better to use pr_debug instead.
