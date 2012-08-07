From: Eric Leblond <eric@regit.org>
Subject: Re: conntrack output - question
Date: Tue, 07 Aug 2012 11:47:44 +0200
Message-ID: <1344332864.17702.6.camel@tiger.regit.org>
References: <CAAJpzgba1eL73KxNZWLU7DxJsrZitdb2WkUOe=An_J-Q677+sg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
	boundary="=-gmfpNwDOQGKZE57wWc8v"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAAJpzgba1eL73KxNZWLU7DxJsrZitdb2WkUOe=An_J-Q677+sg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Gomathivinayagam Muthuvinayagam <sankarmail@gmail.com>
Cc: netfilter@vger.kernel.org


--=-gmfpNwDOQGKZE57wWc8v
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le lundi 06 ao=C3=BBt 2012 =C3=A0 22:38 -0700, Gomathivinayagam Muthuvinaya=
gam a
=C3=A9crit :
> Conntrack classifies a packet to a flow based on protocol no, srcip,
> destip, srcport, and destport.
>=20
> A sample output is shown below,
>=20
> [NEW] udp      17 30 src=3D192.168.2.100 dst=3D192.168.2.1 sport=3D57767
> dport=3D53 [UNREPLIED] src=3D192.168.2.1 dst=3D192.168.2.100 sport=3D53
> dport=3D57767
>=20
> Here, what's the need of reply srcip, reply destip, reply srcport,
> reply destport? (Since we can imply these information from original
> srcp ip, original destip, original srcport, original destport)
> Is it just for avoiding for confusion, or anyother reasons behind this?

Think about NAT.

BR,
--=20
Eric Leblond=20
Blog: http://home.regit.org/ - Portfolio: http://regit.500px.com/

--=-gmfpNwDOQGKZE57wWc8v
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEABECAAYFAlAg5EAACgkQnxA7CdMWjzJGCACdEzSFOSlUmxBJH9p5HXi+wG8E
mysAn05FQNS+73J43IbMtbH867Mji3w9
=hRji
-----END PGP SIGNATURE-----

--=-gmfpNwDOQGKZE57wWc8v--

