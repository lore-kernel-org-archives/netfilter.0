From: Eric Leblond <eric@inl.fr>
Subject: Re: gnutella
Date: Thu, 21 Oct 2004 16:33:27 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1098369207.24579.5.camel@porky>
References: <f9a42cb404102107232273e04@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-eKxUMceahMLR56TMNNRm"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <f9a42cb404102107232273e04@mail.gmail.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
To: Michel Bellemare <michel.bellemare@gmail.com>
Cc: Netfilter Group <netfilter@lists.netfilter.org>


--=-eKxUMceahMLR56TMNNRm
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

You can do this for local traffic by using the owner module and :
	--cmd-owner
For a whole network I see any solutions but slightly modify the NuFW
system to be able to mark packet with an uid corresponding to the
application (same way it can mark with userid).

On Thu, 2004-10-21 at 10:23 -0400, Michel Bellemare wrote:
> is there any way to log all the traffic that uses the gnutella protocol?
> i searched in the mailing list and google and found nothing.
>=20
> I looked to at a tcpdump capture and it never uses the same port...
>=20
> basically i want to control the number of bytes that goes out using
> this protocol.
>=20
> thank you very much!
>=20
--=20
Eric Leblond <eric@regit.org>
NuFW, Now User Filtering Works : http://www.nufw.org

--=-eKxUMceahMLR56TMNNRm
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQBBd8i2nxA7CdMWjzIRAnGtAJ9iv772C/vHkMQ8RDQ3+fNfU79CPQCfZLz6
HRVbvN7zf5U6wj0V++Nj1HI=
=KqL4
-----END PGP SIGNATURE-----

--=-eKxUMceahMLR56TMNNRm--


