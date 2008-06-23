From: =?ISO-8859-2?Q?Thomas_B=E4tzler?= <t.baetzler@bringe.com>
Subject: Re: Weird nat/conntrack Problem with PASV FTP upload
Date: Mon, 23 Jun 2008 14:50:29 +0200
Message-ID: <485F9C15.9080001@bringe.com>
References: <E350C77ABFDBD242BDD51F5DA07905C102825E32@SONNE.gw.bringe.net> <Pine.LNX.4.64.0806101024010.31994@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.64.0806101024010.31994@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Hi,

to finish up this matter and perhaps help people who are
in the same situation as me, here's a summary.

- From the end users PoV, data connections from a ftp
client to a ftp server would sometime spontaeously break
down.

- tcpdump on the client side nat gateway showed that
the nat gateway would inject RST packets in the connection.

- Further examination involved logging packets with a
conntrack state of INVALID and proved that the packets
causing the RST reply were considered to be INVALID by
conntrack.

- Upgrading client and NAT gateway from a 2.6.18 Debian
Etch stock kernel to 2.6.25 Debian testing kernel didn't
help.

At this point more info was requested, but I couldn't
provide it in any useful form.

By chance I happend across a posting by Vladislav Kurz
last week, where he suggested to activate conntrack
logging of invalid packets by setting
/proc/sys/net/ipv4/netfilter/ip_conntrack_log_invalid
to the protocol number that one was interested in.

Now that finally gave me some useful output, namely,
"nf_ct_tcp: ACK is under the lower bound (possible overly delayed ACK)"=
=2E

 From looking at my dumps I think this is probably an
error, but then I'm still digesting the small parts
of TCP/IP Illustrated that I've read so for, so I
might aswell be wrong. If somebody feels like looking
into it, let me know what you need and I'll try and
supply it.

Anyways, the quick and dirty fix to my problem was to put
"inet.ipv4.netfilter.ip_conntrack_tcp_be_liberal=3D1" in
/etc/systcl.conf.

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
Ust.Id: DE812936645, HRB 108943 Mannheim
