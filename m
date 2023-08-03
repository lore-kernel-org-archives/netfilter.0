From: Florian Westphal <fw@strlen.de>
Subject: Re: Incomprehensible behavior
Date: Thu, 3 Aug 2023 17:04:57 +0200
Message-ID: <20230803150457.GF30550@breakpoint.cc>
References: <0d41d9238002f90a1c5a2c7702f675ccd17736bb.camel@mail>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <0d41d9238002f90a1c5a2c7702f675ccd17736bb.camel@mail>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: toml <toml@thlu.de>
Cc: netfilter@vger.kernel.org

toml <toml@thlu.de> wrote:
> (I'm so sorry... my previous post is in failed format... please ignore)
> 
> Hello @ all
> 
> I'm still struggling anymore with the new syntax at
> ApplicationLayerGateway/FTP and testing with smallest steps. In doing
> so I have now come across the following effect. I have 2 test-rules
> here, both of which i expected to completely block any outgoing
> traffic.
> 
> But as you can see from the second example in the counter, only here is
> blocked. The first example has no effect at all, everything works as if
> it was not blocked.
> 
> # nft list ruleset
> table ip filter {
>  chain output {
>  type filter hook output priority 0; policy drop;
>  meta pkttype { 0, 1, 2 } accep

What do you expect that line to do?

This accepts all packets, so all trailing rules
are bypassed and chain policy has no effect.
