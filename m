From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: nftables iifname and currently unknown interfaces
Date: Wed, 28 Oct 2020 23:25:25 +0100
Message-ID: <20201028222525.GC25697@salvia>
References: <c382354e-4a18-0863-e006-0db6f9fce1f6@heinlein-support.de>
 <20201016105612.GH16895@breakpoint.cc>
 <68b4fcb6-f6cc-d1f0-c194-b0d479386ea3@heinlein-support.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <68b4fcb6-f6cc-d1f0-c194-b0d479386ea3@heinlein-support.de>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Robert Sander <r.sander@heinlein-support.de>
Cc: Florian Westphal <fw@strlen.de>, netfilter@vger.kernel.org

On Fri, Oct 16, 2020 at 01:10:21PM +0200, Robert Sander wrote:
> Am 16.10.20 um 12:56 schrieb Florian Westphal:
> 
> > nft add rule inet filter forwad iifname bond0.16 oifname bond0.42 accept
> > Error: Could not process rule: No such file or directory
> > add rule inet filter forwad iifname bond0.16 oifname bond0.42 accept
> >                      ^^^^^^
> > (typo in chain name).
> 
> Oh, how embarrassing. :)
> 
> The rule originally contained a jump to a chain that wa slater declared
> in the nft commands. Bummer. Sorry for the noise.

For the record, the most recent nftables (0.9.7) with recent kernel
versions provide a hint for this error:

# nft add rule x y jump test
Error: Could not process rule: No such file or directory
add rule x y jump test
                  ^^^^
