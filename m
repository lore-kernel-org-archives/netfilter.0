From: "Nikolay S." <nowhere@hakkenden.ath.cx>
Subject: Re: Netfilter TCP Established Timeout
Date: Thu, 20 Oct 2011 07:36:51 +0400
Message-ID: <1319081811.26694.2.camel@hakkenden.homenet>
References: <CADVVA4-XORAyHOLxx-x9RGxEDWmpP=5hxqwxqCaHXv-13WXqaw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CADVVA4-XORAyHOLxx-x9RGxEDWmpP=5hxqwxqCaHXv-13WXqaw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Erik Schweigert <ejschweigert@gmail.com>
Cc: netfilter@vger.kernel.org

=D0=92 =D0=A1=D1=80=D0=B4, 19/10/2011 =D0=B2 12:03 -0700, Erik Schweige=
rt =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> Hi all,
>=20
> I have noticed an oddity in the timeout values of a TCP Established
> connection.  I currently have the
> "nf_conntrack_tcp_timeout_established =3D 1800".
>=20
> # cat /proc/net/nf_conntrack  | grep EST
> ipv4     2 tcp      6 1385 ESTABLISHED src=3D192.168.10.25
> dst=3D192.168.10.134 sport=3D2513 dport=3D1217 packets=3D71 bytes=3D1=
0154
> src=3D192.168.10.134 dst=3D192.168.10.25 sport=3D1217 dport=3D2513 pa=
c1
> ----> ipv4     2 tcp      6 1799 ESTABLISHED src=3D192.168.10.25
> dst=3D192.168.10.134 sport=3D2550 dport=3D1217 packets=3D1142 bytes=3D=
121874
> src=3D192.168.10.134 dst=3D192.168.10.25 sport=3D1217 dport=3D2550 1
> ipv4     2 tcp      6 1413 ESTABLISHED src=3D192.168.10.25
> dst=3D192.168.10.134 sport=3D2515 dport=3D1217 packets=3D824 bytes=3D=
101370
> src=3D192.168.10.134 dst=3D192.168.10.25 sport=3D1217 dport=3D2515 p1
> ipv4     2 tcp      6 263 ESTABLISHED src=3D192.168.10.25
> dst=3D192.168.10.134 sport=3D2440 dport=3D1101 packets=3D41 bytes=3D6=
458
> src=3D192.168.10.134 dst=3D192.168.10.25 sport=3D1101 dport=3D2440 pa=
cke1
> ipv4     2 tcp      6 1221 ESTABLISHED src=3D192.168.10.25
> dst=3D192.168.10.134 sport=3D2512 dport=3D1101 packets=3D79 bytes=3D1=
3578
> src=3D192.168.10.134 dst=3D192.168.10.25 sport=3D1101 dport=3D2512 pa=
c1
> # cat /proc/net/nf_conntrack  | grep EST
> ipv4     2 tcp      6 1369 ESTABLISHED src=3D192.168.10.25
> dst=3D192.168.10.134 sport=3D2513 dport=3D1217 packets=3D71 bytes=3D1=
0154
> src=3D192.168.10.134 dst=3D192.168.10.25 sport=3D1217 dport=3D2513 pa=
c1
> ----> ipv4     2 tcp      6 296 ESTABLISHED src=3D192.168.10.25
> dst=3D192.168.10.134 sport=3D2550 dport=3D1217 packets=3D1166 bytes=3D=
124610
> src=3D192.168.10.134 dst=3D192.168.10.25 sport=3D1217 dport=3D2550 p1
> ipv4     2 tcp      6 1396 ESTABLISHED src=3D192.168.10.25
> dst=3D192.168.10.134 sport=3D2515 dport=3D1217 packets=3D824 bytes=3D=
101370
> src=3D192.168.10.134 dst=3D192.168.10.25 sport=3D1217 dport=3D2515 p1
> ipv4     2 tcp      6 247 ESTABLISHED src=3D192.168.10.25
> dst=3D192.168.10.134 sport=3D2440 dport=3D1101 packets=3D41 bytes=3D6=
458
> src=3D192.168.10.134 dst=3D192.168.10.25 sport=3D1101 dport=3D2440 pa=
cke1
> ipv4     2 tcp      6 1205 ESTABLISHED src=3D192.168.10.25
> dst=3D192.168.10.134 sport=3D2512 dport=3D1101 packets=3D79 bytes=3D1=
3578
> src=3D192.168.10.134 dst=3D192.168.10.25 sport=3D1101 dport=3D2512 pa=
c1
>=20
> You will notice in the two iterations I have marked above, the timeou=
t
> values goes from 1799 to 296 within a 16 second span.  Is this a bug
> or something inherent to the connection tracking system that I unawar=
e
> of.

TCP conntrack allows 5 minutes (300 seconds) for hosts to send the
acknowledge. Once connection has no unacknowledged segments, timeout
will revert to 1800 seconds.

>=20
> I am running kernel 2.6.26.5. My current settings of the tunable
> conntrack features are:
>=20
> nf_conntrack_tcp_be_liberal =3D 0
> nf_conntrack_tcp_loose =3D 1
> nf_conntrack_tcp_max_retrans =3D 3
> nf_conntrack_tcp_timeout_close =3D 10
> nf_conntrack_tcp_timeout_close_wait  =3D 60
> nf_conntrack_tcp_timeout_established =3D 1800
> nf_conntrack_tcp_timeout_fin_wait =3D 120
> nf_conntrack_tcp_timeout_last_ack =3D 30
> nf_conntrack_tcp_timeout_max_retrans =3D 300
> nf_conntrack_tcp_timeout_syn_recv =3D 60
> nf_conntrack_tcp_timeout_syn_sent =3D 120
> nf_conntrack_tcp_timeout_time_wait =3D 120
>=20
> Any help or suggestions is appreciated,
> Erik
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


