From: Athan <netfilter@miggy.org>
Subject: Re: SNAT in OUTPUT chain of the nat table question?
Date: Thu, 9 Jan 2003 01:29:52 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030109012952.GI21359@miggy.org>
References: <20030109003721.GA26207@mit.edu>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kH8JNVvasRCCW1Oz"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20030109003721.GA26207@mit.edu>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: bauer@mit.edu
Cc: netfilter@lists.netfilter.org


--kH8JNVvasRCCW1Oz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 08, 2003 at 07:37:21PM -0500, bauer@mit.edu wrote:
> Is there a good reason that I am unable to conceive of at the=20
> moment why SNAT is not a valid target in the OUTPUT chain of the
> nat table?=20

  From 'man iptables':

   SNAT
       This  target  is  only  valid  in  the  nat  table, in the
       POSTROUTING chain.  It specifies that the  source  address

SNAT gets done just as packets go out, hence only in the POSTROUTING
chain as you only know where they're going by then.

-Ath
--=20
- Athanasius =3D Athanasius(at)miggy.org / http://www.miggy.org/
                  Finger athan(at)fysh.org for PGP key
	   "And it's me who is my enemy. Me who beats me up.
Me who makes the monsters. Me who strips my confidence." Paula Cole - ME

--kH8JNVvasRCCW1Oz
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iEYEARECAAYFAj4c0JAACgkQzbc+I5XfxKeGIgCdF8yLOJaz4k8m4GrghxnTBlyV
eZQAnitd1dMPGsrW7nQ/fCvJFXgmZ+tb
=YO7/
-----END PGP SIGNATURE-----

--kH8JNVvasRCCW1Oz--

