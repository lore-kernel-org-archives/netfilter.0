From: Tom Eastep <teastep@shorewall.net>
Subject: Re: NOTRACK not working as expected
Date: Mon, 27 Nov 2006 13:51:10 -0800
Message-ID: <456B5DCE.20602@shorewall.net>
References: <DE0BDC6DCC1F724882C0828AD2D3E684093116@usplm203.amer.corp.eds.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enig9E929AFF7CBBF413C2B13A68"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <DE0BDC6DCC1F724882C0828AD2D3E684093116@usplm203.amer.corp.eds.com>
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
To: "Wilson, Richard E" <richard.wilson@eds.com>
Cc: netfilter@lists.netfilter.org

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig9E929AFF7CBBF413C2B13A68
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Wilson, Richard E wrote:

>=20
> I added the following rule to prevent the ip_conntrack table from
> tracking localhost connections:
>=20
> iptables -t raw -A PREROUTING -i lo -j NOTRACK
>=20

=2E..

> Is there a better way to create a rule to not track localhost connectio=
ns?
>=20

iptables -t raw -A OUTPUT -o lo -j NOTRACK

-Tom
--=20
Tom Eastep    \ Nothing is foolproof to a sufficiently talented fool
Shoreline,     \ http://shorewall.net
Washington USA  \ teastep@shorewall.net
PGP Public Key   \ https://lists.shorewall.net/teastep.pgp.key


--------------enig9E929AFF7CBBF413C2B13A68
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.3 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFFa13TO/MAbZfjDLIRApMSAKDI+HvA5Rzacmfxd8WZbzjeZlfvpQCfXGLX
/jMBtRzi9AnvL0otSXsMx1k=
=nCvq
-----END PGP SIGNATURE-----

--------------enig9E929AFF7CBBF413C2B13A68--

