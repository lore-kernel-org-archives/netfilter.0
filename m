From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: nft list sets changed behavior
Date: Sun, 18 Jun 2023 17:21:38 +0200
Message-ID: <ZI8hArHRm2ke+Awz@calendula>
References: <60e59333-3d37-5b66-e0ed-8e7d4c01d956@qmail.sunbirdgrove.com>
 <20230618122216.3bdd0e34776293adb0655516@plushkava.net>
 <962b1e4f-63e2-bc3b-bf27-5569c6402c0f@qmail.sunbirdgrove.com>
 <20230618133509.GA869@breakpoint.cc>
Mime-Version: 1.0
Return-path: <netfilter-devel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20230618133509.GA869@breakpoint.cc>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Florian Westphal <fw@strlen.de>
Cc: nft.ogxzcrqhuhgchbvxcs4j7wws@qmail.sunbirdgrove.com, netfilter@vger.kernel.org, netfilter-devel <netfilter-devel@vger.kernel.org>

On Sun, Jun 18, 2023 at 03:35:09PM +0200, Florian Westphal wrote:
> moving to nf-devel
> 
> nft.ogxzcrqhuhgchbvxcs4j7wws@qmail.sunbirdgrove.com <nft.ogxzcrqhuhgchbvxcs4j7wws@qmail.sunbirdgrove.com> wrote:
[...]
> > > > After updating to Debian 12 my tools relying on 'nft -j list sets' fail.
> > > > It now does not include the elements in those lists like it did on 11.
> 
> I see three possible solutions:
> 1 - accept the breakage.
> 2 - repair the inconsistency so we get 1.0.0 and
>     earlier behaviour back.
> 3 - make "list sets" *always* include set elements,
>     unless --terse was given.
> 
> Thoughts? I'd go with 3, I dislike the
> different behaviour that 2) implies and we already
> have --terse, we just need to make use of it here.

I'd go with 3 too, so --terse is honored.
