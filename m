From: "John A. Sullivan III" <jsullivan@opensourcedevelopmentcorp.com>
Subject: Re: DNAT/SNAT efficiency?
Date: Wed, 01 Sep 2004 14:28:00 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1094063280.2030.133.camel@localhost>
References: <3A6E2F2950688040B9D3127FFC06345C064F62@ndm01-mxc01.needham.verso.com>
	<1094061223.1824.37.camel@wolfpack.ljm.dom>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1094061223.1824.37.camel@wolfpack.ljm.dom>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: Jason Opperisano <opie@817west.com>
Cc: netfilter@lists.netfilter.org

On Wed, 2004-09-01 at 13:53, Jason Opperisano wrote:
> On Wed, 2004-09-01 at 10:42, Nolan, Timothy wrote:
> > I'd like to use iptables to map addressA/portB to addressC/portD. I need to support up to 8000 address/port pairs (can be coming from any address, so I don't think the NETMAP target will suffice). I was planning to use the NAT table and add a DNAT 
> > target for each address to change the destination address and a SNAT target to change the source (total of 16000 rules).
> > 
> > It's my understanding that iptables uses a linear search and that hipac doesn't support NAT. Does anyone have any opinions on whether iptables will scale to support what I have described?
> > 
> > Thanks,
> > Tim
> 
> sorry--i'm not qualified to answer the linear search/hipac part of your
> question.
> 
> in the event that your only choice is to have 8000 DNAT and 8000 SNAT
> rules, you can make a small optimization by doing the following (this
> assumes that portB is the same for all addresses, i'm going to use 80 in
> ths example):
> 
>         iptables -t nat -N dport80
>         
>         iptables -t nat -A PREROUTING -i $outsideIF -p tcp --syn \
>           --dport 80 -j dport80
>         
>         iptables -t nat -A dport80 -p tcp -d $addressA \
>           -j DNAT --to-destination $addressC:$portD
> 
> this way--the *only* packets that have to traverse the 8000 DNAT rules
> will be TCP SYN packets coming in on the outside interface with a
> destination port of 80.  once a match is made in there--let connection
> tracking take over for you.  the fact that there are 8000 rules in
> "dport80" won't affect any other traffic going through this gateway.
> 
> as far as traversing the "dport80" chain with 8000 entries...i dunno. 
> i've done something very similar to this, but the production environment
> only have ~250 entries, and the test environment used ~500 entries.  in
> that case, i didn't measure any significant latency--but you're a whole
> order of magnitude above this...
> 
> as i'm typing this--i just realized you *could* use NETMAP from POM in
> the above situation, if portB == portD; and again, portB is the same for
> all addresses:
> 
>         iptables -t nat -N dport80
>         
>         iptables -t nat -A PREROUTING -i $outsideIF -p tcp --syn \
>           --dport 80 -j dport80
>         
>         iptables -t nat -A dport80 -d $ousideNet \
>           -j NETMAP --to $insideNet
> 
> you may need multiple NETMAP statements if the 8000 addresses don't fall
> neatly into subnet boundaries, but you should be able to summarize down
> to something significantly less than 8000.
> 
> sorry for rambling--hope this is some use.
> 
> -j
You may very well already be well aware of this but, just in case, no
matter how efficient the packet processing will be, loading 16000 rules
may take hours if you load each with an iptables command.  Be sure to
use the iptables-restore -n command instead.  I believe that will load
even 16000 rules almost instantly.  If you create 8000 DNAT/SNAT pairs,
you will also need 8000 IP addresses to respond to the ARP requests. 
I'm not sure how that will scale (that is a face value statement - it
may or may not - I do not know).

I'm a little unclear as to why NETMAP will not work for you.  Perhaps
this is an area where ISCS may be of help to you even though it is not
complete (http://iscs.sourceforge.net).  You can create server objects
in ISCS with any IP address range, e.g., one server with an IP address
that includes 8000 contiguous addresses or several servers with a few
thousand or a few hundred addresses each.  You can define both the real
and NAT addresses this way.  If you check the "Enforce One-To-One" check
box it will output a complete set of rules to create that NAT.  The
rules will vary depending on whether or not the gateway supports NETMAP.

If it does support NETMAP, it will break the range(s) into subnets and
create NETMAP rules using those subnets.  If it does not support NETMAP
or if you specify a specific service (since NETMAP does not support
ports), it will create all 16000 rules for you.  It will should also
create a script to use iproute2 to add all the addresses to the public
gateway interface so that it responds to all the various ARP requests. 
Unfortunately, that feature is awaiting a bug fix in one of the third
party libraries.

Finally, if you do not need a one-to-one mapping, it will map any
arbitrary range into any other arbitrary range.

You can conceivably do this entire operation by creating a single server
with a real range of 8000 addresses and a NAT range of 8000 addresses
and clicking OK.

As I mentioned, the project is not complete so you will need to be
creative in capturing the output.  The product is not designed to output
a rules file; it is designed to automatically distribute the rules to
any number of gateways.

Another useful tool might be SubnetCreator
(http://subnetcreator.sourceforge.net).  This is helpful if you can use
NETMAP.  Since NETMAP only uses subnets and not ranges, SubnetCreator
will take any range and break it into subnets.  You can then use the
subnets to manually make your NETMAP rules.

Hope this helps - John
-- 
John A. Sullivan III
Open Source Development Corporation
Financially sustainable open source development
http://www.opensourcedevel.com


