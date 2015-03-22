From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: nftables: nft fails to add rules to chains
Date: Sun, 22 Mar 2015 20:00:33 +0100
Message-ID: <20150322190033.GA7145@salvia>
References: <550B3069.7080209@skarnet.org>
 <20150322183106.GA4150@salvia>
 <550F0DBE.7000905@skarnet.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <550F0DBE.7000905@skarnet.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Laurent Bercot <ska-devel@skarnet.org>
Cc: netfilter@vger.kernel.org

On Sun, Mar 22, 2015 at 07:45:18PM +0100, Laurent Bercot wrote:
>  Hi Pedro,
> 
>  Thanks for answering.
>  Patch applied, and as expected nft now fails with the messages
> 
> libnftnl: Expression 'payload' not supported
> netlink.c:182: Memory allocation failure
> 
> 
> >I think this error is bogus. Please, apply this patch to libnftnl and
> >let us know.  For some reason __init is being ignored, are you using
> >gcc?
> 
>  I am using gcc (version 4.8.3). However I am not using glibc, but musl,
> and I link statically. This is probably the main difference between my
> system and the ones you guys are used to.
>  Is the "constructor" gcc attribute incompatible with static linking ?

The constructor seems to be ignored with static links, libnftnl needs
a fix.
