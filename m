From: Scott Bronson <bronson@rinspin.com>
Subject: Re: Why isn't DNAT happening for host-originated packets?
Date: Thu, 3 Dec 2015 16:09:29 -0800
Message-ID: <CAKmUPx4jX4wyK10jR9Qr0DEPveRG5kOoLnuScpLgWE78DRXtyw@mail.gmail.com>
References: <CAKmUPx5kE+v03OGAjF32rOGyVQfOLbSmyTEOOK9uApANeWbU1A@mail.gmail.com>
	<5660CCD1.60807@familie-kuntze.de>
	<CAKmUPx44yvsz21jRE9BoxK0D4R+gGjJdk9De5QQHUBzj6o9r6Q@mail.gmail.com>
	<5660D6D3.8040205@familie-kuntze.de>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rinspin-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=slLs0NqqFas0zJnTw4Tf1CDyjSR0fBz1lpmag8Mz2Fw=;
        b=OnurAP/JIWdXQizXqAtbrx0IMLFm7UniwW7R59b5O0xpPkPvt4CUApBqYjS58t4+Yb
         R+oy2K0cadYDQaMRdfY06wPlkOuRvrXeTv08vmATYfm1m+vRYjFWlPRnt3fCfOo672Rm
         Af9uwW1tfB5EylJqHxJLFc4lzK0LDu1PhdB2nLsQZqNSk+26OGAr4X2qeNbV5nANep85
         KzVYDzHzpnHdbxgufFZAwgtKFeI4CjjDer5IZx5JkmzuR6+LAYUmpcxSLK7gK+2jCvz/
         rSRSmGJmXK+irfShnG2lBqsghLsl5UiSKYflD3bIhuOL7c0j2SVYe1GNbUTuYNbtr47P
         lAyw==
In-Reply-To: <5660D6D3.8040205@familie-kuntze.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Noel Kuntze <noel@familie-kuntze.de>
Cc: netfilter@vger.kernel.org

> They originate in the middle top of the graph. They only go right, they never go
> left, where the PREROUTING chains are.

Ah, I was naively starting all packets at the (start) box.  That makes
a lot more sense.  Thank you!

My workaround (copy all nat:PREROUTING rules bit-for-bit to
nat:OUTPUT) is pretty skanky though...  Does anyone have a suggestion
for a better way to solve this?

Thanks again!

     - Scott
