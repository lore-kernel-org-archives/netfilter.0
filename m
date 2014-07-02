From: Eliezer Croitoru <eliezer@ngtech.co.il>
Subject: Re: help needed preventing bruteforce behind a reverse proxy
Date: Wed, 02 Jul 2014 05:34:58 +0300
Message-ID: <53B36FD2.70509@ngtech.co.il>
References: <53B26B4C.4030002@gmail.com> <53B2ED11.4020902@ngtech.co.il> <CAMEq33fMwz-iufG+kVsrvdXwf7m9HZoE_0vF4Er5vZ8yyHk_9g@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-reply-to: <CAMEq33fMwz-iufG+kVsrvdXwf7m9HZoE_0vF4Er5vZ8yyHk_9g@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Francesco Morosinotto <francescomorosinotto@gmail.com>
Cc: netfilter@vger.kernel.org

Indeed you got the point of the issue.

Just to let you know that squid can knock out many products out-there as 
a reverse proxy... and is very simple to setup(for me less then a minute)
But you can use haproxy which is very simple to implement or squid.
Nginx is nice and can perform nice as long as it doesn't supply cache, 
and also it's far more complicated to setup then squid and maybe also 
haproxy.
- Haproxy will handle more requests per second and is preferred by many 
admins for this task.
- Squid now(3.4.X and since 3.2) has SMP function which allows it to be 
even more then it was in the past.
With the right setup and settings it can be scaled on a 10GBps 
links.(not necessarily will benefit from all of it but faster then 
teamed\bonded 4 1GBps nics for sure)

If you want to try squid(I am the CentOS RPMs builder for squid) feel 
free to contact me and I can compile for you a squid.conf that will be 
good for your setup.

All The Bests,
Eliezer

On 07/01/2014 11:26 PM, Francesco Morosinotto wrote:
>
>     My suggestion is to implement the fail2ban rules on the reverse
>     proxy machine and not on the origin server.
>     If and only if you can't or doesn't want to, then use a PUSH throw
>     SSH or any other mean to blakclist the IP in the Reverse proxy iptables.
>
>
> So my problem will only be to pass the to-be-banned ip from server B
> (that can decide if an ip has to be banned or not) to server A (that can
> ban the ip using iptables)?
>
>
> cheers
>
> francesco

