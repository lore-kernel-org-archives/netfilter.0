From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Analyzing DNAT traffic
Date: Sat, 5 Mar 2011 16:17:39 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1103051614060.6933@obet.zrqbmnf.qr>
References: <AANLkTimVukQe-ZFsYX_OuFdNV8-buwPHhFh5J768ugqs@mail.gmail.com> <314641299313152@web72.yandex.ru> <AANLkTimhvRGUd-_tb6C10UH8c-cqzcaQFb-OeamMgeuA@mail.gmail.com> <alpine.LNX.2.01.1103051538150.6933@obet.zrqbmnf.qr>
 <AANLkTikUyPPHcUv9XRPBmyUDX1SQO-SSvyS-d09VutGt@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTikUyPPHcUv9XRPBmyUDX1SQO-SSvyS-d09VutGt@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="utf-8"
To: Alex <mysqlstudent@gmail.com>
Cc: "Oleg A. Arkhangelsky" <sysoleg@yandex.ru>, netfilter@vger.kernel.org


On Saturday 2011-03-05 16:12, Alex wrote:
>
>Yes, thanks for that. It is matching some packets.
>[...]
>Mar  5 10:08:11 fc14 kernel: [2726633.762301] dnat invalid IN=3Deth1
>OUT=3Deth0 SRC=3D192.168.1.151 DST=3D69.171.224.11 LEN=3D52 TOS=3D0x00=
 PREC=3D0x00
>TTL=3D63 ID=3D19662 DF PROTO=3DTCP SPT=3D48270 DPT=3D80 WINDOW=3D54 RE=
S=3D0x00 ACK
>FIN URGP=3D0
>
>Mar  5 10:08:45 fc14 kernel: [2726667.362163] dnat invalid IN=3Deth1
>OUT=3Deth0 SRC=3D192.168.1.151 DST=3D69.63.181.56 LEN=3D52 TOS=3D0x00 =
PREC=3D0x00
>TTL=3D63 ID=3D19949 DF PROTO=3DTCP SPT=3D44230 DPT=3D80 WINDOW=3D98 RE=
S=3D0x00 ACK
>FIN URGP=3D0
>
>The last two are just regular requests for access to facebook from
>another PC on the internal network.

nfct discovered that visiting facebook is an invalid waste of time=C2=A0=
=E2=80=94
a conclusion I consent to=C2=A0=E2=80=94 and possibly implies to play a=
 game
instead, say, Minecraft. :-)
