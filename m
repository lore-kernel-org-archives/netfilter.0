From: Laurent Bercot <ska-devel@skarnet.org>
Subject: Re: nftables: nft fails to add rules to chains
Date: Sun, 22 Mar 2015 19:45:18 +0100
Message-ID: <550F0DBE.7000905@skarnet.org>
References: <550B3069.7080209@skarnet.org> <20150322183106.GA4150@salvia>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20150322183106.GA4150@salvia>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

  Hi Pedro,

  Thanks for answering.
  Patch applied, and as expected nft now fails with the messages

libnftnl: Expression 'payload' not supported
netlink.c:182: Memory allocation failure


> I think this error is bogus. Please, apply this patch to libnftnl and
> let us know.  For some reason __init is being ignored, are you using
> gcc?

  I am using gcc (version 4.8.3). However I am not using glibc, but musl,
and I link statically. This is probably the main difference between my
system and the ones you guys are used to.
  Is the "constructor" gcc attribute incompatible with static linking ?
Or is nft using glibc-specific constructs ?

-- 
  Laurent

