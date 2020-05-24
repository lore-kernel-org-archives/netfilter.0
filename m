From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: WTF, over
Date: Sun, 24 May 2020 18:36:52 +0200
Message-ID: <20200524163652.GA6565@salvia>
References: <f8b2b366-356a-cca8-ccc5-58a561904dad@satchell.net>
 <20200524110903.GA4481@salvia>
 <627aadf3-c2d8-6815-bb78-903a38c65b44@satchell.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <627aadf3-c2d8-6815-bb78-903a38c65b44@satchell.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stephen Satchell <list@satchell.net>
Cc: Linux Netfilter Users List <netfilter@vger.kernel.org>

On Sun, May 24, 2020 at 08:03:00AM -0700, Stephen Satchell wrote:
> On 5/24/20 4:09 AM, Pablo Neira Ayuso wrote:
> > fib address type with...
> > 
> > * iff can only be used in prerouting, input and forward.
> > * oif can only be used in output, postrouting and forward.
> > 
> > I assume your 'output' chain is something like:
> > 
> >          type filter hook output priority 0; policy drop;
> 
[...]
> > table inet filter {
> >     chain wan_output {
> >         fib saddr . iif type broadcast   counter drop # no non-unicast
> >        #fib saddr . iif type anycast     counter drop (unicast)
> >         fib saddr . iif type multicast   counter drop         fib saddr
> > . iif type blackhole   counter drop         fib saddr . iif type
> > unreachable counter drop         fib saddr . iif type prohibit
> > counter drop
> >         }
> >     chain output {
> >         type filter hook output priority 0; policy accept;
> >         meta oif "lo" accept
> >         meta oif "ens3" goto wan_output
> >         }
> >     }
> 
> The output when I try to load this is:
> > [root@localhost Desktop]# nft  -f x.nft
> > x.nft:13:9-39: Error: Could not process rule: Operation not supported
> >         meta oif "ens3" goto wan_output
> >         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

This happens because you cannot use 'fib saddr . iif type' from your
wan_output chain.

The error is reported, later on, when you add this rule:

        meta oif "ens3" goto wan_output

because the jump/goto validates your 'wan_output'. This validation
fails because your 'wan_output' chain contains rules with:

        fib saddr . iif type

which is not supported in the output path.

You can only use 'fib saddr . iif type' from prerouting, input and
forward.
