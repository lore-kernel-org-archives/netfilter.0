From: Athan <netfilter@miggy.org>
Subject: Re: firewall bother
Date: Sat, 22 Feb 2003 20:46:27 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030222204627.GC16712@miggy.org>
References: <20030222202147.196de8dc.fommil@yahoo.ie>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="m51xatjYGsM+13rf"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20030222202147.196de8dc.fommil@yahoo.ie>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Sam Halliday <fommil@yahoo.ie>
Cc: netfilter@lists.netfilter.org


--m51xatjYGsM+13rf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 22, 2003 at 08:21:47PM +0000, Sam Halliday wrote:
> hi there,
>=20
> i am having trouble viewing one particular website under my current
> firewall setup... (www.talk21.com)

   My first thought would be this is an ECN problem.  Indeed, without
changes I get connection refused as well.  With this rule it works:

iptables -t mangle -A POSTROUTING -o ${PUBINT} -p tcp -d 62.172.192.30 --ma=
tch ecn --ecn-ip-ect 0 -j ECN --ecn-tcp-remove

Be aware that current released kernels don't have this working.  You'll
need a patch:

	http://www.netfilter.org/documentation/pomlist/pom-submitted.html#07_ECN-t=
cpchecksum-littleendian-fix

HTH,

-Ath
--=20
- Athanasius =3D Athanasius(at)miggy.org / http://www.miggy.org/
                  Finger athan(at)fysh.org for PGP key
	   "And it's me who is my enemy. Me who beats me up.
Me who makes the monsters. Me who strips my confidence." Paula Cole - ME

--m51xatjYGsM+13rf
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iEYEARECAAYFAj5X4aMACgkQzbc+I5XfxKeTNACgnxTrAdEhlQtLyWIbJYS7b4z6
AqUAoJzx1F/pmh3ZxPM6wXF1dUG9oFF1
=RZHM
-----END PGP SIGNATURE-----

--m51xatjYGsM+13rf--

