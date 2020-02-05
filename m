From: Florian Westphal <fw@strlen.de>
Subject: Re: [nftables v0.9.2 | kernel 4.19.93] logging protocols in inet
 family table require explicit protocol statement?
Date: Wed, 5 Feb 2020 15:48:33 +0100
Message-ID: <20200205144833.GH26952@breakpoint.cc>
References: <7f4e6968-d2c8-7b14-0d42-137c7f7d7f85@gmx.net>
 <20200205142935.GG26952@breakpoint.cc>
 <03b849bc-48f3-0e47-2d94-47b2a74f988a@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <03b849bc-48f3-0e47-2d94-47b2a74f988a@gmx.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?utf-8?B?0b3SieG2rOG4s+KEoA==?= <vtol@gmx.net>
Cc: Florian Westphal <fw@strlen.de>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

ѽ҉ᶬḳ℠ <vtol@gmx.net> wrote:
> On 05/02/2020 14:29, Florian Westphal wrote:
> > ѽ҉ᶬḳ℠ <vtol@gmx.net> wrote:
> > > Having perused the WIKI [1] I tried to get protocol specific logging going,
> > > but ended up with
> > > 
> > > * tcp log -> Error: syntax error, unexpected log
> > > * icmpv6 log -> Error: syntax error, unexpected log
> > > 
> > > Only with an explicit protocol statement logging works
> > > 
> > > * ip protocol tcp log
> > > * ip6 nexthdr  icmpv6 log
> > You mean "log" doesn't work?  (no "tcp" prefix).
> 
> Yes, logging does not work with
> 
> icmpv6 log
> 
> and throws the error, whilst
> 
> ip6 nexthdr icmpv6 log
> 
> works and does not exhibit the error, similar with tcp | udp.
> 
> For package filtering it is however not necessary to make such explicit ip
> protocol | ip6 nexthdr statements. And since there is no mention of such
> (explicit) requirement in the WIKI I raised the question here because I find
> it inexplicable that filtering does work one way and logging another way.

Not following. "log" is a single statement, it has no prefix keyword.
Why would it be special?

It works just like everyting else.
If you want to log just tcp (regardless of ipv4 or ipv6), then use
"meta l4proto tcp log"

in the inet family.  "meta l4proto" gives next header protocol after
the ip or ipv6 header.  In case of ipv6, it will skip extension headers,
if any.
