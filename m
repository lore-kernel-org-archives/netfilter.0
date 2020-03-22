From: Darius <dram@mailbox.org>
Subject: Re: TCP and UDP dport in the same rule
Date: Sun, 22 Mar 2020 15:26:24 +0100 (CET)
Message-ID: <161865440.26652.1584887186397@ox93.mailbox.org>
References: <670198645.21727.1584884428183@ox89.mailbox.org>
 <c3cba3e7-4cbb-13f5-7104-e1129416b5e0@fhmtech.com>
Reply-To: Darius <dram@mailbox.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; 
        boundary="----=_Part_26651_1646992547.1584887186397"
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
        content-type:content-type:mime-version:subject:subject
        :references:in-reply-to:message-id:reply-to:from:from:date:date
        :received; s=mail20150812; t=1584887186; bh=x4e/bs93WWa6xD/QOGoU
        O/wdVSSTdUyPJy5EXSJWFAM=; b=P7HKITFKTh7Q88rwVgTuaY5KmsJ4MjCxDvj9
        dulnQRnwYxraivRTVydAuz4NthD93S6EFe7Jb5JpjWB3BmsfJZnBNGBdwXvrsI9T
        vJSoy+lhFKJAzKy5UrGuFFojXlujhsYoZBI1IaeMJW9A94G1xwFJ7r17G6Aepl9j
        m0xsOl/fQeP7FtKXBDsWUd+BMJQ48hKCxQXdQpFjgw+6tah4Q/gOI0T0XLKl8x38
        +REe9rori9Fiw7FKKh4x+TSIlyzvCZXIpN90Ylqc7uW4OQJqUu480i5SptRNIuoz
        cFFqfOhhml7so79xLQJWYpDy4B6QobmuIWxzMuo2s/zOuW+cQw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
        t=1584887188; h=from:from:reply-to:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:mime-version:mime-version:
         content-type:content-type:in-reply-to:in-reply-to:  references:references;
        bh=x4e/bs93WWa6xD/QOGoUO/wdVSSTdUyPJy5EXSJWFAM=;
        b=rVpMqRHiW/3tlKB1/OMUwE7SGqJQ0dZlwUk3TluIMbpUTSV0zgLHFLmV2cSy45FuIHQho/
        ORe+m9gPn9CkcJ4ZoYjQY0IcQX3RT9z/qmZlqdPlnFP6MTIq2NbvMYHrkV8ZkUtouZhHgk
        MgdgIcKo8bdJ9CCFbBnFJ3GcNQ/CHHhFRgoPecgGXljOTQS6GifCR+ajnTzZvB/XNFJaRV
        jTTL8zLhzmz56zKDJ3GUCDUr+ilL9XnIobrd1S8w4wLRwdNkxg9WxQUCo4A9J+AoQh6gSw
        c30emA6eytg/ihF2fMAu3M6cuKrkqehYgGgog1sH44QoeFnwoqupk6fH/AHFsg==
In-Reply-To: <c3cba3e7-4cbb-13f5-7104-e1129416b5e0@fhmtech.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Frank Myhr <fmyhr@fhmtech.com>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

------=_Part_26651_1646992547.1584887186397
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Great Frank that helps!
I had another idea of mark tcp and udp packets with the same mare in prerouting and then use mark in the rule. Any downsides with this solution compared to payload expression?

Regards.

> On March 22, 2020 3:17 PM Frank Myhr <fmyhr@fhmtech.com> wrote:
>
>
> On 2020/03/22 09:40, Darius wrote:
> > Hi, I can't find the way to make one rule matching packets with the
> > same dport either on tcp or udp. So far I have rules like this:
> >
> > ip protocol tcp tcp dport 2000 counter accept ip protocol udp udp
> > dport 2000 counter accept
> >
> > I would like to have one rule instead. I couldn't find the way to do
> > it with intervals or maps because dport statement must go together
> > with tcp or udp.
>
> Hi Darius,
>
> Please see:
> https://www.mankier.com/8/nft#Payload_Expressions-Raw_Payload_Expression
>
> and this very recent thread:
> https://marc.info/?l=netfilter&m=158472251109859&w=2
>
> Best regards,
> Frank

------=_Part_26651_1646992547.1584887186397
Content-Type: application/pgp-signature
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: BCPG v1.61

iQEcBAABCgAGBQJed3WSAAoJEMHklCRhw9WaoocH/3vnpGVzTrO1iFKpHhEicmRk
h7h3ZrzV/EtEWOkVAX72UhXpZCAiZt4sR3LCrTThIyyN0HvQ9ZDfLDhPMFmJFdPF
gspouqR/CnMwIRXPaUwOJJ6lywyZz6CqgVoIqjLEvKpLwWQ3jvzZ2gR4Fv89Tl+l
MSSDlbWPHFg7kPpjL4ZfC4vK7bQljNZOwn/oSebdAk75axeET3kIH7ApHdSbcBKY
nIFNdiveDj2lCdqsvxu3nUEKFi77HdJ+95Q1ZaIiwYfubIc2bvJp4KsecBvS2tt4
vw0wPc6AVHdAhCnreK1YlhHJU/dL00GLKQE14OOtP98QVRq9V7DDjvpfR1CMcjg=
=QTP7
-----END PGP SIGNATURE-----

------=_Part_26651_1646992547.1584887186397--
