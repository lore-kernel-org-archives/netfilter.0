From: martin f krafft <madduck@madduck.net>
Subject: Re: ip6tables icmp conntracking on 2.6.18 vs 2.6.24
Date: Thu, 3 Apr 2008 17:23:30 +0200
Message-ID: <20080403152330.GA15573@piper.oerlikon.madduck.net>
References: <20080402212653.GC11325@piper.oerlikon.madduck.net> <20080403081822.GA13254@piper.oerlikon.madduck.net> <47F4A36A.2010600@plouf.fr.eu.org> <87r6dn1dqs.fsf@petole.dyndns.org> <20080402212653.GC11325@piper.oerlikon.madduck.net> <20080403081822.GA13254@piper.oerlikon.madduck.net> <47F4A36A.2010600@plouf.fr.eu.org> <20080403102632.GA22035@piper.oerlikon.madduck.net> <47F4F2B0.9020205@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="nFreZHaLTZJo0R7j"
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <47F4F2B0.9020205@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter discussion list <netfilter@vger.kernel.org>


--nFreZHaLTZJo0R7j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

also sprach Pascal Hambourg <pascal.mail@plouf.fr.eu.org> [2008.04.03.1707 =
+0200]:
> I'm not sure what you both mean. I tested the IPv6 conntrack on vanilla =
=20
> 2.6.20 and 2.6.24 kernels built from kernel.org sources and everything =
=20
> worked as expected :

I agree, it works if you don't have INVALID at all, but try:

  -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
  -A INPUT -m state --state INVALID -j DROP
  -A INPUT -m state --state NEW -j in-new

and this will match echo-requests on my 2.6.24. echo-replies get
matched by the first rule, but echo-requests should be NEW, not
INVALID.

> I do not see a reason why 2.6.22 would behave differently. Maybe
> there is something special in Debian kernels ?

This bug I see with 2.6.18 and someone else with 2.6.22. It's
a different issue than what this thread is about: that pre-2.6.24
kernels don't seem to register OUTGOING packets in the connection
table.

Or are you saying that if you ping6 from the machine with the
iptables rules to somewhere else, the echo-reply gets matched by
RELATED or ESTABLISHED? Because it certainly does *not* here.

$ ping6 ipv6.aerasec.de(2001:a60:9002:1::184:1) yields:

[INPUT6]: IN=3Deth2 OUT=3D MAC=3D00:16:3e:46:5a:86:00:0e:d6:b8:dc:1b:86:dd
SRC=3D2001:0a60:9002:0001:0000:0000:0184:0001
DST=3D2001:1620:2004:0000:0000:0000:0000:0002 LEN=3D104 TC=3D0 HOPLIMIT=3D57
FLOWLBL=3D0 PROTO=3DICMPv6 TYPE=3D129 CODE=3D0 ID=3D34094 SEQ=3D1

which is logged after falling through the end of the chain and *not*
being matched by ESTABLISHED,RELATED. Note that the source address
is the same as the destination address to which I sent the
echo-request.

If I do the same from a 2.6.24 machine, it works, meaning the
echo-reply is matched by ESTABLISHED,RELATED and accepted.

--=20
martin | http://madduck.net/ | http://two.sentenc.es/
=20
"all language designers are arrogant. goes with the territory..."
                                                         -- larry wall
=20
spamtraps: madduck.bogus@madduck.net

--nFreZHaLTZJo0R7j
Content-Type: application/pgp-signature; name="digital_signature_gpg.asc"
Content-Description: Digital signature (see http://martin-krafft.net/gpg/)
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFH9PZyIgvIgzMMSnURAmltAJ490cmUTsvHX6YjHOdMsPSb4M2uNwCgzY/Y
wfFC4P12pyQAoY9Nyxcu4lU=
=b73B
-----END PGP SIGNATURE-----

--nFreZHaLTZJo0R7j--
