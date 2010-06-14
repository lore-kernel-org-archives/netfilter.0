From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Force traffic
Date: Mon, 14 Jun 2010 22:15:21 +0200 (CEST)
Message-ID: <alpine.LSU.2.01.1006142215020.31348@obet.zrqbmnf.qr>
References: <4C1513F3.5010508@abpni.co.uk> <4C162BEE.5010807@uncu.edu.ar> <AANLkTikmYEJeQVI5icjMK0FuFT8rWNvazsELSxqzi93i@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTikmYEJeQVI5icjMK0FuFT8rWNvazsELSxqzi93i@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="utf-8"
To: Narendra Choyal <narendrachoyal@gmail.com>
Cc: Federico Alberto Sayd <fsayd@uncu.edu.ar>, netfilter@vger.kernel.org

On Monday 2010-06-14 21:51, Narendra Choyal wrote:

>What type of virtualization you are using --
> =E2=80=A2 Para virtualization
> =E2=80=A2 Fully virtualization
>
>Different virtualization differs for your answer.
>
>Sol 1.
>=3D=3D=3D=3D
>You have to apply NATting that will route all routes to a specific
>interface(or ip of interface)

NAT does not route traffic, it rewrites it.

>Sol 2.
>=3D=3D=3D=3D
>Use "route" command

Use "ip route" only.

