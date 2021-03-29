From: Florian Westphal <fw@strlen.de>
Subject: Re: bridge-nf-call-iptables: checking bridge vs. IP context?
Date: Mon, 29 Mar 2021 21:02:55 +0200
Message-ID: <20210329190255.GE8998@breakpoint.cc>
References: <20210329180827.GE2742@otheros>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20210329180827.GE2742@otheros>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Linus =?iso-8859-15?Q?L=FCssing?= <linus.luessing@c0d3.blue>
Cc: netfilter@vger.kernel.org

Linus L=FCssing <linus.luessing@c0d3.blue> wrote:
> I'm wondering whether I'm currently overlooking a simple solution
> for the following:
>=20
> When setting bridge-nf-call-iptables =3D 1, is there a simple way to
> check within one iptables rule whether it matched from a bridge
> netfilter hook or from an IP netfilter hook?

What is the use case? I would try to not use nf-call-iptables if possible.

If its a bridge netfiler hook, its only visible in ebtables.
If its a "native" IP netfilter hook, the skb has no bridge netfilter
extension, --physdev-is-in/out will never match.

> "--physdev-is-bridged" seemingly is not quite what I'm looking
> for, as it will only match after a bridging decision, in the
> FORWARD or POSTROUTING chains.

Yes, for some reason it was tied to output interface.
