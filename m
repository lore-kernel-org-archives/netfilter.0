From: "Jonathan Villa" <jvilla@e37.net>
Subject: Re: allow range syntax - perplexed
Date: Tue, 15 Jun 2004 14:30:05 -0500 (CDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1932.64.2.245.108.1087327805.squirrel@64.2.245.108>
References: <1613.64.2.245.108.1087318849.squirrel@64.2.245.108> 
    <1087322336.2054.12.camel@localhost> 
    <1846.64.2.245.108.1087324894.squirrel@64.2.245.108>
    <1087326912.2055.26.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1087326912.2055.26.camel@localhost>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org


> Hmmm . . . that is very confusing.  It should work which makes me think
> something else is going on.  I would suggest it is time to do a little
> tracing to find out where the problem really is.
>
> I would suggest that the first order of business be ensure that the
> packets are making it to the MySQL server.  One could enable all traffi=
c
> and see if you are still denied (if so, a good sign that the packets
> never make it there in the first place) or, if that is impractical or
> you really want to be sure, put a protocol analyzer on the line (e.g.,
> http://www.ethereal.com).  If the server is on a switch, you can either
> insert a hub, use port mirroring or use ettercap
> (http://ettercap.sourceforge.net) to insert yourself into the packet
> stream.  If you do not see the packets arriving, we know the problem is
> somewhere else in the network.
>
> If the packets arrive at the MySQL server, then I would start placing
> log rules at various points in the iptables rules set to see where the
> packets are dropped.  If they are not dropped before the ACCEPT rule,
> then see if they are still in the chain after the ACCEPT rule (in which
> case something is wrong with the match portion of the rule).  If not,
> they have been ACCEPTED and are either being DROPped or mangled in
> another POSTROUTING chain or, more likely, there is an application laye=
r
> problem.
>
> Regarding interface versus subnet, it depends on which you fear most!
> The interface allows you to add new subnets and they will all be allowe=
d
> based upon port regardless of IP.  If that kind of free access scares
> you, then restrict it to specific addresses and subnets (which seems
> like it is what you want to do anyway).  The downside there is that you
> must change the rules for any subnets or addresses you later add.  If
> that kind of maintenance scares you, go back to allowing everything fro=
m
> the allowed ports on the interface.

Packets are making it to the server just fine for ip addresses not on the
same network.  For example, I am 3 hours away and can access the machine
via port 80, 3306, and 22.  When I create the rules for ips on the same
network, they can't even access port 80 for phpMyAdmin.  But once I remov=
e
the ip check and allow access for the whole world, they are fine.




