From: "Alexander W. Janssen" <yalla@ynfonatic.de>
Subject: Re: another conntrack table query
Date: Fri, 31 Jan 2003 06:08:48 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030131060848.A2680@ynfonatic.de>
References: <20030131113014.GW11221@miggy.org> <Pine.LNX.4.43.0301312001390.13580-100000@avishkaar.lan.deeproot.co.in>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9jxsPFA5p3P2qPhR"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.43.0301312001390.13580-100000@avishkaar.lan.deeproot.co.in>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Nimit Gupta <nimit@deeproot.co.in>
Cc: netfilter@lists.netfilter.org


--9jxsPFA5p3P2qPhR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 31, 2003 at 08:05:26PM +0530, Nimit Gupta wrote:
> hello,
> 	one more thing on what basis the time for UNREPLIED entries gets
> reset? is there a link where such things are explained in detail?

You might want to read [1]. They get kicked out as soon as the conntrack-ta=
ble
becomes full.=20

HTH, Alex.

[1] http://www.netfilter.org/documentation/FAQ/netfilter-faq-3.html#ss3.16
=20

--=20
"Mr Data, when I said 'Fire at Will', I didn't mean for you to be so litera=
l."
Instructions for use of this post: Insert tounge in cheek. Read as normal.

--9jxsPFA5p3P2qPhR
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: Weitere Infos: siehe http://www.gnupg.org

iEYEARECAAYFAj46BN8ACgkQEMMZKORQoYJd3QCdFwZtazCyPPX6LZRGkq/ygFIn
H/MAoJhHEtjKmE9zRznhDjEX5HkiwS31
=HuZ3
-----END PGP SIGNATURE-----

--9jxsPFA5p3P2qPhR--

