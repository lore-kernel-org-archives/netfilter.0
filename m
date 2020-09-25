From: =?UTF-8?B?0b3SieG2rOG4s+KEoA==?= <vtol@gmx.net>
Subject: [nftables] sets update concatenation?
Date: Fri, 25 Sep 2020 19:10:00 +0000
Message-ID: <a629ba84-7c4e-3663-3516-9176d3223965@gmx.net>
Reply-To: vtol@gmx.net
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1601064594;
        bh=Hbo+MC6fXpAaQbetuPx6MmEJU0AHXGHJo83eh5UUj/0=;
        h=X-UI-Sender-Class:Reply-To:To:From:Subject:Date;
        b=IHSMbe8RSmkbOKSgbcMbO7X1wjc+ChfLRYIXPgWB9lgVCHEDL7bGrMVK6SAaDCoOt
         IJteQB3UCeetiE8iqR9rr25lbYWfRi5Hicm4s8GgFlBcom1521pS+hFSR5ks809D+i
         2+YlwPeOOcyIQ/h371yaLAOZRKCvL0eXedXl4wL0=
Content-Language: en-GB
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Been trying to concatenate sets update:

tcp dport @b_t update @b_sa4 { ip saddr } drop;
tcp dport @b_t update @b_sa6 { ip6 saddr } drop;

with:

tcp dport @b_t update @b_sa4 . @b_sa4 { ip saddr . ip6 saddr } drop;

but that did not work out. Is somehow possible to concatenate sets update=
?

