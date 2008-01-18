From: "Peter T. Breuer" <ptb@inv.it.uc3m.es>
Subject: Re: [help] modern iptables rule for transproxy
Date: Fri, 18 Jan 2008 19:07:08 +0100 (CET)
Message-ID: <200801181807.m0II78NV022087@betty.it.uc3m.es>
Reply-To: ptb@inv.it.uc3m.es
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: 
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org


Philip Craig wrote:
> [ptb]
> > There's no "perhaps" in it! That's the problem description. How to get
> > outgoing http requests to distant port 80s to be redirected to a proxy
> > daemon sitting on port 8081 of the LOCAL machine instead.
> 
> Then you need the rule in the OUTPUT chain. PREROUTING only sees forwarded

So PREROUTING = forwarding!  I seeeeee.  Not "before any routing takes
place", as one might naively have supposed from the name :).

Yes, that does it. The following single rule does the job perfectly:

  iptables -t nat -I OUTPUT -p tcp --dport 80 -j REDIRECT --to-port 8081

Thanks!

> packets.  The problem with this though is that you need some way to stop
> connections from the proxy being redirected too. 

The proxy is talking to a remote cache on remote port 3128, so that's not
necessary. So all I need to reroute all http round the firewall is the
following "up" rules in /etc/network/interfaces:

  up start-stop-daemon --start -exec /usr/sbin/tproxy -s 8081 -r tproxy $WEBCACHE 3128 
  up iptables -t nat -I OUTPUT -p tcp --dport 80 -j REDIRECT --to-port 8081 


> Maybe you can use the
> owner match to specify the uid of the proxy process.  From a quick google,

It looks like that works fine too, but it's not required (by definition,
the proxy on local port 8081 can't be emitting to port 80s or it
wouldn't be able to get through the router's firewall either - port 80
outgoing is firewalled but good at the router, and one has to use a
local http proxy/cache to get through; my requirement was to switch my
laptop system universally to using that routing for http packets when I
bring my laptop onto that network).

> there are some example rules for tor that do this:
> http://wiki.noreply.org/noreply/TheOnionRouter/TransparentProxy
> (You want local redirection, not middlebox.)

Thanks!

> Note that the ipchains rule you gave is only for forwarded traffic too.

It used to work.

> I don't recall whether ipchains supported local redirection.

It did. There are notes around saying that that was lost with the change
to iptables. I forget where I saw them now.

> >> If that's the case, telnet's connection may be using
> >> <proxyhost> as source IP address.
> > 
> > What would be bad about that? And if it is bad, what would one do about
> > it? I'm puzzled ...
> 
> Because the '-s ! $PROXY_BOX' means the rule will not match packets
> that have proxyhost as the source IP address.

So telnet's packets would not be redirected as desired. But then there
is no reason why telnet should choose to set src address on outgoing
packets to some machine that it doesn't even know about, is there?


> > 8081 when I telnet out to a distant host on its port 80. I don't know
> > why. How does one debug iptables?!!!
> 
> Use 'iptables -t nat -L -n' and look at the packet counters to see which

It seems I don't have any. I guess that has to be compiled into the
kernel or modules somewhere.

> rules are being matched.  (And if the policy counters go up then no
> rules were matched.)

Thanks!

I was trying things such as

  iptables -t nat -I PREROUTING --dport 80 -j LOG --log-level 4

(I have no idea what number to put for loglevel) without seeing anything
in dmesg. That led me to suspect that packets were not going through
PREROUTING at all. I was too nervous to try using OUTPUT for fear of
provoking a loop .. packets go to output, are redirected, go to output,
are redirected ...

Peter


