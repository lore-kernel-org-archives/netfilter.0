From: =?UTF-8?B?0b3SieG2rOG4s+KEoA==?= <vtol@gmx.net>
Subject: [nftables] xtables-addons - GeoIP/ASN filter and lscan replicable?
Date: Thu, 6 Feb 2020 02:27:16 +0000
Message-ID: <80253ddd-a2ea-3fdb-2612-6ed7c4d68abd@gmx.net>
Reply-To: vtol@gmx.net
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1580956036;
        bh=W0Zzsh8QhuKNmBAP9xDWYiO+Jpf7ah2Va1U7s12dHik=;
        h=X-UI-Sender-Class:Reply-To:To:From:Subject:Date;
        b=d+/KOalF7y8dbArWVJwBbpFQacrlVdYAzrCaOdGzf+ez8yt/v1nCAwDzM4yERVNGM
         dHShO807n4td9D/+TY/FfQM+ycZTr9BH8+c7ymPE+amAraUpXBdtMpTHpGNhD3FK+z
         J3/KA5/E4mLtGvTVY1EOvUB0jcjkDmUO/dD3sPCM=
Content-Language: en-GB
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

 From what I was able to gather xtables-addons are not available for nft?=


Is there any way to

* achieve GeoIP (country | residential)=C2=A0 | ASN filtering?
* replicate lscan?

