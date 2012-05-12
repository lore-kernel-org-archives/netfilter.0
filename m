From: Tom van Leeuwen <tom.van.leeuwen@saasplaza.com>
Subject: Re: Problems with a forward rule
Date: Sat, 12 May 2012 22:53:14 +0200
Message-ID: <4FAECDBA.9030302@saasplaza.com>
References: <CAEjQA5JVsMUizFWODGe+OT88owqbPU0=ZjtRugq6Eg8z1U3A=w@mail.gmail.com> <alpine.LNX.2.01.1205121746300.5922@frira.vanv.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.01.1205121746300.5922@frira.vanv.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jan Engelhardt <jengelh@inai.de>
Cc: "C. L. Martinez" <carlopmart@gmail.com>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Indeed do iptables-save for the complete ruleset and tell us what you 
want and expect.

On 12-5-2012 17:47, Jan Engelhardt wrote:
> On Friday 2012-05-11 17:04, C. L. Martinez wrote:
>
>> Hi all,
>>
>> I have setup the following rules in a centos6 gateway:
>> [ugly iptables -L]
> *Use* iptables-save and provide a *full* ruleset.
>
>> All works ok, except when I try to restrict one host to go out via
>> external interface. My problem is with the following rule:
>>
>>    0     0 ACCEPT     all  --  *      *       172.24.50.3
>> 0.0.0.0/0           state NEW
>>
>> If I try to restrict destination, doesn't works. For example using this rule:
>>
>> iptables -A FORWARD -s 172.24.50.3 -d 1.1.1.0/24 -m state --state NEW -j ACCEPT
>>
>> only works if I do:
>>
>> iptables -A FORWARD -s 172.24.50.3 -m state --state NEW -j ACCEPT
>>
>> then, what am I doing wrong??
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
