From: =?UTF-8?B?0b3SieG2rOG4s+KEoA==?= <vtol@gmx.net>
Subject: Re: [nftables] possible to utilise sets across different tables?
Date: Fri, 25 Sep 2020 09:52:00 +0000
Message-ID: <f1e6e7f6-d9e2-cc93-1a64-acc5599b25a9@gmx.net>
References: <9454a56c-0efb-2f47-e1b4-7fb24991a0d9@gmx.net>
Reply-To: vtol@gmx.net
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1601027555;
        bh=l/FT6DOKqufC45oz1WG3/4ZcPuvQnzMGsRSdr3BUX04=;
        h=X-UI-Sender-Class:Reply-To:From:To:References:Subject:Date:
         In-Reply-To;
        b=kzihAi44TBt/YmDrTwiysJHmgjOUWeHIcZJncZ+vsnnLUayUmB2QZPY0XFWXgId4Z
         Lvy0+dUsRZkgijQWRYdSgPz8k1gOUNsxwi2GJvo1QSCYCwPY9igS0k+JbJvQrb6T+f
         WVZt5/mhTG/IgEfzIVGRRdHu3y1BC1NhFh6jBxkI=
In-Reply-To: <9454a56c-0efb-2f47-e1b4-7fb24991a0d9@gmx.net>
Content-Language: en-GB
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On 23/09/2020 13:43, =D1=BD=D2=89=E1=B6=AC=E1=B8=B3=E2=84=A0 wrote:
> Would it be possible to generate a set in 'table inet' based on=20
> 'saddr=C2=A0 ct state invalid drop' and then utilise the same set in a =

> 'table netdev rule', for offending saddr getting blocked early?
>

Tried some variations but none worked out and thus it seems deployment=20
of sets across families is not supported. Though I reckon it would be a=20
beneficial feature:

* mitigate repetition of same sets that are applicable for different=20
families
* gather set data in one family, e.g offenders' saddr from inet, and=20
deploy such set in a rule in a different family, e.g. in netdev for=20
blocking such offenders early on

