From: Mr Dash Four <mr.dash.four@googlemail.com>
Subject: Re: decipher the secmark number from nf_conntrack/ip_conntrack
Date: Mon, 20 Sep 2010 19:15:52 +0100
Message-ID: <4C97A4D8.4020505@googlemail.com>
References: <4C9696E5.4030803@googlemail.com> <alpine.LNX.2.01.1009200244280.5711@obet.zrqbmnf.qr> <4C973A6A.9010809@googlemail.com> <alpine.LNX.2.01.1009201421180.13430@obet.zrqbmnf.qr> <4C9756AB.5040304@googlemail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:received:received:message-id
         :disposition-notification-to:date:from:user-agent:mime-version:to:cc
         :subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=Fgu0cnq4br89W9bQmOSol2hVRojUuKKSV7rRcxF6Rqg=;
        b=iYVppxqVtQah2UNWmxgVJQHEXM+3J2PA4aRJRLXZseGlueynaGuIrOLPwvPxC7QC5Z
         vbbVTbLVz+AcCpocwL7a9MMpfjj7I1LM6P3emewRC9uQtJoO0Y2VmiF21proTQirND9o
         SDPFm5c3PlGNeRh2cPL8nakiAAkWRtSH8ihTg=
In-Reply-To: <4C9756AB.5040304@googlemail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: netfilter@vger.kernel.org, Pablo Neira Ayuso <pablo@netfilter.org>, netfilter-owner@vger.kernel.org

Further to my earlier post today, I can now confirm that the number 
shown in the secmark=XXX output IS the same as the "selctx" field in 
xt_SECMARK.h/libxt_SECMARK.c so it won't be that difficult to extract 
and incorporate the whole struct in some way suitable for visualisation 
(here's hoping!).

