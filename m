From: Florian Westphal <fw@strlen.de>
Subject: Re: [PATCH RESEND v3] netfilter: xtables: add quota support to nfacct
Date: Sat, 1 Feb 2014 23:57:26 +0100
Message-ID: <20140201225726.GF776@breakpoint.cc>
References: <1391292671-26466-1-git-send-email-mathieu.poirier@linaro.org>
Mime-Version: 1.0
Return-path: <netfilter-devel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1391292671-26466-1-git-send-email-mathieu.poirier@linaro.org>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mathieu.poirier@linaro.org
Cc: pablo@netfilter.org, kaber@trash.net, kadlec@blackhole.kfki.hu, netfilter-devel@vger.kernel.org, netfilter@vger.kernel.org, fw@strlen.de

mathieu.poirier@linaro.org <mathieu.poirier@linaro.org> wrote:
> +struct xt_nfacct_match_info_v1 {
> +	char		name[NFACCT_NAME_MAX];
> +	struct nf_acct	*nfacct;
> +
> +	__u32 flags;
> +	__aligned_u64 quota;
> +	/* used internally by kernel */
> +	struct nf_acct_quota	*priv __attribute__((aligned(8)));
> +};

I think *nfacct pointer is also kernel internal, so it should also get
aligned (might also be possible to stash it in *private struct).

> +	if (info->flags & XT_NFACCT_QUOTA) {
> +		spin_lock_bh(&info->priv->lock);
> +		val = (info->flags & XT_NFACCT_QUOTA_PKTS) ?
> +				atomic64_read(&info->nfacct->pkts) :
> +				atomic64_read(&info->nfacct->bytes);
> +		if (val <= info->quota) {
> +			ret = !ret;
> +			info->priv->quota_reached = false;

Why quota_reached = false
assignment?

[ How is this toggled (other than transition to 'true' below)? ]

> +		if (val >= info->quota && !info->priv->quota_reached) {
> +			info->priv->quota_reached = true;
> +			nfnl_quota_event(info->nfacct);
> +		}
> +
> +		spin_unlock_bh(&info->priv->lock);
> +	}

Hm.  Not sure why the lock has to be hold during all tests.  What about:

if (info->flags & XT_NFACCT_QUOTA) {
		val = (info->flags & XT_NFACCT_QUOTA_PKTS) ?
				atomic64_read(&info->nfacct->pkts) :
				atomic64_read(&info->nfacct->bytes);
		/* normal case: quota not reached */
		if (val <= info->quota)
			return !ret;

		/* other case: quota reached AND event sent */
		if (info->priv->quota_reached)
		       return ret;

		spin_lock_bh(&info->priv->lock);

		if (!info->priv->quota_reached) {
			info->priv->quota_reached = true;
			nfnl_quota_event(info->nfacct);
		}

		spin_unlock_bh(&info->priv->lock);

[ could also cmpxchg instead of spinlock ]

Other than that this looks good to me.
