From: Alexander Samad <alex@samad.com.au>
Subject: Re: limiting bandwidth with iptables or squid?
Date: Mon, 25 Oct 2004 10:15:42 +1000
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20041025001542.GN4247@samad.com.au>
References: <web-486910273@mail01.infosat.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="JVu9XMG6uEpKCPDY"
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <web-486910273@mail01.infosat.net>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
To: netfilter@lists.netfilter.org


--JVu9XMG6uEpKCPDY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

You could look at iproute2 the command tc

lets you do traffic shapping!

So you could mark up packets in iptables and then traffic shape based on
that

A

On Sun, Oct 24, 2004 at 04:20:25PM +0200, it clown wrote:
> Hi All,
>=20
> I would like to know how to limit bandwidth with iptables.I
> would like to limit bandwidth to ip's and mac address.Do i
> need another program to work with iptables or can iptables
> do it on its own?Does any one know where i can find
> something to read up on this?
>=20
> If iptables can not do it can i do it with squid?
>=20
> Regards
> _____________________________________________________________________
> For super low premiums ,click here http://www.dialdirect.co.za/quote
>=20
>=20

--JVu9XMG6uEpKCPDY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFBfEWukZz88chpJ2MRArniAKCqrqtIZzhM4IOTMw0eHHyAOrt3xgCfb5bL
FvvxJX2uyxpFdy1dLRLJlTY=
=cqcq
-----END PGP SIGNATURE-----

--JVu9XMG6uEpKCPDY--

