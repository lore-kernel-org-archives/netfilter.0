From: martin f krafft <madduck@madduck.net>
Subject: ip6tables: --state INVALID matches echo-replies
Date: Wed, 2 Apr 2008 23:17:36 +0200
Message-ID: <20080402211736.GA10516@piper.oerlikon.madduck.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mP3DRpeJDSE+ciuQ"
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter discussion list <netfilter@vger.kernel.org>


--mP3DRpeJDSE+ciuQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Dear list,

I tried to find an answer to this on the web, but I couldn't. Thus
I am turning to you.

On an IPv6 host,

  -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
  -A INPUT -m state --state INVALID -j DROP
  -A INPUT -m state --state NEW -j in-new
  -A in-new -p icmpv6 -icmpv6-type echo-request -j ACCEPT

causes echo-reply to be dropped by the second rule. It works for
IPv4. Is this a bug, or am I doing something wrong?

Thanks,

--=20
martin | http://madduck.net/ | http://two.sentenc.es/
=20
"sometimes the urge to do bad is nearly overpowering"
                                                          -- ben horne
=20
spamtraps: madduck.bogus@madduck.net

--mP3DRpeJDSE+ciuQ
Content-Type: application/pgp-signature; name="digital_signature_gpg.asc"
Content-Description: Digital signature (see http://martin-krafft.net/gpg/)
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFH8/fwIgvIgzMMSnURAmhuAJwKJ/PNmrbpUxoqtXW0YnTIkMDbcACfX3N2
Bu3hvDMOb0T1uC/qPBUrr8o=
=VJj+
-----END PGP SIGNATURE-----

--mP3DRpeJDSE+ciuQ--
