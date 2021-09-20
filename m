From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: [PATCH] conntrackd: cache: fix zone entry uniqueness in external
 cache
Date: Mon, 20 Sep 2021 09:56:37 +0200
Message-ID: <YUg+tbNu+eO8DX6w@salvia>
References: <20210817203125.20128-1-adam.casella1984@gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20210817203125.20128-1-adam.casella1984@gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Adam Casella <ihateprod@gmail.com>
Cc: netfilter@vger.kernel.org, Adam Casella <adam.casella1984@gmail.com>

Hi,

Applied, thanks.

Please, send your patches to netfilter-devel@vger.kernel.org next
time.

One comment below.

On Tue, Aug 17, 2021 at 01:31:25PM -0700, Adam Casella wrote:
> In some use-cases, zone is used to differetiate conntrack state.  This preserves that uniqueness by adding zone into the cache in addtion to 5-tuple data
> This preserves external-cache uniqueness per zone when synced.
> 
> Follow up fix to: https://git.netfilter.org/conntrack-tools/commit/?id=a08af5d26297eb85218a3c3a9e0991001a88cf10
> 
> Signed-off-by: Adam Casella <adam.casella1984@gmail.com>
> ---
>  src/cache-ct.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/src/cache-ct.c b/src/cache-ct.c
> index abcfde4..7e788d2 100644
> --- a/src/cache-ct.c
> +++ b/src/cache-ct.c
> @@ -41,7 +41,8 @@ cache_hash4_ct(const struct nf_conntrack *ct, const struct hashtable *table)
>  			  nfct_get_attr_u8(ct, ATTR_L4PROTO),
>  		[3]	= nfct_get_attr_u16(ct, ATTR_PORT_SRC) << 16 |
>  			  nfct_get_attr_u16(ct, ATTR_PORT_DST),
> -	};
> +                [4]     = nfct_get_attr_u16(ct, ATTR_ZONE),

This array has a size of 4 slots, you forgot to update it, in case you
are using this patch in production already.

I have fixed it here before applying.
