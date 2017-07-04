From: "Neal P. Murphy" <neal.p.murphy@alum.wpi.edu>
Subject: Re: Hairpin NAT - possible without packet marking?
Date: Tue, 4 Jul 2017 17:20:50 -0400
Message-ID: <20170704172050.20dcc4ac@playground>
References: <1363a246-966e-59fc-7d5a-efaf12aa6b51@dynator.no>
        <4c60ba2e-3e52-f55d-96e1-699c7821940d@pobox.com>
        <ea023673-d0c6-f8d8-0399-203a71e7fa62@trustiosity.com>
        <6773e78c-f0e6-508d-0a72-d5880705756d@pobox.com>
        <a3219c0b-2e2e-74d3-ae9b-88ec6ff35810@trustiosity.com>
        <1402388a-fb32-d7af-bc3a-6f25b8a2f47a@pobox.com>
        <2a775b43-8c1d-6b48-cecf-9796b82ec753@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Filter: OpenDKIM Filter v2.10.3 MAIL1.WPI.EDU v64LKr7K011541
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=wpi.edu; s=_dkim;
        t=1499203253; i=@wpi.edu;
        bh=Vi/P47BbhVRTnbNfhCPeb8iZn3Q3QKZI/bVIrqXNI0s=;
        h=Date:From:Cc:Subject:In-Reply-To:References;
        b=M7+tsaOXcBfcSSwKJn2+9rnXWBZOSkNDL+cwEl518y42kvmG7HrFpe83Fuh5yws32
         N4b0GGiG1OZM3umWYHrckujKIJCpmLYFPn10y+OyvYGRQ9fCN4KgYtsMknQ7RWHaTk
         j6Lpl/HcIAejbhzxw+N6s2cbSm/TX9ktja+ho03g=
In-Reply-To: <2a775b43-8c1d-6b48-cecf-9796b82ec753@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: 
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Tue, 4 Jul 2017 22:53:11 +0200
Pascal Hambourg <pascal@plouf.fr.eu.org> wrote:

> Le 04/07/2017 =C3=A0 03:14, Robert White a =C3=A9crit :
> >
> > I've honestly go no clue why you cant use --in-interface in a
> > POSTROUTING chain. =20
>=20
> Because the POSTROUTING chains also see packets that are generated=20
> locally and have no input interface.

Logically, (for example) locally generated packets (that have no input inte=
rface) and packets from eth1 should equally fail to match "--in-interface e=
th2". In other words, a packet that has no source interface should never ma=
tch any '--in-interface X' option because it clearly did not, and could not=
 have, come in from interface X.

Of course, the implementation may present different conditions and limitati=
ons.
