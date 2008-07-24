From: "Curtis Wyatt" <zhackwyatt@gmail.com>
Subject: Re: ip_queue, libnetfilter_queue, and packet alteration
Date: Thu, 24 Jul 2008 16:13:47 -0700
Message-ID: <7915e7b50807241613s4589f56m7400b7fcd56e310a@mail.gmail.com>
References: <7915e7b50807221702m752d5b74y9283a28f4b9b1689@mail.gmail.com>
	 <20080723094512.GA2250@khasse.inl.fr>
	 <7915e7b50807230943n1b946febw3615fa03a7176739@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=nzmcOdHNYGuaKAXpjaAk1ZB8zWGoB3f8lxuf8EUI/Eg=;
        b=nRvGhhA9DfMKHPsEtJ8dIYPgrp9rzHQVuLgXzltY0q/+VPCDsrUzREY8ywawY+1/kV
         RLtgJv8uHzGObAkDmyME/RPVSKuzPMUflsgZKC2P07VKQLA0xssEds+UvRq5INCDMJrs
         Xlf+1yhGdyAchyZl6wX+7My7+2FSf80e3NPBU=
In-Reply-To: <7915e7b50807230943n1b946febw3615fa03a7176739@mail.gmail.com>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Eric Leblond <eric@inl.fr>, Curtis Wyatt <zhackwyatt@gmail.com>, netfilter@vger.kernel.org

On Wed, Jul 23, 2008 at 9:43 AM, Curtis Wyatt <zhackwyatt@gmail.com> wrote:
>
> I have to do that with ip_queue as well.  I just can't understand why
> the packet disappears then after I do the NF_ACCEPT on it.  Or why the
> payload is shifted over 7 spaces for me.  I have to increment the
> pointer to the payload 7 times to get it to line up correctly.
>


Well I figured out the source of my problems, (this shifting that is
going on).  It's because during the compile this was passed as a
switch: -fpack-struct
