From: Eric Leblond <eric@regit.org>
Subject: Re: Iptables as auth ?
Date: 17 Jul 2003 13:59:18 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1058443158.30327.8.camel@tech004.alphalink.fr>
References: <200307151738.53777.rio@martin.mu>
	 <20030715135821.GA24604@cannon.eng.us.uu.net>
	 <200307171447.26226.rio@martin.mu>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-/6PMtlAEdt2eGXbvwL1M"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200307171447.26226.rio@martin.mu>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: netfilter@lists.netfilter.org


--=-/6PMtlAEdt2eGXbvwL1M
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Thu, 2003-07-17 at 09:47, Rio Martin. wrote:

> INTERNET ----> Linux NAT Gateway + RADIUS ----> PC Client 1, 2, 3.. 100
>=20
> Users in PC Client 1 .. 100 must authenticate with RADIUS before its traf=
fic=20
> goes to Internet. I dont know how its going to work, but what i have in m=
y=20
> mind for now is RADIUS must cooperate with somekind of daemon that should=
=20
> execute iptables to perform NAT to client IP.

I'm actually working on such a solution, project is for the moment named
gnufw. Some information can be found at http://www.gnufw.org

I planned to release the first version around the beginning of september
(sooner if possible).

For the moment we've got a generic framework and a communication
protocol :
	A daemon that send queued packet to an external server doing auth.

Work is now done on the auth server.

Any contributers are welcome.

BR,
--=20
Eric Leblond <eric@regit.org>
Regit.org

--=-/6PMtlAEdt2eGXbvwL1M
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQA/Fo+WnxA7CdMWjzIRAg8NAJ9P/Xeo1UnwpSemdml16mfoTABoLQCfUMN0
BXMZ74KjxDOx0B3OJYyV2UU=
=aRyj
-----END PGP SIGNATURE-----

--=-/6PMtlAEdt2eGXbvwL1M--


