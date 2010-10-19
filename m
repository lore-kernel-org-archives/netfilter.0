From: Bob Miller <bob@computerisms.ca>
Subject: Re: xtables-addons ACCOUNT
Date: Tue, 19 Oct 2010 09:45:49 -0700
Message-ID: <1287506749.13167.1042.camel@laplaplian>
References: <201010181712.03160.maarten@ba.be>
	 <1287418703.13167.231.camel@laplaplian>
	 <1287419553.13167.237.camel@laplaplian>  <201010191009.32841.maarten@ba.be>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <201010191009.32841.maarten@ba.be>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Maarten Vanraes <maarten@ba.be>
Cc: netfilter@vger.kernel.org

Hi
> 
> where exactly should i use the ACCOUNT module? does that matter?

Assuming you mean in your iptables rule set, yes, it matters, and you
should put it where you want it to count.  Based on my my understanding,
limited though it is; in theory, for the 0/0 subnet, the mangle
table/prerouting chain will catch all traffic between you and the ISP
that has tcp/ip qualities (ie address and netmask).  If you are trying
to count data used to the ISP by computers on a LAN, then placing the
rule in the filter table/forward chain should count that traffic.

> error message when trying to use it now:
> 
> 
> ACCOUNT: Table publicnet found, but IP/netmask mismatch. IP/netmask found: 
> 194.0.234.0/255.255.255.0
> ACCOUNT: Table insert problem. Aborting

Seems your configuration doesn't match your situation?  without knowing
more about your environment and how you configured this box, it is hard
to say, maybe your interface address is not in 194.0.234.0/24 or
something?
Jan's response might seem to indicate this is an issue of the way you
built this up or a software mismatch of some sort.  Given the fun I had
making this work before it all came out in debian packages with debian
methods of building it, I would not be one bit surprised if that is the
case.

> when trying to remove the rule with iptables:
> 
> 
> ACCOUNT: Table publicnet not found for destroy
> 
> 
> "iptaccount -a" does show the nets fine; but the -l publicnet always gives:
> 
> 
> Showing table: publicnet
> Run #0 - 0 items found
> Finished.

If the other two nets are working as expected, I would think that means
your software is working, but I dont' know why you would have this
problem on the one net.


Bob Miller
334-7117/660-5315
http://computerisms.ca
bob@computerisms.ca
Network, Internet, Server,
and Open Source Solutions

