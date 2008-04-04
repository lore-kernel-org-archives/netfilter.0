From: martin f krafft <madduck@madduck.net>
Subject: Re: RFC 4890 (icmpv6 firewall recommendations) and ip6tables (was:
	ip6tables icmp conntracking on 2.6.18 vs 2.6.24)
Date: Fri, 4 Apr 2008 13:15:50 +0200
Message-ID: <20080404111550.GA1950@piper.oerlikon.madduck.net>
References: <20080402212653.GC11325@piper.oerlikon.madduck.net> <20080403081822.GA13254@piper.oerlikon.madduck.net> <47F4A36A.2010600@plouf.fr.eu.org> <20080403102632.GA22035@piper.oerlikon.madduck.net> <47F4F2B0.9020205@plouf.fr.eu.org> <873aq3ymr1.fsf@petole.dyndns.org> <20080403153847.GA17170@piper.oerlikon.madduck.net> <Pine.LNX.4.64.0804031747120.18275@blackhole.kfki.hu> <20080404073230.GA22259@piper.oerlikon.madduck.net> <Pine.LNX.4.64.0804041039280.20943@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="SLDf9lqlvOQaIe6s"
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.64.0804041039280.20943@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org


--SLDf9lqlvOQaIe6s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

also sprach Jozsef Kadlecsik <kadlec@blackhole.kfki.hu> [2008.04.04.1112 +0=
200]:
> Let me put this way: a new sample script which is cleaned up and takes th=
e=20
> current kernel features into account would be highly useful for the=20
> netfilter user community. Everyone entering the realm of IPv6 faces the=
=20
> same filtering problems and a lot of headache, hair-pulling could be save=
d=20
> by providing proper recipes.

With all your help and, it's quite conceivable that I will end up
providing this. Possibly not a script, since I just like
iptables-save format, but an annotated ruleset.

But I probably want to migrate my 2.6.18 hosts to 2.6.24 first so
that I can extensively test.

Feel free to ping me in a few weeks if I haven't written in with the
aforementioned annotated example ruleset.

--=20
martin | http://madduck.net/ | http://two.sentenc.es/
=20
in africa some of the native tribes have a custom of beating the
ground with clubs and uttering spine chilling cries. anthropologists
call this a form of primitive self-expression. in america they call
it golf.
=20
spamtraps: madduck.bogus@madduck.net

--SLDf9lqlvOQaIe6s
Content-Type: application/pgp-signature; name="digital_signature_gpg.asc"
Content-Description: Digital signature (see http://martin-krafft.net/gpg/)
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFH9g3mIgvIgzMMSnURAgylAKCTuEwr9vpON6p2VrMmzRE8Ty9S8ACgzK0S
Kvk7c2Klql7D2ohsf7iBrZw=
=XiA3
-----END PGP SIGNATURE-----

--SLDf9lqlvOQaIe6s--
