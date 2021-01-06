From: "Eliezer Croitoru" <ngtech1ltd@gmail.com>
Subject: RE: Matching streaming services
Date: Wed, 6 Jan 2021 22:05:04 +0200
Message-ID: <00ac01d6e467$398043c0$ac80cb40$@gmail.com>
References: <34e8a6b25cd0886dc6f5d8757e64d1846b29d7cd.camel@lusan.id.au>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:thread-index
         :content-language;
        bh=toxwMJej7JCju0AWrpIysKtbCFYsWVXWYKc9T4sOl64=;
        b=Sm9T3txNr8OfdX85bK5rVjkcIh3niGdM0g81uULWrpDiYQ/MYQCVjyRL6Mo2/5+JA8
         J2/qjlCMZHAjNBExQr/WMVz0lRnF8Wxot6/2N4C1XFsdy7Psx4k+EpS2CtmneE5d63j1
         y0ewvDsAuYy9t2HvP8zf4Vgryy5fE6FfbG2KoumYKLEoZjSeqAceKHrXGWgj3l2+rtKg
         Lq315MQK87f3pT4Yi24xwxru8NMn5vM8WHc/B3uMMY4OlI+Hmd7eJ56zioZ/GcB71SX0
         NC4VDPlKOu0UPGPtZ+Foxw9rKyC4oFBZ0HLbYV4lw3IqTETvO7HjhumyuGtzBPoAxUAA
         KSxA==
In-Reply-To: <34e8a6b25cd0886dc6f5d8757e64d1846b29d7cd.camel@lusan.id.au>
Content-Language: en-us
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: nikolai@lusan.id.au
Cc: netfilter@vger.kernel.org

Hey Nikolai,

Take a peek at:
* https://github.com/vel21ripn/nDPI
* https://github.com/elico/debian10-dev-ndpi-vel

It works ontop of Debian buster and couple others.
Even if you will not use this you might find in the code how they =
identify or try to identify specific services.

If you have control on the local DNS service you might be able to =
identify some of these dynamically.

Eliezer

----
Eliezer Croitoru
Tech Support
Mobile: +972-5-28704261
Email: ngtech1ltd@gmail.com
Zoom: Coming soon


-----Original Message-----
From: Nikolai Lusan <nikolai@lusan.id.au>=20
Sent: Wednesday, January 6, 2021 8:06 PM
To: netfilter@vger.kernel.org
Subject: Matching streaming services

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
- --=20
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
GTayCQbOZGG7SilV34dA/F8zwN4W5v4baL30CwLkQY1MDD4+xeY=3D
=3DkKYX
-----END PGP SIGNATURE-----

