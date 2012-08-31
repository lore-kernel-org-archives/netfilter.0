From: <mabra@manfbraun.de>
Subject: RE: IPTABLES:Let external address appear as an internal address
Date: Sat, 1 Sep 2012 01:05:32 +0200
Message-ID: <!&!AAAAAAAAAAAYAAAAAAAAAOosgHnoPqdNlUO2DUrQ/DfCgAAAEAAAACyt4OZhXX9Ijc6HtHJdLrMBAAAAAA==@manfbraun.de>
References: <!&!AAAAAAAAAAAYAAAAAAAAAOosgHnoPqdNlUO2DUrQ/DfCgAAAEAAAACcGGLxSfBNPu0OwD65yae8BAAAAAA==@manfbraun.de> <1346434579.2200.4.camel@andylaptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1346434579.2200.4.camel@andylaptop>
Content-Language: de
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org
Cc: 'Andrew Beverley' <andy@andybev.com>

-----Original Message-----
From: Andrew Beverley [mailto:andy@andybev.com] 
Sent: Friday, August 31, 2012 7:36 PM
To: mabra@manfbraun.de
Cc: netfilter@vger.kernel.org
Subject: Re: IPTABLES:Let external address appear as an internal address

On Fri, 2012-08-31 at 13:11 +0200, mabra@manfbraun.de wrote:
> [usining debian squeeze, iptables, monit monitoring program].
> [eth1: internet==$EXTIF, eth0: local==$INTIF]
> [192.168.6.254 ist the LAN port of the firewall at eth0]
> 
> The problem is this: The monit daemon is configured to accepts packtes 
> on the internal address only and I think, this is right.
> Usually nearly nothing internal should accepts packets from outside.
> The daemon cannot be bind to a specific interface, but just by ip 
> address and mask. Internally, everything works fine [http requests 
> from inside 192.168.26.0/24 are working]. To allow to redirect packtes 
> from outside to this daemon, I wrote this two filters, where the 
> incoming external trafiic should use port 9995:
> 
> $IPTABLES -t nat -A PREROUTING -p tcp -d $EXTADDR --dport 9995 \ -j 
> DNAT --to-destination 192.168.6.254:2812
> 
> $IPTABLES -t nat -A POSTROUTING -p tcp -d 192.168.6.254 --dport 2812 \ 
> -j SNAT --to-source 192.168.6.254:3000
> 
> The deamon gets accessed, but denies the request, because it's seen 
> source address is not from the LAN, but the external client ip address.
> So my SNAT does not seem to work.

I may have misunderstood, in which case a diagram would be useful, but is the monit daemon on the same machine as the iptables rules? If so, SNAT will have no effect, as it only works on the POSTROUTING table (as packets leave the machine). It will therefore have no effect on packets to process on the local machine.

Off the top of my head, I'm not sure of the solution you could use. You might want to look at the IFB interface to see if that can be used in any way.

Andy

=======================================================================

Hi !

Thanks for your reply.

I studied the diagrams over and over and over again [Although , there are different
schemas on the net, the last I've used, was on wikipedia]. What you said, comes to
my mind, but I am not sure, because, what is a "local process" is not quit clear in the
diagram and the diagram has even not the usual LO interface, which is alway present
too.

Yes, the monit daemon runs on the firewall machine with the iptables. The problem
came to my mind, while I am re-building the box so, that no service directly uses
the internet interface [eth1 for me]. Currently, I am finding each minute something
new.

Even the internal web cannot be used on the local machine, which is a must
for me. I saw the latter shortly, as I started to write a cron job, which pulls something
out of my web for some monitoring reason. This is not working [both, curl and wget 
say me: connection refused]. This web, running on apache is reachable from outside
[internet] and from the LAN, but not from the local machine. Seems to be the same
issue. I am working on this for about three day now and I am out of hope. If there
is no way to make this work, I would need additional hardware :-(
This all was just recognized, as I startet to change my host and the firewall
to have no longer something run on the internet address.

This would lead to the situation to run all used services [web, monitoring etc.]
onto the public address of the firewall. Oh my ! From my point of view, this is
the worst case solution ever.

I would pretty become happy for each new thought. BTW, I've looked into
the mentioned IFB interface, but this will be out of my ability. I am "migrating"
to linux for years and I am not that experienced.

Best regards,
++mabra




