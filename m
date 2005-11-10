From: Adam Rosi-Kessel <adam@rosi-kessel.org>
Subject: Re: Why would certain packets not reach nat PREROUTING chain?
Date: Wed, 09 Nov 2005 20:59:37 -0500
Message-ID: <4372A989.5090606@rosi-kessel.org>
References: <4372A919.8020100@rosi-kessel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enig5284B7381D22255AB2B3C6BC"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4372A919.8020100@rosi-kessel.org>
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
To: netfilter@lists.netfilter.org

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig5284B7381D22255AB2B3C6BC
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Adam Rosi-Kessel wrote:
> I'm troubleshooting an issue of accessing a VPN through NAT. Right now =
the
> problem can be reduced to the following question:
> Under what conditions would inbound packets not be routing through the =
nat
> PREROUTING chain?

I should add that, just for debugging purposes, the default policy for al=
l
chains is set to ACCEPT. There are also no DROP rules anywhere in any tab=
le
(again, just for debugging).
--=20
Adam Rosi-Kessel
http://adam.rosi-kessel.org


--------------enig5284B7381D22255AB2B3C6BC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (MingW32)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFDcqmJdTf3ZklQ6qYRAn0HAJ44KlayaNzwb3577mTORNLAv04GrQCfUDFX
6UloiPWg5zfD4eURolgZkh8=
=Kz+n
-----END PGP SIGNATURE-----

--------------enig5284B7381D22255AB2B3C6BC--

