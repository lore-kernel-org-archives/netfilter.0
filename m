From: Mart Frauenlob <mart.frauenlob@chello.at>
Subject: Re: Invalid arguments when using '-j TEE'
Date: Wed, 11 Jan 2012 21:18:50 +0100
Message-ID: <4F0DEEAA.5020603@chello.at>
References: <CAO=pG1As783Kach_+8_hUHBMqaYNBcvw6a13RUB4cVnuOeUB+g@mail.gmail.com> <alpine.LNX.2.01.1201111924450.23643@frira.zrqbmnf.qr> <CAO=pG1DZEaKoWUi+zSxFtLgNuowY1Up5m98JMNoFwn9hcePwdw@mail.gmail.com>
Reply-To: mart.frauenlob@chello.at
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAO=pG1DZEaKoWUi+zSxFtLgNuowY1Up5m98JMNoFwn9hcePwdw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ye Liu <yeliu@carmelvision.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>, Dov Berliner <dov@carmelvision.com>

On 11.01.2012 19:30, Ye Liu wrote:
> Jan, I replaced the real ip with X's, sorry for the confusion.
>
> On Wed, Jan 11, 2012 at 1:25 PM, Jan Engelhardt<jengelh@medozas.de>  wrote:
>> On Wednesday 2012-01-11 19:20, Ye Liu wrote:
>>
>>> Hi there,
>>>
>>> I need to setup iptables rules to tee the traffic, so I've tried to
>>> add the following rule:
>>> $>  iptables -t mangle -A PREROUTING -j TEE --gateway xxx.xxx.xxx.xxx
>>> But the command gives an error, says
>>> $>  iptables: Invalid argument. Run `dmesg' for more information.
>>
>> xxx.xxx.xxx.xxx is of course not a valid IP address.
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

Forget Jan, he once again proved he's the biggest asshole on the list.
