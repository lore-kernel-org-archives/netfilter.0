From: Patrick McHardy <kaber@trash.net>
Subject: Re: [PATCH 01/29] : xt_sctp: simplify xt_sctp.h
Date: Wed, 26 Mar 2008 21:15:20 +0100
Message-ID: <47EAAED8.5040903@trash.net>
References: <alpine.LNX.1.10.0803251914060.2240@fbirervta.pbzchgretzou.qr> <720350a38b1dbd43c907d5d81decd6edd6725d81.1206469820.git.jengelh@computergmbh.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <720350a38b1dbd43c907d5d81decd6edd6725d81.1206469820.git.jengelh@computergmbh.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jan Engelhardt <jengelh@computergmbh.de>
Cc: netfilter@vger.kernel.org

Jan Engelhardt wrote:
> diff --git a/include/linux/netfilter/xt_sctp.h b/include/linux/netfilter/xt_sctp.h
> index dd5a4fd..32000ba 100644
> --- a/include/linux/netfilter/xt_sctp.h
> +++ b/include/linux/netfilter/xt_sctp.h
> @@ -37,68 +37,54 @@ struct xt_sctp_info {
>  
>  #define SCTP_CHUNKMAP_SET(chunkmap, type) 		\
>  	do { 						\
> -		chunkmap[type / bytes(u_int32_t)] |= 	\
> +		(chunkmap)[type / bytes(u_int32_t)] |= 	\

This "bytes()" stuff also deserves to die.

Anyways, applied.
