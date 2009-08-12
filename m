From: Steve Brown <sbrown25@gmail.com>
Subject: Re: Poor upload speed with NAT
Date: Wed, 12 Aug 2009 11:03:11 -0500
Message-ID: <1f4ef0970908120903i7dbf1c79q85e097d7a315113a@mail.gmail.com>
References: <1f4ef0970908101443i28bf4c1hc6b280d4096fd100@mail.gmail.com>
	 <1f4ef0970908120702h76814835rb475a09258efb812@mail.gmail.com>
	 <4A82D82F.1000003@shorwall.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=5Tfq3OU1XyRNGWeDJt1fdAcvkBXSCj8XyxcFwiuAle8=;
        b=X8jf6HolZhn4hR1Hu8NpC10KSJgYUcSxO33yrvUB2sNr3gIDO3839wbOSACOJwd7uP
         X+A7Diincfuqh4WthpTJjrfSKYdfK0nbc1WwP3gfnTpoktCdYb9FfsSNyoHsYOV1//at
         e/vUucCTHyrIdo7jLdXkjco4w424ybButBSGg=
In-Reply-To: <4A82D82F.1000003@shorwall.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

> At a root shell prompt, type "ip -s link ls" and look at the error
> rates, especially on your LAN interface. I suspect that will point you
> in the right direction.

Ah.... you are correct, that did point me in the right direction.  It
seems my WAN interface actually had the wrong media type specified,
thus creating lots of collisions.  Fixed that and performance
increased to where I was expecting it to be.  Couple of other issues
to work out, but thy aren't netfilter related (as this apparently
wasn't either). ;-)

Thanks!
