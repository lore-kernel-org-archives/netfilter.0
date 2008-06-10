From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: RE: Weird nat/conntrack Problem with PASV FTP upload
Date: Tue, 10 Jun 2008 10:28:04 +0200 (CEST)
Message-ID: <Pine.LNX.4.64.0806101024010.31994@blackhole.kfki.hu>
References: <E350C77ABFDBD242BDD51F5DA07905C102825E32@SONNE.gw.bringe.net>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="110391808-1674285521-1213086484=:31994"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <E350C77ABFDBD242BDD51F5DA07905C102825E32@SONNE.gw.bringe.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: =?iso-8859-1?Q?Thomas_B=E4tzler?= <t.baetzler@bringe.com>
Cc: netfilter@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--110391808-1674285521-1213086484=:31994
Content-Type: TEXT/PLAIN; charset=ISO-8859-2
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Mon, 9 Jun 2008, Thomas B=E4tzler wrote:

> Jozsef Kadlecsik wrote:
> > Then the best were if you could capture a full TCP session by=20
> > tcpdump and send it so that we could replay and analyze the traffic.
>=20
> I've uploaded an archive to http://baetzler.de/sandbox/dump.tar.bz2.
> There is a complete tcp session of a file upload and a second dump
> that contains a segment from that connection that was IMHO erroneously
> logged/dropped by a rule that filters by state INVALID in the
> PREROUTING chain of the mangle table.

In the first dump there is no dropped packet and the second one contains a=
=20
single packet. Neither of the dumps help. I need a full record of a TCP=20
session in which packets were marked as INVALID. If you can attach the log=
=20
record, that'd be even better.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
--110391808-1674285521-1213086484=:31994--
