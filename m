From: Athan <netfilter@miggy.org>
Subject: Re: ECN target does not behave as expected
Date: Tue, 7 Jan 2003 22:02:37 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030107220237.GO16581@miggy.org>
References: <004101c2b62a$37489320$a268c451@Marius> <Pine.LNX.4.44.0301071122270.2806-100000@grignard.amagerkollegiet.dk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0UhZIN3Sa23/ILEd"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44.0301071122270.2806-100000@grignard.amagerkollegiet.dk>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: netfilter@lists.netfilter.org


--0UhZIN3Sa23/ILEd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 07, 2003 at 11:23:49AM +0100, Rasmus B?g Hansen wrote:
> Apparently you need the patch below - at least that works for me:

  For what it's worth I've sent this patch to Marcelo Tosatti
<marcelo@conectiva.com.br>, the guy who maintains and releases the
current 2.4.x kernels.  Someone may have done so already but I wanted to
be sure the fix makes it into mainstream ;).

-Ath
--=20
- Athanasius =3D Athanasius(at)miggy.org / http://www.miggy.org/
                  Finger athan(at)fysh.org for PGP key
	   "And it's me who is my enemy. Me who beats me up.
Me who makes the monsters. Me who strips my confidence." Paula Cole - ME

--0UhZIN3Sa23/ILEd
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iEYEARECAAYFAj4bTn0ACgkQzbc+I5XfxKelUQCeJEsKweLEYbWiCOcAYNOuEePS
ui0An2pyKO/E90IOm4wZC5UD8cB2a49H
=OHRl
-----END PGP SIGNATURE-----

--0UhZIN3Sa23/ILEd--

