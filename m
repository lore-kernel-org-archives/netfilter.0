From: "Michael P. Soulier" <michael_soulier@mitel.com>
Subject: Re: Guaranteeing bandwidth through netfilter-based router?
Date: Fri, 07 Jan 2005 11:26:30 -0500
Message-ID: <1105115190.7645.14.camel@latte.nssg.mitel.com>
References: <132A17DB-6023-11D9-BC93-000A95CFE5AA@latencyzero.com>
	<20050106222649.GA26877@acentral.co.uk>
	<1105064717.7100.78.camel@localhost>
	<200501070848.09790.gdh@acentral.co.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-IDcNDF6ioJfZbAxf5ql9"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200501070848.09790.gdh@acentral.co.uk>
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


--=-IDcNDF6ioJfZbAxf5ql9
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Fri, 2005-01-07 at 08:48 +0000, Gavin Hamill wrote:
> Interesting stuff - I didn't know the kernel itself would prioritise pack=
ets=20
> simply by having these bits set, I thought they only existed so that some=
=20
> upstream router / ISP could manage them.

Well, they're technically the same mechanism. The default queue on all
interfaces is a prio queue that respects TOS. prio does not guarantee
bandwidth however, as the original poster asked for. To do that in an
adaptive way, I recommend changing the default queues to HTB queues. See
the aforementioned advanced routing howto.=20

Mike

--=20
Michael P. Soulier <michael_soulier@mitel.com>, 613-592-2122 x2522
6000/6010/60* Development, Mitel Corporation
"...the word HACK is used as a verb to indicate a massive amount of
nerd-like effort." -Harley Hahn, A Student's Guide to Unix


--=-IDcNDF6ioJfZbAxf5ql9
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQBB3rg2KGqCc1vIvggRAmzNAKCVzUilpFaVWM6YLiDFx+fnE609dwCfRVoh
QuB0D1CICj+rNWbD5Ei8sP0=
=oCef
-----END PGP SIGNATURE-----

--=-IDcNDF6ioJfZbAxf5ql9--


