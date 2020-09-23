From: =?UTF-8?B?0b3SieG2rOG4s+KEoA==?= <vtol@gmx.net>
Subject: [nftables] possible to utilise sets across different tables?
Date: Wed, 23 Sep 2020 11:43:00 +0000
Message-ID: <9454a56c-0efb-2f47-e1b4-7fb24991a0d9@gmx.net>
Reply-To: vtol@gmx.net
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1600861732;
        bh=bNcgNl/DpIkNj110zDG/fJaDPEa27jEW4qFWwPwRmHg=;
        h=X-UI-Sender-Class:Reply-To:To:From:Subject:Date;
        b=MIp6POMFHiCqVFR7LhRHTsYjIOBHZbEsxg1NpacvkqcD4HuAJvxorLU/Wf4LdS960
         AXhrH1ITQY6PG+2rwNabYWj1Gp+RkQhIoYd9W16TXBTDVhL/PJEO0x9DKIDNuCh6xu
         BjAuHMblg2Lm/sDQSJX9EW20g2BHNVH3Dc9o8v88=
Content-Language: en-GB
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-9"; format="flowed"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Would it be possible to generate a set in 'table inet' based on 'saddr=C2=
=A0=20
ct state invalid drop' and then utilise the same set in a 'table netdev=20
rule', for offending saddr getting blocked early?

