From: martin f krafft <madduck@madduck.net>
Subject: safely apply new rulesets: iptables-apply
Date: Wed, 5 Mar 2008 00:16:06 +0100
Message-ID: <20080304231606.GA16376@piper.oerlikon.madduck.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/04w6evG8XlLl3ft"
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter discussion list <netfilter@vger.kernel.org>


--/04w6evG8XlLl3ft
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi folks,

You probably now the feeling, that cold and hot rush of adrenaline
after you've typed "iptables-restore < new-ruleset" and didn't get to
see the shell prompt again: you've just locked yourself out of
a machine that=E2=80=99s potentially far away, and you feel like vandalism,
or screaming on the top of your lungs, or whatever.

I've had that feelings once too many and ended up writing
iptables-apply[0] with a docbook manpage[1].

0. http://svn.madduck.net/pub/sbin/base/iptables-apply
1. http://svn.madduck.net/pub/sbin/base/iptables-apply.dbk

iptables-apply is a simple shell script which applies the new
ruleset and then prompts whether you like it. If you've locked
yourself out, you cannot answer the prompt, and if you don't, the
script rolls back the ruleset. Nice and simple.

Could this script possibly make it into the iptables distribution
tarball? I am flexible about the licence and all...

Thanks,

--=20
martin | http://madduck.net/ | http://two.sentenc.es/
=20
perl -e 'print "The earth is a disk!\n" if ( "earth" =3D=3D "flat" );'
=20
spamtraps: madduck.bogus@madduck.net

--/04w6evG8XlLl3ft
Content-Type: application/pgp-signature; name="digital_signature_gpg.asc"
Content-Description: Digital signature (see http://martin-krafft.net/gpg/)
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFHzdg2IgvIgzMMSnURArBNAJ4kuvrj5g571LF72yUI3nkykFTC6ACeKbv4
TvLtGWKgQoSrJbkHG48Nfdo=
=/eoZ
-----END PGP SIGNATURE-----

--/04w6evG8XlLl3ft--
