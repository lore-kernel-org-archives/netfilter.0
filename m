From: Ray Leach <raymondl@knowledgefactory.co.za>
Subject: Re: Port Forwarding
Date: Wed, 03 Dec 2003 10:44:42 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1070441081.936.17.camel@raylinux.internal>
References: <3FCEC98A.8000703@mchsi.com>
	 <039a01c3b977$41188a80$6e69690a@RIMAS>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-U+Fe5iWXHtwno5l+Q2oY"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <039a01c3b977$41188a80$6e69690a@RIMAS>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Netfilter Mailing List <netfilter@lists.netfilter.org>


--=-U+Fe5iWXHtwno5l+Q2oY
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Wed, 2003-12-03 at 10:26, Remus wrote:
> Hi folks,
>=20
> I have a PREROUTING rule:
> iptables -t nat -A PREROUTING -d $EXTERNALIP_1 -s some_external_IP -p 47 =
-j
> DNAT --to 192.168.0.19
>=20
Just add more rules with different -s some_external_IP's

> How to add more source addresses which will be able to connect?
>=20
>=20
> Thanks in advance
>=20
> Remus
--=20
--
Raymond Leach <raymondl@knowledgefactory.co.za>
Network Support Specialist
http://www.knowledgefactory.co.za
"lynx -source http://www.rchq.co.za/raymondl.asc | gpg --import"
Key fingerprint =3D 7209 A695 9EE0 E971 A9AD  00EE 8757 EE47 F06F FB28
--

--=-U+Fe5iWXHtwno5l+Q2oY
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2-rc1-SuSE (GNU/Linux)

iD8DBQA/zaJ5h1fuR/Bv+ygRAsiCAJ4xIraFkHxCr+1vn6r+6FrtD4Vy5wCgksY1
ZrfkY4UkTwYl2V8CKz9lxdU=
=h+0Z
-----END PGP SIGNATURE-----

--=-U+Fe5iWXHtwno5l+Q2oY--


