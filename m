From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Error: conflicting intervals specified - Bullseye 0.9.8
Date: Thu, 16 Sep 2021 14:58:58 +0200
Message-ID: <20210916125858.GA9451@salvia>
References: <ab060c71-e640-a67e-347f-60cd1d800932@tootai.net>
 <20210916092924.GB31336@salvia>
 <48e95c8a-2469-08dd-0620-55187252653c@tootai.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <48e95c8a-2469-08dd-0620-55187252653c@tootai.net>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Daniel <tech@tootai.net>
Cc: Netfilter list <netfilter@vger.kernel.org>

On Thu, Sep 16, 2021 at 01:27:44PM +0200, Daniel wrote:
> Hello
> 
> Le 16/09/2021 à 11:29, Pablo Neira Ayuso a écrit :
> > On Wed, Sep 08, 2021 at 11:33:02AM +0200, Daniel wrote:
> > > Hi,
> > > 
> > > I get the following error with the above nft version, lan being the
> > > interface name:
> > > 
> > > add element ip6 nat fwdtoip_tcp.lan { 1-65534 : 2001:db8:27b:10:ff9b::,
> > > 1-65534 : 2001:db8:27b:ff9b::c0a8:ad1}
> > > 
> > > with
> > > 
> > > add map ipv6_addr nat fwdtoip_tcp.lan { type inet_service : ipv6_addr\;
> > > flags interval\; }
> > > 
> > > What's wrong here ? My goal being to redirect all (or range ports) external
> > > traffic to another server.
> > Could you develop what your use-case is?
>
> The above example says -in my mind ;)- that everything coming from outside
> on ip
> 
> 2001:db8:27b:10:ff9b:: should be redirect (symmetrical) to ip 2001:db8:27b:ff9b::c0a8:ad1
>
> > Keys uniquely identify an entry in a map, if you define two entries
> > with the same key, you hit this conflict interval error.
>
> I see this like forward port:ip to port:anotherip

so you want to redirect all ports except a few of them?

  add map x mymap { type ipv4_addr : ipv4_addr ; }
  add rule x y ip protocol { tcp, udp } th dport 1-65534 dnat to ip saddr map @mymap

This allows you to dnat depending on the IP source address, skipping 0
and 65535 for TCP and UDP.

I'm not sure yet if this is what you need though
