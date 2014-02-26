From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: nft error
Date: Wed, 26 Feb 2014 17:34:58 +0100
Message-ID: <20140226163458.GA22606@localhost>
References: <CAFnufp3Wzw9fLk2SU16kR1vfAbwaFQfhAo9dwNqk_80LVUfx4g@mail.gmail.com>
 <20140226102530.GA4093@localhost>
 <20140226104555.GA4215@localhost>
 <CAFnufp2EFQcaT6rKQaRLjOrgu32CPgaHvOjBfKzTAawkxOayVg@mail.gmail.com>
 <CAFnufp3Jigct_=uwUO+7sgNzQuRUHAczSWJ3yS+jSBhu=9H6VQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAFnufp3Jigct_=uwUO+7sgNzQuRUHAczSWJ3yS+jSBhu=9H6VQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matteo Croce <technoboy85@gmail.com>
Cc: netfilter@vger.kernel.org

On Wed, Feb 26, 2014 at 05:26:58PM +0100, Matteo Croce wrote:
> What module I'm missing now?
> 
> # nft list table global
> table ip global {
>         chain one {
>                  type filter hook input priority 0;
>         }
> }
> 
> # nft add set global ipv4_ad \{ type ipv4_address \; \}
> internal:0:0-0: Error: Could not add set: Operation not supported

nft_hash               12900  0
nft_rbtree             12808  1
nf_tables              42349  3 nf_tables_ipv4,nft_hash,nft_rbtree
