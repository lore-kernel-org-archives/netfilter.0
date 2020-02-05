From: =?UTF-8?B?0b3SieG2rOG4s+KEoA==?= <vtol@gmx.net>
Subject: [nftables v0.9.2] inet <> ip | ip6 family tables processing order?
Date: Wed, 5 Feb 2020 09:23:46 +0000
Message-ID: <dad1e392-ae29-a3bf-7411-d1dfe2095de2@gmx.net>
Reply-To: vtol@gmx.net
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1580894627;
        bh=PE+yr0jpPbalpDrOEO4CnS3pxal4UuV3YT8WOYcPaQg=;
        h=X-UI-Sender-Class:Reply-To:To:From:Subject:Date;
        b=gogO43dsNdOrflP68hC9mf3FeeRQFBQcUbLkhnCzr7LBp64bR99sCXetqTUrNb7Il
         ECMpEVohSkPgaDMxhlVr1HlhdslexN8fMXhLVRcWFr4na3YMKPUb3+YbYcxsQThCpr
         a7NM60tGy2aT9f3nRScYsbpFaBw0QnYaye1Hseso=
Content-Language: en-GB
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Having deployed family tables:

* inet
* ip
* ip6

and to my understanding the _base chain definitions_, hook priority and=20
policy, are only applicable to chains within the same family table but=20
are mutually exclusive between the different family tables I am=20
struggling to comprehend as to the order of packet processing among the=20
aforementioned family tables:

* which family table the packet is processed trough first/last - inet or =

ip | ip6?
* if the hook priority in the base chains of each family is the same but =

different policies being applied how would such conflict, inet vs. ip |=20
ip6, resolve?

As far as I comprehend jump | goto works with chains in the same family=20
table but it is not possible to jump | goto from the inet table to ip |=20
ip6 or vice versa, or is it?


