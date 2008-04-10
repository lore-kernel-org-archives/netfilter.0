From: martin f krafft <madduck@madduck.net>
Subject: Re: safely apply new rulesets: iptables-apply
Date: Thu, 10 Apr 2008 15:34:03 +0200
Message-ID: <20080410133403.GA5538@lapse.madduck.net>
References: <20080304231606.GA16376@piper.oerlikon.madduck.net> <Pine.LNX.4.64.0803091733060.26142@fbirervta.pbzchgretzou.qr> <20080310110209.GB17757@piper.oerlikon.madduck.net> <Pine.LNX.4.64.0803111947120.18745@fbirervta.pbzchgretzou.qr> <20080311190036.GA23401@piper.oerlikon.madduck.net> <Pine.LNX.4.64.0803112027340.18745@fbirervta.pbzchgretzou.qr> <20080311202922.GC26811@piper.oerlikon.madduck.net> <20080404063255.GA14667@piper.oerlikon.madduck.net> <alpine.LNX.1.10.0804101228050.8765@fbirervta.pbzchgretzou.qr>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="PmA2V3Z32TCmWXqI"
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <alpine.LNX.1.10.0804101228050.8765@fbirervta.pbzchgretzou.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Jan Engelhardt <jengelh@computergmbh.de>
Cc: netfilter discussion list <netfilter@vger.kernel.org>


--PmA2V3Z32TCmWXqI
Content-Type: multipart/mixed; boundary="ZGiS0Q5IWpPtfppv"
Content-Disposition: inline


--ZGiS0Q5IWpPtfppv
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

also sprach Jan Engelhardt <jengelh@computergmbh.de> [2008.04.10.1229 +0200=
]:
> My patch queue finally starts to decrease..=E2=80=94

yay!

> Anyway, could you make a normal manpage instead of a .dbk file?
> This is easier to process (because it needs no processing at all -hehe)
> Thanks!

It's attached. Thanks!

--=20
martin | http://madduck.net/ | http://two.sentenc.es/
=20
after you install windows xp, you have the option to create user
accounts. if you create user accounts, by default, they will have an
account type of administrator with no password. way to go!
=20
spamtraps: madduck.bogus@madduck.net

--ZGiS0Q5IWpPtfppv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="iptables-apply.8"
Content-Transfer-Encoding: quoted-printable

=2E\"     Title: iptables-apply
=2E\"    Author:=20
=2E\" Generator: DocBook XSL Stylesheets v1.73.2 <http://docbook.sf.net/>
=2E\"      Date: Jun 04, 2006
=2E\"    Manual:=20
=2E\"    Source:=20
=2E\"
=2ETH "IPTABLES\-APPLY" "8" "Jun 04, 2006" "" ""
=2E\" disable hyphenation
=2Enh
=2E\" disable justification (adjust text to left margin only)
=2Ead l
=2ESH "NAME"
iptables-apply \- a safer way to update iptables remotely
=2ESH "SYNOPSIS"
=2EHP 15
\fBiptables\-apply\fR [\-\fBthV\fR]\fI ruleset\-file\fR
=2ESH "DESCRIPTION"
=2EPP
iptables\-apply will try to apply a new ruleset (as output by iptables\-sav=
e/read by iptables\-restore) to iptables, then prompt the user whether the =
changes are okay\&. If the new ruleset cut the existing connection, the use=
r won\'t be able to answer affirmatively\&. In this case, the script rolls =
back to the previous ruleset after the timeout expired\&. The timeout can b=
e set with
\fB\-t\fR\&.
=2EPP
When called as ip6tables\-apply, the script will use ip6tables\-save/\-rest=
ore instead\&.
=2ESH "OPTIONS"
=2EPP
\-t \fIseconds\fR, \-\-timeout \fIseconds\fR
=2ERS 4
Sets the timeout after which the script will roll back to the previous rule=
set\&.
=2ERE
=2EPP
\-h, \-\-help
=2ERS 4
Display usage information\&.
=2ERE
=2EPP
\-V, \-\-version
=2ERS 4
Display version information\&.
=2ERE
=2ESH "SEE ALSO"
=2EPP

\fBiptables-restore\fR(1),
\fBiptables-save\fR(1),
\fBiptables\fR(8)\&.
=2ESH "LEGALESE"
=2EPP
iptables\-apply is copyright by martin f\&. krafft
=2EPP
This manual page was written by martin f\&. krafft
<madduck@madduck\&.net>
=2EPP
Permission is granted to copy, distribute and/or modify this document under=
 the terms of the Artistic License 2\&.0

--ZGiS0Q5IWpPtfppv--

--PmA2V3Z32TCmWXqI
Content-Type: application/pgp-signature; name="digital_signature_gpg.asc"
Content-Description: Digital signature (see http://martin-krafft.net/gpg/)
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFH/hdLIgvIgzMMSnURArgvAJ96P9MaVcfZpRFJ5jeaqBvMDEAinACgkjFv
JxHPloBIugJypCPcx3sjqfw=
=kRzO
-----END PGP SIGNATURE-----

--PmA2V3Z32TCmWXqI--
