From: Duncan Roe <duncan_roe@optusnet.com.au>
Subject: Re: nftables atomic updates
Date: Wed, 29 Jan 2020 10:50:39 +1100
Message-ID: <20200128235039.GA11731@dimstar.local.net>
References: <76313ba4-fe88-1ef3-8250-682764dfcb08@fhmtech.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <76313ba4-fe88-1ef3-8250-682764dfcb08@fhmtech.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Frank Myhr <fmyhr@fhmtech.com>
Cc: netfilter@vger.kernel.org

Hi Frank,

On Tue, Jan 28, 2020 at 06:03:02PM -0500, Frank Myhr wrote:
> Hi,
>
> I'm belatedly moving from iptables and ipset to nftables. I've become
> accustomed to using 'ipset swap' to atomically update large ipsets (by
> loading the update into a temp ipset, then swapping the temp ipset with the
> old one, then finally deleting the temp ipset). From reading the fine
> nftables wiki I gather that all nft operations* included in a single file
> run with 'nft -f <file>' are first built up in parallel memory structures
> and then applied atomically. Is this statement correct?
>
> * I'm particularly interested in 'add element' operations.
>
> Thanks,
> Frank

Yes, any nft script or command is atomic.

Cheers ... Duncan.
