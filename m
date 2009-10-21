From: Gary Smith <gary.smith@holdstead.com>
Subject: RE: Ramdom NAT drop
Date: Wed, 21 Oct 2009 08:35:38 -0700
Message-ID: <034DEBCAE934A74991E6E76B8DA72D14185DD509A1@HSSBS.holdstead.local>
References: <034DEBCAE934A74991E6E76B8DA72D14182B54DFB0@HSSBS.holdstead.local>
	 <034DEBCAE934A74991E6E76B8DA72D14185DD50990@HSSBS.holdstead.local>
 <38db14850910202315n7500d970g921748e8a3d0e360@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <38db14850910202315n7500d970g921748e8a3d0e360@mail.gmail.com>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: 'Anatoly Muliarski' <x86ever@gmail.com>
Cc: "'netfilter@vger.kernel.org'" <netfilter@vger.kernel.org>

> You must have set the conntrack value too much for your RAM size.
> Each conntrack structure use ~300 bytes in physical memory, so the
> value of 1024*1024 would be suitable. And the hashsize should be
> lowered too. Look at
> http://www.wallfire.org/misc/netfilter_conntrack_perf.txt for details.
> The problem may also be in your iptables rules or in settings for
> /proc/sys/net/netfilter/nf_conntrack_XXX timeouts.
> 

Anatoly, 

I had looked at the link.  I will either crank the value lower, or increase the ram.  I had increased the values to rule that out as a problem.

I will take a look at the conntrack timeouts.  It definitely appears to be some type of timeout problem.  When the problem does happen, it seems to continue for a while, then when I come back it works just fine.  The problem looks like it's some type of timeout what the NAT though.  A connection is made, NAT is setup, later trips doesn't get forwarded past the firewall.  As for the rules for the filter chain, they are all direct rules (not connection tracking on them).  I will definitely look a little deeping, I just didn't know where to begin.

Gary Smith
