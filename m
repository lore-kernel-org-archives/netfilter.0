From: Colin Davis <col@colsmemory.co.uk>
Subject: Re: iptables - how to create a rule that expires automatically
Date: Thu, 19 Feb 2009 18:14:06 +0000
Message-ID: <499DA16E.8060909@colsmemory.co.uk>
References: <499D9292.902@colsmemory.co.uk> <d39744a20902190936u48f082d9p7c0da22a6948e6d8@mail.gmail.com> <499D99F4.2010400@colsmemory.co.uk> <84965006-A4F7-41DD-8C6F-ED62AA82B2F9@dancing.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <84965006-A4F7-41DD-8C6F-ED62AA82B2F9@dancing.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Peter Renzland <peter@dancing.org>
Cc: netfilter@vger.kernel.org


Thanks Peter, definitely pointed me in a better direction.

Colin.


Peter Renzland wrote:
> I would write a simple script "ipoff NN" which takes the same 
> arguments as iptables (after NN), converts -I and -A to -D, etc, and 
> sleeps NN minutes before doing the cancel.
>
> Then, after running the command that sets up the rule, I would just 
> arrow up and change iptables to ipoff NN.
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
>> without writing a script / using cron but looks like that's what I'm 
>> going
>> to have to do.
>>
>> Colin.
>>
>>
>> Ivan Petrushev wrote:
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
>>>> Not sure if this is possible. I wish to create a rule that once 
>>>> created will
>>>> automatically expire (and be removed) after say 10 minutes.
>>>>
>>>> Please
>>>>
>>>> Many thanks,
>>>> Colin.
>>>> -- 
>>>> To unsubscribe from this list: send the line "unsubscribe 
>>>> netfilter" in
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

