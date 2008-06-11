From: =?ISO-8859-2?Q?Thomas_B=E4tzler?= <t.baetzler@bringe.com>
Subject: Re: Weird nat/conntrack Problem with PASV FTP upload
Date: Wed, 11 Jun 2008 10:50:45 +0200
Message-ID: <484F91E5.8040807@bringe.com>
References: <E350C77ABFDBD242BDD51F5DA07905C102825E32@SONNE.gw.bringe.net> <Pine.LNX.4.64.0806101024010.31994@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.64.0806101024010.31994@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org
Cc: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>

Hi,

Jozsef Kadlecsik schrieb:
> In the first dump there is no dropped packet and the second one conta=
ins a=20
> single packet. Neither of the dumps help. I need a full record of a T=
CP=20
> session in which packets were marked as INVALID. If you can attach th=
e log=20
> record, that'd be even better.

Sorry, my fault.

Here's what I've done now:

- "tcpdump -s0" on the external interface
- I log invalid packets using this iptables rule:
   iptables -t mangle -A PREROUTING -m state --state INVALID -j LOG
- locate "invalid" dropped in kernel.log
- tcpdump -r -w on port identified above to create a session dump.

I've uploaded such a session dump and the corresponding log line to
http://baetzler.de/sandbox/dump.tar.bz2

I'm running a Debian flavour 2.6.25 kernel (nf_conntrack version 0.5.0=20
(16384 buckets, 65536 max)).

If there's a better/different method to do this or to get additional=20
debugging info, please let me know. I'm currently running a kernel=20
compiled with debugging info for netfilter enabled, but this does not=20
seem to produce any additional output in kernel.log.

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
Ust.Id: DE812936645, HRB 108943 Mannheim
