From: Colin Davis <col@colsmemory.co.uk>
Subject: Re: iptables - how to create a rule that expires automatically
Date: Thu, 19 Feb 2009 17:42:12 +0000
Message-ID: <499D99F4.2010400@colsmemory.co.uk>
References: <499D9292.902@colsmemory.co.uk> <d39744a20902190936u48f082d9p7c0da22a6948e6d8@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <d39744a20902190936u48f082d9p7c0da22a6948e6d8@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ivan Petrushev <ivanatora@gmail.com>
Cc: netfilter@vger.kernel.org


Thanks Ivan, I was hoping to be able to do this directly using a rule
without writing a script / using cron but looks like that's what I'm going
to have to do.

Colin.


Ivan Petrushev wrote:
> I'm not sure if that can be done with the netfilter itself.
> You could always get a script into crontab to check if the rule is
> matched (iptables ... -L -n -v will show you number of packets matched
> by the rule) and set up some sort of a timer.
>
> Ivan
>
> On Thu, Feb 19, 2009 at 7:10 PM, Colin Davis <col@colsmemory.co.uk> wrote:
>   
>> Hi,
>>
>> Not sure if this is possible. I wish to create a rule that once created will
>> automatically expire (and be removed) after say 10 minutes.
>>
>> Please
>>
>> Many thanks,
>> Colin.
>> --
>> To unsubscribe from this list: send the line "unsubscribe netfilter" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
>>     

