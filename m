From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: [PATCH 3.8-stable] netfilter: nfnetlink_acct: return -EINVAL if
 object name is empty
Date: Sat, 13 Apr 2013 12:08:38 +0200
Message-ID: <20130413100838.GB7230@localhost>
References: <1365779765-11924-1-git-send-email-jhbird.choi@samsung.com>
Mime-Version: 1.0
Return-path: <stable-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1365779765-11924-1-git-send-email-jhbird.choi@samsung.com>
Sender: stable-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jonghwan Choi <jhbird.choi@gmail.com>
Cc: stable@vger.kernel.org, netfilter@vger.kernel.org, Jonghwan Choi <jhbird.choi@samsung.com>

On Sat, Apr 13, 2013 at 12:16:05AM +0900, Jonghwan Choi wrote:
> From: Pablo Neira Ayuso <pablo@netfilter.org>
> 
> This patch looks like it should be in the 3.8-stable tree, should we apply
> it?

Please, hold on with this. I'm preparing a -stable batch.

> ------------------
> 
> From: "Pablo Neira Ayuso <pablo@netfilter.org>"
> 
> commit deadcfc3324410726cd6a663fb4fc46be595abe7 upstream
> 
> If user-space tries to create accounting object with an empty
> name, then return -EINVAL.
> 
> Reported-by: Michael Zintakis <michael.zintakis@googlemail.com>
> Signed-off-by: Pablo Neira Ayuso <pablo@netfilter.org>
> Signed-off-by: Jonghwan Choi <jhbird.choi@samsung.com>
> ---
>  net/netfilter/nfnetlink_acct.c |    2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/net/netfilter/nfnetlink_acct.c b/net/netfilter/nfnetlink_acct.c
> index 589d686..dc3fd5d 100644
> --- a/net/netfilter/nfnetlink_acct.c
> +++ b/net/netfilter/nfnetlink_acct.c
> @@ -49,6 +49,8 @@ nfnl_acct_new(struct sock *nfnl, struct sk_buff *skb,
>  		return -EINVAL;
>  
>  	acct_name = nla_data(tb[NFACCT_NAME]);
> +	if (strlen(acct_name) == 0)
> +		return -EINVAL;
>  
>  	list_for_each_entry(nfacct, &nfnl_acct_list, head) {
>  		if (strncmp(nfacct->name, acct_name, NFACCT_NAME_MAX) != 0)
> -- 
> 1.7.10.4
> 
