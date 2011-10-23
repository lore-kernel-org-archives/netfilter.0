From: "Nikolay S." <nowhere@hakkenden.ath.cx>
Subject: Re: Netfilter TCP Established Timeout
Date: Sun, 23 Oct 2011 23:22:30 +0400
Message-ID: <1319397750.9866.8.camel@hakkenden.homenet>
References: <CADVVA4-XORAyHOLxx-x9RGxEDWmpP=5hxqwxqCaHXv-13WXqaw@mail.gmail.com>
	 <1319081811.26694.2.camel@hakkenden.homenet>
	 <CADVVA49349gKbXWK8j9dhGXQ5o2JRT019Jsxyv1vD7zP6j6B+g@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CADVVA49349gKbXWK8j9dhGXQ5o2JRT019Jsxyv1vD7zP6j6B+g@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Erik Schweigert <ejschweigert@gmail.com>
Cc: netfilter@vger.kernel.org

=D0=92 =D0=A7=D1=82=D0=B2, 20/10/2011 =D0=B2 12:10 -0700, Erik Schweige=
rt =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> On Wed, Oct 19, 2011 at 8:36 PM, Nikolay S. <nowhere@hakkenden.ath.cx=
> wrote:
> >
> > =D0=92 =D0=A1=D1=80=D0=B4, 19/10/2011 =D0=B2 12:03 -0700, Erik Schw=
eigert =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > > Hi all,
> > >
> > > I have noticed an oddity in the timeout values of a TCP Establish=
ed
> > > connection.  I currently have the
> > > "nf_conntrack_tcp_timeout_established =3D 1800".
> > >
> > > # cat /proc/net/nf_conntrack  | grep EST
> > > ipv4     2 tcp      6 1385 ESTABLISHED src=3D192.168.10.25
> > > dst=3D192.168.10.134 sport=3D2513 dport=3D1217 packets=3D71 bytes=
=3D10154
> > > src=3D192.168.10.134 dst=3D192.168.10.25 sport=3D1217 dport=3D251=
3 pac1
> > > ----> ipv4     2 tcp      6 1799 ESTABLISHED src=3D192.168.10.25
> > > dst=3D192.168.10.134 sport=3D2550 dport=3D1217 packets=3D1142 byt=
es=3D121874
> > > src=3D192.168.10.134 dst=3D192.168.10.25 sport=3D1217 dport=3D255=
0 1
> > > ipv4     2 tcp      6 1413 ESTABLISHED src=3D192.168.10.25
> > > dst=3D192.168.10.134 sport=3D2515 dport=3D1217 packets=3D824 byte=
s=3D101370
> > > src=3D192.168.10.134 dst=3D192.168.10.25 sport=3D1217 dport=3D251=
5 p1
> > > ipv4     2 tcp      6 263 ESTABLISHED src=3D192.168.10.25
> > > dst=3D192.168.10.134 sport=3D2440 dport=3D1101 packets=3D41 bytes=
=3D6458
> > > src=3D192.168.10.134 dst=3D192.168.10.25 sport=3D1101 dport=3D244=
0 packe1
> > > ipv4     2 tcp      6 1221 ESTABLISHED src=3D192.168.10.25
> > > dst=3D192.168.10.134 sport=3D2512 dport=3D1101 packets=3D79 bytes=
=3D13578
> > > src=3D192.168.10.134 dst=3D192.168.10.25 sport=3D1101 dport=3D251=
2 pac1
> > > # cat /proc/net/nf_conntrack  | grep EST
> > > ipv4     2 tcp      6 1369 ESTABLISHED src=3D192.168.10.25
> > > dst=3D192.168.10.134 sport=3D2513 dport=3D1217 packets=3D71 bytes=
=3D10154
> > > src=3D192.168.10.134 dst=3D192.168.10.25 sport=3D1217 dport=3D251=
3 pac1
> > > ----> ipv4     2 tcp      6 296 ESTABLISHED src=3D192.168.10.25
> > > dst=3D192.168.10.134 sport=3D2550 dport=3D1217 packets=3D1166 byt=
es=3D124610
> > > src=3D192.168.10.134 dst=3D192.168.10.25 sport=3D1217 dport=3D255=
0 p1
> > > ipv4     2 tcp      6 1396 ESTABLISHED src=3D192.168.10.25
> > > dst=3D192.168.10.134 sport=3D2515 dport=3D1217 packets=3D824 byte=
s=3D101370
> > > src=3D192.168.10.134 dst=3D192.168.10.25 sport=3D1217 dport=3D251=
5 p1
> > > ipv4     2 tcp      6 247 ESTABLISHED src=3D192.168.10.25
> > > dst=3D192.168.10.134 sport=3D2440 dport=3D1101 packets=3D41 bytes=
=3D6458
> > > src=3D192.168.10.134 dst=3D192.168.10.25 sport=3D1101 dport=3D244=
0 packe1
> > > ipv4     2 tcp      6 1205 ESTABLISHED src=3D192.168.10.25
> > > dst=3D192.168.10.134 sport=3D2512 dport=3D1101 packets=3D79 bytes=
=3D13578
> > > src=3D192.168.10.134 dst=3D192.168.10.25 sport=3D1101 dport=3D251=
2 pac1
> > >
> > > You will notice in the two iterations I have marked above, the ti=
meout
> > > values goes from 1799 to 296 within a 16 second span.  Is this a =
bug
> > > or something inherent to the connection tracking system that I un=
aware
> > > of.
> >
> > TCP conntrack allows 5 minutes (300 seconds) for hosts to send the
> > acknowledge. Once connection has no unacknowledged segments, timeou=
t
> > will revert to 1800 seconds.
>=20
> Is this also a user settable value?

No

>=20
> >
> > >
> > > I am running kernel 2.6.26.5. My current settings of the tunable
> > > conntrack features are:
> > >
> > > nf_conntrack_tcp_be_liberal =3D 0
> > > nf_conntrack_tcp_loose =3D 1
> > > nf_conntrack_tcp_max_retrans =3D 3
> > > nf_conntrack_tcp_timeout_close =3D 10
> > > nf_conntrack_tcp_timeout_close_wait  =3D 60
> > > nf_conntrack_tcp_timeout_established =3D 1800
> > > nf_conntrack_tcp_timeout_fin_wait =3D 120
> > > nf_conntrack_tcp_timeout_last_ack =3D 30
> > > nf_conntrack_tcp_timeout_max_retrans =3D 300
> > > nf_conntrack_tcp_timeout_syn_recv =3D 60
> > > nf_conntrack_tcp_timeout_syn_sent =3D 120
> > > nf_conntrack_tcp_timeout_time_wait =3D 120
> > >
> > > Any help or suggestions is appreciated,
> > > Erik
> > > --
> > > To unsubscribe from this list: send the line "unsubscribe netfilt=
er" in
> > > the body of a message to majordomo@vger.kernel.org
> > > More majordomo info at  http://vger.kernel.org/majordomo-info.htm=
l
> >
> >
>=20
>=20
>=20
> --
> Erik Schweigert
> Email: ejschweigert@gmail.com
> Website: http://www.lainoox.com


