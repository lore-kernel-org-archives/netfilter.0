From: Eric Leblond <eric@inl.fr>
Subject: Re: Abot libipq
Date: Wed, 20 Oct 2004 13:34:36 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1098272076.8628.13.camel@porky>
References: <200410191856493.SM01604@FERRARI>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-jD/O3R1Fvgh+Vw3aFvJb"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200410191856493.SM01604@FERRARI>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
To: Danyel Leon Toledo <danyel@tesla.cujae.edu.cu>
Cc: netfilter@lists.netfilter.org


--=-jD/O3R1Fvgh+Vw3aFvJb
Content-Type: text/plain; charset=windows-1251
Content-Transfer-Encoding: quoted-printable

On Tue, 2004-10-19 at 18:56 -0400, Danyel Leon Toledo wrote:
> I need write one aplication for look into pakets I recive in my linux
> router. I found that libipq can help me. But, ?can any body tell me where=
 I
> find documentation about it? Really is hard to find it=85

NuFW (http://www.nufw.org) use libipq (but don't deal with payload
inspection as it only works on headers).
You can have a look at the source code in directory=20
	src/nufw/
for usage example.

BR,
--=20
Eric Leblond <eric@regit.org>
NuFW, Now User Filtering Works : http://www.nufw.org

--=-jD/O3R1Fvgh+Vw3aFvJb
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQBBdk1LnxA7CdMWjzIRAj/gAJ93Pdwt1fP3MKFPC5+miSQTtVX+zQCdEppn
mn1WNDUgvrpwcv3CzKiEeTc=
=fZ+q
-----END PGP SIGNATURE-----

--=-jD/O3R1Fvgh+Vw3aFvJb--


