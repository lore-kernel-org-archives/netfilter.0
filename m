From: "Mike Herms" <mherms@gmail.com>
Subject: Re: NFQUEUE handler source example
Date: Tue, 22 Apr 2008 16:43:53 -0400
Message-ID: <c1ae779f0804221343i44982416v9c29171b30db5513@mail.gmail.com>
References: <c1ae779f0804220704s3a419fbu2e507ced85a6aa06@mail.gmail.com>
	 <20080422201727.GB15732@bayen.regit.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        bh=dks2ZtyYFAnneqAlkxeUerbgE3mlM8wPL4fhlGsX7X0=;
        b=Z0jZH8bghUQ+TSMfeN9CbFBSiE9bHiZLO/NIhZFwoS8ho/T3ACNXddKEhgpzcwrpXLoUuAdYtw91n53rO/5Nim68ls4mShB9OX/e6JYcviNDTDP7tMbCLL2PdCJlhlsMVROL6ksVILw8Sk7u8xzr+lYP/cf7AvgA2O0xd38UKn0=
In-Reply-To: <20080422201727.GB15732@bayen.regit.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On Tue, Apr 22, 2008 at 4:17 PM, Eric Leblond <eric@inl.fr> wrote:
> Hello,
>
>
>  On Tuesday, 2008 April 22 at 10:04:18 -0400, Mike Herms wrote:
>  > Short question:
>  > Does anyone have example source code for user land handling of packets
>  > off of NFQUEUE in a bridged environment?  I believe that I've
>  > successfully created a bridged environment as follows:
>  ...
>
> > Version information:
>  > bridge-utils v1.2
>  > iptables v1.4.0
>  > ebtables v2.0.8-1 (May 2007
>  > arptables v0.0.3-3
>
>  Which kernel do you use, we did not succeed in queueing packet on 2.6.22
>  but 2.6.24 was clean. The effect was the same as your: no routed packet as
>  soon as NFQUEUE application is launched.

Thanks for the lead.  My kernel is the current for Ubuntu 7.10, which
is 2.6.22-14.  I'll check out my stuff on a newer kernel.

BTW, I'd still love to have a source code example if anyone is willing to share.

Mike
