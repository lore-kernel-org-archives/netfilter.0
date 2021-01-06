From: Nikolai Lusan <nikolai@lusan.id.au>
Subject: Matching streaming services
Date: Thu, 07 Jan 2021 04:05:58 +1000
Message-ID: <34e8a6b25cd0886dc6f5d8757e64d1846b29d7cd.camel@lusan.id.au>
Reply-To: nikolai@lusan.id.au
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lusan.id.au;
        s=KIEV_LUSAN; t=1609956367;
        bh=IO/Aev6c+ZfZ+56DKBwTEOix8asPFaKpmM6/Ajz33o8=;
        h=Subject:From:Reply-To:To:Date;
        b=hig2+F14+QOHJlL3Sa4urNceJje8WCNeSDem6xyjx8UfLlnwrT9OHj7I1YdUaNeKf
         nQLBRmU6WdOJ9ZeX0HLDKWxXaTSNzm6p0E2f4kVjx229I9SRA8iMEjLVzy9jCnwitv
         GHNBv5rxCw+mR4tYvEEy8Oj238oqRcl5inQALWF0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lusan.id.au;
        s=KIEV_LUSAN; t=1609956359;
        bh=IO/Aev6c+ZfZ+56DKBwTEOix8asPFaKpmM6/Ajz33o8=;
        h=Subject:From:Reply-To:To:Date;
        b=VNdXGLkEloWsrjW8rtS7cS5MOY2n6va09FbmPCFiYgbQ3NXnP35mA3t7C0V7j5yYq
         bIaiZW+3QUbGUhVWWiMoFe2JcLxymzIBelMxVTGSUh3FJsb/FPL2P105on4NGaL1B9
         MkNdNwpVbHirjICrcPhpn5jV6plg60fHfk7iFWG8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lusan.id.au;
        s=KIEV_LUSAN; t=1609956359;
        bh=IO/Aev6c+ZfZ+56DKBwTEOix8asPFaKpmM6/Ajz33o8=;
        h=Subject:From:Reply-To:To:Date;
        b=VNdXGLkEloWsrjW8rtS7cS5MOY2n6va09FbmPCFiYgbQ3NXnP35mA3t7C0V7j5yYq
         bIaiZW+3QUbGUhVWWiMoFe2JcLxymzIBelMxVTGSUh3FJsb/FPL2P105on4NGaL1B9
         MkNdNwpVbHirjICrcPhpn5jV6plg60fHfk7iFWG8=
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

Hi,

I have been looking for a way to differentiate traffic from streaming
services (Netflix, Amazon Prime, <insert_locally_available_service>)
from other https traffic, with not much luck. The goal is to add rules
to nftables and tc to ensure quality while allowing the rest of the
link to function normally.

I tried using tcpdump to see if there was something in the packets that
I could use, but they look like any other bit of https traffic.

Does anyone have a method for determining which http/https traffic is
streaming video, and which is not?

Thanks
- -- 
Nikolai Lusan <nikolai@lusan.id.au>
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEVfd4GW6z4nsBxdLo4ZaDRV2VL6QFAl/1/AYACgkQ4ZaDRV2V
L6Qtaw/9EaJHbOuar8d8s4FyKU3JvJxlV0SAPsHSoSGHWFZ3j7eYj+A8SZ8vylni
AGzZ0SbstVcpW7BvnjHfo7RV1rrqdM1dTxXGecXfVuktFWg6PyWcICrUqnwo9Zkd
bQ3LO8hs8/r69mNzhOC9XxRDiHM6y1aPlHpkQgCXNhY5mdPXdqo4vdRH61N6ktg1
mwWZ3vtr0gTqCD8Ir7sVlI0TBbp4Ztl8sqHT0UOhDkwC0aWpDc0MYxg+mMv2+Cmw
wsGcVR52Nm61pryEOTJrdQL5iX7LxBdjuSB+GR+y1nwOevsQlzhrBrad42HiIgE3
WKKPWVKuInq3vOD+ZU/QKP/JPzXbsop4s/cJC6Fj+T8rnO4QPAbqDrMjdAYlmz+R
ntjKg4Nwe8WEVKwV7ftzeeEb8iLBjm+5qbFysMoumMo4D2om9DX3mCmEdzz8HASe
5Xw0vkNJI3AgjNRyU462ybrV+ZtYDiM3e71PiOvf/MKyiORzEZ0OQxtpdd9KHChJ
aAjwtfKgz0H/ZJoQdArtqjhQTTHXEOBR0S6t32MBSsuLbuStdQ5Jbi1eG7KrKvkw
mkRLlupzqShncZArNFLDIatVazG3Vx3Bav//CxXM28A0bm8YgnQkz3p6NIf6SSOY
GTayCQbOZGG7SilV34dA/F8zwN4W5v4baL30CwLkQY1MDD4+xeY=
=kKYX
-----END PGP SIGNATURE-----

