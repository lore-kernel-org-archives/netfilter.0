From: Optimum Wireless Services <wilson@optimumwireless.com>
Subject: Re: How can I test my tc script?
Date: Thu, 03 Feb 2011 10:13:11 -0400
Message-ID: <1296742392.4183.2.camel@debian-laptop.OptimumWireless>
References: <1296699466.4606.14.camel@debian-laptop.OptimumWireless>
	 <20110203120131.38cd818d@catus>
Reply-To: wilson@optimumwireless.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20110203120131.38cd818d@catus>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Marek Kierdelewicz <marek@piasta.pl>
Cc: netfilter@vger.kernel.org

Thanks for replying.

I thought I could optimize these ruleset but, didn't have an idea how
to. Now, you gave me an idea on how to accomplish it. I'll read the two
links you sent to see how I can do this.

I hope you guys don't mind if I have questions about it later on.

Thanks.


On Thu, 2011-02-03 at 12:01 +0100, Marek Kierdelewicz wrote:
> >Hello.
> 
> Hi,
> 
> >I recently wrote a script that adds a new rule for an ip address each
> >time a new user is added to our network. I've noticed my tc rules work
> >...
> >Our network has about 120 users in total not all of these get connected
> >Are these rules ok?
> 
> If you have such linear ruleset (iptables marking+tc filter) for 120
> users then it's will not work well. If my theory is right, check top
> when there are more users logged in. You'll probably see hi cpu usage
> in "si"/"hi" (software/hardware interrupt) fraction.
> 
> You can easily optimize you ruleset by using:
> - tc u32 hashing filters [1] instead of iptables marking and fw tc
>   filters;
> - shape upload on ifb device [2] in ingress before nat, so you can use
>   tc u32 hashing filters too;
> 
> With such setup Core2 duo 3GHz + dual port intel nic can easily
> (68% peak cpu usage) route symmetric 400mbit of traffic, doing per user
> shaping, nat and access control for >2k users.
> 
> 
> [1] http://lartc.org/howto/lartc.adv-filter.hashing.html
> [2] http://www.linuxfoundation.org/collaborate/workgroups/networking/ifb
> 
> Best regards,
> Marek Kierdelewicz

