From: Eric Leblond <eric@inl.fr>
Subject: Re: OT - rule based system for a fire wall
Date: Mon, 18 Oct 2004 10:01:05 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1098086465.4212.7.camel@porky>
References: <Pine.LNX.4.56.0410151216210.2188@pali.cps.cmich.edu>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-FuAjny0CUwGt1MY5VarX"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.56.0410151216210.2188@pali.cps.cmich.edu>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
To: Ishwar Rattan <ishwar@pali.cps.cmich.edu>
Cc: netfilter@lists.netfilter.org


--=-FuAjny0CUwGt1MY5VarX
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Fri, 2004-10-15 at 18:16, Ishwar Rattan wrote:
> - Is there such a thing out there? if the propser won't
>   part with any more details, what kind of gusses can be
>   made?
>=20
>   1. Rule-system can interact with a user and then insert
>      rules in the firewall -- I think this has already been
>      accomplished??

Better things can be done. The NuFW system based on Netfilter allow you
to define policy based on user. You're even able to define policies such
as :

"John can connect to internet website if he uses Firefox on windows XP
SP2"

More informations at :
	http://www.nufw.org/
BR,
--=20
Eric Leblond
Nufw, Now User Filtering Works (http://www.nufw.org)

--=-FuAjny0CUwGt1MY5VarX
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQBBc3hBnxA7CdMWjzIRAmlEAKCPjaXnoJk/MBxJraDfI19ZqyHTKQCggErh
ZfBjulaRTUXNLR25YeBo23c=
=pki/
-----END PGP SIGNATURE-----

--=-FuAjny0CUwGt1MY5VarX--


