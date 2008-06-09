From: =?iso-8859-1?Q?Thomas_B=E4tzler?= <t.baetzler@bringe.com>
Subject: RE: Weird nat/conntrack Problem with PASV FTP upload
Date: Mon, 9 Jun 2008 10:58:28 +0200
Message-ID: <E350C77ABFDBD242BDD51F5DA07905C102825E30@SONNE.gw.bringe.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Content-class: urn:content-classes:message
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Patrick McHardy wrote:

> Thomas B=E4tzler wrote:
> > iptables -t nat -A PREROUTING -m state --state INVALID \
> >   -j  LOG
> > iptables -t nat -A PREROUTING -m state --state INVALID \
> >   -j DROP
>=20
> These rules need to go in mangle, that nat table is only=20
> traversed for the first packet of a connection.

I've changed my ruleset as you suggested, and now I'm seeing
packets being filtered. I'll wait and see how that's affecting
stability and throughput of the connection.

In any case I'm wondering why netfilter doesn't consider these
packets to be part of a connection. Is there a known problem
with netfilter and TCP SACK? Or did I miss something while
looking at the rejected packets? I've enabled logging via ulogd
now and have a look at what's being filtered now.

In the meantime thanks a lot for your help!

Cheers,
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
