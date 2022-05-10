From: Maximiliano Estudies <maxiestudies@gmail.com>
Subject: Re: Question about "masquerade"
Date: Tue, 10 May 2022 13:34:29 +0200
Message-ID: <CAF358wQBrgfKh1c-A9p_PKStfYABuZBmuGnmgfwZxzb0UeabJg@mail.gmail.com>
References: <875ymeepq4.fsf@alfa.kjonca>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=IVMWewcC6kk7xXPXWNFWHb9kzBEy5Imh03mE8AGXLqw=;
        b=EIolxxIdUpek5E5ffBFlylBARQzKD3CyQkAQgh/bhy9l5lizT/SwmzgQ3K5OecY/c+
         +9KUAtqALTET80nXxVDP8s/ySKEpQFHuOGS5I7hVJBpxkRY3ihXIDdX5PJ2zpK51hK1y
         Q6L3wPmupOStIziVLX82Uonk39AJKHqU3dHWZwL5c9kMRl2RcdwBf9MawjFA2Bu+TNHI
         3Dy+EW0fnXFIVixiFgFHBznb7tr15GCm2EjdCkO1pXbo2KxfnD1khC+pQzgJOOGXM6Vj
         ZwuWhixL6V4nBYalQ3Bf9DGZnLFIz7Pw4RsZONCJU6AOVk1IVPGTLl2jhyvcOwRpnj5t
         AGnQ==
In-Reply-To: <875ymeepq4.fsf@alfa.kjonca>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

Hi Kamil,

From the nftwiki docs: "Masquerade is a special case of SNAT, where
the source address is automagically set to the address of the output
interface", so it's just like SNAT without specifying the source
address which then gets assigned dynamically depending on the output
interface. You con also configure the port with "masquerade to :1024"

El lun, 9 may 2022 a las 16:38, Kamil Jo=C5=84ca (<kjonca@op.pl>) escribi=
=C3=B3:
>
>
> Maybe I miss something obvious in documentation.
> How stable is "masquerade"
> I know that it translates addresses.
> But what about ports? Changes them somehow? Keepos original?
> KJ
>
> --
> http://wolnelektury.pl/wesprzyj/teraz/



--=20
Maximiliano Estudies
VDT Referat Beschallung
+49 176 36784771
omslo.com
maxiestudies.com
