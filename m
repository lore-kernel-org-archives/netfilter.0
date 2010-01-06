From: Richard Horton <arimus.uk@googlemail.com>
Subject: Re: what should I use for "unassigned" ports?
Date: Wed, 6 Jan 2010 20:33:42 +0000
Message-ID: <56378e321001061233o121c12fgadc33b03639343c8@mail.gmail.com>
References: <4B44D277.3000801@verizon.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type;
        bh=m717MVH/REUZ0ZaJLxTbGEnhrT7EYIt6tMMND632kX0=;
        b=U3uuWaqOQTHtjevXMu8VSFu3L43acPbM8gPKAd0pthPmusEGmh2+A99286aPlDqIS9
         RaNS48V2vFyBZLlTEmDZHhJnBrJ1HM3f6Q2L7lK2OaOSs7tuVWKSRshjFpa7TOxszQGP
         16dzKhMbAo0jUMssMTPl3fQkeTJSbsWF3JFhw=
In-Reply-To: <4B44D277.3000801@verizon.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Anthony Ewell <amewell@verizon.net>
Cc: netfilter@vger.kernel.org

2010/1/6 Anthony Ewell <amewell@verizon.net>:

> Having taken a more recent look at "/etc/services", I
> am finding zillions of service ports above 1024.
>
> With that in mind, is there a better starting port
> for my "unassigned" ports?
>

Sadly these days nope - the assigned port numbers are now all over the place.

However, alot of them are not likely to be in use on your system so
you ought to define your unassigned port range by what you are
actually running not by the contents of /etc/services (same goes for
protocols).
-- 
Richard Horton
Users are like a virus: Each causing a thousand tiny crises until the
host finally dies.
http://www.solstans.co.uk - Solstans Japanese Bobtails and Norwegian Forest Cats
http://www.pbase.com/arimus - My online photogallery
