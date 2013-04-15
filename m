From: Jonghwan Choi <jhbird.choi@samsung.com>
Subject: RE: [PATCH 3.8-stable] netfilter: nfnetlink_queue: fix error return
 code in nfnetlink_queue_init()
Date: Mon, 15 Apr 2013 09:22:44 +0900
Message-ID: <005c01ce396f$59a2d600$0ce88200$%choi@samsung.com>
References: <1365779663-11862-1-git-send-email-jhbird.choi@samsung.com>
 <20130413100827.GA7230@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <stable-owner@vger.kernel.org>
In-reply-to: <20130413100827.GA7230@localhost>
Content-language: ko
Sender: stable-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'Pablo Neira Ayuso' <pablo@netfilter.org>, 'Jonghwan Choi' <jhbird.choi@gmail.com>
Cc: 'Wei Yongjun' <yongjun_wei@trendmicro.com.cn>, stable@vger.kernel.org, netfilter@vger.kernel.org

Dear Pablo Neira Ayuso
> > From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
> >
> > This patch looks like it should be in the 3.8-stable tree, should we
> apply
> > it?
> 
> Please, hold on with this. I'm preparing a -stable batch.


I see. Thanks.

Best Regards.

> -----Original Message-----
> From: stable-owner@vger.kernel.org [mailto:stable-owner@vger.kernel.org]
> On Behalf Of Pablo Neira Ayuso
> Sent: Saturday, April 13, 2013 7:08 PM
> To: Jonghwan Choi
> Cc: Wei Yongjun; stable@vger.kernel.org; netfilter@vger.kernel.org;
> Jonghwan Choi
> Subject: Re: [PATCH 3.8-stable] netfilter: nfnetlink_queue: fix error
> return code in nfnetlink_queue_init()
> 
> On Sat, Apr 13, 2013 at 12:14:23AM +0900, Jonghwan Choi wrote:
> > From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
> >
> > This patch looks like it should be in the 3.8-stable tree, should we
> apply
> > it?
> 
> Please, hold on with this. I'm preparing a -stable batch.
> 
> > ------------------
> >
> > From: "Wei Yongjun <yongjun_wei@trendmicro.com.cn>"
> >
> > commit 558724a5b2a73ad0c7638e21e8dffc419d267b6c upstream
> >
> > Fix to return a negative error code from the error handling
> > case instead of 0, as returned elsewhere in this function.
> >
> > Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
> > Signed-off-by: Pablo Neira Ayuso <pablo@netfilter.org>
> > Signed-off-by: Jonghwan Choi <jhbird.choi@samsung.com>
> > ---
> >  net/netfilter/nfnetlink_queue_core.c |    4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/net/netfilter/nfnetlink_queue_core.c
> b/net/netfilter/nfnetlink_queue_core.c
> > index 3158d87..39006c9 100644
> > --- a/net/netfilter/nfnetlink_queue_core.c
> > +++ b/net/netfilter/nfnetlink_queue_core.c
> > @@ -1064,8 +1064,10 @@ static int __init nfnetlink_queue_init(void)
> >
> >  #ifdef CONFIG_PROC_FS
> >  	if (!proc_create("nfnetlink_queue", 0440,
> > -			 proc_net_netfilter, &nfqnl_file_ops))
> > +			 proc_net_netfilter, &nfqnl_file_ops)) {
> > +		status = -ENOMEM;
> >  		goto cleanup_subsys;
> > +	}
> >  #endif
> >
> >  	register_netdevice_notifier(&nfqnl_dev_notifier);
> > --
> > 1.7.10.4
> >
> --
> To unsubscribe from this list: send the line "unsubscribe stable" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
