From: martin f krafft <madduck@madduck.net>
Subject: Re: safely apply new rulesets: iptables-apply
Date: Thu, 17 Apr 2008 10:05:27 +0200
Message-ID: <20080417080527.GE23974@piper.oerlikon.madduck.net>
References: <20080304231606.GA16376@piper.oerlikon.madduck.net> <Pine.LNX.4.64.0803091733060.26142@fbirervta.pbzchgretzou.qr> <20080310110209.GB17757@piper.oerlikon.madduck.net> <Pine.LNX.4.64.0803111947120.18745@fbirervta.pbzchgretzou.qr> <4806760D.3040909@rtij.nl>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5oH/S/bF6lOfqCQb"
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4806760D.3040909@rtij.nl>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Martijn Lievaart <m@rtij.nl>
Cc: Jan Engelhardt <jengelh@computergmbh.de>, netfilter discussion list <netfilter@vger.kernel.org>


--5oH/S/bF6lOfqCQb
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

also sprach Martijn Lievaart <m@rtij.nl> [2008.04.16.2356 +0200]:
>> echo "Applying new rules...";
>> iptables-restore <new.txt;
>> if [ "$?" -ne 0 ]; then
>> 	echo "Dude, that failed horribly. (Old rules still intact.)";
>> 	exit 1;
>> fi
>
> Are you sure? I think it may have committed some tables already and =20
> errored on another.

No, I am not sure. But wouldn't that be a bug? iptables-restore
gives the impression to be transaction-oriented. It should be
all-or-nothing, I think.

--=20
martin | http://madduck.net/ | http://two.sentenc.es/
=20
"wovon man nicht sprechen kann, dar=FCber mu=DF man schweigen."
                                                       -- wittgenstein
=20
spamtraps: madduck.bogus@madduck.net

--5oH/S/bF6lOfqCQb
Content-Type: application/pgp-signature; name="digital_signature_gpg.asc"
Content-Description: Digital signature (see http://martin-krafft.net/gpg/)
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFIBwTHIgvIgzMMSnURAmS/AKCv9/LKikwP72MmWlpYy+lS8qGwnwCePsuI
MHxsg9I4yNcptrOfXymd8F0=
=i9Ot
-----END PGP SIGNATURE-----

--5oH/S/bF6lOfqCQb--
