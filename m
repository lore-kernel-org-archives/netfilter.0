From: Florian Westphal <fw@strlen.de>
Subject: Re: [nftables v0.9.2 | kernel 4.19.93] MSS clamping rule possible in
 the inet family table?
Date: Wed, 5 Feb 2020 12:26:12 +0100
Message-ID: <20200205112612.GB26952@breakpoint.cc>
References: <3716a5fa-e7e7-5220-06c1-a651ee6b576f@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <3716a5fa-e7e7-5220-06c1-a651ee6b576f@gmx.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?utf-8?B?0b3SieG2rOG4s+KEoA==?= <vtol@gmx.net>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

ѽ҉ᶬḳ℠ <vtol@gmx.net> wrote:
> WIKI [1] stipulates the rule in the ip family table, perhaps logical since
> it applies to IPv4 only, It is however possible to include the rule in the
> inet family table?
> 
> Having it implemented in
> 
> table inet filter {
>  chain input               { oif pppoe-wan tcp flags syn tcp option maxseg
> size set 1400; }
> }
> 
> does not throw an error but it does not work either.

That chain isn't hooked up, its missing the 'type filter hook input
priority 0;' part.

> Then tried instead (inet family)
> 
> { oif pppoe-wan ip protocol tcp flags syn tcp option maxseg size set 1400; }
> { oif pppoe-wan ip protocol tcp flags syn ip protocol tcp option maxseg size
> set 1400; }
> 
> But either throwing
> 
> Error: syntax error, unexpected flags, expecting newline or semicolon.

> { oif pppoe-wan ip protocol tcp flags syn tcp option maxseg size set 1400; }

This is: oif == pppoe-wan
         ip protocol == tcp
	 flags syn # invalid, should be "tcp flags syn"

> What am I missing to get this to work in the inet family table?

Did not try it but it should work, there is nothing ip/ipv6 specific
in the tcp option code.
