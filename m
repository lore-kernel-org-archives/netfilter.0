From: martin f krafft <madduck@madduck.net>
Subject: ip6tables: --state INVALID catches echo-request
Date: Wed, 2 Apr 2008 23:21:49 +0200
Message-ID: <20080402212149.GB11325@piper.oerlikon.madduck.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jq0ap7NbKX2Kqbes"
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter discussion list <netfilter@vger.kernel.org>


--jq0ap7NbKX2Kqbes
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi list,

sorry for the previous post, here is my retry:

An IPv6 host cannot receive any echo-requests with the following
ruleset:

  -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
  -A INPUT -m state --state INVALID -j DROP
  -A INPUT -m state --state NEW -j in-new
  -A in-new -p icmpv6 -icmpv6-type echo-request -j ACCEPT

The reason is that -m state --state INVALID -j DROP catches the
ping packet.

In an IPv4 setting, this does *not* happen.

Both iptables(8) and ip6tables(8) say:

  INVALID meaning that the packet could not be  identified  for some
  reason which  includes  running  out  of memory and ICMP errors
  which don=E2=80=99t correspond to any known connection

But echo-request is not an error.

Is this a bug or am I doing something wrong?

--=20
martin | http://madduck.net/ | http://two.sentenc.es/
=20
plan to be spontaneous tomorrow.
=20
spamtraps: madduck.bogus@madduck.net

--jq0ap7NbKX2Kqbes
Content-Type: application/pgp-signature; name="digital_signature_gpg.asc"
Content-Description: Digital signature (see http://martin-krafft.net/gpg/)
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFH8/jtIgvIgzMMSnURAj1qAJ0UbPrFuZ8fOXEfY+3ZlMQkuIZIpwCfV+5m
TkJMpY6jIADaZZckXhXEycc=
=+IPL
-----END PGP SIGNATURE-----

--jq0ap7NbKX2Kqbes--
