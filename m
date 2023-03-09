From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: [ANNOUNCE] libnftnl 1.2.5 release
Date: Thu, 9 Mar 2023 21:00:16 +0100
Message-ID: <ZAo60Btm0W3st8Ix@salvia>
References: <ZAo5g2gfD8z4OEs0@salvia>
Mime-Version: 1.0
Return-path: <netfilter-devel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <ZAo5g2gfD8z4OEs0@salvia>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter-devel@vger.kernel.org
Cc: netfilter@vger.kernel.org, netfilter-announce@lists.netfilter.org, lwn@lwn.net

On Thu, Mar 09, 2023 at 08:54:47PM +0100, Pablo Neira Ayuso wrote:
> Hi!
> 
> The Netfilter project proudly presents:
> 
>         libnftnl 1.2.5
> 
> libnftnl is a userspace library providing a low-level netlink
> programming interface (API) to the in-kernel nf_tables subsystem.
> This library is currently used by nftables.
> 
> This release includes two fixes for the printing of the set element
> user data area and the removal of an internal function without any
> clients.

This description is not correct: This release includes the inner
expression support, removal of deprecated functions from examples.

This release tarball is tar.xz instead tar.bz2.

Sorry for the incorrect description.

> See ChangeLog that comes attached to this email for more details on
> the updates.
> 
> You can download it from:
> 
> https://www.netfilter.org/projects/libnftnl/downloads.html
> 
> Happy firewalling.

> Pablo Neira Ayuso (5):
>       examples: remove nftnl_batch_is_supported() call
>       src: replace nftnl_*_nlmsg_build_hdr() by nftnl_nlmsg_build_hdr()
>       expr: add inner support
>       chain: relax logic to build NFTA_CHAIN_HOOK
>       build: libnftnl 1.2.5 release
> 
> Phil Sutter (1):
>       Makefile: Create LZMA-compressed dist-files
> 

