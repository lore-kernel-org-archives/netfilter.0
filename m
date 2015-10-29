From: Florian Westphal <fw@strlen.de>
Subject: Re: nftables: bridge filter with queue to userspace
Date: Thu, 29 Oct 2015 23:23:03 +0100
Message-ID: <20151029222303.GF18062@breakpoint.cc>
References: <56328E60.4040002@web.de>
 <20151029221138.GA3447@salvia>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20151029221138.GA3447@salvia>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: Martin =?iso-8859-15?Q?Gr=F6ger?= <mgroeger1@web.de>, netfilter@vger.kernel.org, bernhard.thaler@wvnet.at

Pablo Neira Ayuso <pablo@netfilter.org> wrote:

[ CC Bernhard ]

> On Thu, Oct 29, 2015 at 10:23:44PM +0100, Martin Gr=F6ger wrote:
> > I'm trying to build a transparent filter with application level fil=
tering.
> > First experiment with ip and output hook and queue to userspace was
> > successful. Then I changed to bridge filtering with forward hook. W=
ith
> > counter action I see that the packets match the rule, but the queue=
 to the
> > usersapce doesn't work.
> >=20
> > Am I right, that this fuction should work?

nfqueue backend only works with NFPROTO_IPV4 and _IPV6 at the moment,
i.e. nft ip and nft ip6, or via bridge_netfilter hack (which 'pushes'
packets though ipv4/ipv6 netfilter hooks).

> Florian told me he will come up sooner or later with native queue
> support for nft (ie. no bridge_netfilter required anymore).

Argh.  I'm a moron and forgot about this.

I still have the q&d hack that makes it work but no reroute (re-bridge,
cough) support, just dump-to-userspace.

Bernhard, did you have time to work on this?

If not, I think I can make time available soon since the other work
(nft bridge conntrack, nf netns hook stuff) is delayed at the moment
anyways.
