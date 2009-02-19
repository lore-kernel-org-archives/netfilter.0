From: Ivan Petrushev <ivanatora@gmail.com>
Subject: Re: iptables - how to create a rule that expires automatically
Date: Thu, 19 Feb 2009 20:17:05 +0200
Message-ID: <d39744a20902191017r496cb6bch65212916b8c6e9f5@mail.gmail.com>
References: <499D9292.902@colsmemory.co.uk>
	 <d39744a20902190936u48f082d9p7c0da22a6948e6d8@mail.gmail.com>
	 <499D99F4.2010400@colsmemory.co.uk>
	 <84965006-A4F7-41DD-8C6F-ED62AA82B2F9@dancing.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=O8VIXmd1FAd41IgbW8q1jZ31nkNo0dW+lub94pUsbTU=;
        b=WXJ8KCTxvSRdj71s7Xockbf6G5emoo+Z9kaJBqNespt/ASLBgkMdv9ZVB9OBEZk7K6
         ddYGmpYkt2tBUXDRppq0TWE+onWaQysfIrp7bcjPZeyblKlzjsgHDhHxS6Cjbmzo9S5K
         9eX04TfnyEpuGlpFcST4f4Ebf+kA4D4M4dy/k=
In-Reply-To: <84965006-A4F7-41DD-8C6F-ED62AA82B2F9@dancing.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Peter Renzland <peter@dancing.org>
Cc: Colin Davis <col@colsmemory.co.uk>, netfilter@vger.kernel.org

You will have a daemon hanging in background. If it happens to be
killed your rule will not be removed from iptables. Besides that it is
a nice solution, but I think cron plus a decent script does really
solves the problem fine.

On Thu, Feb 19, 2009 at 7:56 PM, Peter Renzland <peter@dancing.org> wrote:
> I would write a simple script "ipoff NN" which takes the same arguments as
> iptables (after NN), converts -I and -A to -D, etc, and sleeps NN minutes
> before doing the cancel.
>
> Then, after running the command that sets up the rule, I would just arrow up
> and change iptables to ipoff NN.
> That would be *very usable*, IMHO.
>
> (I most definitely would not use cron or at, since those tools do not
> naturally match the problem at all.)
>
>
> Peter
>
>
> On 09  Feb 19, at 12:42 , Colin Davis wrote:
>
>>
>> Thanks Ivan, I was hoping to be able to do this directly using a rule
>> without writing a script / using cron but looks like that's what I'm going
>> to have to do.
>>
>> Colin.
>>
>>
>> Ivan Petrushev wrote:
>>>
>>> I'm not sure if that can be done with the netfilter itself.
>>> You could always get a script into crontab to check if the rule is
>>> matched (iptables ... -L -n -v will show you number of packets matched
>>> by the rule) and set up some sort of a timer.
>>>
>>> Ivan
>>>
>>> On Thu, Feb 19, 2009 at 7:10 PM, Colin Davis <col@colsmemory.co.uk>
>>> wrote:
>>>
>>>> Hi,
>>>>
>>>> Not sure if this is possible. I wish to create a rule that once created
>>>> will
>>>> automatically expire (and be removed) after say 10 minutes.
>>>>
>>>> Please
>>>>
>>>> Many thanks,
>>>> Colin.
>>>> --
>>>> To unsubscribe from this list: send the line "unsubscribe netfilter" in
>>>> the body of a message to majordomo@vger.kernel.org
>>>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>>>
>>>>
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe netfilter" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
