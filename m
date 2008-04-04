From: martin f krafft <madduck@madduck.net>
Subject: Re: ip6tables icmp conntracking on 2.6.18 vs 2.6.24
Date: Fri, 4 Apr 2008 08:22:29 +0200
Message-ID: <20080404062229.GC12613@piper.oerlikon.madduck.net>
References: <47F4A36A.2010600@plouf.fr.eu.org> <87r6dn1dqs.fsf@petole.dyndns.org> <20080402212653.GC11325@piper.oerlikon.madduck.net> <20080403081822.GA13254@piper.oerlikon.madduck.net> <47F4A36A.2010600@plouf.fr.eu.org> <20080403102632.GA22035@piper.oerlikon.madduck.net> <47F4F2B0.9020205@plouf.fr.eu.org> <873aq3ymr1.fsf@petole.dyndns.org> <20080403153847.GA17170@piper.oerlikon.madduck.net> <Pine.LNX.4.64.0804031747120.18275@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="c3bfwLpm8qysLVxt"
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.64.0804031747120.18275@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org


--c3bfwLpm8qysLVxt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

also sprach Jozsef Kadlecsik <kadlec@blackhole.kfki.hu> [2008.04.03.1814 +0=
200]:
> ICMPv6 non-error types (i.e. above type 128) - the exception of=20
> echo-request (128) and node information query (139)  - are not tracked=20
> yet, thus such packets are marked as INVALID.

Ah, I am glad there is such a straight-forward answer.

Do you have a roadmap for this sort of stuff? Can we expect more
IPv6 support for netfilter in 2.6.25?

> In order to handle ICMPv6 in the best way I'd suggest to read
> rfc4890 titled Recommendations for Filtering ICMPv6 Messages in
> Firewalls, which even comes with a sample ip6tables script.

Perfect. Thanks a lot!

--=20
martin | http://madduck.net/ | http://two.sentenc.es/
=20
"all i know is that i'm being sued for unfair business=20
 practices by micro$oft. hello pot? it's kettle on line two."
                                                  -- michael robertson
=20
spamtraps: madduck.bogus@madduck.net

--c3bfwLpm8qysLVxt
Content-Type: application/pgp-signature; name="digital_signature_gpg.asc"
Content-Description: Digital signature (see http://martin-krafft.net/gpg/)
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFH9cklIgvIgzMMSnURAsDvAKDO3D8pprc21JVn2WKL2q0StaA1UQCgz2zR
nywDH5Zwi+A6wywaYPe8X74=
=KZk2
-----END PGP SIGNATURE-----

--c3bfwLpm8qysLVxt--
