From: Frederic de Villamil <neuro@seclab.jp>
Subject: Re: Error message change request (=?iso-8859-1?q?Sig=FE=F3r_Jar=F0arson?=)
Date: Fri, 19 Sep 2003 06:44:30 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030919064429.GB1015@catherine.seclab.jp>
References: <20030919042818.24451.68672.Mailman@netfilter-sponsored-by.noris.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="R3G7APHDIzY6R/pk"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20030919042818.24451.68672.Mailman@netfilter-sponsored-by.noris.net>
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


--R3G7APHDIzY6R/pk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi netfilter-request!

On Fri, 19 Sep 2003, netfilter-request@lists.netfilter.org wrote:

> Message: 2
> From: =3D?iso-8859-1?q?Sig=3DFE=3DF3r_Jar=3DF0arson?=3D <cshobe@somerando=
mdomain.com>
> To: netfilter@lists.netfilter.org
> Subject: Error message change request
> Date: Thu, 18 Sep 2003 20:56:03 -0400
>=20
> Hey all,
>=20
> I have a quick request - a change to an error message.
>=20
> A friend I sold a server to called me insistant that iptables was broken =
on=3D
> =3D20
> the firewall I sold him.
>=20
> He was trying the following, and got the following message:
>=20
> superuser root@hydrogen:/home/root
> # /bin/iptables -A INPUT -s 0.0.0.0/0 -d 0.0.0.0/0 --dport 22 -j ACCEPT
> iptables v1.2.7a: Unknown arg `--dport'
> Try `iptables -h' or 'iptables --help' for more information.
>=20
> I figured out that he missed -p tcp, but the error is misleading.
>=20
> I think it should instead say something like "iptables v1.2.7a: Argument=
=3D20
> `--dport' cannot be used in this context" or something.
>=20
> =3D2D-=3D20
> Sig=3DFE=3DF3r Jar=3DF0arson
> cshobe@somerandomdomain.com

Hi,
the answer is: .... 42.Just kidding

# /bin/iptables -A INPUT -p tcp --dport 22 -s 0/0 -d 0/0 -j ACCEPT
Best regards
Frederic

--=20
B.O.F.H excuse of the day: Domain controller not responding
http://www.seclab.jp

--R3G7APHDIzY6R/pk
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (NetBSD)

iD8DBQE/aqXNYBnsNILdO64RAk5LAKCCRa0ROBJjowCTJw3uHEw/ACYKLgCfRVSR
qULqctKoFzjPAebJhbgCpqY=
=aOH/
-----END PGP SIGNATURE-----

--R3G7APHDIzY6R/pk--

