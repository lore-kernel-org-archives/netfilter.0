From: Harald Welte <laforge@netfilter.org>
Subject: Re: [netfilter-core] How many bits are reserved for the counters?
Date: Sat, 27 Aug 2005 13:09:16 +0200
Message-ID: <20050827110916.GC4407@rama.de.gnumonks.org>
References: <4310180E.7050500@opengate.be>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="raC6veAxrt5nqIoY"
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <4310180E.7050500@opengate.be>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
To: Glenn Matthys <glenn@opengate.be>
Cc: coreteam@netfilter.org, netfilter@lists.netfilter.org


--raC6veAxrt5nqIoY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 27, 2005 at 09:36:46AM +0200, Glenn Matthys wrote:
> Hello,
>=20
> I am using IPtables for traffic accounting right now, and my question is,=
 how many bits are=20
> reserved for the counters? If they are 32 bits, they'll probably overflow=
 and return to 0=20
> after 4294967296 bytes, 4096 megabytes that is. Is there any way of overc=
oming this?

it's 64bit packet and byte counters, so I seriously doubt you would
overflow them anytime soon ;)

--=20
- Harald Welte <laforge@netfilter.org>                 http://netfilter.org/
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
  "Fragmentation is like classful addressing -- an interesting early
   architectural error that shows how much experimentation was going
   on while IP was being designed."                    -- Paul Vixie

--raC6veAxrt5nqIoY
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQFDEEnbXaXGVTD0i/8RAn30AJwPfU6hNHkze4Iii5UanwoUxuCWEgCgpekO
ciCWMpgLyI43hOUMEI/ms4w=
=Rk9i
-----END PGP SIGNATURE-----

--raC6veAxrt5nqIoY--

