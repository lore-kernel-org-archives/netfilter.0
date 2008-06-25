From: =?ISO-8859-2?Q?Thomas_B=E4tzler?= <t.baetzler@bringe.com>
Subject: Re: Weird nat/conntrack Problem with PASV FTP upload
Date: Wed, 25 Jun 2008 11:47:03 +0200
Message-ID: <48621417.90101@bringe.com>
References: <E350C77ABFDBD242BDD51F5DA07905C102825E32@SONNE.gw.bringe.net> <Pine.LNX.4.64.0806101024010.31994@blackhole.kfki.hu> <484F91E5.8040807@bringe.com> <Pine.LNX.4.64.0806231204220.17434@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.64.0806231204220.17434@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org
Cc: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>

Jozsef Kadlecsik wrote:
> That's a perfect dump file, thank you. Please try the patch below and=
=20
> please report me if it helps without any bad effect.

We've been running a Debian 2.6.25 kernel (2.6.25-4 to be precise) with
your patch for close to 2 days now. So far, it has worked perfectly:
We've transferred about 88GB of data without a single broken connection
and without a log message from netfilter.

Before we started tinkering with this, we'd see 2 to 4 lost connections
per day.

Thanks a lot for your help in this matter!

Thomas
--=20
BRINGE Informationstechnik GmbH
Zur Seeplatte 12
D-76228 Karlsruhe
Germany

=46on: +49 721 94246-0
=46on: +49 171 5438457
=46ax: +49 721 94246-66
Web: http://www.bringe.de/

Gesch=E4ftsf=FChrer: Dipl.-Ing. (FH) Martin Bringe
Ust.Id: DE812936645, HRB 108943 Mannheim=20
