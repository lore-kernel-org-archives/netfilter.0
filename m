From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Why is this traffic dropped?
Date: Wed, 18 Jun 2008 20:37:27 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0806182036500.14231@fbirervta.pbzchgretzou.qr>
References: <200806181711.m5IHBbkX023710@doug.ats.sensis.com> <48594DE4.9070006@freemail.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <48594DE4.9070006@freemail.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="utf-8"
To: =?UTF-8?Q?G=C3=A1sp=C3=A1r_Lajos?= <swifty@freemail.hu>
Cc: drabe@sensis.com, netfilter@vger.kernel.org


On Wednesday 2008-06-18 20:03, G=C3=A1sp=C3=A1r Lajos wrote:

> Douglas Rabe =C3=ADrta:
>> Greetings,
>>
>> I dont understand why this traffic is dropped?
>>
>> Jun 18 17:03:39 iahabs1 kernel: IN_DROP: IN=3Deth0 OUT=3D
>> MAC=3D00:1c:23:ca:ec:1d:00:1b:53:87:68:c0:08:00 SRC=3D10.192.130.104
>> DST=3D192.168.51.1 LEN=3D40 TOS=3D0x00 PREC=3D0x00 TTL=3D119 ID=3D55=
63 DF PROTO=3DTCP
>> SPT=3D35557 DPT=3D80 WINDOW=3D65149 RES=3D0x00 ACK FIN URGP=3D0=20
>
> Because it is a FIN packet... =3D  ! (NEW,RELATED or ESTABLISHED) but
> INVALID !!!

Seriously, FIN packets should not be dropped, otherwise a connection
is lurking around until it times out.

