From: Andrew Beverley <andy@andybev.com>
Subject: Re: How can I test my tc script?
Date: Thu, 03 Feb 2011 19:38:36 +0000
Message-ID: <1296761916.7587.29.camel@andybev>
References: <1296699466.4606.14.camel@debian-laptop.OptimumWireless>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1296761919; bh=MxEsWDXosXje6wpBhh0pmDuYVuSyW9UgODi7J
	8NuPhg=; h=Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:Message-ID:Mime-Version:Content-Transfer-Encoding; b=fU/gtfzE
	mtVpgFhORigNLE3JrNksCTgkKE+bnUzIQo+hhYOiIkS6uW26tGu2MPdWq0OxXGGGTgD
	VugZOyisq//wW4xXmIBd6K9iUGMdh1r779jqmUrpaOuNPxEQDwNyBgptCCH8OFiLnaz
	lPIShosyun/id+OJrUsrSuvjx+Exg=
In-Reply-To: <1296699466.4606.14.camel@debian-laptop.OptimumWireless>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: wilson@optimumwireless.com
Cc: netfilter@vger.kernel.org

On Wed, 2011-02-02 at 22:17 -0400, Optimum Wireless Services wrote:
> I would like to know how can I run some sort of benchmark test on a
> network that would simulate 10,20,50,100 users connected to see if my gw
> is handling the traffic well.
> 

I suggest using tc-viewer to see what your qdisc is actually doing
during peak use:

tc-viewer --iface=eth1 --zero --counter=1 --unit=kbit

> Here's a snip of what the script looks like:
> 
> ################ 
> Now Download interface
> 
> $tc qdisc del dev eth1 root
> $tc qdisc add dev eth1 root handle 2: htb r2q 1
> 
> $tc class add dev eth1 parent 2:0  classid 2:1 htb rate 15500kbit ceil
> 15525kbit
> 

Does the sum of all the leaf classes below add up to the root rate
above? From the HTB manual: "The rate supplied for a parent should be
the sum of the rates of its children."

This isn't necessarily your problem, but you should definitely make sure
you have it right.

> #for each user
> $iptables -t mangle -A POSTROUTING -d 172.16.100.11 -j MARK --set-mark
> 1009
> $iptables -t mangle -A POSTROUTING -d 172.16.100.11 -j RETURN
> $tc class   add dev eth1 parent 2:17    classid 2:1009 htb rate 739kbit
> ceil 850kbit prio 3

This doesn't look right to me. I see no parent 2:17 ?

> $tc filter  add dev eth1 parent 2:0     protocol ip prio 3 handle 1009
> fw classid 2:1009
> $tc qdisc   add dev eth1 parent 2:1009  handle 507: sfq perturb 2
> 
> 
> Are these rules ok?
> 

I suggest using tc-vewer as above. You'll then be able to see how much
traffic is going into each leaf class and get an idea if your rules are
working. You will also be able to compare the data rate in your qdisc
with the rate on your interface - you might even find that not all
traffic is going into the qdisc.

Andy



