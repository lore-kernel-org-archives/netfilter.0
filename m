From: "Alexander W. Janssen" <yalla@ynfonatic.de>
Subject: Re: How to block all ports except port 21,22,80,8080 ???
Date: Tue, 18 Feb 2003 20:40:14 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030218194014.GB23914@ynfonatic.de>
References: <1045555939.94722.jacob_chan@so-net.net.tw> <1045558628.1967.29.camel@kermit.spenneberg.de> <1045560648.1913.39.camel@kermit.spenneberg.de> <3E5207B9.7C2BEDFA@patrick.at> <20030218160348.GA23914@ynfonatic.de> <20030218121919.GA11554@omega.lacnic.net.uy>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="TakKZr9L6Hm6aLOc"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20030218121919.GA11554@omega.lacnic.net.uy>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Pablo Allietti <pablo@lacnic.net>
Cc: netfilter@lists.netfilter.org


--TakKZr9L6Hm6aLOc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 18, 2003 at 03:19:19PM +0300, Pablo Allietti wrote:
>  iptables -A INPUT -i lo -j ACCEPT
>=20
> Another Question when i put this line in iptables -L say
>=20
> Chain INPUT (policy DROP)
> target     prot opt source               destination
> ACCEPT     all  --  anywhere             anywhere
>=20
> whit this i do open all ports for any connection of outside?????

No it won't. Try "iptables -vnL" instead, it will show you that the rule is
limited to traffic coming from the lo-interface.
=20
Alex.

--=20
"Mr Data, when I said 'Fire at Will', I didn't mean for you to be so litera=
l."
Instructions for use of this post: Insert tounge in cheek. Read as normal.

--TakKZr9L6Hm6aLOc
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: Weitere Infos: siehe http://www.gnupg.org

iEYEARECAAYFAj5SjB4ACgkQEMMZKORQoYJPSgCfaefZ2cf9tmtShMXDRFhymazc
X5cAn2e5c7FMePot6J9dhLU0ugeom+6i
=FPOj
-----END PGP SIGNATURE-----

--TakKZr9L6Hm6aLOc--

