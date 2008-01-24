From: Eric Leblond <eric@inl.fr>
Subject: Re: Port redirection not working
Date: Thu, 24 Jan 2008 16:32:45 +0100
Message-ID: <1201188765.25760.40.camel@khasse.inl.fr>
References: <200801241243.43277.me@gustavonarea.net>
	 <1201182594.25760.17.camel@khasse.inl.fr>
	 <200801241604.41073.me@gustavonarea.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-NkfanqmI6nVbOfH4V7/O"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <200801241604.41073.me@gustavonarea.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Gustavo Narea <me@gustavonarea.net>
Cc: netfilter@vger.kernel.org


--=-NkfanqmI6nVbOfH4V7/O
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

Le jeudi 24 janvier 2008 =C3=A0 16:04 +0100, Gustavo Narea a =C3=A9crit :
> Hello, Eric.
>=20
> On Thursday 24 January 2008 14:49:54 Eric Leblond wrote:
> > > I'm using this line in the attached file:
> > > -A PREROUTING -p tcp -m tcp --dport 80 -j REDIRECT --to-ports 8080
> >
> > Miss "-t nat" in the line, you need to specify the table to use.
>=20
> I've changed that line as you suggested, but now I get this error when ru=
nning=20
> `iptables-restore < /etc/iptables.config':

Hmm sorry, I miss the iptables-restore way to add the rules.

iptables-restore format is not done to be hand edited (although this is
possible).

In fact, best thing to do is to :
      * restore a working file
      * add the NAT rules : iptables -t nat A PREROUTING -p tcp -m tcp
        --dport 80 -j REDIRECT --to-ports 8080
      * iptables-save>/etc/iptables.config

Your error was to add the REDIRECT rules in the filter table.
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> iptables-restore v1.3.6: Line 7 seems to have a -t table option.
>=20
> Error occurred at line: 7
> Try `iptables-restore -h' or 'iptables-restore --help' for more informati=
on.
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> It now reads:
> -A PREROUTING -t nat -p tcp -m tcp --dport 80 -j REDIRECT --to-ports 8080
>=20
> Thanks!

--=-NkfanqmI6nVbOfH4V7/O
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Ceci est une partie de message
	=?ISO-8859-1?Q?num=E9riquement?= =?ISO-8859-1?Q?_sign=E9e?=

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQBHmK+dnxA7CdMWjzIRAnuVAJwMSvbuG4nb2Eg1/7JjaqfkhBqlUQCdEC78
9BM/WwOkSMwEMzJ+Y9Zt8tk=
=a0LQ
-----END PGP SIGNATURE-----

--=-NkfanqmI6nVbOfH4V7/O--

