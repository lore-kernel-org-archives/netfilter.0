From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: filtering in which rules?
Date: Fri, 20 May 2005 21:37:17 -0500
Message-ID: <428E9EDD.5020909@riverviewtech.net>
References: <42889941.5060507@griffous.net>	<4288E7F6.3030700@riverviewtech.net>	<Pine.LNX.4.60.0505161523100.15128@darkstar.sysinfo.com>	<Pine.LNX.4.60.0505161548000.15128@darkstar.sysinfo.com>	<42890B63.2000603@riverviewtech.net>
	<Pine.LNX.4.60.0505202018220.12153@darkstar.sysinfo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.60.0505202018220.12153@darkstar.sysinfo.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

> I wacthed the discusion today on leaving filtering to the filter chain 
> and leave nat to nat and routing to the pre/post chains.  But, when one 
> reads other documentation and it has paramaters to iptables like this;
> 
> iptables -P INPUT DROP
> iptables -P FORWARD DROP
> iptables -P OUTPUT ACCEPT
> iptables -t nat -P PREROUTING DROP
> iptables -t nat -P POSTROUTING DROP
> 
> It gives one the impression that matters of filtering and decision 
> making for a packet are not as carved in stone as implied in the 
> discusion today. Jason makes some great points about complexity of 
> rulesets and trying to maintain that accross a number of firewalls 
> overtime.  But, that seems to implay that others have adopted complexity 
> and feel fine with all it brings to the maintainace table.  Unless I'm 
> reading the DROP defaults for the pre/post routing above.  So for 
> clarification one more time, should one read these docs with a grain of 
> salt and alter acordingly, perhaps placing a default ACCEPT in the 
> pre/post chanins and then doing what filtering is required in the 
> 'proper' filter chains for clarity? I direct this to Jason in 
> particular, though Grant as well as others may wish to input again 
> <cause Jason and Grant seem to know their stuff when it comes to iptables>.

I think that what Jason is trying to allude to is akin to stock Ford Crown Victorias you and I can by at our local car dealership vs. the Fleet Ford Crown Victoria that the police so love to use.  I have been told (and tend to believe) that the stock CV is faster and more maneuverable than the fleet version.  However the fleet version is meant to be on the road far far more hours than the non fleet and they are also meant to be MUCH more maintainable.  The idea behind this analogy and my statement is that the IPTables firewalls that Jason is referring to would be more of the fleet variety, something you might use in place of the Cisco 2501 routers that are on the remote end of so many T1, they standardized, maintainable, easily configurable and upgradeable to any average Cisco person that walks on site.  Where as more of the uber secure IPTables firewalls that are described in many of th
 ose documents are what you might find in side of an R & D department that is worried about
 industrial espionage and thus have much more secure firewalls.  I suspect that many of the firewalls that Jason is working on are simple and effective with out too many bells and whistles, something that will be robust and secure.  More of the firewalls that I work on are more of the R & D department type (routing / load balancing across 8 cable modems from the same provider with 8 sequential IPs all of which have the same upstream GW) firewalls where it will be me or a select few of my piers that will work on them.  The more bells and whistles that you put in to a system the more complicated you make it for others to maintain when you are hit by the Greyhound Buss on your way in to the office after your morning bagel.  With this in mind the simple and robust solution would be to do all your filtering in the filter table (as that is what it is meant for) where people will look first to 
 resolve problems.  Once you have the filter table set up the way that you want it you coul
d optionally choose to also set up filtering in the nat, mangle, and raw tables to be absolutely sure that no one will get past your firewall.  However this is probably and quite likely overkill for most situation.  One reason that does come to mind to filter in the mangle table would be if you continually received a LOT of one specific type of packet that you knew you would never need that was causing undo load on your firewall to process on the IP routing layer, thus you could / should filter it out in the mangle layer before IP even decides if it needs to route it.  Below is a short list of points as to why to filter in the filter table:

  1)  All packets (that are not DROPed prior) traverse the INPUT / FORWARD and / or OUTPUT chains in the filter table.
  2)  Not all packets traverse the PREROUTING, POSTROUTING, OUTPUT chains in the nat table, just NEW connections.
  3)  The nat, mangle, and raw table are really sort of like tools to do specific things that can not (should not) be done in the filter table.
  4)  The filter table is where people expect to see filtering rules and thus will look.  Often (as Jason pointed out) some rules that are not in the filter table will be overlooked when diagnosing problems.
  5)  More advanced features, i.e. SSH_Brute_Force test, selectively REJECTing vs DROPing Ident (Auth) requests, etc. are more specialized and thus are more troublesome to diagnose and thus are not often needed on most of your firewalls / routers.
  6)  Many edge routers that pass large amounts of traffic do not need the complexity of these filters and thus do not have them, this is reserved for the R & D departmental level routers / firewalls.

Ok, I think I'm done ranting now.



Grant. . . .

