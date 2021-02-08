From: Florian Westphal <fw@strlen.de>
Subject: Re: Constraints on nft expressions and statements in inet ingress
 chains
Date: Mon, 8 Feb 2021 17:32:14 +0100
Message-ID: <20210208163214.GG16570@breakpoint.cc>
References: <5959d455-c6b8-acaf-bc1c-9500b4a2716c@fhmtech.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5959d455-c6b8-acaf-bc1c-9500b4a2716c@fhmtech.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Frank Myhr <fmyhr@fhmtech.com>
Cc: netfilter@vger.kernel.org

Frank Myhr <fmyhr@fhmtech.com> wrote:
> 
> Some clearly make no sense, like:
> - anything involving an output interface

yes.

> - anything related to conntrack (I think)

Depends, conntrack info may be present for loopback case.

> - packet mark (I think)

Will be present for loopback and it can be set/assigned.

> Not sure about:
> - reject statement (pretty sure not)

Should work in recent kernels.

> - ah & esp header expressions?

Why would that not worl?  This is just like tcp/udp header access.

> - raw payload expression?

Same.

> - extension header expressions?

Same.

> Seem to work, but are they a good idea this early in processing?:
> - tcp header & udp header expressions? If IP datagrams are fragmented, these
> matches will miss all but first fragment, correct? (Since defragmentation
> doesn't happen until prerouting?)

Yes, access to l4 header will not work for subsequent fragments.

> My general impression is that inet ingress filtering on L3 IPv4 and IPv6
> header expressions like ip saddr, ip daddr is okay, but trying to reach into
> L4 so early will be problematic...

Yes, it might not work in fragmentation case.
