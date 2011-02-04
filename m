From: Optimum Wireless Services <wilson@optimumwireless.com>
Subject: Re: How can I test my tc script?
Date: Fri, 04 Feb 2011 09:45:53 -0400
Message-ID: <1296827153.3644.7.camel@debian-laptop.OptimumWireless>
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
> (

> 68% peak cpu usage) route symmetric 400mbit of traffic, doing per user
> shaping, nat and access control for >2k users.
> 
> 
> [1] http://lartc.org/howto/lartc.adv-filter.hashing.html
> [2] http://www.linuxfoundation.org/collaborate/workgroups/networking/ifb
> 

After reading the lartc and the linuxfoundation.org documentation about
the u32 hashing filters it leaves me very confused. I don't get how I
would write my ruleset for all the users I have.

Would I have to create a table for each ip and then create a filter to
match? for ie:

tc filter add dev eth1 parent 1:0 protocol ip prio 100 match ip src \
  172.16.100.1 classid 1:1

tc filter add dev eth1 protocol ip parent 1:0 prio 5 u32 ht 2:7b: \
        match ip src 172.16.100.1 flowid 1:1


tc filter add dev eth1 protocol ip parent 1:0 prio 5 u32 ht 800:: \
        match ip src 172.16.100.1/16 \
        hashkey mask 0x000000ff at 12 \
        link 2:


This method is somewhat complicated but, according to the documentation
"very worth it". 

Can someone please explain it a little better, thanks.



> Best regards,
> Marek Kierdelewicz
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

