From: Oskar Andreasson <blueflux@koffein.net>
Subject: Re: Packet chain traversals
Date: Sun, 27 Oct 2002 22:23:29 +0100 (CET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0210272214080.12317-100000@laptop1.agatha>
References: <200210271421.51119.netfilter@newkirk.us>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200210271421.51119.netfilter@newkirk.us>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joel Newkirk <netfilter@newkirk.us>
Cc: netfilter@lists.netfilter.org

On Sun, 27 Oct 2002, Joel Newkirk wrote:

> On Sunday 27 October 2002 01:50 pm, Oskar Andreasson wrote:

> > > http://newkirk.no-ip.org:83/Traversal-sm.png
> >
> > Mmmmm, reminds me of that trip on LSD I took the other day.... =) just
> > kidding. 
> 
> mmm.  about the resemblance, or the other day?  :^) (just kidding too :^)

About the resemblance, of course;)

> 
> > It does look good really, except you made it rather confusing in
> > one aspect... I don't know if it's just me, but why do you have two "out"
> > and two "in"?
> 
> Two reasons mostly:  That seems to reflect a common arrangement, where there 
> is a single connection to the internet and a single connection to local 
> network(s).  (feel free to label the top one 'ppp0' and the bottom 'eth1')  
> It also allows the diagram to more clearly illustrate (to me at least) the 
> situation where a packet can be sent back out the same interface it arrived 
> from, such as a local DNAT redirection to another local IP.  Also, one or 
> three (or more) would ruin the pretty symmetry...

Ok, I can understand that reasoning. 

> 
> In my mind, I always think of the local machine (local processes) as being 
> 'inside' the firewall, with the individual interfaces being separated by it, 
> or the LAN being 'behind' it.  I can't think of a useful, non-degenerate 
> example where this isn't a valid perspective, so I've held to it so far.

Try a small backbone or so:).

> > > Thanks for any input, examples, diagram criticism (artistic or logical)
> > > etc. If your response seems to you to be useless to the list in general
> > > then please just send it to me directly.
> >
> > no problem. Don't take me too seriously though, I am a lousy "artist"
> > so... :)
> 
> I may be as well, but I've tired of always referring to a visualization that 
> suited my perspective, and decided to try to make a printed version.  (BTW, 
> my actual intention is to tweak then fade the colors out about 70% before 
> printing a 'keeper', otherwise I'll have to cover it late in the evening... 
> :^)

Sounds as a nice idea. I could use one myself once in a while (lousy 
memory). I would really like seeing the mangle/nat/filter stuff added to 
FORWARD/INPUT/OUTPUT though, and it would be even better:)

-- 
----
Oskar Andreasson
http://www.frozentux.net
http://iptables-tutorial.frozentux.net
http://ipsysctl-tutorial.frozentux.net
mailto:blueflux@koffein.net


