From: Chris Shepherd <chriss@whstuart.com>
Subject: Re: ip_conntrack_http?
Date: Tue, 10 Dec 2002 10:29:12 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1039534152.3df60848b8692@mail.whstuart.com>
References: <1039450606.3df4c1ee704fd@mail.whstuart.com> <1039469549.20570.24.camel@tux>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1039469549.20570.24.camel@tux>
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
To: Martin Josefsson <gandalf@wlug.westbo.se>
Cc: Netfilter mailinglist <netfilter@lists.netfilter.org>

Quoting Martin Josefsson <gandalf@wlug.westbo.se>:

> On Mon, 2002-12-09 at 17:16, Chris Shepherd wrote:
> 
> [big snip]
> > What I'm wondering is twofold:
> > 1) Did I do something wrong with my configuration?
> 
> No, this is how loadbalacing in iptables works, it balances the
> individual connections.

That's what I thought.

> > 2) If not, and this is by design, is there any module/could a module be
> > written that would track HTTP requests and forward ALL http requests from 
> > the same connection to the same IP?
> 
> All http requests from the same connection? What do you mean? All
> packets in a connection is forwarded to the same server. But not all
> connections are forwarded to the same server.

Sorry, got my wording entirely mixed up. I see that you got it from my example.

> > What happens now:
> > CONN1a -> WS1
> > CONN1b -> WS2
> > CONN2a -> WS1
> > CONN2b -> WS2
> > 
> > What should happen:
> > CONN1a -> WS1
> > CONN1b -> WS1
> > CONN2a -> WS2
> > CONN2b -> WS2
> > 
> > Provided that CONN1[ab] are related connections, but unrelated to
> CONN2[ab].
> 
> How do you relate http connections to each other?

Well, I would think the TCP RELATED flag should be set for the second 
connection from the browser. Not being a Netfilter programmer myself, I'm not 
sure if there's any connection identifier that's passed along with the RELATED 
connection information... If there was, would it not be possible to just 
forward all related connection IDs to one IP? So at most there should only be 
two or three connections in a group, and this would sort out situations where 
people sharing a connection would otherwise all end up on the same webserver, 
and not be effectively load balanced.

> > Is this possible with the current NetFilter setup? Must a module be
> written?
> 
> Depends on if it's possible to uniquely identify all connections that's
> part of the same session or not. Only then it's possible to write a
> module to do this. I don't know if that's possible.

On the connection-level, is it possible to somehow see which connection a new 
connection is related to? If so, I would think it'd be logically easy, but not 
necessarily programmatically so.

> One solution would be to forward all connections from a certain ip to a
> certain server, this can be done with the SAME module if it's modified a
> little (only permits SNAT at the moment IIRC).
> 
> I think I should remove this limit from SAME even if maybe you won't use
> it, I'll go do that now. (Don't know why I put it in there in the first
> place, guess I didn't think that it could be used for this).
> 
> Patch is attached, just patchyour kernel with the SAME patch from
> patch-o-matic (after running './runme pending'). Then just patchit with
> this patch and compile.
> 
> then it's just a matter of replacing -j SNAT with -j SAME and hope for
> the best :)
> 
> (SAME has a --nodst option that makes it not include the destination
> ipaddress in the calculation that decides which ip to redirect to,
> probably doesn't matter in this situation)
> 
> If you try it, please report back and tell me if it works (it's
> completely untested, but it should work :)

I will let you know when I get a chance to test it. I have the sneaky feeling 
that if this works properly (which it should), a lot of developers might wanna 
know about it. :)
Thank you so much for your help, and being willing to make changes to the 
module for me!

> > I am very interested in knowing, because it could save myself and a few
> dozen 
> > webdevs I know a lot of money that we'd be spending on a hardware
> connection-
> > level load balancer.
> 
> Other options may be the LVS, Linux Virtual Server project. I believe
> they have loadbalancers and stuff for http.

From the documentation I've read, LVS does essentially the same thing as NF 
does: it forwards on a per connection basis. It too would succumb to this 
problem. 

-- 
Chris Shepherd

-------------------------------------------------
This email may contain confidential information. Use of any such information
is strictly prohibited without express written consent of the sender



