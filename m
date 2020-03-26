From: =?UTF-8?B?0b3SieG2rOG4s+KEoA==?= <vtol@gmx.net>
Subject: Re: [nftables 0.9.2 | flow table] dynamic (soft) NETDEV
Date: Thu, 26 Mar 2020 12:09:20 +0000
Message-ID: <af7c651a-1f45-205b-d503-365452955443@gmx.net>
References: <574afe87-ced9-8c5b-9dd4-4619e85f9774@gmx.net>
Reply-To: vtol@gmx.net
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1585224572;
        bh=zMTwbP+iPsJp16SqkRnVPV2a1bes5lWfyM9j0aka11c=;
        h=X-UI-Sender-Class:Reply-To:Subject:From:To:References:Date:
         In-Reply-To;
        b=BY1E/xKLahCB9UVaMxWgoWHZbjjiKTb9rtNyX8fMg4EIDCgdVb7MhtzqUkZa5xfw0
         fnq+QFquhv/cSqSGZqZ2Ti5fnPQO+pjquUWwUst1q/cOKAEt02o8elcTfCfzUPBBcm
         7uc9gaHx1TK1z17eCp0+JTRCYGGKUxSsr/F+XWGE=
In-Reply-To: <574afe87-ced9-8c5b-9dd4-4619e85f9774@gmx.net>
Content-Language: en-GB
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On 21/03/2020 09:53, =D1=BD=D2=89=E1=B6=AC=E1=B8=B3=E2=84=A0 wrote:
> With some (soft) NETDEV being available only after NFT been invoked at
> boot time, e.g. bridge or pppoe, NFT would fail to load at boot time
> if such NETDEV being stipulated, e.g.
>
> flowtable f { hook ingress priority 0; devices =3D { pppoe-wan, lan0,
> lan1, lan2, lan3, lan4, br-lan }; }
>
> Is there a syntax that would allow to add/alter such dynamic dev to an
> initial stanza, e.g.
>
> flowtable f { hook ingress priority 0; devices =3D { lan0, lan1, lan2,
> lan3, lan4 }; }
>
> and then adding pppoe-* and/or br-* to it? Or is there any other good
> practice, e.g. are dynamic sets are working with flowtable device =3D?

Other NETDEV that may not be available at the NFT start during boot
time, or that are dynamically enabled/disabled, are WLan and VPN (tap,
tun, wg). Whilst this can be worked around with hotplug scripts it does
not help with altering the > devices =3D {=C2=A0 } < portion in a dynamic =
fashion.

The replace command does not seem suitable as it requires the query for
the rule handle.

Thus the question whether dynamic sets are suitable/working for the >
devices =3D {=C2=A0 } < portion?
