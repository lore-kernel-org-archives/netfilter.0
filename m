From: Athanasius <netfilter@miggy.org>
Subject: Re: ECN mangling
Date: Fri, 27 Dec 2002 11:34:22 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021227113422.GE1878@miggy.org>
References: <20021227073624.GA1878@miggy.org> <20021227091659.GB1878@miggy.org> <3E0C361A.6040603@istitutocolli.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Lb0e7rgc7IsuDeGj"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <3E0C361A.6040603@istitutocolli.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Netfilter Users <netfilter@lists.netfilter.org>


--Lb0e7rgc7IsuDeGj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 27, 2002 at 12:14:34PM +0100, Andrea Rossato wrote:
> there's a bug in that code: in the netfilter-devel mailing list a patch=
=20
> was posted:
>=20
> >      90                 diffs[0] =3D diffs[0] ^ 0xFFFF;
> >      91                 diffs[1] =3D *tcpflags;
>=20
> that does the job.
> andrea

  Thanks, that works, although I can't find any mention of it in the
netfilter-devel archive.  I trust a patch is being pushed to
Linus/whoever to get this fixed in mainstream kernels?

-Ath
--=20
- Athanasius =3D Athanasius(at)miggy.org / http://www.miggy.org/
                  Finger athan(at)fysh.org for PGP key
	   "And it's me who is my enemy. Me who beats me up.
Me who makes the monsters. Me who strips my confidence." Paula Cole - ME

--Lb0e7rgc7IsuDeGj
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iEYEARECAAYFAj4MOr4ACgkQzbc+I5XfxKctUgCfZUc4z+y5XEbl2Sng9+e+jWd7
dygAn1TgTb4wvsHZuyZhiVkoWEC3Tif1
=+1db
-----END PGP SIGNATURE-----

--Lb0e7rgc7IsuDeGj--

