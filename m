From: Martin Josefsson <gandalf@wlug.westbo.se>
Subject: Re: ip_conntrack_http?
Date: 10 Dec 2002 16:59:53 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1039535993.20561.68.camel@tux>
References: <1039450606.3df4c1ee704fd@mail.whstuart.com>
	<1039469549.20570.24.camel@tux> 
	<1039534152.3df60848b8692@mail.whstuart.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1039534152.3df60848b8692@mail.whstuart.com>
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
To: Chris Shepherd <chriss@whstuart.com>
Cc: Netfilter mailinglist <netfilter@lists.netfilter.org>

On Tue, 2002-12-10 at 16:29, Chris Shepherd wrote:
 
> > How do you relate http connections to each other?
> 
> Well, I would think the TCP RELATED flag should be set for the second 
> connection from the browser. Not being a Netfilter programmer myself, I'm not 
> sure if there's any connection identifier that's passed along with the RELATED 
> connection information... If there was, would it not be possible to just 
> forward all related connection IDs to one IP? So at most there should only be 
> two or three connections in a group, and this would sort out situations where 
> people sharing a connection would otherwise all end up on the same webserver, 
> and not be effectively load balanced.

The question is still, how do you determine that a new connection is
related to another? The new connection is just that, a new connection.
You need some way to relate it to an existing connection. I have no idea
how to do that.

No "RELATED connection information" is passed along anywhere. It's just
an internal state in the connectiontracking. See below to understand how
it's set.

> On the connection-level, is it possible to somehow see which connection a new 
> connection is related to? If so, I would think it'd be logically easy, but not 
> necessarily programmatically so.

Related connections are for example the ftp-data connections or irc dcc
connections. They are known prior to their initiation beacause we parsed
them out of the control-datastream earlier and set up an expectation for
them. But with http we don't have a control connection we can parse to
fint out which ports will be used. Then they become marked as RELATED to
the control-datastream in which the information about them was parsed
out.
 
> > If you try it, please report back and tell me if it works (it's
> > completely untested, but it should work :)
> 
> I will let you know when I get a chance to test it. I have the sneaky feeling 
> that if this works properly (which it should), a lot of developers might wanna 
> know about it. :)
> Thank you so much for your help, and being willing to make changes to the 
> module for me!

I made this module for about the same case but reversed... SNAT to
multiple addresses and iptables will loadbalance between them. Some
stuff expects clients to always make their connection from the same ip.
For example hotmail or banking via internet (many things that require
login seems to have this requirement, for a good reason).

So I wrote the module to calculate which sourceip clients should get
when they initiate connections. Now they always get the same for all
connections and everything is happy. Note that I still get a lot of
balancing, diffrent clients get diffrent ip's, but always the same ip
(unless the range of ipaddresses used for SNAT is changed, then the
calculation is changed)
 
> > Other options may be the LVS, Linux Virtual Server project. I believe
> > they have loadbalancers and stuff for http.
> 
> >From the documentation I've read, LVS does essentially the same thing as NF 
> does: it forwards on a per connection basis. It too would succumb to this 
> problem. 

Ok, I thought they had some kind of solution for this problem. Maybe I
should go read up on it a little bit.
 
-- 
/Martin

Never argue with an idiot. They drag you down to their level, then beat
you with experience.

