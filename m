From: =?UTF-8?B?0b3SieG2rOG4s+KEoA==?= <vtol@gmx.net>
Subject: [nftables 0.9.2 | kernel 4.19.93] flowtable - number of devices
 limited (7)?
Date: Wed, 18 Mar 2020 12:37:28 +0000
Message-ID: <dd0815e7-2cae-afa9-0c54-240687c75c06@gmx.net>
Reply-To: vtol@gmx.net
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1584535037;
        bh=8t2QlEiVnfL3ePqUfnwp8bJUdI4s7v+ht0xtCUE/dJQ=;
        h=X-UI-Sender-Class:Reply-To:To:From:Subject:Date;
        b=eNJ/boTrXJgHHGpeAAdxgDPwkGya5v/1yIGRpPNYJTtrfPyuNSZ4FeHErmuuGhY15
         fQN5hje/IxToikkRRHsbxSFGjcUD9GtAY4lsFSgVXRauKpQg0O4TyIH5m+WFYg2YwZ
         YWrieeKDIbg/EgVyKKPSVHg8fAK4P/9ZgU5gXTf0=
Content-Language: en-GB
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

When exceeding the number of devices > 7 NFT prints:

Illegal instruction

This does not print the error:

flowtable ft =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 { ho=
ok ingress priority 0; devices =3D {
pppoe-wan, lan0, lan1, lan2, lan3, lan4, br-lan }; }
flowtable ft =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 { ho=
ok ingress priority 0; devices =3D {
pppoe-wan, lan0, lan1, lan2, lan3, lan4, br-guest }; }
flowtable ft =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 { ho=
ok ingress priority 0; devices =3D {
pppoe-wan, lan0, lan1, lan2, lan3, lan4, br-mgt }; }
flowtable ft =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 { ho=
ok ingress priority 0; devices =3D {
pppoe-wan, lan0, lan1, lan3, lan4, br-mgt, br-guest }; }
flowtable ft =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 { ho=
ok ingress priority 0; devices =3D {
pppoe-wan, lan0, lan1, lan3, br-mgt, br-guest, br-mgt }; }

But this prints the error:

flowtable ft =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 { ho=
ok ingress priority 0; devices =3D {
pppoe-wan, lan0, lan1, lan2, lan3, lan4, br-lan, br-mgt }; }
flowtable ft =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 { ho=
ok ingress priority 0; devices =3D {
pppoe-wan, lan0, lan1, lan2, lan3, lan4, br-guest, br-lan }; }
flowtable ft =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 { ho=
ok ingress priority 0; devices =3D {
pppoe-wan, lan0, lan1, lan2, lan3, lan4, br-mgt, br-guest }; }

