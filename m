From: Harald Welte <laforge@gnumonks.org>
Subject: Re: netfilter HOWTO out of date?
Date: Wed, 8 Oct 2003 11:01:06 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031008090106.GH25743@sunbeam.de.gnumonks.org>
References: <1065518354.3047.3.camel@turtle>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="aYDVKSzuImP48n7V"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1065518354.3047.3.camel@turtle>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Andrew Beresford <a.j.beresford@sheffield.ac.uk>
Cc: netfilter@lists.samba.org


--aYDVKSzuImP48n7V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 07, 2003 at 10:19:15AM +0100, Andrew Beresford wrote:
> Hi all,
>=20
> In an act of desperation I tried placing a DNAT rule in the OUTPUT chain
> to redirect some locally generated traffic to a different machine even
> though down at the bottom of
> http://www.netfilter.org/documentation/HOWTO/NAT-HOWTO-6.html it says
> this isn't possible yet.

There is now CONFIG_IP_NF_NAT_LOCAL to allow DNAT in output.

> Cheers,
> Andrew

Any volunteers for updating the documentation are welcome.

I'm now off to bugzilla-bug-bashing, and I'm happy to find some time to
do real development rather than updating docs if there's any time left.
*sigh*.

--=20
- Harald Welte <laforge@gnumonks.org>               http://www.gnumonks.org/
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
Programming is like sex: One mistake and you have to support it your lifeti=
me

--aYDVKSzuImP48n7V
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQE/g9JSXaXGVTD0i/8RAgAYAJsHBx6UxOtKS4Hudxn6FZBJmtKLrgCfZKiM
omyxlKcJ68aIIl9k8zNUOrE=
=FnPP
-----END PGP SIGNATURE-----

--aYDVKSzuImP48n7V--

