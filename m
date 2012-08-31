From: Andrew Beverley <andy@andybev.com>
Subject: Re: IPTABLES:Let external address appear as an internal address
Date: Fri, 31 Aug 2012 18:36:19 +0100
Message-ID: <1346434579.2200.4.camel@andylaptop>
References: <!&!AAAAAAAAAAAYAAAAAAAAAOosgHnoPqdNlUO2DUrQ/DfCgAAAEAAAACcGGLxSfBNPu0OwD65yae8BAAAAAA==@manfbraun.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <!&!AAAAAAAAAAAYAAAAAAAAAOosgHnoPqdNlUO2DUrQ/DfCgAAAEAAAACcGGLxSfBNPu0OwD65yae8BAAAAAA==@manfbraun.de>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1346434584;
	bh=A15L8nFsnlk2J97BsaipMu3ZGQGnh5RZ9DurbSodgKU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:Mime-Version;
	b=UJV3Fdk0H3N8MkfrivN8uy0uEwmh4BhfEVJId370QcvrUdywkJ/kDhu50zAdXHHQw
	 1Bha8aoey1JaMcednVotlJ2DVz84kNSf6T0Fi3oWMXCHuvWLjVOVN2NnvvguYcZtru
	 xcnUam1KAdJw34Tdl7z6UGwOHYAydAKKahl7rwGc=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: mabra@manfbraun.de
Cc: netfilter@vger.kernel.org

On Fri, 2012-08-31 at 13:11 +0200, mabra@manfbraun.de wrote:
> [usining debian squeeze, iptables, monit monitoring program].
> [eth1: internet==$EXTIF, eth0: local==$INTIF]
> [192.168.6.254 ist the LAN port of the firewall at eth0]
> 
> The problem is this: The monit daemon is configured to accepts
> packtes on the internal address only and I think, this is right.
> Usually nearly nothing internal should accepts packets from outside.
> The daemon cannot be bind to a specific interface, but just by
> ip address and mask. Internally, everything works fine [http requests
> from inside 192.168.26.0/24 are working]. To allow to redirect packtes
> from outside to this daemon, I wrote this two filters, where the
> incoming external trafiic should use port 9995:
> 
> $IPTABLES -t nat -A PREROUTING -p tcp -d $EXTADDR --dport 9995 \
> -j DNAT --to-destination 192.168.6.254:2812
> 
> $IPTABLES -t nat -A POSTROUTING -p tcp -d 192.168.6.254 --dport 2812 \
> -j SNAT --to-source 192.168.6.254:3000
> 
> The deamon gets accessed, but denies the request, because it's seen
> source address is not from the LAN, but the external client ip address.
> So my SNAT does not seem to work.

I may have misunderstood, in which case a diagram would be useful, but
is the monit daemon on the same machine as the iptables rules? If so,
SNAT will have no effect, as it only works on the POSTROUTING table (as
packets leave the machine). It will therefore have no effect on packets
to process on the local machine.

Off the top of my head, I'm not sure of the solution you could use. You
might want to look at the IFB interface to see if that can be used in
any way.

Andy



