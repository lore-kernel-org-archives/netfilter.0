From: Florian Westphal <fw@strlen.de>
Subject: Re: bridge-nf-call-iptables: checking bridge vs. IP context?
Date: Tue, 30 Mar 2021 19:33:18 +0200
Message-ID: <20210330173318.GA17285@breakpoint.cc>
References: <20210329180827.GE2742@otheros>
 <20210329190255.GE8998@breakpoint.cc>
 <20210329232423.GF2742@otheros>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20210329232423.GF2742@otheros>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Linus =?iso-8859-15?Q?L=FCssing?= <linus.luessing@c0d3.blue>
Cc: Florian Westphal <fw@strlen.de>, netfilter@vger.kernel.org

Linus L=FCssing <linus.luessing@c0d3.blue> wrote:
> Ah! Okay, so adding something like
> "-m physdev ! --physdev-is-in" to all OpenWrt firewall rules should work?

Yes.

> So from a bridge netfilter hook "--physdev-in" will always either
> point to a bridge port or the bridge interface itself?
> And "--physdev-is-in" will always be true?

--physdev-is-in is true when call-iptables infra is 1 and packet
came in via a bridge port.

> And in "native" IP netfilter hooks "--physdev-in" will never match

It won't match if packet came in via a normal (not bridged)
interface.

> and "--physdev-is-in" will always be false?

Yes.
