From: Florian Westphal <fw@strlen.de>
Subject: Re: Re: nft show counter
Date: Thu, 1 Apr 2021 22:03:33 +0200
Message-ID: <20210401200333.GH13699@breakpoint.cc>
References: <trinity-08431e16-b4eb-4bb7-8b36-df2084481611-1617212862528@3c-app-gmx-bap62>
 <20210331214053.GB13699@breakpoint.cc>
 <d5770849-515b-5514-39ab-bb6907023ca2@fhmtech.com>
 <trinity-e144cb32-0c89-44a6-b0f6-5b9edcf5e457-1617264512699@3c-app-gmx-bap06>
 <20210401181414.GF13699@breakpoint.cc>
 <902B82E6-79AE-4C04-B2CA-C860662911EC@public-files.de>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <902B82E6-79AE-4C04-B2CA-C860662911EC@public-files.de>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Frank Wunderlich <frank-w@public-files.de>
Cc: Florian Westphal <fw@strlen.de>, Frank Myhr <fmyhr@fhmtech.com>, netfilter@vger.kernel.org

Frank Wunderlich <frank-w@public-files.de> wrote:
> Am 1. April 2021 20:14:14 MESZ schrieb Florian Westphal <fw@strlen.de>:
> >map voipcounters {
> > type ipv4_addr . inet_service : counter
> > elements = { 10.0.1.1 . 5160 : "voip1", 10.2.1.1 . 5161 : ...
> >
> >and then count with one rule only:
> >
> >counter name ip saddr . udp dport map @voipcounters
> 
> Have seen maps,but have not understood them :(

Its just a set that returns a value instead of simple 'in set/not in
set'.

> The ip is always same ($ipvoipbox),only port differs (sip1+sip2) and this bidirectional (saddr/daddr,sport/dport) to catch traffic from/to this ip separated by sip-streams.
> 
> Your example seems to match only source-addr and destination port.

Yes, it was an example.

> Maybe its possible to match "addr" (saddr or daddr) and "port" (sport or dport),so i can have only 2 rules...with map maybe only 1

There is no 'or', so you will need two rules at a minimum if you want to
match in either direction.

map voipcounters {
	type inet_service : counter
	elements = { 5160 : "voip1", 5161 : "voip2" }
}

ip saddr $ipvoipbox counter name udp sport map @voipcounters
ip daddr $ipvoipbox counter name udp dport map @voipcounters

This says 'fetch name of counter to use from @voipcounters, with 'udp
sport/udp dport' as search key.

but with just two counters its not worth it.
