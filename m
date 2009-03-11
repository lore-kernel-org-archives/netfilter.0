From: martin f krafft <madduck@madduck.net>
Subject: Re: RFC 4890 (icmpv6 firewall recommendations) and ip6tables (was:
	ip6tables icmp conntracking on 2.6.18 vs 2.6.24)
Date: Wed, 11 Mar 2009 13:44:05 +0100
Message-ID: <20090311124405.GA5688@piper.oerlikon.madduck.net>
References: <20080403081822.GA13254@piper.oerlikon.madduck.net> <47F4A36A.2010600@plouf.fr.eu.org> <20080403102632.GA22035@piper.oerlikon.madduck.net> <47F4F2B0.9020205@plouf.fr.eu.org> <873aq3ymr1.fsf@petole.dyndns.org> <20080403153847.GA17170@piper.oerlikon.madduck.net> <Pine.LNX.4.64.0804031747120.18275@blackhole.kfki.hu> <20080404073230.GA22259@piper.oerlikon.madduck.net> <Pine.LNX.4.64.0804041039280.20943@blackhole.kfki.hu> <20080404111550.GA1950@piper.oerlikon.madduck.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xHFwDpU9dbj6ez1V"
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20080404111550.GA1950@piper.oerlikon.madduck.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org


--xHFwDpU9dbj6ez1V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

also sprach martin f krafft <madduck@madduck.net> [2008.04.04.1315 +0200]:
> With all your help and, it's quite conceivable that I will end up
> providing this. Possibly not a script, since I just like
> iptables-save format, but an annotated ruleset.

So this is long overdue, and it's not a script, but it's an IPv6
guideline, based on Debian but probably applicable to all other
distros: http://ipv6.debian.net

--=20
martin | http://madduck.net/ | http://two.sentenc.es/
=20
only by counting could humans demonstrate
their independence of computers.
            -- douglas adams, "the hitchhiker's guide to the galaxy"
=20
spamtraps: madduck.bogus@madduck.net

--xHFwDpU9dbj6ez1V
Content-Type: application/pgp-signature; name="digital_signature_gpg.asc"
Content-Description: Digital signature (see http://martin-krafft.net/gpg/)
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkm3shEACgkQIgvIgzMMSnXoTQCfeYM96ktmTKAq+lT5GH0Qu8Bb
w5EAn31Ascnh6gekthDzk3hhPB15DQk7
=ZExx
-----END PGP SIGNATURE-----

--xHFwDpU9dbj6ez1V--
