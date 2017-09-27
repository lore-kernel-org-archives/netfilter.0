From: "Evan Davies" <evan.davies@gmail.com>
Subject: Nftables bridge interface redirect to local machine
Date: Wed, 27 Sep 2017 21:11:25 +1000
Message-ID: <000b01d33781$5dbad2f0$193078d0$@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding:thread-index:content-language;
        bh=cqBDJ1YXPgfhnC0SsIfMf5YgSkaU435MEIu0o9C0/Jw=;
        b=lufHU+cedv9yUsDLVfCD9lOKRiA4BYPOOhQGRW0xqCLL9n0Uev2VBjatDzj6myp5hT
         LN4nzZjTK7qkkDwFIexlE6W5Gc2vhp0g9pMKL1kTiyvxqrxp/amrRwQh6Ta2035qVAqI
         DC5cXS71IKEDDT6JvPHuuxpN404OqGXbNblkHdK2lCFb2o9C32yGXknb9V+cLl4oDeMP
         E6xR9eFDf42Ncyeb7hTl3XVJIW7LvgaatViL7AhsI1a87pUNoP+cSPUbn3Yj8MKMyxbd
         8wgBbz9dwt+qWyAav8ITA0mmo6GloBNMQBS/xPD2zQ0oHGaTC184x2V0rc3uxrA7d4ts
         FT1A==
Content-Language: en-au
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org


Hi Guys,

I'm trying to migrate across to nftables as I like its new features. My
current sent up is:

=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 br0
LAN <------------>=A0 [ens34 bridged ens33] <--------------> =
ROUTER(Internet)


I would like to redirect any incoming traffic on the LAN side (ens34) of =
the
bridge interface br0 destined to port 80 to the local web server to
authenticate.
I would like to do this for all DNS requests as well. Basically, use the
bridged Linux box as a transparent gateway.

I have tried the example in the man page but I cannot get it to work.
Any help or pointers would be greatly appreciated.

Kernel Version 4.10.0-35-generic
nftables v0.7

Thanks
Evan



