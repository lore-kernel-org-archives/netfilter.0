From: Athanasius <Athanasius@miggy.org>
Subject: Re: Trying to setup two ethernet cards with two websites
Date: Thu, 2 Jan 2003 20:36:57 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030102203657.GD10404@miggy.org>
References: <se1459fa.075@butchers.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lMM8JwqTlfDpEaS6"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <se1459fa.075@butchers.com>
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


--lMM8JwqTlfDpEaS6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 02, 2003 at 03:25:21PM -0500, JUSTIN GERRY wrote:
> (For example, I will drop anything claiming to be from a Class A
> Private Network on either interface)
> iptables -A INPUT  -i $IF1 -s $CLASS_A -j DROP
> iptables -A INPUT  -i $IF2 -s $CLASS_A -j DROP
>=20
> can be written in one line as:
> iptables -A INPUT -s $CLASS_A -j DROP

  Yes, any field like -i or -s or -d when NOT specified defaults to
'any'.

-Ath
--=20
- Athanasius =3D Athanasius(at)miggy.org / http://www.miggy.org/
                  Finger athan(at)fysh.org for PGP key
	   "And it's me who is my enemy. Me who beats me up.
Me who makes the monsters. Me who strips my confidence." Paula Cole - ME

--lMM8JwqTlfDpEaS6
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iEUEARECAAYFAj4UoukACgkQzbc+I5XfxKcbjQCVFKub+LYVKDM2wtWO3Sxm+ZXh
7wCdE2CCUvYN2PpklzN3ZI1GkUOrgV0=
=yCaB
-----END PGP SIGNATURE-----

--lMM8JwqTlfDpEaS6--

