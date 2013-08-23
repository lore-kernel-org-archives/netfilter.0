From: Eric Dumazet <eric.dumazet@gmail.com>
Subject: Re: [PATCH] netfilter: avoid array overflow in nf_register_hook
Date: Fri, 23 Aug 2013 09:05:55 -0700
Message-ID: <1377273955.8828.13.camel@edumazet-glaptop>
References: <1377313495-16060-1-git-send-email-yp.fangdong@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-type:content-transfer-encoding:mime-version;
        bh=o7wKJl8PcIA51aZQkK84uhpTBwcqEElI7KntKla518U=;
        b=hM4DWGH1ZVmUftuGJymkFdbOXRW5AsmU96sISak5aNjF9hYHSVFVbrrs2/O3tCN1v/
         +wN8P3ZTe3uPqzmNMfLR0XmJw+obPVPFrziWpN+Z0QcgMpy5kanWpeIuY92uMt50luxd
         6JiTaTLyy2UITSZ7G/xleI6dlEGlkEQNVFSCewvggo5GjlqrkNuHK3mFPkkxyNm589Gn
         KVaEBde98x/Y3NOhzQkXENHLaD7TLQ/qYP0QpT9FeeESExEeiB0oMNxJij5WF2HH13z3
         zK1jy+A3iHQDxBHqWa3hf8CDSIV1x0i8vL9Sdo/pM2LrlFdgs3GJg189C5CeHP40UPtF
         oxZQ==
In-Reply-To: <1377313495-16060-1-git-send-email-yp.fangdong@gmail.com>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Dong Fang <yp.fangdong@gmail.com>
Cc: pablo@netfilter.org, kaber@trash.net, kadlec@blackhole.kfki.hu, davem@davemloft.net, netfilter-devel@vger.kernel.org, netfilter@vger.kernel.org, coreteam@netfilter.org, netdev@vger.kernel.org

On Fri, 2013-08-23 at 23:04 -0400, Dong Fang wrote:
> This patch fix the array overflow in nf_register_hook function
> 
> Signed-off-by: Dong Fang <yp.fangdong@gmail.com>
> ---
>  net/netfilter/core.c |    5 ++++-
>  1 files changed, 4 insertions(+), 1 deletions(-)
> 
> diff --git a/net/netfilter/core.c b/net/netfilter/core.c
> index 2217363..819eee1 100644
> --- a/net/netfilter/core.c
> +++ b/net/netfilter/core.c
> @@ -68,8 +68,11 @@ static DEFINE_MUTEX(nf_hook_mutex);
>  int nf_register_hook(struct nf_hook_ops *reg)
>  {
>  	struct nf_hook_ops *elem;
> -	int err;
> +	int err = -EINVAL;
>  
> +	if (reg->pf >= NFPROTO_NUMPROTO || reg->hooknum >= NF_MAX_HOOKS)
> +		return err;
> +

Thats a bug in the caller.

We want a hard crash so that the poor netfilter guy who made this error
can fix the bug before sending us a buggy patch.


