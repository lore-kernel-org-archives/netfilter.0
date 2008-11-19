From: "JC Janos" <jcjanos245@gmail.com>
Subject: Re: Xtables-addons 1.6
Date: Wed, 19 Nov 2008 05:58:34 -0800
Message-ID: <7259d7020811190558m315a5e37va0310f4fc5fd6ff@mail.gmail.com>
References: <alpine.LNX.1.10.0811181840170.2316@fbirervta.pbzchgretzou.qr>
	 <7259d7020811181620n1ca06f84oe9d6d1f5f0a680c7@mail.gmail.com>
	 <alpine.LNX.1.10.0811190900450.24370@fbirervta.pbzchgretzou.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=12QjLa5pmJHDcy86bj8yVfq2PDwXgZv6bTwuHluSKVU=;
        b=D1Je0A0u1CO/s7qCQX9Z7Mv6dR/PwM1iui4G7QSFEorBJ2H7y3S35wWAFCBJzXvbah
         p8hnQ0Hi7eKi71nWpCCHY0IMeZATollkEyfJzIS3FX0jTo3usnJDkfG98iGQAOfXB4mQ
         uYE7I8M7WxYM9PXKaLunz8MQEX6jkLWUrxTS4=
In-Reply-To: <alpine.LNX.1.10.0811190900450.24370@fbirervta.pbzchgretzou.qr>
Content-Disposition: inline
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: Netfilter Developer Mailing List <netfilter-devel@vger.kernel.org>, netfilter@vger.kernel.org

On Wed, Nov 19, 2008 at 12:05 AM, Jan Engelhardt <jengelh@medozas.de> wrote:
> Yes, you can edit the "mconfig" file and set "build_ipset=n".

That works.

Thanks!

--JC
