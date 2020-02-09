From: =?UTF-8?B?0b3SieG2rOG4s+KEoA==?= <vtol@gmx.net>
Subject: [nftables] economics of reverse path filtering - FIB expression vs.
 kernel parameter
Date: Sun, 9 Feb 2020 12:51:43 +0000
Message-ID: <4c393f46-903c-bfe3-0b91-a4b5411b50d0@gmx.net>
Reply-To: vtol@gmx.net
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1581252705;
        bh=7uw0C/rnoocrp7UVE7zkSRm9vEj0qhpL0lTbUQdIZvQ=;
        h=X-UI-Sender-Class:Reply-To:To:From:Subject:Date;
        b=cra1btwplgZyEoN1ar10sNVXi/MUI+cOnWyo5TGG0kByIc8NmOdz5ppjGW/cJR2jL
         KR/GFhJQy9eudzzNiXM+FUVSTO/RCCgdcLcAeMIX/qut1X97NAgEK1zrZVUotE9FmE
         phZCuIc+Bw2IScz2zCwYJIK4Ekpe77dgV0Sq81BI=
Content-Language: en-GB
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Presumably NFT rule

* filter prerouting fib saddr . iif oif missing drop

and kernel parameter

net.ipv4.conf.<interface>.rp_filter =3D 2

achieving the same goal.

Which one comes into effect first, if there is difference assuming that=20
both are being processed through netfilter?
Is one or the other more economic with regard to CPU cycles and/or=20
responsiveness?


