From: =?iso-8859-1?Q?Thomas_B=E4tzler?= <t.baetzler@bringe.com>
Subject: RE: Weird nat/conntrack Problem with PASV FTP upload
Date: Mon, 9 Jun 2008 14:35:47 +0200
Message-ID: <E350C77ABFDBD242BDD51F5DA07905C102825E32@SONNE.gw.bringe.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Content-class: urn:content-classes:message
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Jozsef Kadlecsik wrote:
> Then the best were if you could capture a full TCP session by=20
> tcpdump and send it so that we could replay and analyze the traffic.

I've uploaded an archive to http://baetzler.de/sandbox/dump.tar.bz2.
There is a complete tcp session of a file upload and a second dump
that contains a segment from that connection that was IMHO erroneously
logged/dropped by a rule that filters by state INVALID in the
PREROUTING chain of the mangle table.

Inititator is my NAT box, target is the FTP server.

TIA,
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
