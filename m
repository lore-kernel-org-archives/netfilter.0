From: Vinicius Massuchetto <viniciusmassuchetto@gmail.com>
Subject: Re: Can't share ppp internet connection
Date: Sun, 21 Aug 2011 21:16:05 -0300
Message-ID: <CAJ1a920huQxJX790e+DYMjw7cDwCcGcCS+vSN3nT8mBpYe6mHQ@mail.gmail.com>
References: <CAJ1a921b0HqJmUxTfqmsO+RG56w+DS6tBoWWhPBFQb8t2cHQCQ@mail.gmail.com>
 <CAJ1a920zedy041MoUtYfbDCjMtzcg86Xd-i7ugP2zwDmGg7gXQ@mail.gmail.com> <4E50EE9C.6000603@gmx.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type:content-transfer-encoding;
        bh=CNLtXb7k6rdrTlEaktNVs6b3A+OerG7tcziRfVL+cV8=;
        b=TQP2wXC546fVzg2E2LwzBr+5Dpdjh2fSoB70zZwff85ttfGrOCbtwzmdHYVGVw8L3U
         LjXSe7yfVMqehSIM9zUmhQOxEVmocqB3n7Ht6Bkcq8sHuDgUNC141zhuWzbT6Fu9+26i
         pngDGugsaR/rQVy6rQHhd9TZ8g/8dCD3v4P9w=
In-Reply-To: <4E50EE9C.6000603@gmx.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: fuzzy_4711@gmx.de
Cc: Netfilter <netfilter@vger.kernel.org>

2011/8/21 fuzzy_4711 <fuzzy_4711@gmx.de>:
>
>
> -------- Original - Text --------
>
>> subnet 192.168.0.0 netmask 255.255.255.0 {
>>> =C2=A0 =C2=A0option routers 192.168.0.1;
>>> =C2=A0 =C2=A0option domain-name "onix";
>>> =C2=A0 =C2=A0range 192.168.0.2 192.168.0.10;
>>> =C2=A0 =C2=A0option domain-name-servers 201.10.120.2, 201.10.128.2;
>>> =C2=A0 =C2=A0option broadcast-address 192.168.0.1;
>>> =C2=A0 =C2=A0option ip-forwarding on;
>>> }
>
> You are using IP 192.168.0.1 for 2 purposes:
> a) router
> b) broadcast

That was wrong. I already removed the broadcast entry for interfaces
and dhcp configuration. Same results.

Thanks.
--=20
Vinicius Massuchetto
