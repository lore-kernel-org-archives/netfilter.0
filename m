From: Florian Westphal <fw@strlen.de>
Subject: Re: nftables iifname and currently unknown interfaces
Date: Fri, 16 Oct 2020 12:56:12 +0200
Message-ID: <20201016105612.GH16895@breakpoint.cc>
References: <c382354e-4a18-0863-e006-0db6f9fce1f6@heinlein-support.de>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <c382354e-4a18-0863-e006-0db6f9fce1f6@heinlein-support.de>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Robert Sander <r.sander@heinlein-support.de>
Cc: netfilter@vger.kernel.org

Robert Sander <r.sander@heinlein-support.de> wrote:
> Hi.
> 
> with iptables it was possible to specify "-i ifacename" even when the
> interface was currently not available.
> 
> nft bails out with an error:
> 
> ./nft:225:1-75: Error: Could not process rule: No such file or directory
> add rule ip filter FORWARD iifname bond0.16 oifname bond0.42 accept

This error is not related to the interface names.

nft should annotate this error with ^^^^ markers with more recent
version, e.g.:

nft add rule inet filter forwad iifname bond0.16 oifname bond0.42 accept
Error: Could not process rule: No such file or directory
add rule inet filter forwad iifname bond0.16 oifname bond0.42 accept
                     ^^^^^^
(typo in chain name).
