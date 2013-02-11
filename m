From: Eric Leblond <eric@regit.org>
Subject: Re: Multithreading with libnetfilter_queue?
Date: Mon, 11 Feb 2013 07:37:22 +0100
Message-ID: <1360564642.5195.17.camel@ice-age.regit.org>
References: <CAJZVxRm0ivU2O429rEYOKhB14F2d3mqZ11yYS90s5Hj47Xv2=Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
	boundary="=-LWnadyF6vBS4avwbaK6t"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAJZVxRm0ivU2O429rEYOKhB14F2d3mqZ11yYS90s5Hj47Xv2=Q@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Aaron Lewis <the.warl0ck.1989@gmail.com>
Cc: netfilter mailing list <netfilter@vger.kernel.org>


--=-LWnadyF6vBS4avwbaK6t
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: quoted-printable

Hi,

Le lundi 11 f=E9vrier 2013 =E0 12:48 +0800, Aaron Lewis a =E9crit :
> Hi,
>=20
> Looks like libnetfilter_queue is single threaded, am I wrong?

Please have a look to FAQ section of
https://home.regit.org/netfilter-en/using-nfqueue-and-libnetfilter_queue/


Locking read and write operation is known to enough to be "trhead-safe".
It may even not mandatory (need to be tested though).

BR,
--
Eric Leblond

--=-LWnadyF6vBS4avwbaK6t
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iD8DBQBRGJGinxA7CdMWjzIRAhX4AJ4zg3IFO3szP/AmPoa18TZTtWN2YQCeJmUR
AEL8IIgdgoCtQ5WgIV0e20Y=
=WJTa
-----END PGP SIGNATURE-----

--=-LWnadyF6vBS4avwbaK6t--

