From: "Gilad Benjamini" <gilad.benjamini@gmail.com>
Subject: Re: TEE target
Date: Tue, 27 May 2008 09:51:43 -0700
Message-ID: <d95317090805270951s7a7595f5uc844d1cd573d8527@mail.gmail.com>
References: <d95317090805270919s5a8347d5y75a3b8cbf5114727@mail.gmail.com>
	 <alpine.LNX.1.10.0805271843320.12937@fbirervta.pbzchgretzou.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        bh=imoI2F0vGoPMxW0hyagD/S9kMpNOAChgCOB6oUIntqE=;
        b=kJcP93Veqzr+PX5pkB/BNrynFgY7pGijwr3UChTJvkV8UfW/B+wA9NiwJWnOMq0dFFhVU2oBerVmFnmVofsbnQxZSnDujaZMgO3aUM0vndfNOveNyQImd6r+gU7zr0vzcqQI7+X3EH/KXIMx9LOVYeQAEI9dLips3uNTGRXhhws=
In-Reply-To: <alpine.LNX.1.10.0805271843320.12937@fbirervta.pbzchgretzou.qr>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: netfilter@vger.kernel.org

While on the subject...
- Can TEE be allowed earlier in the packet traversal, e.g. in the
FORWARD chain ?
- Rather than a gateway, can TEE get a device to direct to (e.g. a GRE tunnel) ?

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
