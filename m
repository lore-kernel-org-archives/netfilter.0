From: Born Without <blackhole@airpost.net>
Subject: Re: [SOLVED] Re: Native support of counting rules?
Date: Fri, 04 Jan 2013 06:45:53 +0100
Message-ID: <50E66C91.9000505@airpost.net>
References: <20130102134421.GA17997@devnull> <50E43D07.50009@ngtech.co.il> <CAJZVxRkyDyZyWUBbhP+H5gv2Dk1_Jj=v4QRAheHKWEnSKTdrhg@mail.gmail.com> <50E59C32.5090003@jvales.net> <alpine.LNX.2.01.1301031704440.32551@nerf07.vanv.qr> <50E5BF89.1010505@jvales.net>
Reply-To: blackhole@airpost.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=airpost.net; h=
	message-id:date:from:reply-to:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	 s=mesmtp; bh=GPh/88u016FzuN8sLoCgmycJOiQ=; b=evfDEmAc2eVxMPLwkJ
	Q0Ufp/HNoIK7txisWfxEtKWyEHUXbLdk2Ev6cfvRMq7/ByM+tsZr15w7p5+Hi4DM
	L/QYtIysEAh83Y6grcC6g4xUf5DtpvO6dCGG7NOkhSwzCUax2zO+Wadsrd9Ia5Al
	KJAKiaNkw/kDxiKsMZT4wS8s8=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=message-id:date:from:reply-to
	:mime-version:to:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding; s=smtpout; bh=GPh/88u016FzuN8sLoCgmy
	cJOiQ=; b=klFWYT4e8lw8ivj2WGK1v7moqsG58Kzj08sR+sXYiDzoxi5KGwz05K
	zcGxP0irjZClc6tre4P9tvk1BpHqWPhbUScXf3DSHf7q2Zbd+c75e1UoVFMq46vk
	4sjuGKVFPR1ClVPM6daL/6QI5gSa7HANTMMT5D+WcJ0xcCcEBbOTI=
In-Reply-To: <50E5BF89.1010505@jvales.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter-owner@vger.kernel.org
Cc: Jan Engelhardt <jengelh@inai.de>, Aaron Lewis <the.warl0ck.1989@gmail.com>, netfilter mailing list <netfilter@vger.kernel.org>

On 03.01.2013 18:27, netfilter-owner@vger.kernel.org wrote:
> On 03/01/13 17:05, Jan Engelhardt wrote:
>> On Thursday 2013-01-03 15:56, Jan Vales wrote:
>>
>>> Hi,
>>>
>>> why dont you use ...
>>> iptables-save | grep "\-A" | wc -l
>>
>> grep ^-A
>>
>> But the foremost question is: how is the rule count alone going to be
>> useful?
>>
>
> I dont think its useful at all - I just like stats and wanted to help ;)
>
> Especially with OP's requirement to allow non-root users to view this count.
> Therefore know that/when you changed something.

you can swap the whole ruleset, as long as the total count of rules 
stays the same, this test won't detect it, therefore is totally 
unreliable. Nothing but stats, yes.

