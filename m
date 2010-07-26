From: Edison Figueira <efjgrub@gmail.com>
Subject: Re: CLUSTERIP: no conntrack error
Date: Mon, 26 Jul 2010 10:43:30 -0300
Message-ID: <AANLkTinGWcu=mMg0NCdH4Q=E022HA+5kwtc+YdKyf+WQ@mail.gmail.com>
References: <AANLkTinWzfnYgN0vTECKfgYxUPYynPr0OHVfgEbZyRfj@mail.gmail.com>
	<alpine.LSU.2.01.1007251834380.14790@obet.zrqbmnf.qr>
	<4C4D64FC.7070304@netfilter.org>
	<alpine.LSU.2.01.1007261300020.323@obet.zrqbmnf.qr>
	<4C4D6CDB.2060900@netfilter.org>
	<alpine.LSU.2.01.1007261313070.4128@obet.zrqbmnf.qr>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type;
        bh=ir+nrM6+QnOOSI5ouJIlB+I9ihVJ0+qjFWlI135StMw=;
        b=MofQwQBzS5pvu5VSYCgyq1gam+vWPIHQDEyNRU1A0h9lCOsxKL82lVll57aKqOdyJ4
         fZgYSv/oanvMeN7uCR9qn0iwXYb4IIXskqO4y+lfEPmrSnwujJbDouAONih4PQ3i4uSM
         FadUnCPJhqCfv2AgoxR/PmruOPYNK1q2CdKE8=
In-Reply-To: <alpine.LSU.2.01.1007261313070.4128@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Engelhardt <jengelh@medozas.de>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>, netfilter@vger.kernel.org

Thank you all for the replies. The DROP rule of INVALID packets resolved it.

Att.

Edison Figueira Junior

On Mon, Jul 26, 2010 at 8:13 AM, Jan Engelhardt <jengelh@medozas.de> wrote:
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
>
