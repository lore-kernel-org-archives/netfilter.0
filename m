From: Harald Welte <laforge@netfilter.org>
Subject: Re: cannot compile extensions/libipt_ECN.c
Date: Sun, 15 Feb 2004 16:56:33 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040215155633.GO15567@sunbeam.de.gnumonks.org>
References: <!~!UENERkVCMDkAAQACAAAAAAAAAAAAAAAAABgAAAAAAAAAPCp1YAf+Yku8TNzXRFUK5MKAAAAQAAAApakBm76La0OUjD2MrlZa8QEAAAAA@digital-vitamins.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+gHRqQ1BTyNna/y8"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <!~!UENERkVCMDkAAQACAAAAAAAAAAAAAAAAABgAAAAAAAAAPCp1YAf+Yku8TNzXRFUK5MKAAAAQAAAApakBm76La0OUjD2MrlZa8QEAAAAA@digital-vitamins.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Stefan Bosnjakovic <sb@digital-vitamins.com>
Cc: netfilter@lists.netfilter.org


--+gHRqQ1BTyNna/y8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 09, 2004 at 06:13:28PM +0100, Stefan Bosnjakovic wrote:
> Hi list,
>=20
> when I try to compile the user-land applications of iptables 1.2.6a,
> it stops at extensions/libipt_ECN.c with the following message:

please use a more recent version of iptables.

1.2.6a contained an old incompatible version of the ECN target.

> Cheers, Stefan !

--=20
- Harald Welte <laforge@netfilter.org>             http://www.netfilter.org/
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
  "Fragmentation is like classful addressing -- an interesting early
   architectural error that shows how much experimentation was going
   on while IP was being designed."                    -- Paul Vixie

--+gHRqQ1BTyNna/y8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAL5axXaXGVTD0i/8RAsTcAJ4nf3zugcK90tb2iZPEHbJH/Dd3dwCfV6LD
OX4PEpoQUXAEIkfs6QSiGXk=
=JvKc
-----END PGP SIGNATURE-----

--+gHRqQ1BTyNna/y8--

