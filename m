From: Rvfg <i@rvf6.com>
Subject: Re: ct state vmap no longer works on 6.3 kernel
Date: Wed, 3 May 2023 19:33:35 +0800
Message-ID: <9252665d-7d18-099f-dad2-e3ee882591fd@rvf6.com>
References: <a2c6386f-d339-9774-387a-f20fa8aa28e6@rvf6.com>
 <ZFH86op04R2rWPbi@calendula> <03175e31-29bd-1588-1042-5931af102348@rvf6.com>
 <20230503081920.GA9674@breakpoint.cc>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=rvf6.com; s=dkim;
        t=1683113620; bh=Nb652fdgo1uu4VBlgJPPJNlMsloj529cqYQG9i0X7oo=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To;
        b=kVZQQIiXUDP8N64TzLL1JEiHpB6xSxO8AdSgyBhbkj2Ytuk7CcflZaikUCiVk9zZX
         ak0uE94hYfSPGROCZ2O+Fcj4GZv+x4kQOEgKEO6EzYGSY/M33Fqo8FsdMbrCjKKYeh
         I1pqXtljWUvGngR+lnOfIAtW2MKXy/2oCZ51MVTIWWz/+FR127wrYyTDUUh1x7E2oq
         oubEQhV95/TeuFHv0DGD7k82r9YsJXm2kIAu3OgDeSpFE2He+WRXQkWNWyTSSnpd/e
         1vJv+3GnopQuM06hIyML6WrWflFEMmXgfS5NPqJvICZBIAWtMuvhLE7h6Kfd3MUu1Q
         0x37UL5NYYobA==
Content-Language: en-US
In-Reply-To: <20230503081920.GA9674@breakpoint.cc>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Florian Westphal <fw@strlen.de>
Cc: netfilter@vger.kernel.org



On 5/3/23 16:19, Florian Westphal wrote:
> Thanks, the BREAK in the referenced patch is the problem.
> 
> Please give this fix a try:
> 
> diff --git a/net/netfilter/nft_ct_fast.c b/net/netfilter/nft_ct_fast.c
> --- a/net/netfilter/nft_ct_fast.c
> +++ b/net/netfilter/nft_ct_fast.c
> @@ -15,10 +15,6 @@ void nft_ct_get_fast_eval(const struct nft_expr *expr,
>   	unsigned int state;
>   
>   	ct = nf_ct_get(pkt->skb, &ctinfo);
> -	if (!ct) {
> -		regs->verdict.code = NFT_BREAK;
> -		return;
> -	}
>   
>   	switch (priv->key) {
>   	case NFT_CT_STATE:
> @@ -30,6 +26,16 @@ void nft_ct_get_fast_eval(const struct nft_expr *expr,
>   			state = NF_CT_STATE_INVALID_BIT;
>   		*dest = state;
>   		return;
> +	default:
> +		break;
> +	}
> +
> +	if (!ct) {
> +		regs->verdict.code = NFT_BREAK;
> +		return;
> +	}
> +
> +	switch (priv->key) {
>   	case NFT_CT_DIRECTION:
>   		nft_reg_store8(dest, CTINFO2DIR(ctinfo));
>   		return;

This patch fixed my problem on 6.3.0 kernel. Thank you!
