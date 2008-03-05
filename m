From: martin f krafft <madduck@madduck.net>
Subject: Re: safely apply new rulesets: iptables-apply
Date: Wed, 5 Mar 2008 12:42:41 +0100
Message-ID: <20080305114241.GA22204@piper.oerlikon.madduck.net>
References: <20080304231606.GA16376@piper.oerlikon.madduck.net> <20080305103707.GA9740@outback.rfc2324.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="J2SCkAp4GZ/dPZZf"
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20080305103707.GA9740@outback.rfc2324.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter discussion list <netfilter@vger.kernel.org>


--J2SCkAp4GZ/dPZZf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

also sprach Maximilian Wilhelm <max@rfc2324.org> [2008.03.05.1137 +0100]:
> Oh well, that's a different approach to my version :) While
> hacking on a firewall management framework, I build such a thing,
> tooo.

I used to use at:

  http://madduck.net/blog/2006.06.04:iptables-apply/

but I ended up at times to forget to remove the "token" and the
ruleset would revert without me knowing.

Thus I wrote iptables-apply, which kinda makes that impossible.

> Greetz from frosty Zurich

Ha! Greetings from frosty Oerlikon.

--=20
martin | http://madduck.net/ | http://two.sentenc.es/
=20
whatever you do will be insignificant,
but it is very important that you do it.
                                                     -- mahatma gandhi
=20
spamtraps: madduck.bogus@madduck.net

--J2SCkAp4GZ/dPZZf
Content-Type: application/pgp-signature; name="digital_signature_gpg.asc"
Content-Description: Digital signature (see http://martin-krafft.net/gpg/)
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFHzocxIgvIgzMMSnURAu1BAJ4/QexGQNgF+IdXFT5Lq/dVbjHEGACg10Ek
O8v10emush6O2CF22JJIZKE=
=YuWq
-----END PGP SIGNATURE-----

--J2SCkAp4GZ/dPZZf--
