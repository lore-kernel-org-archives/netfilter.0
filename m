From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: RE: Weird nat/conntrack Problem with PASV FTP upload
Date: Mon, 9 Jun 2008 11:14:29 +0200 (CEST)
Message-ID: <Pine.LNX.4.64.0806091101410.30276@blackhole.kfki.hu>
References: <E350C77ABFDBD242BDD51F5DA07905C102825E30@SONNE.gw.bringe.net>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="110391808-1671741177-1213002869=:30276"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <E350C77ABFDBD242BDD51F5DA07905C102825E30@SONNE.gw.bringe.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: =?iso-8859-1?Q?Thomas_B=E4tzler?= <t.baetzler@bringe.com>
Cc: netfilter@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--110391808-1671741177-1213002869=:30276
Content-Type: TEXT/PLAIN; charset=ISO-8859-2
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Mon, 9 Jun 2008, Thomas B=E4tzler wrote:

> Patrick McHardy wrote:
>=20
> > Thomas B=E4tzler wrote:
> > > iptables -t nat -A PREROUTING -m state --state INVALID \
> > >   -j  LOG
> > > iptables -t nat -A PREROUTING -m state --state INVALID \
> > >   -j DROP
> >=20
> > These rules need to go in mangle, that nat table is only=20
> > traversed for the first packet of a connection.
>=20
> I've changed my ruleset as you suggested, and now I'm seeing
> packets being filtered. I'll wait and see how that's affecting
> stability and throughput of the connection.
>=20
> In any case I'm wondering why netfilter doesn't consider these
> packets to be part of a connection. Is there a known problem
> with netfilter and TCP SACK?=20

In these cases usually there is a device sitting between the firewall=20
running netfilter and the server/client machine, which randomizes the TCP=
=20
sequence numbers but fails to propagate the changes to the SACK fields.=20
Thus the SACK values are totally bogus and therefore netfilter marks them=
=20
as INVALID.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
--110391808-1671741177-1213002869=:30276--
