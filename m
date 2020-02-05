From: =?UTF-8?B?0b3SieG2rOG4s+KEoA==?= <vtol@gmx.net>
Subject: [nftables v0.9.2 | kernel 4.19.93] MSS clamping rule possible in the
 inet family table?
Date: Wed, 5 Feb 2020 08:14:18 +0000
Message-ID: <3716a5fa-e7e7-5220-06c1-a651ee6b576f@gmx.net>
Reply-To: vtol@gmx.net
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1580890460;
        bh=aUC1Ea1UjpU4rbdSUS93I+VA/z51xrfkHADYUsR/Y8w=;
        h=X-UI-Sender-Class:Reply-To:To:From:Subject:Date;
        b=c1+u0+rcOw1u66DmD1XRLm8B8xlOIcH+o9tQjaUtS00XrGxvufZE1g9zhIy7g2Rst
         wVqK0Iop28LdnhiS0NdEjtkLtVt47J5MH5259/rRroa1hokuetaLreNtff28eC+FaS
         VOnmpvJIzuNnAoEligBDNEntRc89sjF/89qZmyvs=
Content-Language: en-GB
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

WIKI [1] stipulates the rule in the ip family table, perhaps logical=20
since it applies to IPv4 only, It is however possible to include the=20
rule in the inet family table?

Having it implemented in

table inet filter {
 =C2=A0chain input =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=
 =C2=A0 { oif pppoe-wan tcp flags syn tcp option=20
maxseg size set 1400; }
}

does not throw an error but it does not work either.

Then tried instead (inet family)

{ oif pppoe-wan ip protocol tcp flags syn tcp option maxseg size set 1400=
; }
{ oif pppoe-wan ip protocol tcp flags syn ip protocol tcp option maxseg=20
size set 1400; }

But either throwing

Error: syntax error, unexpected flags, expecting newline or semicolon.

What am I missing to get this to work in the inet family table?

____
[1] https://wiki.nftables.org/wiki-nftables/index.php/Mangle_TCP_options

