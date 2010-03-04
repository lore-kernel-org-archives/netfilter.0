From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: How does netfilter decide which in/out-interface a packet has
Date: Thu, 04 Mar 2010 23:59:27 +0100
Message-ID: <4B903B4F.2030708@plouf.fr.eu.org>
References: <20100303165422.18973x8p8ccy6s84@webmail.physik.uni-muenchen.de>	 <4B8E97BA.9070103@plouf.fr.eu.org> <1267698530.22478.27.camel@etppc09.garching.physik.uni-muenchen.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1267698530.22478.27.camel@etppc09.garching.physik.uni-muenchen.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Christoph Anton Mitterer a =E9crit :
>=20
> So the kernel basically sees when packets do not leave the box but ar=
e
> just "internal traffic" and uses lo for this?
>=20
> I assume this also applies for byte counters like RX/TX packets and
> they're accounted on lo?

Yes and yes.

>>> "incoming traffic (from remote):
>>> 99.99.99.99 --> 127.x.x.x     =3D> is that possible at all? how wou=
ld =20
>>> the in=3D/out=3D be?
>> eth0, but the packet is discarded after PREROUTING by the input rout=
ing
>> decision which prohibits receiving a packet with a loopback address =
from
>> outside (a non loopback interface).
> Ah great,... so I don't have to manually drop such stuff... right?
>=20
> Are such packets dropped (like DROP) or are the rejected with error
> codes?

They are silently discarded, like DROP. Some of these packets are logge=
d
when sysctl net.ipv4.conf.*.log_martians is enabled. Otherwise you can
log (and drop) them with iptables.

>>> "outgoing traffic (to remote):
>>> 127.x.x.x --> 99.99.99.99     =3D> is that possible at all?
>> Not possible, the output routing decision prohibits sending a packet
>> with a loopback address outside the host (on a non loopback interfac=
e).
> So the same as above,... this is handled automatically and I don't ne=
ed
> to setup specific rules to block such evil.

Note that I observed once that the kernel allowed sending IPv6 packets
outside the host with the source address ::1 (IPv6 loopback address),
which should be prohibited. I didn't test all "impossible" addresses bu=
t
there may be other cases. So it may be worth filtering with ip(6)tables
anyway.

> Just out of curiosity,... would it be possible to tell the kernel not=
 to
> drop such bogus packets at the respective routing decision points?

Not without hacking into the kernel source AFAIK.
