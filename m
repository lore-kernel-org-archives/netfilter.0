From: Paul Evans <paul@mxtelecom.com>
Subject: Atomic get-and-watch of conntrack table
Date: Mon, 1 Jun 2009 18:36:00 +0100
Message-ID: <20090601183600.579332c1@nacelle.mxtelecom.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=PGP-SHA1;
 boundary="Sig_/OinUc60uTo_o3OjHuCIkz4r"; protocol="application/pgp-signature"
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org

--Sig_/OinUc60uTo_o3OjHuCIkz4r
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

I'd like to write a long-running program that regularly reports
statistics on conntrack usage (total number of connections, number of
NATs, etc...). To do this, the program needs to start up, grab the
current state of the table, and be informed of updates.

This presents a problem. You can't pass conntrack -L -E together.

So either:

 a: I run "conntrack -L", then watch "conntrack -E", with the inherent
    race condition inbetween where state might change while I'm not
    looking

or

 b: I start watching "conntrack -E", then run "conntrack -L", with more
    subtle race conditions involved in the fact that I might get events
    from the -E command which set the state I've already seen by the -L
    list; so having to filter those out somehow.

Is there any alternative to this; can I atomically get the current
table, and watch for updates to it? If not I guess I'll have to go for
a careful implementation of case b- start watching, scrape the current
table, and be prepared for "DELETE" or "UPDATE" events to touch items
in the table I don't yet know about, or "NEW" or "UPDATE" events to set
state that I've now already seen... tricky indeed...

--=20
Paul Evans <paul@mxtelecom.com>
Tel: +44 (0) 845 666 7778
Fax: +44 (0) 870 163 4694
http://www.mxtelecom.com

--Sig_/OinUc60uTo_o3OjHuCIkz4r
Content-Type: application/pgp-signature; name=signature.asc
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkokEYAACgkQcGehlx3Gqx4KhACgj4oRGDyfssPmowHtVZxPJQeC
JAUAn26S1w1ynEF3wBaDrADT/RCF+lqh
=zqpu
-----END PGP SIGNATURE-----

--Sig_/OinUc60uTo_o3OjHuCIkz4r--
