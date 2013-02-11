From: Eric Leblond <eric@regit.org>
Subject: Re: Modifying data of a multiple packet connection with
 libnetfilter_queue
Date: Mon, 11 Feb 2013 07:42:26 +0100
Message-ID: <1360564946.5195.22.camel@ice-age.regit.org>
References: <CAJZVxR=SroDrZJvQbiC-KJQLxhc68JOcf5242D9nKpPYyTtvHw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
	boundary="=-IFE1r2lI2diVXIj15R6D"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAJZVxR=SroDrZJvQbiC-KJQLxhc68JOcf5242D9nKpPYyTtvHw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Aaron Lewis <the.warl0ck.1989@gmail.com>
Cc: netfilter mailing list <netfilter@vger.kernel.org>


--=-IFE1r2lI2diVXIj15R6D
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: quoted-printable

Hi,
Le lundi 11 f=E9vrier 2013 =E0 12:47 +0800, Aaron Lewis a =E9crit :
> Hi,
>=20
> Protocols like HTTP are segmented, so I must rebuild the whole
> incoming packet prior to modify it.
>=20
> But with libnetfilter_queue, you receive one packet at time, and you
> just either ACCEPT or do other actions.
>=20
> Do you think there's a way to let libnetfiter_queue buffer the packet
> before sending to userland program?
> So that in the callback I will see the whole packet.

You don't have to verdict one packet at a time. See again
https://home.regit.org/netfilter-en/using-nfqueue-and-libnetfilter_queue/ f=
or explanation.

> Any ideas? Or other alternatives is welcomed!

For HTTP, you will only be able to buffer and modify the packets in a
TCP window. So you will have HTTP messages that won't be handled by this
system. A working solution could be to use a (trasnparent maybe) proxy
to get the whole request.

Maybe you can use TPROXY mechanism if you want a good transparency.

BR,
--
Eric Leblond


--=-IFE1r2lI2diVXIj15R6D
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iD8DBQBRGJLSnxA7CdMWjzIRAkWFAJsFDM90jNt+USJS3TGV4FJUmOb/qQCePMFz
802hN42dlUjPk5xTZ3p6td8=
=cbYT
-----END PGP SIGNATURE-----

--=-IFE1r2lI2diVXIj15R6D--

