From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: nftables carefully open the related-flow: ct state related ct
 helper "ftp-21" ...
Date: Tue, 9 Mar 2021 22:06:06 +0100
Message-ID: <20210309210606.GA6016@salvia>
References: <ae754fef-dbae-6a71-b7d5-b730bc21c363@hafenthal.de>
 <052d6523-bf4b-fadf-b95d-15bd63457cef@fhmtech.com>
 <1b961364-e014-57c9-5849-eb67c05b3a76@hafenthal.de>
 <5f52d13e-d135-7cb2-707f-2037ba041c87@fhmtech.com>
 <375f428e-f37b-551a-e09d-1024f00abb3d@hafenthal.de>
 <20210308210518.GC10808@breakpoint.cc>
 <624d2626-2fdc-a1d8-825c-81891488bf9d@hafenthal.de>
 <af7cddce-b8cf-1a01-1b71-130ea452c84b@fhmtech.com>
 <20210309172428.GF10808@breakpoint.cc>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20210309172428.GF10808@breakpoint.cc>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Florian Westphal <fw@strlen.de>
Cc: Frank Myhr <fmyhr@fhmtech.com>, Stefan Hartmann <stefanh@hafenthal.de>, "netfilter.org" <netfilter@vger.kernel.org>

On Tue, Mar 09, 2021 at 06:24:28PM +0100, Florian Westphal wrote:
> Frank Myhr <fmyhr@fhmtech.com> wrote:
> > > The ct helper "ftp" matches on the RELATED packets.
> > 
> > Stefan, congrats on getting your configuration working. :-)
> > And thank you very much for posting your complete ruleset below.
> > 
> > Florian, I hope you can comment:
> > 
> > 1) I will look at the code, but am surprised that "ct helper" uses the
> > in-kernel name "ftp" rather than that of the stateful object "ftp-21" that
> > the ruleset goes to the trouble of explicitly defining.
> > 
> > a) Is this simply a parsing artifact -- if the helper were called "abcd"
> > would the expression 'ct helper "abcd"' match it?
> > 
> > b) If it is NOT a parsing artifact but by design: why? It would be more
> > intuitive to use the name of the explicitly-named helper object. Another way
> > to ask the same thing: why bother with the explicit helper object at all,
> > rather than just use "ftp" (which implies the ip & tcp protocols in "ftp-21"
> > definition anyway) in both match and statement, like 'ct helper set "ftp"'?
> 
> Its a design fuckup.  When I made the objref patches to attach the
> defined helpers I did not consider that we already had a 'ct helper'
> with existing behaviour.
> 
> The explicit helper objects were done this way to allow defining
> multiple helpers wuth different settings.
> 
> There are helpers that can be tuned by options and users might want to
> use different settings in each.

Just posted a patchset, maybe we can address this inconsistency moving
forward:

https://patchwork.ozlabs.org/project/netfilter-devel/patch/20210309210134.13620-2-pablo@netfilter.org/
https://patchwork.ozlabs.org/project/netfilter-devel/patch/20210309210134.13620-3-pablo@netfilter.org/

> > 2) Does it make a difference whether 'ct helper set' is done in input (as in
> > below ruleset) or in prerouting? Maybe it has to be in prerouting only in
> > case of forwarded traffic?
> 
> It can be in input if the traffic is not forwarded.

Actually it can be place in forward chain too IIRC.

If the rule is added to prerouting, then the ct helper is attached to
both input and forward traffic.
