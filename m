From: "Nikolay S." <nowhere@hakkenden.ath.cx>
Subject: Re: libnetfilter_queue question
Date: Wed, 04 May 2011 22:32:31 +0400
Message-ID: <1304533951.25221.8.camel@hakkenden>
References: <1304489658.32272.19.camel@compot-mob>
	 <4DC19739.2040008@tana.it>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4DC19739.2040008@tana.it>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Alessandro Vesely <vesely@tana.it>
Cc: netfilter@vger.kernel.org

=D0=92 =D0=A1=D1=80=D0=B4, 04/05/2011 =D0=B2 20:13 +0200, Alessandro Ve=
sely =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> On 04.05.2011 08:14, nowhere wrote:
> > 5. Worker threads accept packets, which (if I understand correctly)
> > still reside in kernel netfilter queue
>=20
> Part of them are copied to user's space (no payload but only metadata=
,
> according to your use of nfq_set_mode).
>=20
> > Then I do the following to test the setup:
> > iptables -t mangle -A POSTROUTING -p icmp -d 10.77.130.72 -j NFQUEU=
E
> > --queue-num 1
> >=20
> > and then start ping. If i do normal ping, everything works like exp=
ected
> >=20
> > $ping 10.77.130.72
> > PING 10.77.130.72 (10.77.130.72) 56(84) bytes of data.
> > 64 bytes from 10.77.130.72: icmp_req=3D1 ttl=3D64 time=3D97.0 ms
> > 64 bytes from 10.77.130.72: icmp_req=3D2 ttl=3D64 time=3D97.1 ms
> > 64 bytes from 10.77.130.72: icmp_req=3D3 ttl=3D64 time=3D97.6 ms
> > 64 bytes from 10.77.130.72: icmp_req=3D4 ttl=3D64 time=3D93.6 ms
> > 64 bytes from 10.77.130.72: icmp_req=3D5 ttl=3D64 time=3D101 ms
> > 64 bytes from 10.77.130.72: icmp_req=3D6 ttl=3D64 time=3D94.8 ms
> >=20
> > Packets are passed to the target host, delay is applied. Stats from
> > application and fro iptables counters show consistent figures.
> >=20
> > But when I issue flood ping I see this:
> > $ sudo ping 10.77.130.72 -i0
> > PING 10.77.130.72 (10.77.130.72) 56(84) bytes of data.
> > 64 bytes from 10.77.130.72: icmp_req=3D1 ttl=3D64 time=3D111 ms
> > 64 bytes from 10.77.130.72: icmp_req=3D8 ttl=3D64 time=3D118 ms
> > 64 bytes from 10.77.130.72: icmp_req=3D9 ttl=3D64 time=3D114 ms
> > 64 bytes from 10.77.130.72: icmp_req=3D10 ttl=3D64 time=3D104 ms
> > 64 bytes from 10.77.130.72: icmp_req=3D11 ttl=3D64 time=3D93.5 ms
> > 64 bytes from 10.77.130.72: icmp_req=3D12 ttl=3D64 time=3D93.9 ms
> > 64 bytes from 10.77.130.72: icmp_req=3D13 ttl=3D64 time=3D94.3 ms
> > 64 bytes from 10.77.130.72: icmp_req=3D14 ttl=3D64 time=3D101 ms
> > 64 bytes from 10.77.130.72: icmp_req=3D15 ttl=3D64 time=3D96.8 ms
> >=20
> > There are 7 packets dropped at the beginning.
>=20
> I assume you meant 6 (15 - 9)

Yes :)

>=20
> > Several packets at the beginning get lost.
>=20
> Are they always at the beginning, or does that depend on the distribu=
tion of
> delays?

Indeed. The first packet is never dropped, then comes a serie of drops
(the number of dropped packets depends on the sending rate, i.e. testin=
g
with iperf on, say, 50 Mbit/s shows drops of ~800 packets) and after
that no drops at all. Distribution and it's parameters do not matter
except for zeroes: if there is no artificial delay, no packets are
dropped.

>=20
> > iptables counters show, that NFQUEUE rule has processed all the pac=
kets
> > (15 in this example), app debug output shows 15 processed packets,
>=20
> They were seen, but it seems the verdict didn't arrive in time for 6 =
of them.
>=20
> > nfqueue stat show no drops, tc -s -d qdisc show dev eth0 shows no d=
rops
> > in the interface queue. But tcpdump has caught only 9 packets on re=
mote
> > and on local hosts.
>=20
> The relationship between filter and local tcpdump is not always obvio=
us, IME.
>  Perhaps, your choice of table/chain makes it better.  Anyway, the re=
mote
> host cannot get it wrong.  Did you dump requests, responses, or both?

Requests only. Do you recommend queuing from another tables/chain?
I tried OUTPUT in filter table, but did not see any difference...

>=20
> > There is app's source code here. Maybe, I'm doing something wrong i=
n it?
>=20
> I see nothing wrong in it.  However, I'd print out occurrences of rv =
< 0
> after recv() and look for errno=3D=3DENOBUFS in particular.  It shoul=
d report
> lost packets

Yes, I did it (actually this was one of the first checks). There are no
situations when rv < 0.

> .
>=20
> hth
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


