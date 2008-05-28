From: "Gilad Benjamini" <gilad.benjamini@gmail.com>
Subject: Re: TEE target
Date: Wed, 28 May 2008 10:27:22 -0700
Message-ID: <d95317090805281027i70b46548sbfeed39a040f746c@mail.gmail.com>
References: <d95317090805270919s5a8347d5y75a3b8cbf5114727@mail.gmail.com>
	 <alpine.LNX.1.10.0805271843320.12937@fbirervta.pbzchgretzou.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        bh=HIzg3KRtgvY8BWmdTVF2mTrnknyQbBSqFg21SkGzkIM=;
        b=iUHCi5fPYThb99VabjyYJlloGnu99hS4qnWbw3KjmJqcyael6jtyAd87Nbh1qzSSnwRf+jI5WxMfa9nUL3t17xsPFKs7ZB2vzQQwpD2xcPCKm5Jr7nDfhWKLbwAcIug3O0aeV61BpJFCDRfIAdPG5kDg28RkVqDdU6nI6FUkzUw=
In-Reply-To: <alpine.LNX.1.10.0805271843320.12937@fbirervta.pbzchgretzou.qr>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: netfilter@vger.kernel.org

I tried compiling and installing without the attached version.
The installation, by default, places the ".so" files in different
location that the standard iptables shared libraries.
Is iptables supposed to find the libraries there somehow or am I
suppose to configure the location differently ? I couldn't quite
understand what variable I need to set in the configuration.

TIA
Gilad

2008/5/27, Jan Engelhardt <jengelh@medozas.de>:
>
>  On Tuesday 2008-05-27 18:19, Gilad Benjamini wrote:
>
>  >When is the TEE target expected to be a standard part of iptables ?
>
>
> Probably never.
>
>
>  >If that doesn't happen, when might it be able to compile without it's
>  >"attached" version of iptables ?
>
>
> The attached version is just a copy of the official tree,
>  and is just provided for convenience because a lot of
>  distros are stuck with old versions.
>  There are also tarballs of Xtables-addons without the "attached" version;
>  see http://dev.medozas.de/files/xtables/ for singular files.
>
