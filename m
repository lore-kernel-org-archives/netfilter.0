From: martin f krafft <madduck@madduck.net>
Subject: Re: ip6tables icmp conntracking on 2.6.18 vs 2.6.24
Date: Fri, 4 Apr 2008 13:04:28 +0200
Message-ID: <20080404110428.GA32555@piper.oerlikon.madduck.net>
References: <20080402212653.GC11325@piper.oerlikon.madduck.net> <20080403081822.GA13254@piper.oerlikon.madduck.net> <47F4A36A.2010600@plouf.fr.eu.org> <20080403102632.GA22035@piper.oerlikon.madduck.net> <47F4F2B0.9020205@plouf.fr.eu.org> <873aq3ymr1.fsf@petole.dyndns.org> <20080403153847.GA17170@piper.oerlikon.madduck.net> <87y77vx7kn.fsf@petole.dyndns.org> <20080404085100.GB27854@piper.oerlikon.madduck.net> <87lk3uq9p3.fsf@petole.dyndns.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0F1p//8PRICkK4MW"
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <87lk3uq9p3.fsf@petole.dyndns.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Nicolas KOWALSKI <niko@petole.dyndns.org>
Cc: netfilter@vger.kernel.org


--0F1p//8PRICkK4MW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

also sprach Nicolas KOWALSKI <niko@petole.dyndns.org> [2008.04.04.1057 +020=
0]:
> -A INPUT -s ::/0 -d ::/0 -m state --state RELATED,ESTABLISHED -j ACCEPT
> -A INPUT -s ::/0 -d ff01::/32 -j ACCEPT
> -A INPUT -s ::/0 -d ff02::/32 -j ACCEPT
> -A INPUT -s ::/0 -d ::/0 -m state --state INVALID -j LOG
> -A INPUT -s ::/0 -d ::/0 -m state --state INVALID -j DROP

Why do you treat multicast special before INVALID?

> -A INPUT -s fe80::/64 -d ::/0 -j ACCEPT

So local clients should be able to access everything on the machine?
Why treat them special?

> -A INPUT -s 2001:6f8:3f1::/48 -d ::/0 -i eth0 -j ACCEPT

Source-authenticated rules *can* be exploited.

> -A INPUT -s ::/0 -d ::/0 -p ipv6-icmp -j ACCEPT
> -A INPUT -s ::/0 -d ::/0 -p tcp -m tcp --dport 22 -j ACCEPT

You probably want --syn in there too.

> -A FORWARD -s ::/0 -d ::/0 -m state --state RELATED,ESTABLISHED -j ACCEPT
> -A FORWARD -s 2001:6f8:3f1::/48 -d ::/0 -i eth0 -j ACCEPT

You might want to use -o on those too.

--=20
martin | http://madduck.net/ | http://two.sentenc.es/
=20
"the 'volatile' keyword
 is implemented syntactically
 but not semantically"
                          -- documentation of m$ visual c, around 1992
=20
spamtraps: madduck.bogus@madduck.net

--0F1p//8PRICkK4MW
Content-Type: application/pgp-signature; name="digital_signature_gpg.asc"
Content-Description: Digital signature (see http://martin-krafft.net/gpg/)
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFH9gs8IgvIgzMMSnURAlr5AKCYs5zQ4VRuC/Z2lbMtbNJx8Y6PSACgr99G
GB+3vX1SMuDcGMg1n1scxnM=
=JGES
-----END PGP SIGNATURE-----

--0F1p//8PRICkK4MW--
