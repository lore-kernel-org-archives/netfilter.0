From: Optimum Wireless Services <wilson@optimumwireless.com>
Subject: Re: How can I test my tc script?
Date: Thu, 03 Feb 2011 12:18:44 -0400
Message-ID: <1296749924.4183.14.camel@debian-laptop.OptimumWireless>
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
To: netfilter@vger.kernel.org

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

Based on the example in the above link, the authour creates 256 chains,
which I don't understand. This example also mentions that the ip
addresses are in the "basic", "medium", etc... plan and each of these
ips are in different rules.

My network is on 172.16.0.0 so, that means I need to take the same
aproach to create rules like this:

tc filter add dev eth1 parent 1:0 protocol ip prio 100 match ip src \
  172.16.0.0 classid 1:1
tc filter add dev eth1 parent 1:0 protocol ip prio 100 match ip src \
  172.16.1.0 classid 2:1
..........
tc filter add dev eth1 parent 1:0 protocol ip prio 100 match ip src \
  172.16.100.0 classid 99:1

??? 

so that means I would have to write: 254x254 = 64516 rules ? that
doesn't seem correct.

Please correct me and clear my mind... (I guess I have to do a lot of
reading)


> [2] http://www.linuxfoundation.org/collaborate/workgroups/networking/ifb
> 
> Best regards,
> Marek Kierdelewicz

