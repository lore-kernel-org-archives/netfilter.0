From: Henrique Netfilter <henrique.netfilter@gmail.com>
Subject: Re: Handling RoadWarrior VPN Traffic with IPtables
Date: Fri, 25 Apr 2008 14:23:46 -0300
Message-ID: <481213A2.5010002@gmail.com>
References: <4811F8B2.4040702@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:user-agent:mime-version:to:subject:references:in-reply-to:content-type:content-transfer-encoding;
        bh=yz6gwqcYtbcswpJk8HMdj0sOTLkM9tjXB13qkusKmkI=;
        b=qKR+XtYuT7s71pb7n3XTvYVFWQCsyjINNdHEjSm8HMOE/QxTWA3bSVt3U+nsvzm0KyIbKc8SS50XrZFxAyvDSsAHr4dUJ92r3BMlUP7qyktOWBEEILGk+H/2nBmTW8bmHXxXn1Cmb0iEXwAIWmWaEbtd8FD2micEY25Z+kEGMd8=
In-Reply-To: <4811F8B2.4040702@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Yes, it does work.
Followed the packet counter for the rule, it increases with each connection.
Thanks a lot, saved my life.

Henrique Netfilter wrote:
> Jan,
>
> This really looks like might work. I read iptables man page and sounds 
> pretty logical.
> I'm gonna test it, and then I'll reply here saying if it worked or not.
> So far, thank you.
>
>
>
> Jan Engelhardt wrote:
>> On Friday 2008-04-25 17:05, Henrique Netfilter wrote:
>>  
>>> The l2tpd is encaspuled inside the ESP traffic of the IPSec tunnel,
>>> and when it reaches my external interface, it must be redirected to
>>> my internal interface (where the l2tpd daemon listens) to continue
>>> the connection. If I had a KLIPS kernel, I could easily just DNAT
>>> the incoming L2TP requisition on interface ipsec0 to my internal
>>> interface:
>>>
>>> iptables -t nat -A PREROUTING -i ipsecX -p udp --sport 1701 --dport
>>> 1701 -j DNAT --to-destination X.X.X.X <------ my internal interface
>>> IP
>>>
>>> But since my kernel is NETKEY, I can't, since there is  no ipsec
>>> interface, and I can't just DNAT the incoming traffic from my
>>> external to my internal interface for security reasons (since I
>>> want that only traffic coming from the IPSec tunnel to access the
>>> l2tpd daemon).
>>>     
>>
>> -i eth0 -m policy --dir in --pol ipsec
>> [--tunnel-src theirip] [--tunnel-dst yourip]
>>
>> Should be able to accurately replace -i ipsecX. See the iptables
>> manpage. --tunnel-src, --tunnel-dst are just for ensuring that
>> you match exactly one tunnel, you can omit it if it satisfies you.
>>
>>   
>

