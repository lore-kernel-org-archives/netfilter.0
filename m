From: martin f krafft <madduck@madduck.net>
Subject: Re: ip6tables icmp conntracking on 2.6.18 vs 2.6.24
Date: Thu, 3 Apr 2008 00:05:17 +0200
Message-ID: <20080402220517.GA15009@piper.oerlikon.madduck.net>
References: <20080402212653.GC11325@piper.oerlikon.madduck.net> <slrnfv7vhg.46d.petr.pisar@album.ics.muni.cz>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+QahgC5+KEYLbs62"
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <slrnfv7vhg.46d.petr.pisar@album.ics.muni.cz>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org


--+QahgC5+KEYLbs62
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

also sprach Petr Pisar <petr.pisar@atlas.cz> [2008.04.02.2344 +0200]:
> ICMPv6 is used for neighborhood discovery (similar to ARP in IPv4).
> Therefore droping all new packets is bad idea because it will drop ND
> requestes from other link local stations.

This is just a test-case, really. I am aware that I need to open the
filter for more ICMP types. But in this case, it's all about
echo-reply not being treated as RELATED...



also sprach Jan Engelhardt <jengelh@computergmbh.de> [2008.04.02.2357 +0200=
]:
> Even so, it should not be INVALID but NEW.

Right, except RELATED in this case... but I understand your reply
was to Petr.

--=20
martin | http://madduck.net/ | http://two.sentenc.es/
=20
"durch frauen werden die h=F6hepunkte des lebens bereichert
 und die tiefpunkte vermehrt."
                                                 - friedrich nietzsche
=20
spamtraps: madduck.bogus@madduck.net

--+QahgC5+KEYLbs62
Content-Type: application/pgp-signature; name="digital_signature_gpg.asc"
Content-Description: Digital signature (see http://martin-krafft.net/gpg/)
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFH9AMdIgvIgzMMSnURAtbAAKDJqTavL1ubITom7UH7QFMItkYV9gCfSN+U
QGaKYMqi2n83/vIuMr07EVQ=
=erdF
-----END PGP SIGNATURE-----

--+QahgC5+KEYLbs62--
