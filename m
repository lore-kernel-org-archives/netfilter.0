From: Linus =?utf-8?Q?L=C3=BCssing?= <linus.luessing@c0d3.blue>
Subject: Re: bridge-nf-call-iptables: checking bridge vs. IP context?
Date: Tue, 30 Mar 2021 01:24:23 +0200
Message-ID: <20210329232423.GF2742@otheros>
References: <20210329180827.GE2742@otheros>
 <20210329190255.GE8998@breakpoint.cc>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20210329190255.GE8998@breakpoint.cc>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Florian Westphal <fw@strlen.de>
Cc: netfilter@vger.kernel.org

On Mon, Mar 29, 2021 at 09:02:55PM +0200, Florian Westphal wrote:
> Linus L=C3=BCssing <linus.luessing@c0d3.blue> wrote:
> > I'm wondering whether I'm currently overlooking a simple solution
> > for the following:
> >=20
> > When setting bridge-nf-call-iptables =3D 1, is there a simple way to
> > check within one iptables rule whether it matched from a bridge
> > netfilter hook or from an IP netfilter hook?
>=20
> What is the use case? I would try to not use nf-call-iptables if possible.

The use case is the following: I would like to use openNDS
(captive portal) between bridge ports. As is it comes with a set
of iptables rules. And I have the OpenWrt firewall with another
set of iptables rules.

Ideally I would want to avoid major modifications to either of
them.

For instance it would be great if I could avoid porting the
iptables rules of openNDS to ebtables, to avoid the maintenance
burden of keeping the iptables and ebtables version in sync. And
actually conditionally, when bridge-nf-call-iptables is set, replacing
any "-i" and "-o" on br-lan with --physdev-{in,out} on the bridge ports
in openNDS already works quite well.

Now I'm wondering if it would be possible to conditionally, when
bridge-nf-call-iptables is set, add something like a
"! --physdev-in-bridge-context" to all OpenWrt firewall rules. So
that any rule in the OpenWrt firewall would behave as if I
had bridge-nf-call-iptables=3D0. Again with the goal to avoid having
to maintain a heavilly modified OpenWrt firewall rule set.

>=20
> If its a bridge netfiler hook, its only visible in ebtables.

> If its a "native" IP netfilter hook, the skb has no bridge netfilter
> extension, --physdev-is-in/out will never match.

Ah! Okay, so adding something like
"-m physdev ! --physdev-is-in" to all OpenWrt firewall rules should work?

So from a bridge netfilter hook "--physdev-in" will always either
point to a bridge port or the bridge interface itself?
And "--physdev-is-in" will always be true?

And in "native" IP netfilter hooks "--physdev-in" will never match
and "--physdev-is-in" will always be false?
