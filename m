From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: [PATCH 3.8-stable] netfilter: nfnetlink_queue: fix error return
 code in nfnetlink_queue_init()
Date: Sat, 13 Apr 2013 12:08:27 +0200
Message-ID: <20130413100827.GA7230@localhost>
References: <1365779663-11862-1-git-send-email-jhbird.choi@samsung.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1365779663-11862-1-git-send-email-jhbird.choi@samsung.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jonghwan Choi <jhbird.choi@gmail.com>
Cc: Wei Yongjun <yongjun_wei@trendmicro.com.cn>, stable@vger.kernel.org, netfilter@vger.kernel.org, Jonghwan Choi <jhbird.choi@samsung.com>

On Sat, Apr 13, 2013 at 12:14:23AM +0900, Jonghwan Choi wrote:
> From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
> 
> This patch looks like it should be in the 3.8-stable tree, should we apply
> it?

Please, hold on with this. I'm preparing a -stable batch.

> ------------------
> 
> From: "Wei Yongjun <yongjun_wei@trendmicro.com.cn>"
> 
> commit 558724a5b2a73ad0c7638e21e8dffc419d267b6c upstream
> 
> Fix to return a negative error code from the error handling
> case instead of 0, as returned elsewhere in this function.
> 
> Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
> Signed-off-by: Pablo Neira Ayuso <pablo@netfilter.org>
> Signed-off-by: Jonghwan Choi <jhbird.choi@samsung.com>
> ---
>  net/netfilter/nfnetlink_queue_core.c |    4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/net/netfilter/nfnetlink_queue_core.c b/net/netfilter/nfnetlink_queue_core.c
> index 3158d87..39006c9 100644
> --- a/net/netfilter/nfnetlink_queue_core.c
> +++ b/net/netfilter/nfnetlink_queue_core.c
> @@ -1064,8 +1064,10 @@ static int __init nfnetlink_queue_init(void)
>  
>  #ifdef CONFIG_PROC_FS
>  	if (!proc_create("nfnetlink_queue", 0440,
> -			 proc_net_netfilter, &nfqnl_file_ops))
> +			 proc_net_netfilter, &nfqnl_file_ops)) {
> +		status = -ENOMEM;
>  		goto cleanup_subsys;
> +	}
>  #endif
>  
>  	register_netdevice_notifier(&nfqnl_dev_notifier);
> -- 
> 1.7.10.4
> 
