From: Eric <evil.function@proton.me>
Subject: Re: nftables 1.0.6:  snat with maps
Date: Wed, 02 Aug 2023 14:36:03 +0000
Message-ID: <eajtHN1X5SQfn-dagoPk2oYxeIlA4_TrjP-DS2YR2pH4JkIgOIFMFfJEKWC-pLSafs8li8RLfUl_0JJYKWrq5F3DW9gIwDZ2xd4vB75of8E=@proton.me>
References: <34f5ce6552e75f830d9340e8d576b73e@sieciuch.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
        s=protonmail; t=1690986969; x=1691246169;
        bh=Xnr6sIeYc5eqmPOsd4WN6DYFmyk/JL7IeX4dbNY+OKs=;
        h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
         Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
         Message-ID:BIMI-Selector;
        b=Cc51qDZdL9IOEHOjMCIdmjtfr00XJjXFmwNr5+gHBultMgoJUwKU9TdPUmPkKWh69
         EM5SQa1aHFutJ7tu/KDm8q1+0uJv39lLp8eRBczFnpvHiNwXcC0tBYAqxcuU9NgtJ8
         QbrQ/x+UcLlMAPaR6xqO+/jz+rbGk6sRcAiKRj1lGEb0VzGpiwZ4EBaeSiSobKG46+
         LNbsm1qISUU6GfmTptZz2He4fO/FMPdI1rPTptGEVY3MXJBWV0r6A4Wz5pL7BGd5ej
         0wjh0aQsVSI4T6DfiEZzNSq9sMptFk2z4khGW0X9tmAkY1xSatO6Gthl4NuxrWAuiK
         YkhVFt7PZZ3ZQ==
In-Reply-To: <34f5ce6552e75f830d9340e8d576b73e@sieciuch.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Mucha Marcin, Sieciuch.com" <m.mucha@sieciuch.com>
Cc: netfilter@vger.kernel.org

On Wednesday, August 2nd, 2023 at 03:17, Mucha Marcin, Sieciuch.com <m.much=
a@sieciuch.com> wrote:
>=20
> chain source-nat {
> type nat hook postrouting priority 100; policy accept;
> ct state invalid drop;
> oif enp7s0 ip saddr maps {10.0.0.0/24 : 192.168.10.8, 10.1.0.0/24 : 192.1=
68.10.9};
> }

I believe you are missing the "snat" operation in the second clause of the =
rule:

    oif enp7s0  snat ip saddr maps {10.0.0.0/24 : 192.168.10.8,
This guy ------ ^^^^


Eric
