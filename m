From: Florian Westphal <fw@strlen.de>
Subject: Re: [nftables v0.9.2 | kernel 4.19.93] logging protocols in inet
 family table require explicit protocol statement?
Date: Wed, 5 Feb 2020 16:37:34 +0100
Message-ID: <20200205153734.GI26952@breakpoint.cc>
References: <7f4e6968-d2c8-7b14-0d42-137c7f7d7f85@gmx.net>
 <20200205142935.GG26952@breakpoint.cc>
 <03b849bc-48f3-0e47-2d94-47b2a74f988a@gmx.net>
 <20200205144833.GH26952@breakpoint.cc>
 <6a254067-bad5-4a72-25f3-a14ded823097@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <6a254067-bad5-4a72-25f3-a14ded823097@gmx.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?utf-8?B?0b3SieG2rOG4s+KEoA==?= <vtol@gmx.net>
Cc: Florian Westphal <fw@strlen.de>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

ѽ҉ᶬḳ℠ <vtol@gmx.net> wrote:
> Citing an example from the WIKI
> 
> nft add rule filter input tcp dport 22 ct state new log prefix \"New SSH
> connection: \" accept
>
> there is no "ip protocol" stipulated. And neither does it throw an error and
> it works as expected (described in the WIKI)

Why would there?
tcp dport eq 22
ct state eq new
log prefix \"New SSH ...\"
accept

See?
4 statements, first two statements are equality tests,
3rd statement is log, 4th is the verdict.

> Trying something similar in the inet table
> 
> nft add rule inet filter input tcp log
>
> throws
> 
> Error: syntax error, unexpected log

Of course, because this is not similar at all.
This is
tcp
log

"tcp" isn't a statement.  What should it mean?

> * nft add rule inet filter input ip protocol tcp log
> * nft add rule inet filter input ip6 nexthdr  icmpv6 log
> 
> neither throws an error. Hope that makes it clear.

Why would it?  Its valid.

ip protocol == tcp
log

ip6 nexthdr == icmpv6
log

both are two valid statements.

It might help if you would explain what you are trying to do.
