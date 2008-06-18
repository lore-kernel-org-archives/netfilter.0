From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: Why is this traffic dropped?
Date: Wed, 18 Jun 2008 22:21:16 +0200 (CEST)
Message-ID: <Pine.LNX.4.64.0806182217030.11333@blackhole.kfki.hu>
References: <200806181711.m5IHBbkX023710@doug.ats.sensis.com>
 <48594DE4.9070006@freemail.hu> <alpine.LNX.1.10.0806182036500.14231@fbirervta.pbzchgretzou.qr>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="110391808-1488658705-1213820476=:11333"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.1.10.0806182036500.14231@fbirervta.pbzchgretzou.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Jan Engelhardt <jengelh@medozas.de>
Cc: =?UTF-8?Q?G=C3=A1sp=C3=A1r_Lajos?= <swifty@freemail.hu>, drabe@sensis.com, netfilter@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--110391808-1488658705-1213820476=:11333
Content-Type: TEXT/PLAIN; charset=ISO-8859-2
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 18 Jun 2008, Jan Engelhardt wrote:

> On Wednesday 2008-06-18 20:03, G=E1sp=E1r Lajos wrote:
>=20
> > Douglas Rabe =EDrta:
> >>
> >> I dont understand why this traffic is dropped?
> >>
> >> Jun 18 17:03:39 iahabs1 kernel: IN_DROP: IN=3Deth0 OUT=3D
> >> MAC=3D00:1c:23:ca:ec:1d:00:1b:53:87:68:c0:08:00 SRC=3D10.192.130.104
> >> DST=3D192.168.51.1 LEN=3D40 TOS=3D0x00 PREC=3D0x00 TTL=3D119 ID=3D5563=
 DF PROTO=3DTCP
> >> SPT=3D35557 DPT=3D80 WINDOW=3D65149 RES=3D0x00 ACK FIN URGP=3D0=20
> >
> > Because it is a FIN packet... =3D  ! (NEW,RELATED or ESTABLISHED) but
> > INVALID !!!
>=20
> Seriously, FIN packets should not be dropped, otherwise a connection
> is lurking around until it times out.

Absolutely true. FIN packets which are OK according to conntrack are=20
marked as ESTABLISHED (or RELATED).

Without knowing the kernel version, one can only assume that it's the last=
=20
packet of the stream which arrived too late: conntrack already deleted the=
=20
the corresponding conntrack entry and therefore it could be categorized as=
=20
INVALID only.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
--110391808-1488658705-1213820476=:11333--
