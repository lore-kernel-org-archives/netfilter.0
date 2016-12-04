From: "Brian J. Murrell" <brian@interlinx.bc.ca>
Subject: Re: DNAT working for one host but not another
Date: Sun, 04 Dec 2016 14:06:37 -0500
Message-ID: <1480878397.19944.31.camel@interlinx.bc.ca>
References: <1480878101.19944.29.camel@interlinx.bc.ca>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-+2e56uRfU3+7Hkr9eusE"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1480878101.19944.29.camel@interlinx.bc.ca>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org


--=-+2e56uRfU3+7Hkr9eusE
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2016-12-04 at 14:01 -0500, Brian J. Murrell wrote:
> I have a DNAT rule on a host who's purpose is to redirect traffic
> that
> is destined for port 23768 to port 5060 on that host:

I should add, that what is going back to the 10.75.23.212 host is also
wrong:

14:04:53.723018 IP 10.75.23.212.6060 > 10.75.22.8.23768: UDP, length 0
14:04:53.877539 IP 10.75.22.8.5060 > 10.75.23.212.6060: SIP, length: 555
14:04:53.910351 IP 10.75.23.212.6060 > 10.75.22.8.23768: UDP, length 472
14:04:53.912158 IP 10.75.22.8.5060 > 10.75.23.212.6060: SIP, length: 555

As you can see, what is being returned is not having it's port un-
natted back to 23768.  But that is perhaps unsurprising given that the
connection never gets to ASSURED.

Cheers,
b.

--=-+2e56uRfU3+7Hkr9eusE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAABCAAGBQJYRGk9AAoJENrB0DQWy8igJHEH/33vNrQ2wJW1g8WE5tto3jpQ
8vQGljQsHGXlBfrUp0y5FliHzKKTUhZ2RUqSQOQlVqR9SIJLVta/plN7iIMfa5nr
jyuYAaStUG5JBoNuiuuTqfDZotvczVe5dDxxtzmO+lSrBXVGsm4xESkcRsognI9g
E6nFNL1hhPA3lme85A5Z/K3tRRFvvkoFp3lQezaNCqfIMrezrXoF+QGc6nQymv6O
3OiXtooR+Crhbe6sxKOp80EZ+0GEvV742MVWVUrh9vZxXNv68PJDeEWX+ZJpNbI8
W0tgdrSSxxMvLIiItIDmWlzYx7U5juLYDkVp7sHIjHGsSUoyy9H+2ZZH8jLh/oo=
=IBCf
-----END PGP SIGNATURE-----

--=-+2e56uRfU3+7Hkr9eusE--


