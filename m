From: Athan <netfilter@miggy.org>
Subject: Re: Newbie - Where is my kernel? Can't run POM
Date: Wed, 8 Jan 2003 18:18:10 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030108181810.GD21359@miggy.org>
References: <002301c2b73e$e0f36ca0$3f00a8c0@tharryman>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FFoLq8A0u+X9iRU8"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <002301c2b73e$e0f36ca0$3f00a8c0@tharryman>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Timothy Harryman <timothy@woodlandscenics.com>
Cc: netfilter@lists.netfilter.org


--FFoLq8A0u+X9iRU8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 08, 2003 at 11:53:38AM -0600, Timothy Harryman wrote:
> It certainly is not in /usr/src/linux (nautilus & terminal show that
> /usr/src is empty - yes, I am showing all hidden/system files), nor
> anywhere else I have looked.
>=20
> I have a default installation of RH 8.0, and through rhupdate, it has
> updated the kernel to 2.4.18-19.8.0
>=20
> I am trying to install patch-o-matic 20030107, and the script prompts me
> for the KERNEL_DIR.

  RH is almost certainly using seperate runtime and source packages for
the kernel.  Looking at http://www.rpmfind.net/ I see things like:

	kernel-2.4.20-2.6.i686.rpm
	kernel-2.4.20-2.6.src.rpm

The first being the compiled kernel and modules, the latter the source
for it.  So go find kernel-2.4.18-19.8.0.src.rpm, or even better upgrade
packages to a 2.4.20 kernel the current latest stable release.

HTH,

-Ath
--=20
- Athanasius =3D Athanasius(at)miggy.org / http://www.miggy.org/
                  Finger athan(at)fysh.org for PGP key
	   "And it's me who is my enemy. Me who beats me up.
Me who makes the monsters. Me who strips my confidence." Paula Cole - ME

--FFoLq8A0u+X9iRU8
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iEYEARECAAYFAj4ca2IACgkQzbc+I5XfxKe6ogCgolSfwZ98IXf4q08smspsJKbF
RXMAoJgMd+o8dTA+SrtT4V24qvqaskMF
=rOEx
-----END PGP SIGNATURE-----

--FFoLq8A0u+X9iRU8--

