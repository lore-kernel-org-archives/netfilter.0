From: Internet Protocol version Six <inet6@mail.be>
Subject: Re: IPv6 Router and NAT/connection tracking
Date: Sat, 21 Jun 2003 00:27:17 +0200 (GMT+02:00)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1547190167.1056148037625.JavaMail.Administrator@pumbaa>
Reply-To: Internet Protocol version Six <inet6@mail.be>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: netfilter@newkirk.us
Cc: netfilter@lists.netfilter.org

Well, I just tried it, still the same, connections from the
routerbox itself to the Internet (like an IRC server) don't timeout,
but connections to the Internet from a machine on the network do
timeout after a 4 minutes or something and traceroutes to the address
of the machine on the network ends at the router, timing out.
And then I cannot establish a connection anymore unless I tracert6
from the networkmachine to a hostname on the Internet, doesn't even
matter which address I traceroute6 too, aslong as it's an Internet
address and then the whole thing works again..., repeating the same
problem again :(

> ----------------------------------------
> From: Joel Newkirk <netfilter@newkirk.us>
> Sent: Fri Jun 20 08:24:48 GMT+02:00 2003
> To: Internet Protocol version Six <inet6@mail.be>
> Subject: Re: IPv6 Router and NAT/connection tracking
> 
> 
> On Wed, 2003-06-18 at 20:09, Internet Protocol version Six wrote:
> > I'm connected via IPv6-in-IPv4 and I have a /48 assigned to this
> > box, and I want the box to act as a router for my machines which
> > it's doing nicely, only the conntrack thing is annoying the hell
> > outta me ;) Will that solve it (ACCEPTING in both directions)?
> > 
> > And so what you are saying is that I should do this?:
> > iptables -I INPUT -p 41 -j ACCEPT
> > iptables -I OUTPUT -p 41 -j ACCEPT
> > iptables -I PREROUTING -p 41 -j ACCEPT -> not sure about this one
> > 
> > or am I wrong/forgetting something? :)
> > 
> > Thanks for your help, greatly appreciated
> 
> AFAIK that is correct.  (however the PREROUTING one wouldn't work, would
> need to be NAT table, and would be unnecessary anyway since that chain
> is supposed to have an ACCEPT policy - NAT in NAT table, filter in
> FILTER table)  The two rules, INPUT and OUTPUT, should overcome any
> failure of the state machine to recognize intermittent tunnel traffic as
> ESTABLISHED.
> 
> Regarding 'internal' ipv6 traffic within your network, I suspect you
> should be using ip6tables there if needed.  (ip6tables won't see 6in4
> tunnel traffic though, since the tunnel itself is IPv4)
> 
> I haven't configured my gateway as an ipv6 router yet, however.  I have
> a single address ATM from freenet6.  When I get the chance to tinker (a
> few weeks from now at least) I want to configure ipv6 on my desktop as
> well as my server and see what there is to see.
> 
> j
> 
> 
> 
> 

-----------------------------------------------------
Mail.be, WebMail and Virtual Office
http://www.mail.be


