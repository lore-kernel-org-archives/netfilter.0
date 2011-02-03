From: Marek Kierdelewicz <marek@piasta.pl>
Subject: Re: How can I test my tc script?
Date: Thu, 3 Feb 2011 12:01:31 +0100
Message-ID: <20110203120131.38cd818d@catus>
References: <1296699466.4606.14.camel@debian-laptop.OptimumWireless>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1296699466.4606.14.camel@debian-laptop.OptimumWireless>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: wilson@optimumwireless.com
Cc: netfilter@vger.kernel.org

>Hello.

Hi,

>I recently wrote a script that adds a new rule for an ip address each
>time a new user is added to our network. I've noticed my tc rules work
>...
>Our network has about 120 users in total not all of these get connected
>Are these rules ok?

If you have such linear ruleset (iptables marking+tc filter) for 120
users then it's will not work well. If my theory is right, check top
when there are more users logged in. You'll probably see hi cpu usage
in "si"/"hi" (software/hardware interrupt) fraction.

You can easily optimize you ruleset by using:
- tc u32 hashing filters [1] instead of iptables marking and fw tc
  filters;
- shape upload on ifb device [2] in ingress before nat, so you can use
  tc u32 hashing filters too;

With such setup Core2 duo 3GHz + dual port intel nic can easily
(68% peak cpu usage) route symmetric 400mbit of traffic, doing per user
shaping, nat and access control for >2k users.


[1] http://lartc.org/howto/lartc.adv-filter.hashing.html
[2] http://www.linuxfoundation.org/collaborate/workgroups/networking/ifb

Best regards,
Marek Kierdelewicz
