From: martin f krafft <madduck@madduck.net>
Subject: Re: ip6tables icmp conntracking on 2.6.18 vs 2.6.24
Date: Thu, 3 Apr 2008 12:26:32 +0200
Message-ID: <20080403102632.GA22035@piper.oerlikon.madduck.net>
References: <20080402212653.GC11325@piper.oerlikon.madduck.net> <20080403081822.GA13254@piper.oerlikon.madduck.net> <47F4A36A.2010600@plouf.fr.eu.org> <87r6dn1dqs.fsf@petole.dyndns.org> <20080402212653.GC11325@piper.oerlikon.madduck.net> <20080403081822.GA13254@piper.oerlikon.madduck.net> <47F4A36A.2010600@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="huq684BweRXVnRxX"
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <87r6dn1dqs.fsf@petole.dyndns.org> <47F4A36A.2010600@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter discussion list <netfilter@vger.kernel.org>


--huq684BweRXVnRxX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

also sprach Pascal Hambourg <pascal.mail@plouf.fr.eu.org> [2008.04.03.1129 =
+0200]:
> Are you using a 2.6.18 kernel image from Debian etch or a custom one ?

Debian's.

> IPv6 conntrack requires the (now not so) new nf_conntrack, but in kernel =
=20
> versions older than 2.6.20 nf_conntrack did not support IPv4 NAT yet. =20
> Only the old ip_conntrack, the IPv4-only conntrack, did. So IPv6 =20
> conntrack and IPv4 NAT were mutually exclusive. AFAIK 2.6.18 kernel =20
> images from Debian etch are built with ip_conntrack in order to support =
=20
> IPv4 NAT, and do not support IPv6 conntrack.

Excellent explanation, thanks. I can confirm that nf_* modules are
not present in Debian's 2.6.18, but they are with 2.6.24.



also sprach Nicolas KOWALSKI <niko@petole.dyndns.org> [2008.04.03.1136 +020=
0]:
> I noticed the same behaviour on Etch + kernel 2.6.22 (from
> backports.org): ICMPv6 echo replies are matched by INVALID.

See http://marc.info/?l=3Dnetfilter&m=3D120717177831833&w=3D2
And this is still the case with 2.6.24.

--=20
martin | http://madduck.net/ | http://two.sentenc.es/
=20
"whale feces or working at microsoft? i would probably be the whale
 feces researcher. salt air and whale flatulence; what
 could go wrong?"
             -- michael moyer, executive editor of _popular science_
=20
spamtraps: madduck.bogus@madduck.net

--huq684BweRXVnRxX
Content-Type: application/pgp-signature; name="digital_signature_gpg.asc"
Content-Description: Digital signature (see http://martin-krafft.net/gpg/)
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFH9LDYIgvIgzMMSnURAisLAKDNDxz7b4Jc5WbjkN/jR/v+s+tN6QCgwfBZ
A6gVQyvx9z4ctrmHa8YHsgw=
=/j+Q
-----END PGP SIGNATURE-----

--huq684BweRXVnRxX--
