From: Florian Westphal <fw@strlen.de>
Subject: Re: [libnftnl] documentation?
Date: Thu, 26 Mar 2020 10:45:29 +0100
Message-ID: <20200326094529.GD878@breakpoint.cc>
References: <2b42de23-1291-58b1-48d4-1863bc9772a6@gmx.net>
 <d29b4165-34cc-ab98-e2cd-d83b2cc7f815@fhmtech.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <d29b4165-34cc-ab98-e2cd-d83b2cc7f815@fhmtech.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Frank Myhr <fmyhr@fhmtech.com>
Cc: vtol@gmx.net, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Frank Myhr <fmyhr@fhmtech.com> wrote:
> On 2020/03/26 04:38, ѽ҉ᶬḳ℠ wrote:
> > Been trying to find some documentation in these places:
> > 
> > * https://netfilter.org/projects/libnftnl/
> > * https://www.netfilter.org/documentation/
> > * https://git.netfilter.org/libnftnl/tree/
> > *
> > https://wiki.nftables.org/wiki-nftables/index.php/Portal:DeveloperDocs/nftables_internals
> > 
> > 
> > but either I missed it - and thus appreciate a pointer - or there is none?
> > 
> > The aim/goal is to utilise libnftnl with json.
> 
> Do these help you?:
> https://git.netfilter.org/nftables/tree/doc/libnftables.adoc
> https://git.netfilter.org/nftables/tree/doc/libnftables-json.adoc
> 
> AFAIK libnftnl=libnftables, the older name just persists (confusingly) in
> many places.

No, these are different libraries. libnftnl is a standalone library
with low-level helpers.

libnftables is the highlevel library, its part of nftables itself.

libnftables contains the ruleset parser, for example.
