From: Ramin Alidousti <ramin@cannon.eng.us.uu.net>
Subject: Re: eth0, ppp0 & ppp1
Date: Fri, 6 Jun 2003 11:07:43 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030606150743.GA11486@cannon.eng.us.uu.net>
References: <20030606141249.GA4652@corky.voltar-confed.org>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20030606141249.GA4652@corky.voltar-confed.org>
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
Content-Transfer-Encoding: 7bit
To: Paul Miller <iptabler@voltar-confed.org>
Cc: Netfilter <netfilter@lists.netfilter.org>

There is no need for marking the packets. A simple rule associated
with a default route (in different tables) does the trick:

# this takes care of the main default route through your cable access
ip ro add default via <IP of upstream cable router> dev eth0

# these take care of the outgoing traffic from ppp0
ip ro add default scope global dev ppp0 table 100
ip ru add from 208.31.142.43/32 table 100

# these take care of the outgoing traffic from ppp1
ip ro add default scope global dev ppp1 table 101
ip ru add from 208.31.142.23/32 table 101

# reset the cache
ip ro flush cache

Keep in mind that the routes you want to set up are _only_ used for
the outgoing traffic. You have no control whatsoever for the incoming
traffic. But I guess it's pretty obvious...

Ramin

On Fri, Jun 06, 2003 at 10:12:49AM -0400, Paul Miller wrote:

> Sorry this is so long, I wanna be specific.
> 
> I've got a routing issue that I think should be really easy
> to solve.  It's baffled me for over 4 hours now, so I'm
> going to ask.
> 
> eth0 - my cable internet 24.247.240.235
> ppp0 - 208.31.142.43
> ppp1 - 208.31.142.23
> 
> My employer makes money for having my modems connected.
> That's a long story, and hard to explain.  Anyway, ppp0 and
> ppp1 are just sitting there doing nothing.
> 
> The other day my cable went out, and with it, my default
> route.  I tried to telnet into my ppp devices, but they
> didn't work because the return path was trying to go through
> the cable.
> 
> Even when the cable is working, I can't telnet into the ppp
> devs unless I make a specific route.  
> 
> route add 208.31.142.2 gw 208.31.142.43 dev ppp0
> 
> That may look odd, trust me, my ip is my gateway.  Anyhoo,
> after that it works great.  That's less than desireable
> though -- then all traffic to my webserver goes through
> ppp0.  What I really want, is any traffic that SYNs to
> 208.31.142.43 from the outside, should automagically route
> back out that device.  I hope that made sense.
> 
> So, I tried to mark the packets with 0x04 then route them
> based on that...
> 
> iptables -t mangle -A PREROUTING -p tcp -d 208.31.142.43 -j TOS --set-tos 0x04
> ip route add default via 208.31.142.43 dev ppp0 tos 0x04
> 
> I've had success routing on those tos values before.  But
> this solution didn't work for obvious reasons.  I need to
> mark the whole session, not just packets that are destined
> to 208.31.142.43.
> 
> Questions:
> 
> Is there a way to mark the entire session in such a way that
> I can do sorta this type of routing?
> 
> Is there a cleaner way to make sure that:
> 
> a) my default route for anything starting from my box goes
>     out the cable modem...
> 
> b) any traffic initiated to one of the ppp devs
>     automagically routes back out the same ppp dev?
> 
> 
> -- 
> If riding in an airplane is flying, then riding in a boat
> is swimming.  33 jumps, 6.7 minutes of freefall, 14.4 ff vertical miles.
> Key fingerprint = CEAC EBBE C541 B1E0 3174  81E0 E4E5 4D11 9A0C DA99



