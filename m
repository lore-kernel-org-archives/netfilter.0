From: =?UTF-8?B?0b3SieG2rOG4s+KEoA==?= <vtol@gmx.net>
Subject: [nftables] icmp type rate limiting - cumulative for the daddr or
 selectively per saddr?
Date: Tue, 29 Sep 2020 13:39:00 +0000
Message-ID: <407b6fc3-1986-6453-9f68-a066b3ad1974@gmx.net>
Reply-To: vtol@gmx.net
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1601386778;
        bh=GQC1qxavFYZQtZmyme1/xOHl4DoZHiA5tHxmYXOEE3I=;
        h=X-UI-Sender-Class:Reply-To:To:From:Subject:Date;
        b=Qo56dTnBRoXvMjhYgyovDEJYiNknkdQwIredXN7uHYTZhoBRYvQL1kUSakjC8W9av
         Hfa8BpEqejolmedReo5n5vkenX/yjqtCOaHW1UP/RBLvJzLjzFReuEGMEQRVogLkmM
         gkXZfpCo8n3PRFdw4jz0zXheI9BGlC8qFa65sIBs=
Content-Language: en-GB
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

https://wiki.nftables.org/wiki-nftables/index.php/Rate_limiting_matchings=
=20
is not clear whether the 'limit rate' stanza applies as:

* cummulutive limit (from any/all saddr) for the daddr within the given=20
period

or

* assumes/implies limit selectively for each saddr within the given perio=
d

If it is a cummulutive limit how to go about a limit per saddr? For examp=
le:

icmpv6 type 128 ip6 saddr limit rate over 15/second burst 3 packets drop

or

icmpv6 type 128 { ip6 saddr limit rate over 15/second burst 3 packets } d=
rop

producing:

Error: syntax error, unexpected saddr, expecting comma or '}'





