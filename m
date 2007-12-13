From: Eric Leblond <eric@inl.fr>
Subject: [Announce] Nulog 2.0-rc1
Date: Thu, 13 Dec 2007 22:16:30 +0100
Message-ID: <1197580590.6801.11.camel@localhost>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-fVzTfa5c/BSMjf9r8ooH"
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter <netfilter@vger.kernel.org>
Cc: romain <romain@inl.fr>


--=-fVzTfa5c/BSMjf9r8ooH
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Hello,

Nulog2 developpement team and INL are proud to announce the availability
of the first release candidate of Nulog 2.0.

Nulog2 is a complete rewrite of Nulog the historical filtering log
analysis solution from INL. Nulog2 is an application build upon Twisted,
an advanced Python framework. It analyzes logs from Netfilter and/or
NuFW and displays them on a Web page.

Logs have to be injected in a MySQL database to be accessible to Nulog2.
For Netfilter, this can easily be done via ULOG and ulogd and there is a
native support of MySQL in NuFW, the authenticating firewall.

Nulog2 is a modular application where the administrator can easily setup
the index page by adding search results to it. In fact, a simple clic is
enough to add a "widget" on the main page.

The datas in the widget can be displayed in three forms:
      * Textual array
      * Bar chart
      * Pie chart

More information and download:
Nulog2: http://software.inl.fr/trac/trac.cgi/wiki/EdenWall/NuLog2
NuFW: http://www.nufw.org/
INL: http://www.inl.fr/

Happy filtering to all,
--=20
Eric Leblond <eric@inl.fr>
INL

--=-fVzTfa5c/BSMjf9r8ooH
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Ceci est une partie de message
	=?ISO-8859-1?Q?num=E9riquement?= =?ISO-8859-1?Q?_sign=E9e?=

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD4DBQBHYaEunxA7CdMWjzIRAiX9AKCDI6fUlQzfMjo05MaMs4UDyUNVLACTBqKi
q8eErGw79NeV+B8/9q86JQ==
=4W/t
-----END PGP SIGNATURE-----

--=-fVzTfa5c/BSMjf9r8ooH--

