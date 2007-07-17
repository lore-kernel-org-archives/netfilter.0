From: Franck Joncourt <franck.joncourt@wanadoo.fr>
Subject: Re: limit extension problem
Date: Tue, 17 Jul 2007 20:25:37 +0200
Message-ID: <20070717182537.GE5264@toystory.lan>
References: <469BA216.6000802@unipex.it> <20070716181156.GA5264@toystory.lan>
	<469BBC34.10306@unipex.it>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="idY8LE8SD6/8DnRI"
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <469BBC34.10306@unipex.it>
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
To: netfilter@lists.netfilter.org


--idY8LE8SD6/8DnRI
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 16, 2007 at 08:43:00PM +0200, Michele Petrazzo - Unipex srl wro=
te:

> I want to log only 20 ping forwarded on a minute.=20
>
> iptables -A FORWARD -p icmp -m limit --limit 20/min -j LOG_ICMP
> iptables -A FORWARD -p icmp --icmp-type echo-request -m mark --mark 2 -j=
=20
> ACCEPT

iptables -A FORWARD -p icmp --icmp-type echo-request \
		-m limit --limit 20/min -j LOG_ICMP

In your first email, I thought you wanted to accept all echo-request
without logging, but log other icmp types.

What you wrote will log all icmp types, and not only echo-request.

Why are you playing with _mark_ in your rules ?

--=20
Franck Joncourt
http://www.debian.org - http://smhteam.info/wiki/
GPG server : pgpkeys.mit.edu
Fingerprint : C10E D1D0 EF70 0A2A CACF 9A3C C490 534E 75C0 89FE

--idY8LE8SD6/8DnRI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFGnQmhxJBTTnXAif4RAmQAAKC3lPdrewsFXDSXNXU6HBEzZxvplwCfYtC1
bZjC0ZirjgQtwnURyjE3YFQ=
=Abi4
-----END PGP SIGNATURE-----

--idY8LE8SD6/8DnRI--


