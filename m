From: Jeremy Sowden <jeremy@azazel.net>
Subject: Re: Error when using 'time' statement in nftables 1.0.2 rule
Date: Fri, 8 Apr 2022 09:14:38 +0100
Message-ID: <Yk/u7vMRmWxLxUd/@azazel.net>
References: <CANf9dFMQO4mHXFd88BHL5u9BWyp-v-Tu2L6x_oS1OdMp8UrhhA@mail.gmail.com>
 <Yk/tmuXkGYrfhDh+@azazel.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="GgIRPFXYHLVnA6+i"
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=azazel.net;
        s=20190108; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
        Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=OiEUeA+JsaeRGpJ8q6E96LWCeFWqft1Wu+lxE4O+mAk=; b=IgPNbCkNRU4dnpSu8EbpSHCshP
        UZYvo9jdcyss6TG3S7PS6mXYZpounvx/UTJJ+SN5VPkZsBxZ+alBr7xmotgYQ0tZvbDiUPcwLAI5V
        wnZfUh0AeI+Rv3KNtfEC8OS5C3EiZbq4PS23Bo6V4IFlbQlk2QesoMualVZPrzOMhfYkBvGFhRJMY
        hOZPjHGpalqOKYuQLzj7Po/1GS3b7QmqIQ59wVEuY9AjSWrhzx6xT1FNO71Iw15T7InP2SOVus2R4
        2sG0U/OzobZJsxjvUZ8hQd5Gppqnu7xizWJTmZUOQ53ZHFoRPlJKT7PiLrC90myOJb+5o3f2f2nP+
        Q7gYt0g 
Content-Disposition: inline
In-Reply-To: <Yk/tmuXkGYrfhDh+@azazel.net>
List-ID: <netfilter.vger.kernel.org>
To: Martin Gignac <martin.gignac@gmail.com>
Cc: netfilter@vger.kernel.org


--GgIRPFXYHLVnA6+i
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2022-04-08, at 09:08:59 +0100, Jeremy Sowden wrote:
> On 2022-04-07, at 22:19:30 -0400, Martin Gignac wrote:
> > On nftables 1.0.1, I can run this command just fine:
> >=20
> >     nft> add rule inet filter input iif lo time < "2022-07-01 11:00" ac=
cept
> >     nft>
> >=20
> > On 1.0.2, however, it gives me this error:
> >=20
> >     nft> add rule inet filter input iif lo time < "2022-07-01 11:00" ac=
cept
> >     Error: No symbol type information
> >     add rule inet filter input iif lo time < "2022-07-01 11:00" accept
> >                                     ^^^^
> > Have I encountered a bug, or has the usage of the 'time' statement
> > simply changed?
>=20
> It appears to be a bug.  I shall send a fix.

No need.  Somebody else has already committed one.

J.

--GgIRPFXYHLVnA6+i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEbB20U2PvQDe9VtUXKYasCr3xBA0FAmJP7u4ACgkQKYasCr3x
BA0KYA//aotKm8hw89WzRZGMxMiLHSWOUSb6EkjQCCWo2enQEaSUzUIVdlRWqQyA
l/NDZ+YV6TH4fPP5ZdwIoXtj8WtwLH6YZaq4xR0DSxUFzm7e0OA96SWEHAGDuzMo
oy1lw6OLJHX6/eD7EoszAUHwzCTZ/a+rR078Ie9R2ralUgyRi92ekbGOlMVo6SgR
1ldILfl6i6aFpbHXHB4pVZj70xLy0mVv5oy+7QZdQKrZELBu8ff6FFkV1bE/CgRf
KDONtQA06a35DFHvRRvH+FhGzBvoeU9MXoSyaV/U/4u/y4ht9yLGkWOQKs/02ypz
iLDGIa2Wr88qfznu4/WGde0L3+9f7szFqXJFxvFPa1lozCWb+t6QjBPBVoY8dmXx
VbK6ZXu1jsgW0Uh7ZR+mS3dCoryEB91Dk12fCmdsFCyUNbj+jSR80Dd793RDXXI1
KkOV0Qsza2iec4xq7Ixfqpci4weHl4fOmwwEKtmidbM6ycdifHchIqPE9oRrM5o9
6mjpavr4w2vB76R+1+zlLw0mCFbPybHX18qKW9mo7pPt/8OjfdvKpW5U8NXbHWue
Q2kRiTov2L+lU1xlU1ceeyN2dI0Vy6WbEV2SlP/dhlXoVFK6biYGzCKt3Vq+/kwn
zyTzI3Jxpqc3gSAewpOyI/Py2z1idpZEtU63ej9wdxI/6E5PcOY=
=5+2B
-----END PGP SIGNATURE-----

--GgIRPFXYHLVnA6+i--
