From: Ray Leach <raymondl@knowledgefactory.co.za>
Subject: Re: squid
Date: 30 Apr 2003 08:30:03 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1051684203.1690.94.camel@raylinux.internal>
References: <ABEKJILKOKKGGDJKHKDFOENCCAAA.patrick@vikus.com>
	 <17731623692.20030429233024@o2.pl>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-wpyzKfTy0kJ+zvDHUEju"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <17731623692.20030429233024@o2.pl>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: netfilter EMAIL <netfilter@lists.netfilter.org>


--=-wpyzKfTy0kJ+zvDHUEju
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Tue, 2003-04-29 at 23:30, netfilter_user wrote:
> Hello Patrick,
>=20
> Tuesday, April 29, 2003, 6:49:41 PM, you wrote:
>=20
> PA> I know this is a bit off topic, but at first I thought it was a netfi=
lter
> PA> problem, now I'm convinced it's squid. I redirect my internal traffic
> PA> through a squid proxy... the problem I'm running into is that I can't=
 seem
> PA> to get any windows updates to work for my machines using the proxy. W=
hen it
> PA> begins to detect upgrades needed, it will just sit on 0%. Anyone else=
 had
> PA> this problem? If so, how'd you fix it?
>=20
> PA> -=3DPaTriCK
>=20
>=20
>=20
> well.. it might not help u, but all http traffic im my network  coming
> across squid and i got no problem with update windows nodes.
>=20
Ya, me too. We have approx. 50 Win2k/WinXP machines and they have no
issues. We run squid in transparent mode with delay pools, squidguard,
and very restrictive iptables filters.

> Show me ur squid config, maybe i can help

--=-wpyzKfTy0kJ+zvDHUEju
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQA+r21rh1fuR/Bv+ygRAqrTAKCL1LzTx3+Es6czaFg3Eo6n9LRBSgCgpIyz
qJqnG1mBDoEDsD3q78bGBmo=
=Bb0B
-----END PGP SIGNATURE-----

--=-wpyzKfTy0kJ+zvDHUEju--


