From: =?UTF-8?B?0b3SieG2rOG4s+KEoA==?= <vtol@gmx.net>
Subject: [nftables] granular rule for combined tcp & udp sports?
Date: Mon, 5 Oct 2020 12:56:00 +0000
Message-ID: <47b2582c-1f1e-4761-9be3-22018d7c87a2@gmx.net>
Reply-To: vtol@gmx.net
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1601902880;
        bh=RuZZ+i6SQZPh+lwf6AmLsZkiJVcxZjU9e6NUVmQCLyk=;
        h=X-UI-Sender-Class:Reply-To:From:To:Subject:Date;
        b=MjPZbnyIDvtfTV9ZycdZBoo4vRLjh9C3j2E+kHPiEd+z6sxY9tJhhymgEOXH3onQz
         VkiA39gs57+fNI9KHnEcEj2T5N+2x7ob5LzANa3nWgMvso8UFKfZkJCEYosnKbCZZ3
         HUEe3fNEHgYFhjIdel9fEz3f7PNgvvZJ8V79p4L4=
Content-Language: en-GB
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

I am trying to get a granular logging rule going, combining tcp and udp=20
sports for ip6 saddr but somehow failing:


tcp sport !=3D { 80, 443, 993, 5228 } udp sport !=3D 19302 ip6 saddr @g_6=
=20
log flags all prefix "G_C :" continue

-> Error: conflicting protocols specified: tcp vs. udp



ip6 saddr @g_6 tcp sport !=3D { 80, 443, 993, 5228 } | udp sport !=3D 193=
02=20
log flags all prefix "G_C :" continue;

-> Error: syntax error, unexpected '|', expecting newline or semicolon

