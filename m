From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: Weird nat/conntrack Problem with PASV FTP upload
Date: Wed, 25 Jun 2008 11:50:31 +0200 (CEST)
Message-ID: <Pine.LNX.4.64.0806251148530.21979@blackhole.kfki.hu>
References: <E350C77ABFDBD242BDD51F5DA07905C102825E32@SONNE.gw.bringe.net>
 <Pine.LNX.4.64.0806101024010.31994@blackhole.kfki.hu> <484F91E5.8040807@bringe.com>
 <Pine.LNX.4.64.0806231204220.17434@blackhole.kfki.hu> <48621417.90101@bringe.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="110391808-367329152-1214387431=:21979"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <48621417.90101@bringe.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: =?ISO-8859-2?Q?Thomas_B=E4tzler?= <t.baetzler@bringe.com>
Cc: netfilter@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--110391808-367329152-1214387431=:21979
Content-Type: TEXT/PLAIN; charset=ISO-8859-2
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 25 Jun 2008, Thomas B=E4tzler wrote:

> Jozsef Kadlecsik wrote:
> > That's a perfect dump file, thank you. Please try the patch below and=
=20
> > please report me if it helps without any bad effect.
>=20
> We've been running a Debian 2.6.25 kernel (2.6.25-4 to be precise) with
> your patch for close to 2 days now. So far, it has worked perfectly:
> We've transferred about 88GB of data without a single broken connection
> and without a log message from netfilter.

Good! Thank you the reports and the tcpdump recording - it helped a lot to=
=20
find the bug.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
--110391808-367329152-1214387431=:21979--
