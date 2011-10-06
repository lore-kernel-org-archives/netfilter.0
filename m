From: ratheesh kannoth <ratheesh.ksz@gmail.com>
Subject: Re: track the icmp packet.
Date: Thu, 6 Oct 2011 23:13:09 +0530
Message-ID: <CAGZFCEHaDuG12ip++U5x77yVOps=nNyBNPOEo8rbsT1-sheM-A@mail.gmail.com>
References: <CAGZFCEH59K7gFs5uNVdY_XQrAea+DT5Mes4OzOaxCOdnCtTWKw@mail.gmail.com>
	<20111006170727.GA10297@ams1.x31.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=mlwR2a8Xm5e6au+NljEs6bvQVr6ntm8Q8z4aoIAvHEI=;
        b=KAWFpmnvV2VPI8nxF/L+RBJgjsCwDcCk+vktSl6lofCVkornc8qmaciNM5cQKzYnDU
         xPS9XtldddKfPUDm6okLf6f0n0iROdoBZ/OsMST/GXCqTlsrddLY4saaatOsDiEWNKNx
         tg5WO0clEQA9LFLxlb5ccasSoZAy95v9RfTRM=
In-Reply-To: <20111006170727.GA10297@ams1.x31.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Sarenik <jasan@x31.com>
Cc: Netfilter mailing list <netfilter@vger.kernel.org>, Jan Engelhardt <jengelh@medozas.de>

On Thu, Oct 6, 2011 at 10:37 PM, Jan Sarenik <jasan@x31.com> wrote
> The program is an example of Netfilter kernel module - not the way to
> go here.

I agree. But i would like to use this  conntrack module and do the "printk".

-Ratheesh
