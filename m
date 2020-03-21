From: =?UTF-8?B?0b3SieG2rOG4s+KEoA==?= <vtol@gmx.net>
Subject: [nftables 0.9.2 | flow table] dynamic (soft) NETDEV
Date: Sat, 21 Mar 2020 09:53:15 +0000
Message-ID: <574afe87-ced9-8c5b-9dd4-4619e85f9774@gmx.net>
Reply-To: vtol@gmx.net
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1584784405;
        bh=JX6B+LW4fC2TzYUiepJwHzZOiyeXVxyXl29ivHvvq3s=;
        h=X-UI-Sender-Class:Reply-To:To:From:Subject:Date;
        b=Z6Uzb9GsOLdNK9MygDK8RFWmwlFKuzUamOt4d8kU2VNU85UH+J2ibNe41A7JapRLb
         VYy5c+juvRmIlvOhsctRUosADOq9imW3di+UzIJiSWVWlu70Z4xLidP5HbDLcmCCJV
         qm7zZ0uHtY3+tUisTJwESG+lHARS7xZVrFvdwtnw=
Content-Language: en-GB
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

With some (soft) NETDEV being available only after NFT been invoked at
boot time, e.g. bridge or pppoe, NFT would fail to load at boot time if
such NETDEV being stipulated, e.g.

flowtable f { hook ingress priority 0; devices =3D { pppoe-wan, lan0,
lan1, lan2, lan3, lan4, br-lan }; }

Is there a syntax that would allow to add/alter such dynamic dev to an
initial stanza, e.g.

flowtable f { hook ingress priority 0; devices =3D { lan0, lan1, lan2,
lan3, lan4 }; }

and then adding pppoe-* and/or br-* to it? Or is there any other good
practice, e.g. are dynamic sets are working with flowtable device =3D?
