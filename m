From: Tom van Leeuwen <tom.van.leeuwen@saasplaza.com>
Subject: Re: Problems with a forward rule
Date: Mon, 14 May 2012 09:03:21 +0200
Message-ID: <4FB0AE39.6040805@saasplaza.com>
References: <CAEjQA5JVsMUizFWODGe+OT88owqbPU0=ZjtRugq6Eg8z1U3A=w@mail.gmail.com> <alpine.LNX.2.01.1205121746300.5922@frira.vanv.qr> <4FAECDBA.9030302@saasplaza.com> <CAEjQA5LAwmxTwAGWJH5A5Bs57h8=BSXWwiWegYmVKSM7ZtvtmA@mail.gmail.com> <4FB0A732.4070909@saasplaza.com> <CAEjQA5JZ55ku3DZuQ_Oe+Ne-85Lr_zMse7VudYAryO5aH8-JLQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAEjQA5JZ55ku3DZuQ_Oe+Ne-85Lr_zMse7VudYAryO5aH8-JLQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "C. L. Martinez" <carlopmart@gmail.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

So, when you do a ping from your host 172.24.50.3 to 1.1.1.x you will 
probably see the counter increase for your rule (with restricted 
destination).
Do "iptables -vnL FORWARD" to check.

That rule is not the problem.

What traffic are you sending that times out?
source ip, source port, destination ip, dest port, protocol?

Your forward and postrouting rules look fine and should work

Regards,
Tom

On 05/14/2012 08:40 AM, C. L. Martinez wrote:
> On Mon, May 14, 2012 at 8:33 AM, Tom van Leeuwen
> <tom.van.leeuwen@saasplaza.com>  wrote:
>> Alright,
>> Judging your ruleset the only relevant lines for your host 172.24.50.3 would
>> be:
>>
>> :FORWARD DROP [2:80]
>> -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
>> -A FORWARD -s 172.24.50.3/32 -m state --state NEW -j ACCEPT
>> -A FORWARD -j LOG --log-prefix "IPT FORWARD packet died: "
>>
>> And you said that restricting destination does not work. Your rule:
>>
>> iptables -A FORWARD -s 172.24.50.3 -d 1.1.1.0/24 -m state --state NEW -j
>> ACCEPT
>>
>> You say it does not work. If that is the case, your packets are logged and
>> dropped.
>> Could you paste the log entries for your host 172.24.50.3?
>>
>>
> Nothing, no drops ... But connections died by timeout ...
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
