From: martin f krafft <madduck@madduck.net>
Subject: Re: ip6tables icmp conntracking on 2.6.18 vs 2.6.24
Date: Thu, 3 Apr 2008 17:38:47 +0200
Message-ID: <20080403153847.GA17170@piper.oerlikon.madduck.net>
References: <20080402212653.GC11325@piper.oerlikon.madduck.net> <20080403081822.GA13254@piper.oerlikon.madduck.net> <47F4A36A.2010600@plouf.fr.eu.org> <87r6dn1dqs.fsf@petole.dyndns.org> <20080402212653.GC11325@piper.oerlikon.madduck.net> <20080403081822.GA13254@piper.oerlikon.madduck.net> <47F4A36A.2010600@plouf.fr.eu.org> <20080403102632.GA22035@piper.oerlikon.madduck.net> <47F4F2B0.9020205@plouf.fr.eu.org> <873aq3ymr1.fsf@petole.dyndns.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ikeVEW9yuYc//A+q"
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <873aq3ymr1.fsf@petole.dyndns.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org


--ikeVEW9yuYc//A+q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

also sprach Nicolas KOWALSKI <niko@petole.dyndns.org> [2008.04.03.1735 +020=
0]:
> IN=3Deth0 OUT=3D MAC=3D33:33:00:00:00:02:00:0f:1f:c9:4e:7d:86:dd
> SRC=3Dfe80:0000:0000:0000:020f:1fff:fec9:4e7d
> DST=3Dff02:0000:0000:0000:0000:0000:0000:0002 LEN=3D56 TC=3D0
> HOPLIMIT=3D255 FLOWLBL=3D0 PROTO=3DICMPv6 TYPE=3D133 CODE=3D0

Exactly. router-solicitation being matched by INVALID.

--=20
martin | http://madduck.net/ | http://two.sentenc.es/
=20
"anyone who is capable of getting themselves made president
 should on no account be allowed to do the job"
                                                      -- douglas adams
=20
spamtraps: madduck.bogus@madduck.net

--ikeVEW9yuYc//A+q
Content-Type: application/pgp-signature; name="digital_signature_gpg.asc"
Content-Description: Digital signature (see http://martin-krafft.net/gpg/)
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFH9PoHIgvIgzMMSnURAn8uAJ9Ty5Qt6pJehOpp5cqlWoSLe/s6SgCgua6Z
3qJtfZP83LtjS2NTIun9KXQ=
=emsp
-----END PGP SIGNATURE-----

--ikeVEW9yuYc//A+q--
