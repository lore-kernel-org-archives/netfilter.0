From: Piyush Pangtey <gokuvsvegita@gmail.com>
Subject: Re: [PATCH] extensions: libxt_CONNMARK.c: Add translation to nft
Date: Wed, 9 Mar 2016 22:33:11 +0530
Message-ID: <56E0574F.9070007@gmail.com>
References: <1457539133-6410-1-git-send-email-bhumirks@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=subject:to:references:from:cc:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=psbt+bb20TWuUlffKe2i+z/NPjPWQOJYNdQ/Nx+24Jc=;
        b=0D9g5vlZlwYfD4ft2CWPwYor1X8aQqvhSFmBqrqLCBZH8dutC2QfiQyU9gPTUWAGlX
         ZIcs/ZjHW0yhkTzrbBRYnfjt6Jtt9bgUP4+ubSCs3Q8mPq2kiGOcz683biQyldxkaFC1
         YhkEAryV55ZvR5a7IgX7crBIhf/bSqeRUgghS0LNeGkdFzEQda5e4fWUigwE5qPSK/Aw
         5JQVAQY1wi6KsD9B8W/X8YnX6jN6RBJ4YWOA1rRHBPAzCtvYZ6l26Rw2zvU/PAynQ7My
         CGyqK8aVdOXyx1O9xURiFFgworAqrA8vmGn+PtgPqbtMezT/Zkd0X979IyFoADQOvd87
         5qEw==
In-Reply-To: <1457539133-6410-1-git-send-email-bhumirks@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bhumika Goyal <bhumirks@gmail.com>
Cc: netfilter@vger.kernel.org

Hello Bhumika,

On Wednesday 09 March 2016 09:28 PM, Bhumika Goyal wrote:
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
								  ^^^^^^^^^^^^^^
								  this does not work
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
			        ^
				missing space here

> +			     info->nfmask, info->ctmask);
> +		break;
> +	case XT_CONNMARK_RESTORE:
> +		xt_xlate_add(xl,"mark restore nfmask 0x%x ctmask 0x%x",	
			        ^
				missing space here

> +			     info->nfmask, info->ctmask);
> +		break;
> +	default:
> +		/* Should not happen */
		^^^^^^^^^^^^^^^^^^^^^^^
		this comment is not meaningfull

> +		break;
> +	}
> +
> +	return 1;
> +}
> +
>  static struct xtables_target connmark_tg_reg[] = {
>  	{
>  		.family        = NFPROTO_UNSPEC,
> @@ -362,6 +388,7 @@ static struct xtables_target connmark_tg_reg[] = {
>  		.x6_parse      = CONNMARK_parse,
>  		.x6_fcheck     = connmark_tg_check,
>  		.x6_options    = CONNMARK_opts,
> +		.xlate	       = connmark_tg_xlate,
>  	},
>  	{
>  		.version       = XTABLES_VERSION,
> @@ -377,6 +404,7 @@ static struct xtables_target connmark_tg_reg[] = {
>  		.x6_parse      = connmark_tg_parse,
>  		.x6_fcheck     = connmark_tg_check,
>  		.x6_options    = connmark_tg_opts,
> +		.xlate	       = connmark_tg_xlate,
>  	},
>  };
>  
> 



