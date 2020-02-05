From: Florian Westphal <fw@strlen.de>
Subject: Re: [nftables v0.9.2 | kernel 4.19.93] MSS clamping rule possible in
 the inet family table?
Date: Thu, 6 Feb 2020 00:38:43 +0100
Message-ID: <20200205233843.GM26952@breakpoint.cc>
References: <3716a5fa-e7e7-5220-06c1-a651ee6b576f@gmx.net>
 <20200205112612.GB26952@breakpoint.cc>
 <801ea275-a5b0-4c49-f772-eb7632431ff3@gmx.net>
 <9fdbae51-1c8d-18b4-dd0c-5f0c22f8347c@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <9fdbae51-1c8d-18b4-dd0c-5f0c22f8347c@gmx.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?utf-8?B?0b3SieG2rOG4s+KEoA==?= <vtol@gmx.net>
Cc: Florian Westphal <fw@strlen.de>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

ѽ҉ᶬḳ℠ <vtol@gmx.net> wrote:
> Finally got it working in the inet table, seems being a matter of rule
> position (handle value),

The handle has nothing to do with the ordering though, the handle is
just a unique identifier.

> chain forward { # handle 2
>                 type filter hook forward priority filter; policy drop;
>                 ct state established,related accept # handle 19
>                 ct state invalid drop # handle 20
>                 oif "pppoe-wan" tcp flags syn tcp option maxseg size set
> 1300 # handle 21
>                 iif "br-lan" accept # handle 22
>                 oif "br-lan" accept # handle 23
>                 iif "br-mgt" accept # handle 24
>                 oif "br-mgt" accept # handle 25

iif { "br-lan", "br-mgt } accept
oif { "br-lan", "br-mgt } accept

or maybe
iifname "br-*"

saves two rules.

> but this does not
> 
> chain forward { # handle 2
>         type filter hook forward priority filter; policy drop;
>         ct state established,related accept # handle 19
>         ct state invalid drop # handle 20
>         iif "br-lan" accept # handle 21
>         oif "br-lan" accept # handle 22
>         iif "br-mgt" accept # handle 23
>         oif "br-mgt" accept # handle 24
>         oif "pppoe-wan" tcp flags syn tcp option maxseg size set 1300 #
> handle 25
>         log prefix "DROP_FW " level debug flags all counter packets 0 bytes
> 0 # handle 26
> 
> I someone could explain why I would be grateful because I do not comprehend
> the varying outcome. Is it because after egress/ingress traffic hitting
> handle 21/22 (bottom syntax) the packets are exiting the chain after been
> processed and not reaching handle 25 for processing?

Yes, this is no different than iptables, a verdict ends packet
evaluation in that base chain hook.

So, if packet came from "br-lan" forward chain evaluation ends with handle 21.
