From: Franck Joncourt <franck.joncourt@wanadoo.fr>
Subject: Re: limit extension problem
Date: Mon, 16 Jul 2007 20:11:56 +0200
Message-ID: <20070716181156.GA5264@toystory.lan>
References: <469BA216.6000802@unipex.it>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GvXjxJ+pjyke8COw"
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <469BA216.6000802@unipex.it>
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


--GvXjxJ+pjyke8COw
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 16, 2007 at 06:51:34PM +0200, Michele Petrazzo - Unipex srl wro=
te:
> Hi all,
> I'm on debian etch with the default kernel (iptables 1.3.6 and 2.6.18).
>
> I'm trying the limit extension, but the invert flag doesn't work like
> the man page say:
> """
> iptables -t filter -A FORWARD -m mark --mark 2 -p icmp --icmp-type 8 -m
> limit ! --limit 20/min -j ACCEPT
> iptables v.1.3.6: limit does not support invert
> """
> What I want it's to "limit" the log for icmp protocol to 20/minute
>

Is that what you are looking for :

iptables -A FORWARD -p icmp --icmp-type echo-request -m mark --mark 2 -j AC=
CEPT
iptables -A FORWARD -p icmp -m limit --limit 20/min -j LOG_ICMP

--=20
Franck Joncourt
http://www.debian.org - http://smhteam.info/wiki/
GPG server : pgpkeys.mit.edu
Fingerprint : C10E D1D0 EF70 0A2A CACF 9A3C C490 534E 75C0 89FE

--GvXjxJ+pjyke8COw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFGm7TsxJBTTnXAif4RAmGQAKCcixX71zIX/i3uBGANg/mfr/z/MQCgqRXL
Sze5MaUAENc63aRl15n8vZA=
=zhA9
-----END PGP SIGNATURE-----

--GvXjxJ+pjyke8COw--


