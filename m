From: Josh Cepek <josh.cepek@usa.net>
Subject: iptables-restore BNF description
Date: Fri, 06 Dec 2013 15:24:55 -0600
Message-ID: <l7tfat$534$1@ger.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

I've created a BNF-style description and associated Readme for the
iptables-restore file syntax. I'm not aware of a similar project, and hope that
this can be useful enough as a reference for others.

The project is available here: https://github.com/QueuingKoala/iptables-bnf

While much of the restore-file syntax is apparent to users familiar with
Netfilter, I think it's useful to supply such information as a reference.
Advanced users may also find interesting ways to use some of the less-common
features as well.

Perhaps eventually this information could be included in official distributions
as a formal reference. If there are improvements or errata feel free to let me
know or open a pull request.

- --
Josh Cepek
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQGcBAEBAgAGBQJSokCnAAoJENcx2Xpgb9Rj+vAL/iDVfjhJmLxPS+G4mRhbSwry
qlM2fqApceo81L7pxkC5Rld0bS+fDjSAd+fpcDFojAa3XHJQoqj7hYixQy4qEvX1
UjNMNf89C0KysojxiFb8qx25/EEu+d5U5+kwS1IWPg4oFznVYsRn2DbH07rpJbuX
0o+sogJc6sxg628LkZgy4LfVwKDOwSc49dgGylUR0XiqTlLtfO6TJdxOtbynrtmM
eUYlVmKj+ePrCzud2bwxLMhp22xXiq5wK5rwajx+aJJ7ebe1UD4bTQZ+dCxxM8OZ
9zIsrpMmLJBBOF/AyE/zxpMMgzqH4PNXUK33llNnC2h1h/V03ZaNNtIA0p1yFd/T
GrnRE6hv6TbpFLmZesv3zfuQoZfzJNJwzQFg7VGtBDEME2IqhWYJ6P1zZx0xWrJA
ckb1DzQOE8xL56qmDdX70YOiM452v4zf1B0nA9NafP8uoFAy67YOPnwnuBv1QAFu
IvkZ4iDUmpFwPRpEnzsMOi0KCJ7kFcSL8bhAgl2TIQ==
=h8Hb
-----END PGP SIGNATURE-----

