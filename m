From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: [PATCH] extensions: libxt_CONNMARK.c: Add translation to nft
Date: Wed, 9 Mar 2016 17:52:58 +0100
Message-ID: <20160309165258.GA1040@salvia>
References: <1457539133-6410-1-git-send-email-bhumirks@gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1457539133-6410-1-git-send-email-bhumirks@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bhumika Goyal <bhumirks@gmail.com>
Cc: shivanib134@gmail.com, netfilter@vger.kernel.org

On Wed, Mar 09, 2016 at 09:28:53PM +0530, Bhumika Goyal wrote:
> Add translation for target CONNMARK to nftables.
> 
> Examples:
> 
> $ sudo iptables-translate -t mangle -A PREROUTING -p tcp  --dport 80 -j CONNMARK --save-mark
> nft add rule ip mangle PREROUTING tcp dport 80 counter mark save nfmask 0xffffffff ctmask 0xffffffff
> 
> $ sudo iptables-translate -t mangle -A PREROUTING -p tcp --dport 80 -j CONNMARK --restore-mark --mask 12
> nft add rule ip mangle PREROUTING tcp dport 80 counter mark restore nfmask 0xc ctmask 0xc
> 
> $ sudo iptables-translate -t mangle -A PREROUTING -p tcp --dport 22 -j CONNMARK --set-mark 2
> nft add rule ip mangle PREROUTING tcp dport 22 counter mark set 0x2/0xffffffff
> 
> Signed-off-by: Bhumika Goyal <bhumirks@gmail.com>
> ---
>  extensions/libxt_CONNMARK.c | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/extensions/libxt_CONNMARK.c b/extensions/libxt_CONNMARK.c
> index 42cf207..e2dbf8d 100644
> --- a/extensions/libxt_CONNMARK.c
> +++ b/extensions/libxt_CONNMARK.c
> @@ -347,6 +347,32 @@ connmark_tg_save(const void *ip, const struct xt_entry_target *target)
>  	}
>  }
>  
> +static int
> +connmark_tg_xlate(const struct xt_entry_target *target,
> +		  struct xt_xlate *xl, int numeric)
> +{
> +	const struct xt_connmark_tginfo1 *info = (const void *)target->data;
> +
> +	switch (info->mode) {
> +	case XT_CONNMARK_SET:
> +		xt_xlate_add(xl, "mark set 0x%x/0x%x", info->ctmark, info->ctmask);
> +		break;
> +	case XT_CONNMARK_SAVE:
> +		xt_xlate_add(xl,"mark save nfmask 0x%x ctmask 0x%x",
> +			     info->nfmask, info->ctmask);
> +		break;
> +	case XT_CONNMARK_RESTORE:
> +		xt_xlate_add(xl,"mark restore nfmask 0x%x ctmask 0x%x",
> +			     info->nfmask, info->ctmask);

This translation is not correct.

