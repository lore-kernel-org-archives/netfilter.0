From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: How to elegantly handle two ISPs on a single box?
Date: Wed, 6 Apr 2005 17:04:36 -0500
Message-ID: <000f01c53af4$9f77d8b0$f5001eac@riverview.office>
References: <20050406194635.GE12284@torres.l21.ma.zugschlus.de><002d01c53aea$f577baf0$f5001eac@riverview.office>
	<20050406210406.GA22689@torres.l21.ma.zugschlus.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="us-ascii"
To: Marc Haber <mh+netfilter@zugschlus.de>, netfilter@lists.netfilter.org

> thanks for the verbose explanation. I really appreciate that.

No problem, that's what this list is for, a place where people can help
other people.

> However, the final decision which ISP to use is the kernel's, and it
> treats both path at same cost (hence the name). This is not the case
> here. ISP A is a symmetric 2 Mbit line with high bandwidth cost, and
> ISP B is a cheap ADSL (3Mbit/512 Kbit). That being said, it should be
> clear that I want to control that the office PCs can surf the web
> through ISP B while the home office users should have their VPN access
> through ISP A.
>
> Is that kind of control possible with ECMP?

In a round about way, yes it is.  I think I *may* have assumed that that
your ISP connections were both the same grade (equal) and thus a good
canadate for ECMP.  However in light of what is going on with the different
grade connections other things are in play now.  Considering there is a
price per byte on the ISP A line you probibly want all but your VPN traffic
to go over ISP B's DSL connection.  That being the case I think you are
looking at some different advanced routing issues.  ECMP has a few options
to it's "nexthop via ..."  paramiter to the "ip route" command.

Here is a snippet from the man page for the "ip" command

ip route add default via <ip> [dev <dev_of_ip>] [weight <dev_weight_of_ip>]
nexthop via <ip2> [dev <dev_of_ip2>] [weight <dev_weight_of_ip>]
(This is reworded by me for clarity)
....
nexthop NEXTHOP
    the nexthop of a multipath route.  NEXTHOP is a complex value with its
own syntax  similar  to  the  top level argument lists;
        via ADDRESS - is the nexthop router.
        dev NAME - is the output device.
        weight NUMBER - is the weight for this element of a multipth route
reflecting its relative bandwidth or quality.

As such I think you could do something like this considering that you would
want the ECMP to know about the various speed / cost / weight of the links:

ip route add default via 172.16.0.130 dev <dev of ISP B> weight 3 nexthop
via 10.0.0.2 dev <dev of ISP A> weight 2

I'm not sure if the weights prefere lower or higher numbers as the man page
is not clear, but this should be easily found out by playing with the
numbers and doing some testing.  But this only tries to spread the load out
across the two links, it does not send most of your traffic to ISP B's DLS
connection while having your VPN traffic go over your ISP A's connection.

I'm going to assume that all traffic to and from the web (default route)
will be via ISP B's DSL connection first and then fail over to ISP A's
connection if the DSL is down for some reason.  I'm also going to assume
that all of your VPN traffic should go through the ISP A's connection first
and then fail over to ISP B's DSL connection if the ISP A's connection goes
down.  (For the sake of this discussion please don't talk to me about the
fact that IPSec would probibly break if it started running over a different
IPSec tunnel b/c the external globally routable IP chagned.  This is where
you would acctually establish a VPN on both interfaces and use the primary
one on the 3 Mb sync connection from ISP A.)

I'm speculating here as I have not done any thing like this with the "ip"
command yet, but I would start with this:

ip route add default via 172.16.0.130 metric 1 table main
ip route add default via 10.0.0.2 metric 2 table main
ip route add default via 10.0.0.2 metric 1 table vpn
ip route add default via 172.16.0.130 metric 2 table vpn
ip rule from <server_ip> table vpn

I'm not exactly sure that I have all the syntax exactly right, but I think
you get the gist of what I'm going after.  Basicaly all traffic defaults to
going out ISP B's DSL connection and failing over to ISP A's connection only
when ISP B's DSL connection is down for some reason.  VPN traffic will be
routed out ISP A's connection and fail over to ISP B's DSL connection only
when ISP A's connection is down for some reason.  Based on the fact that you
were creating tables for "ip" to use in your original post I think you know
what has to be done to crate the "vpn" table and make sure that all the
systems use the "main" and "default" table approprietly.  If you only want
the server's VPN traffic to go out the ISP A connection you could use an
IPTables MARK target to mark the packet and then use a rule in side of "ip"
to match against the fwmark in lieu of the server's IP address.



Grant. . . .


