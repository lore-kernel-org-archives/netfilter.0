From: Jeff Simmons <jsimmons@goblin.punk.net>
Subject: Re: Routing and DNAT redux
Date: Thu, 9 Jun 2005 10:00:21 -0700
Message-ID: <200506091000.21220.jsimmons@goblin.punk.net>
References: <200506081754.50537.jsimmons@goblin.punk.net>
	<f68a41605060909226f26a9ba@mail.gmail.com>
Reply-To: jsimmons@goblin.punk.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <f68a41605060909226f26a9ba@mail.gmail.com>
Content-Disposition: inline
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
To: Matin Tamizi <mtamizi@gmail.com>
Cc: netfilter@lists.netfilter.org

The actual challenge is to have two external interfaces, IF_1 and IF_2, each 
with their own address and both DNATed to an internal server. Packets coming 
into IF_1 should have their replies routed out IF_1 while packets coming in 
on IF_2 should have their replies routed out IF_2.

The ONLY place this information (which interface a particular packet stream 
came in on) is available is in the NAT state table. Pre NAT, all routing has 
to go on is the source server destination remote.  Post NAT routing now sees 
source IF_ (1 or 2) destination remote, and the packet can now be properly 
routed out the correct interface.

Which is why it's important whether NAT takes place pre or post routing on the 
reply packets from a DNATed destination.

On Thursday 09 June 2005 09:22, you wrote:
> Why not use netfilter's SNAT and static routes via the route command?
> You can use route to define the outgoing path for specific traffic:
>
> For example:
> route add -net 192.168.0.0 netmask 255.255.0.0 dev eth1
>
> -Matin
>
> On 6/8/05, Jeff Simmons <jsimmons@goblin.punk.net> wrote:
> > OK, a little more specific.
> >
> > I have an iptables firewall with a server behind it. The server has a
> > non-routable address (192.168) so the firewall's IP address:port is
> > DNAT'd to the server's address:port.
> >
> > Incoming packets to the server first encounter the firewall's external
> > interface (EXT_IF), where the prerouting DNAT rule rewrites the IP layer
> > destination address (EXT_ADDR) to the server's address (SERV_ADDR). The
> > packet is then passed on to the routing function, which determines that
> > the packet needs forwarding via the internal interface (INT_IF). The
> > packet is then passed through any appropriate iptables forwarding chains,
> > then to the post-routing function of iptables (which in this case does
> > nothing), and finally out INT_IF to destination SERV_ADDR.
> >
> > There's a nice diagram of this at:
> >
> >  http://www.policyrouting.org/PolicyRoutingBook/ONLINE/CH03.web.html
> >
> > down in section 3.3.2.
> >
> > Now, to the reply from the server. When the packet leaves the server, its
> > IP layer will show source SERV_ADDR destination REMOTE_ADDR. But when the
> > packet arrives at the remote, it will show source EXT_ADDR destination
> > REMOTE_ADDR. It gets rewritten somewhere.
> >
> > My understanding is the rewriting is done by the state engine, which
> > basically maintains a rule that any outbound packet SERV_ADDR:port ->
> > REMOTE_ADDR:port gets changed to EXT_ADDR:port -> REMOTE_ADDR:port. But
> > where in the chain does this happen?
> >
> > Scenario one: it happens on INT_IF prerouting. If this is the case, then
> > I can use source routing with iproute2.
> >
> > Scenario two: it happens on EXT_IF postrouting. Then iproute2 can't do
> > the kind of source routing I need to do, and I'll have to find another
> > solution.
> >
> > (Note that with standard destination routing, it doesn't matter where the
> > packet gets rewritten. But with source routing it matters greatly.)
> >
> > The reality is, the box I'm working on has 4 T1s coming in, a DMZ with
> > routable IP addresses, and two LANS with non-routable addresses where
> > both contain servers that need to be contacted by the outside world via
> > DNAT. It's a big, messy, ugly project, but I need to know if I can use
> > iproute2 to be sure that return packets from all the servers go out the
> > T1 they came in on.
> >
> > Any help, pointers, or FMs that I can RTFM would be GREATLY appreciated.
> >
> > --
> > Jeff Simmons                                   jsimmons@goblin.punk.net
> >      Simmons Consulting - Network Engineering, Administration, Security
> >
> > "You guys, I don't hear any noise. Are you sure you're doing it right?"
> >         -- My Life With The Thrill Kill Kult

-- 
Jeff Simmons                                   jsimmons@goblin.punk.net
     Simmons Consulting - Network Engineering, Administration, Security

"You guys, I don't hear any noise. Are you sure you're doing it right?"
	-- My Life With The Thrill Kill Kult

