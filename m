From: Maarten Vanraes <maarten@ba.be>
Subject: Re: xtables-addons ACCOUNT
Date: Wed, 20 Oct 2010 10:25:55 +0200
Message-ID: <201010201025.55825.maarten@ba.be>
References: <201010181712.03160.maarten@ba.be> <201010191009.32841.maarten@ba.be> <1287506749.13167.1042.camel@laplaplian>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1287506749.13167.1042.camel@laplaplian>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: netfilter@vger.kernel.org
Cc: Bob Miller <bob@computerisms.ca>

Op dinsdag 19 oktober 2010 18:45:49 schreef Bob Miller:
> Hi
> 
> > where exactly should i use the ACCOUNT module? does that matter?
> 
> Assuming you mean in your iptables rule set, yes, it matters, and you
> should put it where you want it to count.  Based on my my understanding,
> limited though it is; in theory, for the 0/0 subnet, the mangle
> table/prerouting chain will catch all traffic between you and the ISP
> that has tcp/ip qualities (ie address and netmask).  If you are trying
> to count data used to the ISP by computers on a LAN, then placing the
> rule in the filter table/forward chain should count that traffic.
> 
> > error message when trying to use it now:
> > 
> > 
> > ACCOUNT: Table publicnet found, but IP/netmask mismatch. IP/netmask
> > found: 194.0.234.0/255.255.255.0
> > ACCOUNT: Table insert problem. Aborting
> 
> Seems your configuration doesn't match your situation?  without knowing
> more about your environment and how you configured this box, it is hard
> to say, maybe your interface address is not in 194.0.234.0/24 or
> something?
> Jan's response might seem to indicate this is an issue of the way you
> built this up or a software mismatch of some sort.  Given the fun I had
> making this work before it all came out in debian packages with debian
> methods of building it, I would not be one bit surprised if that is the
> case.

this error message is due to a previous publicnet rule, and it can't seem to 
find the matching network. even though it is the same one. (i suspect it is due 
to network being 194.0.234.0/24 and the matcher is checking 
194.0.234.0/255.255.255.0 ). also i suspect there is a another bug when 
removing the rule that the matcher can't find the correct one (also due to 
different netmask notations?) and thus not everything is removed which means 
that i can't reinsert that one.


Well, i looked at the distromap, seen which versions of what packages work 
well and put those working ones on this lenny: for instance; this lenny has 
pretty much all relevant packages from the squeeze (which is green in that 
map)

furthermore, i don't have any problem with the module; it loads fine

> > when trying to remove the rule with iptables:
> > 
> > 
> > ACCOUNT: Table publicnet not found for destroy
> > 
> > 
> > "iptaccount -a" does show the nets fine; but the -l publicnet always
> > gives:
> > 
> > 
> > Showing table: publicnet
> > Run #0 - 0 items found
> > Finished.
> 
> If the other two nets are working as expected, I would think that means
> your software is working, but I dont' know why you would have this
> problem on the one net.


no, i am testing manually with iptables and this is after the first entry 
(there is only one tname here.

but no amount of traffic is having any effect here.

i mean; where do i get all the results? it always says 0.

Kind regards,

Maarten
