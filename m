From: Neal Murphy <neal.p.murphy@alum.wpi.edu>
Subject: Re: [PATCH v3] netfilter: xtables: add quota support to nfacct
Date: Mon, 27 Jan 2014 13:08:06 -0500
Message-ID: <201401271308.06748.neal.p.murphy@alum.wpi.edu>
References: <1390842482-2294-1-git-send-email-mathieu.poirier@linaro.org>
Reply-To: neal.p.murphy@alum.wpi.edu
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1390842482-2294-1-git-send-email-mathieu.poirier@linaro.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On Monday, January 27, 2014 12:08:02 PM mathieu.poirier@linaro.org wrote:
> @@ -1108,7 +1108,8 @@ config NETFILTER_XT_MATCH_NFACCT
>         select NETFILTER_NETLINK_ACCT
>         help
>           This option allows you to use the extended accounting through
> -         nfnetlink_acct.
> +         nfnetlink_acct.  It is also possible to add quotas at the
> +         packet and byte level.
>  
>           To compile it as a module, choose M here.  If unsure, say N.

Suggestion: might this be better if described as:

> +         nfnetlink_acct and to control packet- and byte-level flow quotas.

? (I'm not sure if 'flow' is the right term, though.)
