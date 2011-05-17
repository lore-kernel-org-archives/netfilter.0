From: Mr Dash Four <mr.dash.four@googlemail.com>
Subject: Re: ipset, IP6_NF_IPTABLES
Date: Tue, 17 May 2011 12:07:35 +0100
Message-ID: <4DD256F7.7050007@googlemail.com>
References: <ffc7edfebc6396f9754b6327b0523d27@visp.net.lb> <alpine.DEB.2.00.1105171000560.31927@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:message-id:disposition-notification-to:date
         :from:user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=OWpaUmJ2AJdBEZbvULoBxRrI73QeJgFixCmEuyddXu0=;
        b=So27CFsRZddCFIcqOHDVL5W+nZeqnCzz+67RaSScpPzLIcBsslQmxt+XJyz0i+/8a/
         XAguAcc/7NeOmaqUeUClr5XsWZNcQrj511esnVJRZL4SpfBpu6JE3EtPeJFzpIw4of5X
         +2SkKajyYQA/wUXTWlqcxyiZ885Uqfgjn47sI=
In-Reply-To: <alpine.DEB.2.00.1105171000560.31927@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: Denys Fedoryshchenko <denys@visp.net.lb>, netfilter@vger.kernel.org


> No, that's not possible. ipset needs the IPv6 support in the kernel.
>   
That can't be accurate - I have administratively disabled IPv6 on my 
system (both via sysctl as well as via the kernel command line)  - and 
ipset 6.5 runs just fine. I am not using any IPv6 sets though so that 
might be the reason why it is not complaining.
