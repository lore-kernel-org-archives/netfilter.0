From: Sven Schuster <schuster.sven@gmx.de>
Subject: Re: IPSec Transport Mode
Date: Wed, 7 Jul 2004 23:11:22 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040707211122.GA15747@zion.homelinux.com>
References: <1089207305.788.14.camel@PCA-ARNSTR.ee-consultants.de> <200407071453.49223.Antony@Soft-Solutions.co.uk> <1089210110.788.27.camel@PCA-ARNSTR.ee-consultants.de> <200407072154.52923.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="G4iJoqBmSsgzjUCe"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200407072154.52923.Antony@Soft-Solutions.co.uk>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: NetFilter Mailling List <netfilter@lists.netfilter.org>


--G4iJoqBmSsgzjUCe
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


Hi Antony,

On Wed, Jul 07, 2004 at 09:54:52PM +0100, Antony Stone told us:
>=20
> ESP is for tunnel mode, and works fine through NAT.
>=20
> Transport mode uses AH (protocol 51), and that's the one which breaks thr=
ough=20
> NAT.

Isn't using AH or ESP independent from tunnel/transport mode?? AH
mode is just authentication, ESP is authentication + encryption. You
can use AH with tunnel mode and ESP with transport mode like you
wish I think.


Sven

--=20
Linux zion 2.6.7 #1 Thu Jun 17 10:44:26 CEST 2004 i686 athlon i386 GNU/Linux
 23:08:58  up 7 days,  6:52,  3 users,  load average: 0.06, 0.05, 0.00

--G4iJoqBmSsgzjUCe
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQFA7Gb6o4FAdB2PneQRAqqXAJ9Z43IaZU+Fh90R8gmiYs9AvAXD6wCdEXHt
wCFt4RUDY13ALfFtCvFEmgg=
=DZ7T
-----END PGP SIGNATURE-----

--G4iJoqBmSsgzjUCe--

