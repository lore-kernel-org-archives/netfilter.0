From: Florian Westphal <fw@strlen.de>
Subject: Re: [libnftnl] documentation?
Date: Thu, 26 Mar 2020 11:41:54 +0100
Message-ID: <20200326104154.GE878@breakpoint.cc>
References: <2b42de23-1291-58b1-48d4-1863bc9772a6@gmx.net>
 <d29b4165-34cc-ab98-e2cd-d83b2cc7f815@fhmtech.com>
 <20200326094529.GD878@breakpoint.cc>
 <a69e199c-f1f3-0c22-9917-e1bac493ee8b@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <a69e199c-f1f3-0c22-9917-e1bac493ee8b@gmx.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?utf-8?B?0b3SieG2rOG4s+KEoA==?= <vtol@gmx.net>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

ѽ҉ᶬḳ℠ <vtol@gmx.net> wrote:
> On 26/03/2020 09:45, Florian Westphal wrote:
> > Frank Myhr <fmyhr@fhmtech.com> wrote:
> > > On 2020/03/26 04:38, ѽ҉ᶬḳ℠ wrote:
> > > > Been trying to find some documentation in these places:
> > > > 
> > > > * https://netfilter.org/projects/libnftnl/
> > > > * https://www.netfilter.org/documentation/
> > > > * https://git.netfilter.org/libnftnl/tree/
> > > > *
> > > > https://wiki.nftables.org/wiki-nftables/index.php/Portal:DeveloperDocs/nftables_internals
> > > > 
> > > > 
> > > > but either I missed it - and thus appreciate a pointer - or there is none?
> > > > 
> > > > The aim/goal is to utilise libnftnl with json.
> > > Do these help you?:
> > > https://git.netfilter.org/nftables/tree/doc/libnftables.adoc
> > > https://git.netfilter.org/nftables/tree/doc/libnftables-json.adoc
> > > 
> > > AFAIK libnftnl=libnftables, the older name just persists (confusingly) in
> > > many places.
> > No, these are different libraries. libnftnl is a standalone library
> > with low-level helpers.
> > 
> > libnftables is the highlevel library, its part of nftables itself.
> > 
> > libnftables contains the ruleset parser, for example.
> Bit confusing as
> https://wiki.nftables.org/wiki-nftables/index.php/Building_and_installing_nftables_from_sources
> states
> 
> "libnftnl (formerly known as libnftables)"

Yes, agree, this is confusing.  This old libnftables *was* renamed
to libnftnl.  At that point, no high-level library existed yet.

And it seemed better to give the name 'libnftables' to a highlevel
library.

Nowadays, libnftables is the high-level library that contains
most of the nftables functionality, such as parsing (nft rule format
and json).
