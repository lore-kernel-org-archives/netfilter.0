From: =?UTF-8?B?0b3SieG2rOG4s+KEoA==?= <vtol@gmx.net>
Subject: [nftables] multi-level rate limiting with dynamic set
Date: Tue, 29 Sep 2020 20:28:00 +0000
Message-ID: <cc0d60cd-05df-e67e-ce7c-c41177db4d69@gmx.net>
Reply-To: vtol@gmx.net
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1601411307;
        bh=50lqv1LfbvxFNSwxAn9JEdnAHrUHW4ZPPRHMz5Ec/V8=;
        h=X-UI-Sender-Class:Reply-To:To:From:Subject:Date;
        b=VIHIRVxIlC5BwCE1W7QaQvvBPV4+thOc+chQgPbWuvX+zVaa7mAU+gBYBJDrzcItM
         Y8uFOCWRa1yLYjLAsIkIInNBRz+KgC5aru0KlU1k7kCO3UM9UK+gNxmFm9NqSIm+6I
         prl6tQRbXhnfCsNawnmSJRljBfEyuOK1FV8NnjiQ=
Content-Language: en-GB
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

I am experimenting with a multi-level rate limiting approach via a=20
dynamic set, to achieve some fine-graining

set b_sa6 {
 =C2=A0 type ipv6_addr
 =C2=A0 size 65535
 =C2=A0 flags dynamic, timeout
 =C2=A0 timeout 14d
 =C2=A0 gc-interval 5s
}

for better reading: icmpv6 type 128 =3D echo-request

these are the rules being in play at the same time:

icmpv6 type 128 update @b_sa6 { ip6 saddr timeout 168h limit rate over=20
500/day } drop;
icmpv6 type 128 update @b_sa6 { ip6 saddr timeout 24h limit rate over=20
150/hour } drop;
icmpv6 type 128 update @b_sa6 { ip6 saddr timeout 2h limit rate over=20
50/minute } drop;
icmpv6 type 128 update @b_sa6 { ip6 saddr timeout 10m limit rate over=20
15/second burst 2 packets} drop;


With only any one rule in play the rate limiting works as expected but=20
as soon as two or more are in play packets are being dropped well below=20
the specified=C2=A0 limit.

Is it somehow possible to get this sort of fine-tuning done?

