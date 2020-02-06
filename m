From: =?UTF-8?B?0b3SieG2rOG4s+KEoA==?= <vtol@gmx.net>
Subject: [nftables] inherent benefits from XDP?
Date: Thu, 6 Feb 2020 20:28:21 +0000
Message-ID: <860b7317-a2a4-cdca-610a-f3c6440371a6@gmx.net>
Reply-To: vtol@gmx.net
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1581020902;
        bh=C2ibvYt9SNm+5AGUXyclWM1M0iLTdFStMD9OesRjQFQ=;
        h=X-UI-Sender-Class:Reply-To:To:From:Subject:Date;
        b=Bb/VE+xAinpudAzNaYF5ZQTS3zDfwnqcMRfJ7uUFCBS4nZm7De0w1Uo7zydjg+RJl
         tjFaFaSZSYZxyf0FzWS9jAV2USZVgfIauUhvCJhz/ha2rH+93l9sSJiM71jysX0TZf
         EeExQ6Fnbw1dbGjtOIgBZfCb683ztjpzYm3x+hDc=
Content-Language: en-GB
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Reading on the subject of XDP accumulates for me that (e)BFP will=20
benefit from XDP in various ways.

What I wanted to ask is whether NFT is benefiting from XDP as well, if=20
so how and to which extent?
Are there any particular knobs in NFT for colluding with XDP or are the=20
respective planes automatically aligned/optimised without the need of=20
user intervention?

A search in the public domain did not turn up much but for instance [1]=20
that however also mentions (e)BPF.
___
[1] https://lwn.net/Articles/802653/

