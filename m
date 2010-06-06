From: Robby Workman <rw@rlworkman.net>
Subject: Re: prevent iptables LOG target from flooding dmesg
Date: Sat, 5 Jun 2010 22:03:34 -0500
Message-ID: <20100605220334.24df75e5@liberty.rlwhome.lan>
References: <4C0AB6AD.104@asyr.hopto.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=PGP-SHA1;
 boundary="Sig_/fItKXwI/HMkQCnPwgMkoT9c"; protocol="application/pgp-signature"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C0AB6AD.104@asyr.hopto.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Thanasis <thanasis@asyr.hopto.org>
Cc: netfilter@vger.kernel.org

--Sig_/fItKXwI/HMkQCnPwgMkoT9c
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Sat, 05 Jun 2010 23:42:21 +0300
Thanasis <thanasis@asyr.hopto.org> wrote:

> ...
> and dmesg is flooded by DROP log messages etc.
> ...


  1) Do you really *care* about most of what you're logging?
 1a) If so, why?

  2) Install ulogd and use -j ULOG instead of -j LOG.

-RW

--Sig_/fItKXwI/HMkQCnPwgMkoT9c
Content-Type: application/pgp-signature; name=signature.asc
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkwLEAYACgkQvGy9tf6lsvvPLwCfdeSQfCWfBP+sWYvtaOZ4q03p
uUMAn2ur65m2GBrDxiEE19pE/Ho8AnZ/
=maEg
-----END PGP SIGNATURE-----

--Sig_/fItKXwI/HMkQCnPwgMkoT9c--
