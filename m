From: "G.W. Haywood" <ged@jubileegroup.co.uk>
Subject: Re: Deleting rules question
Date: Wed, 20 Oct 2021 23:06:05 +0100 (BST)
Message-ID: <438e1e85-44f0-b39a-3d60-cb1f9963a45c@jubileegroup.co.uk>
References: <6d040689-86b0-823e-2601-6da90dd17a27@tootai.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        jubileegroup.co.uk; h=date:from:to:subject:in-reply-to
        :message-id:references:mime-version:content-type; s=uk; bh=5r5er
        2TpSevbvB48uf3gusZol3mxTBnScWfgRpJgHwY=; b=g3sgZqCmCwaG2rnCWXNUb
        J3DCac9YiY1E6OkJoAGJiLvIORn6TgnIzEAVzBEGUQJqIk/t00KMteLt9ha+r0kX
        hAG6vXHMTWeUMFbnv1E7AjJ4BQI49pYOMQP/z5x63uoZYvCCuLb3zFvABA1bJsAE
        39JapV0Xp1X/dS6nVLtr9Qb6NFbQECMQ0Iuoi3rTyqll9stPHpF6LzSFYm96k2Rj
        8eeXLt0ASMMrauz7e0cbhiREvkDRPghYhxqZRpBesrcUNmxAvdZUzy+BwQHMcc92
        WjJKqGvy+WCg0+b9HYG3ZJafzHUfsk4k3UTQIkFx4iyFWfIiXw2peZOF+avtifjt
        g==
In-Reply-To: <6d040689-86b0-823e-2601-6da90dd17a27@tootai.net>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Daniel via Netfilter users list <netfilter@vger.kernel.org>

Hi there,

On Wed, 20 Oct 2021, Daniel wrote:

> is there a possibility to delete in one shot all rules concerning an 
> interface ?

A qualilfied yes.  I'm not sure what exactly you mean by "one shot",
but if for example you put all the rules in a single chain you could
flush the chain.  If there is more than one chain you can flush all
the chains with a single (possibly compound) command.  If that won't
do, then perhaps you can explain more carefully what you need.

-- 

73,
Ged.
