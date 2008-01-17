From: Eric Leblond <eric@inl.fr>
Subject: Nulog2, Netfilter log analysis reloaded
Date: Thu, 17 Jan 2008 22:52:04 +0100
Message-ID: <1200606724.22724.17.camel@localhost>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-YbOZCksTpysP0ELnGfod"
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter <netfilter@vger.kernel.org>


--=-YbOZCksTpysP0ELnGfod
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Hello,

After almost a year of development, INL's team is proud to announce the
availability of Nulog 2:

Nulog2 is a complete rewrite of Nulog, INL's historical filtering log
analysis solution for NuFW and Netfilter. Nulog2 is an application build
upon Twisted, an advanced Python framework. Nulog2 is released under
GPLv3 licence.

Nulog2 has all Nulog features:
      * Use packet logged by ULOG via MySQL plugin
      * Index page with a summary of firewall activity:=20
              * Packet dropped per host
              * Packets dropped per UDP port
              * Packets dropped per TCP port
              * Packets dropped per user (NuFW only)
      * Fully browsable tables
      * Search capability

It also has exclusive new features:

      * Graphing capabilities (display clickable array, histogram or pie
        for a dataset)
      * SOAP request system for integration with other systems
      * IPv6 support.
      * Account support.
      * Customizable pages (index page, etc)
      * AJAX features.
      * Special pages for user, ip and ports.
      * CSV export.

Testing Nulog2 is quiet easy as it is featured in NuFW.live, a Live CD
based on knoppix (currently on rc1 stage). NuFW.live features NuFW
2.2.11, Nulog 2.0, Nuface 2.0rc3.

Links:=20
      * Nulog 2: http://software.inl.fr/trac/wiki/EdenWall/NuLog2
      * NuFW.live: http://live.nufw.org/
      * NuFW: http://www.netfilter.org/
      * NuFace: http://software.inl.fr/trac/wiki/EdenWall/NuFace2

Happy filtering to all,
--=20
Eric Leblond <eric@inl.fr>
INL

--=-YbOZCksTpysP0ELnGfod
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Ceci est une partie de message
	=?ISO-8859-1?Q?num=E9riquement?= =?ISO-8859-1?Q?_sign=E9e?=

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQBHj84EnxA7CdMWjzIRAtx2AJ9rgD3bi9Y/EqKAHDWuHhhDVRvJdwCggn+h
D/5GszC+HdLevlBH71u2DOI=
=x1cL
-----END PGP SIGNATURE-----

--=-YbOZCksTpysP0ELnGfod--

