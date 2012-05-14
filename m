From: Tom van Leeuwen <tom.van.leeuwen@saasplaza.com>
Subject: Re: Problems with a forward rule
Date: Mon, 14 May 2012 08:33:22 +0200
Message-ID: <4FB0A732.4070909@saasplaza.com>
References: <CAEjQA5JVsMUizFWODGe+OT88owqbPU0=ZjtRugq6Eg8z1U3A=w@mail.gmail.com> <alpine.LNX.2.01.1205121746300.5922@frira.vanv.qr> <4FAECDBA.9030302@saasplaza.com> <CAEjQA5LAwmxTwAGWJH5A5Bs57h8=BSXWwiWegYmVKSM7ZtvtmA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAEjQA5LAwmxTwAGWJH5A5Bs57h8=BSXWwiWegYmVKSM7ZtvtmA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "C. L. Martinez" <carlopmart@gmail.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Alright,
Judging your ruleset the only relevant lines for your host 172.24.50.3 
would be:

:FORWARD DROP [2:80]
-A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
-A FORWARD -s 172.24.50.3/32 -m state --state NEW -j ACCEPT
-A FORWARD -j LOG --log-prefix "IPT FORWARD packet died: "

And you said that restricting destination does not work. Your rule:
iptables -A FORWARD -s 172.24.50.3 -d 1.1.1.0/24 -m state --state NEW -j 
ACCEPT

You say it does not work. If that is the case, your packets are logged 
and dropped.
Could you paste the log entries for your host 172.24.50.3?

On 05/14/2012 07:45 AM, C. L. Martinez wrote:
> On Sat, May 12, 2012 at 10:53 PM, Tom van Leeuwen
> <tom.van.leeuwen@saasplaza.com>  wrote:
>> Indeed do iptables-save for the complete ruleset and tell us what you want
>> and expect.
>>
>>
>> On 12-5-2012 17:47, Jan Engelhardt wrote:
>>> On Friday 2012-05-11 17:04, C. L. Martinez wrote:
>>>
>>>> Hi all,
>>>>
>>>> I have setup the following rules in a centos6 gateway:
>>>> [ugly iptables -L]
>>> *Use* iptables-save and provide a *full* ruleset.
>>>
> Ok, here they are. I want to allow connections from host 172.24.50.3
> to one specific network only.
