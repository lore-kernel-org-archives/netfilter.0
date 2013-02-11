From: Eric Leblond <eric@regit.org>
Subject: Re: Is it safe to use libnetfilter_queue in these cases?
Date: Mon, 11 Feb 2013 07:33:14 +0100
Message-ID: <1360564394.5195.14.camel@ice-age.regit.org>
References: <CAJZVxRmmCeft+f-9wS4LbWzposct+3Ed5586E7opGa=xZKfyag@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
	boundary="=-vjRi0y4HPMJsdhsWgu+/"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAJZVxRmmCeft+f-9wS4LbWzposct+3Ed5586E7opGa=xZKfyag@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Aaron Lewis <the.warl0ck.1989@gmail.com>
Cc: netfilter mailing list <netfilter@vger.kernel.org>


--=-vjRi0y4HPMJsdhsWgu+/
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: quoted-printable

Hello,

Le lundi 11 f=E9vrier 2013 =E0 12:43 +0800, Aaron Lewis a =E9crit :
> Hi,
>=20
> When I process a packet with libnetfilter_queue, would it be safe to:
>=20
> 1) Consider a packet is always valid, for example,
>=20
> In the callback, you extract the payload to a "char *data", now you
> want the protocol id, so you check data[9],
>=20
> Is it safe if I don't check the package length first? (Would Iptables
> drop it manually?)

It is always good for security reason to check the length.

The following document contain useful information about
libnetfilter_queue:
https://home.regit.org/netfilter-en/using-nfqueue-and-libnetfilter_queue/

BR,
--
Eric Leblond


--=-vjRi0y4HPMJsdhsWgu+/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iD8DBQBRGJCqnxA7CdMWjzIRAhJhAJwJwDLdd0sxl/dJYlqLy7Fx4XSO3gCfT+Ob
WxOEIBACkvx/3YAPRM24Vjk=
=HJl5
-----END PGP SIGNATURE-----

--=-vjRi0y4HPMJsdhsWgu+/--

