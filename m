From: Duncan Roe <duncan_roe@optusnet.com.au>
Subject: Re: [nft 0.9.3 | kernel 5.4.48] cannot get NAT to work
Date: Thu, 25 Jun 2020 11:45:06 +1000
Message-ID: <20200625014506.GC2523@dimstar.local.net>
References: <20200623212323.GS26990@breakpoint.cc>
 <cf63c2f8-3aaf-9af6-739e-8928b803fb8c@gmx.net>
 <20200623215239.GT26990@breakpoint.cc>
 <6e919ed9-50d9-7a23-a581-2c6110af5108@gmx.net>
 <20200623224854.GU26990@breakpoint.cc>
 <f67206b8-aebc-47b5-a3e2-d2d07d2bb53e@gmx.net>
 <20200624081443.GV26990@breakpoint.cc>
 <c4212304-c8f3-ebc7-c9cc-101a5e2ef28a@gmx.net>
 <20200624085315.GW26990@breakpoint.cc>
 <1c9f8c63-c2cb-a730-fb0a-a5b92ec5167b@gmx.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1c9f8c63-c2cb-a730-fb0a-a5b92ec5167b@gmx.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ????????????? <vtol@gmx.net>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>, Florian Westphal <fw@strlen.de>

On Wed, Jun 24, 2020 at 08:59:00AM +0000, ????????????? wrote:
> On 24/06/2020 08:53, Florian Westphal wrote:
> > ????????????? <vtol@gmx.net> wrote:
> > > Getting somewhere now, unless there are different kconf flags in 5.6 for
> > > building that module, least on this node with 5.4:
> > >
> > > modinfo: ERROR: Module alias nft_chain_nat not found.
> > >
> > > Which kconf flag is supposed to generate that particular module? Looked into
> > > https://github.com/torvalds/linux/blob/v5.4/net/netfilter/Kconfig but could
> > > not find something specific that builds that module.
> > https://github.com/torvalds/linux/blob/v5.4/net/netfilter/Makefile
> >
> > -> CONFIG_NFT_NAT
> >
> > ... which you seem to have enabled already.
> > So I would guess that the build system used doesn't pick the module up
> > for some reason.
>
> Thank you for the assistance. Will take it up with the distro maintainers to
> take a look at their build system.

What is your distro BTW?

In the meantime, maybe a depmod would help, if you haven't already tried that.

Cheers ... Duncan.
