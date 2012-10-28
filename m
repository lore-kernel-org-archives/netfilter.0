From: Eliezer Croitoru <eliezer@ngtech.co.il>
Subject: Re: 2 nics and traffic delayed/lost on LAN
Date: Mon, 29 Oct 2012 01:44:29 +0200
Message-ID: <508DC35D.1020303@ngtech.co.il>
References: <CAG5MBdXsm-bD2diJKif3mF3p=h6YCfbV__SY55gjtas81ForqA@mail.gmail.com> <508D4FED.4040105@ngtech.co.il> <CAG5MBdUoGwooO7VHy6ae+KyeRcypo2p9A2zxP+egLjkE_6H-KA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAG5MBdUoGwooO7VHy6ae+KyeRcypo2p9A2zxP+egLjkE_6H-KA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Kim Emax <kimemax@gmail.com>
Cc: netfilter <netfilter@vger.kernel.org>

On 10/28/2012 8:52 PM, Kim Emax wrote:
> That's nice to know. I consider myself no expert in iptables but do
> know my way around and it's just fustrating that it does behave as
> supposed to...
You are not suppose to be EXPERT but just to understand the basics.
In most cases it will continue to frustrate you after you will 
understand the real problem so give yourself some slack.
>
> I did find, from googling that maybe i missed a single forward chain:
>
> iptables -A FORWARD -i eth1 -j ACCEPT
I like the output of "iptables-save" which can make more sense to me.
>
if it worked before and the only problem was it is dosnt work well 
that(iptables) is probably not the problem.
> But it didn't make a difference...
>

> When you say lower, do you mean settings in for instance
> /proc/sys/net/ipv4/ip_forward
>
I mean by drivers faulty switch\cable\router\line etc.
(maybe it's related to reverse path filtering)

the odds that the fault is at iptables is so limited it's unlikely the 
cause.(but not 100% guarantied).

>
>> >What Distro are you using?
> Ubuntu 12.04
>
OK
what evidence you do have that proves the packets loss?
if it get's into one interface but dosnt come-out from the other it's 
something with kernel settings.
there aren't many options about it.

I would suggest you to post in Ubuntu-servers with hardware 
specification of the machine and topology.

you can Cc me and I will try to help you on my free time.

Regards,
Eliezer
-- 
Eliezer Croitoru
https://www1.ngtech.co.il
IT consulting for Nonprofit organizations
eliezer <at> ngtech.co.il
