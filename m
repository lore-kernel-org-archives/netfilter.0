From: "Nikolay S. Rybaloff" <nowhere@hakkenden.ath.cx>
Subject: Re: newbie question: UDP is stateless ... right?
Date: Fri, 30 Jan 2009 23:00:31 +0300
Message-ID: <573116CBE1A14366854B66613B492596@Hakkenden>
References: <87fa72960901301050n7d982887waadc1fc090fc96ed@mail.gmail.com> <49835151.8010701@www.knutejohnson.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="response"
To: Knute Johnson <knute2009@www.knutejohnson.com>, Mr Vandeley <mr.vandeley@gmail.com>
Cc: netfilter@vger.kernel.org

If you are talking about netbios name resolution via UDP:137, than this is a 
bit more complex. These packets are mostly network-directed broadcasts so 
AFAIK state rule is not created for them and reply packets look like NEW. 
nf_conntrack_netbios_ns installs this rule.

--------------------------------------------------
From: "Knute Johnson" <knute2009@www.knutejohnson.com>
Sent: Friday, January 30, 2009 10:13 PM
To: "Mr Vandeley" <mr.vandeley@gmail.com>
Cc: <netfilter@vger.kernel.org>
Subject: Re: newbie question: UDP is stateless ... right?

> Mr Vandeley wrote:
>> Hi,
>> Please, excuse me this newbie question, but I don't understand
>> correctly. For what I know, UDP connections are not statefull, so I
>> can't track them... right?
>> What I've been doing on my firewalls was explicitely accepting
>> incoming packets from UDP privileged ports and so accepting answers to
>> my UDP requests. Now I have found that if I accept RELATED,ESTABLISHED
>> traffic without saying anything about the protocol, UDP answers will
>> be accepted.
>> I know that this isn't a question related to Netfilter but is the only
>> place I know to ask about this.
>>
>> thanks.
>
> That's true if you have the correct modules installed.  I ran into this 
> problem with netbios dns packets which are UDP.  I had to add 
> nf_conntrack_netbios_ns to my /etc/modules file and then it would work. 
> This wasn't really clear to me at the time.  I thought all you needed was 
> the iptables rule that said RELATED,ESTABLISHED.  There are a bunch of 
> those modules.
>
> -- 
>
> Knute Johnson
>
> "The urge to save humanity is almost always a false front for the urge to 
> rule."
>
>   H.L. Mencken
>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
