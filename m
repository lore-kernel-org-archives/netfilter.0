From: martin f krafft <madduck@madduck.net>
Subject: Re: ip6tables icmp conntracking on 2.6.18 vs 2.6.24
Date: Thu, 3 Apr 2008 10:18:22 +0200
Message-ID: <20080403081822.GA13254@piper.oerlikon.madduck.net>
References: <20080402212653.GC11325@piper.oerlikon.madduck.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Nq2Wo0NMKNjxTN9z"
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20080402212653.GC11325@piper.oerlikon.madduck.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter discussion list <netfilter@vger.kernel.org>


--Nq2Wo0NMKNjxTN9z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

also sprach martin f krafft <madduck@madduck.net> [2008.04.02.2326 +0200]:
>   -P INPUT DROP
>   -P FORWARD DROP
>   -P OUTPUT ACCEPT
>=20
>   -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
>   -A INPUT -j LOG --log-prefix "[INPUT6]: "

This seems to apply to all kinds of connections. If I make an
outgoing SSH connection, the SYN,ACK packet from the peer is
logged and dropped instead of accepted.

Is IPv6 connection tracking on 2.6.18 just broken?

--=20
martin | http://madduck.net/ | http://two.sentenc.es/
=20
"sailing is, after all, a kind of grace, a kind of magic."
                                                        -- phil berman
=20
spamtraps: madduck.bogus@madduck.net

--Nq2Wo0NMKNjxTN9z
Content-Type: application/pgp-signature; name="digital_signature_gpg.asc"
Content-Description: Digital signature (see http://martin-krafft.net/gpg/)
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFH9JLOIgvIgzMMSnURAiqqAKCQxSFKR3BQbutbxx2VQODoxTL4JACfWcsn
ZogsDIxaSvv6/8c+xXs3k3k=
=S0KY
-----END PGP SIGNATURE-----

--Nq2Wo0NMKNjxTN9z--
