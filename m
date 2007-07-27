From: Tom Eastep <teastep@shorewall.net>
Subject: Re: adding rules - slow
Date: Fri, 27 Jul 2007 15:31:24 -0700
Message-ID: <46AA723C.4090307@shorewall.net>
References: <46aa63fb.120b420a.16f8.0c23@mx.google.com>
	<1185572284.10031.2.camel@localhost>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enig7CA2225DEA054121D21956FD"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1185572284.10031.2.camel@localhost>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
To: netfilter@lists.netfilter.org

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig7CA2225DEA054121D21956FD
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

John A. Sullivan III wrote:

>=20
> We handle it by adding rules via iptables-restore rather than iptables.=

> The load time difference is remarkable.  You write your rules into file=
s
> with very similar syntax to iptables and then direct them into
> iptables-restore, e.g.,=20

The new Perl-based Shorewall rules compiler has adopted this same strateg=
y.
As John says, the difference in performance is remarkable.

-Tom
--=20
Tom Eastep    \ Nothing is foolproof to a sufficiently talented fool
Shoreline,     \ http://shorewall.net
Washington USA  \ teastep@shorewall.net
PGP Public Key   \ https://lists.shorewall.net/teastep.pgp.key


--------------enig7CA2225DEA054121D21956FD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFGqnJBO/MAbZfjDLIRAqR3AKCY/cCa4NRPJJq0ZbPEZL5Xw+M7vQCgsEQC
BpZTwZ9VsEfKka9BkubKgtg=
=ksNm
-----END PGP SIGNATURE-----

--------------enig7CA2225DEA054121D21956FD--

