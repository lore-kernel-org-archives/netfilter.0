From: martin f krafft <madduck@madduck.net>
Subject: Re: safely apply new rulesets: iptables-apply
Date: Mon, 10 Mar 2008 12:02:09 +0100
Message-ID: <20080310110209.GB17757@piper.oerlikon.madduck.net>
References: <20080304231606.GA16376@piper.oerlikon.madduck.net> <Pine.LNX.4.64.0803091733060.26142@fbirervta.pbzchgretzou.qr>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Fba/0zbH8Xs+Fj9o"
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.64.0803091733060.26142@fbirervta.pbzchgretzou.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter discussion list <netfilter@vger.kernel.org>


--Fba/0zbH8Xs+Fj9o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

also sprach Jan Engelhardt <jengelh@computergmbh.de> [2008.03.09.1745 +0100=
]:
> It needs a minor tweak in that the timeout needs to be started
> before you output anything to the terminal, just in case the
> terminal blocks.

I don't really see a way to do this trivially. If the terminal
blocks, the shell script will sooner or later be suspended and
unless I used an external resource like atd as timeout processor,
there's nothing I can do, I think.

But I can turn off all printing to the terminal, which is
informational anyway.

> On a related note, you cannot trap signal 0:
> 	trap "rm -f $TMPFILE" 0 1 2 3 4 5 6 7 8 10 11 12 13 14 15

Yes, you can. Trapping 0 means at-exit. Undoubtedly, I don't need it
because I remove the tmpfile at the end anyway, but it's just
a habit I formed and never broke with because it's the only reliable
way I found to get rid of tmpfiles from shell scripts.

> >Could this script possibly make it into the iptables distribution
> >tarball? I am flexible about the licence and all...
>=20
> The idea gets my approval.

Is there anything else I need to do?

Thanks.

--=20
martin | http://madduck.net/ | http://two.sentenc.es/
=20
people with narrow minds usually have broad tongues.
=20
spamtraps: madduck.bogus@madduck.net

--Fba/0zbH8Xs+Fj9o
Content-Type: application/pgp-signature; name="digital_signature_gpg.asc"
Content-Description: Digital signature (see http://martin-krafft.net/gpg/)
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFH1RUxIgvIgzMMSnURArqRAKCF98l7NHv9TbvwYYucy3rl/3vAiQCfZ2Th
kKDTnjyBn5RL/8ZDw7G3GHY=
=eXw2
-----END PGP SIGNATURE-----

--Fba/0zbH8Xs+Fj9o--
