From: Aiko Barz <aiko@deepco.de>
Subject: INVALID FIN/ACK packets
Date: Wed, 14 Nov 2007 11:02:26 +0100
Message-ID: <20071114100226.GA29362@thorin.admin.heise.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="SUOF0GtieIMvvwua"
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org
Cc: aiko@deepco.de


--SUOF0GtieIMvvwua
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

like others, I'm facing some conntrack problems. A typical logentry
looks like this:

> Nov 14 10:46:22 lain fire: INVALID IN=3Deth0 OUT=3D MAC=3D00:e0:81:5c:f7:=
d9:00:02:85:04:0e:c0:08:00 SRC=3Da.b.c.d DST=3D88.198.253.172 LEN=3D40 TOS=
=3D0x00 PREC=3D0x00 TTL=3D57 ID=3D47775 DF PROTO=3DTCP SPT=3D49184 DPT=3D99=
3 WINDOW=3D65535 RES=3D0x00 ACK RST URGP=3D0
> Nov 14 10:46:22 lain fire: INPUT IN=3Deth0 OUT=3D MAC=3D00:e0:81:5c:f7:d9=
:00:02:85:04:0e:c0:08:00 SRC=3Da.b.c.d DST=3D88.198.253.172 LEN=3D40 TOS=3D=
0x00 PREC=3D0x00 TTL=3D57 ID=3D47775 DF PROTO=3DTCP SPT=3D49184 DPT=3D993 W=
INDOW=3D65535 RES=3D0x00 ACK RST URGP=3D0=20
> Nov 14 10:46:22 lain fire: OUTPUT IN=3D OUT=3Deth0 SRC=3D88.198.253.172 D=
ST=3Da.b.c.d LEN=3D68 TOS=3D0x00 PREC=3D0xC0 TTL=3D64 ID=3D13872 PROTO=3DIC=
MP TYPE=3D3 CODE=3D13 [SRC=3Da.b.c.d DST=3D88.198.253.172 LEN=3D40 TOS=3D0x=
00 PREC=3D0x00 TTL=3D57 ID=3D47775 DF PROTO=3DTCP SPT=3D49184 DPT=3D993 WIN=
DOW=3D65535 RES=3D0x00 ACK RST URGP=3D0 ]

lain is an IMAP server. This is not happening in any FORWARDING chain.
I have one more server with this same kind of problem. "ACK RST" and
"ACK FIN" packets are involved.

> $ uname -a
> Linux lain 2.6.22-gentoo-r8-lain #2 SMP Wed Oct 24 13:48:14 CEST 2007 x86=
_64 AMD Athlon(tm) 64 X2 Dual Core Processor 3800+ AuthenticAMD GNU/Linux

> sysctl -a| grep -i conntrack
> net.netfilter.nf_conntrack_generic_timeout =3D 600
> net.netfilter.nf_conntrack_max =3D 65536
> net.netfilter.nf_conntrack_count =3D 127
> net.netfilter.nf_conntrack_buckets =3D 8192
> net.netfilter.nf_conntrack_checksum =3D 1
> net.netfilter.nf_conntrack_log_invalid =3D 1
> net.netfilter.nf_conntrack_tcp_timeout_syn_sent =3D 120
> net.netfilter.nf_conntrack_tcp_timeout_syn_recv =3D 60
> net.netfilter.nf_conntrack_tcp_timeout_established =3D 432000
> net.netfilter.nf_conntrack_tcp_timeout_fin_wait =3D 120
> net.netfilter.nf_conntrack_tcp_timeout_close_wait =3D 60
> net.netfilter.nf_conntrack_tcp_timeout_last_ack =3D 30
> net.netfilter.nf_conntrack_tcp_timeout_time_wait =3D 120
> net.netfilter.nf_conntrack_tcp_timeout_close =3D 10
> net.netfilter.nf_conntrack_tcp_timeout_max_retrans =3D 300
> net.netfilter.nf_conntrack_tcp_loose =3D 1
> net.netfilter.nf_conntrack_tcp_be_liberal =3D 0
> net.netfilter.nf_conntrack_tcp_max_retrans =3D 3
> net.netfilter.nf_conntrack_udp_timeout =3D 30
> net.netfilter.nf_conntrack_udp_timeout_stream =3D 180
> net.netfilter.nf_conntrack_icmp_timeout =3D 30
> net.nf_conntrack_max =3D 65536

The rules are basically like the following set:

> $fw -A INPUT -m state --state INVALID -j LOG --log-prefix "fire: INVALID "
> $fw -A INPUT  -i $dev -m state --state ESTABLISHED,RELATED -s $world -d $=
myip -j ACCEPT
> $fw -A OUTPUT -o $dev -m state --state ESTABLISHED,RELATED -d $world -s $=
myip -j ACCEPT
> $fw -A INPUT -i $dev -p tcp -m tcp -m state --state NEW --syn -s $world -=
-sport 1024: -d $myip --dport 993 -j ACCEPT

Those rules are working most of the time. But there are quite a number
of invalid connections...

Bye,
    Aiko
--=20
:wq

--SUOF0GtieIMvvwua
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFHOseyemsPkv+IVCERAjHyAJ460GkzXlA0zUX9XjtA5D9xdnLsXwCaA3tl
RcI1WnRBJxLOjBEkFro7NP0=
=KsF3
-----END PGP SIGNATURE-----

--SUOF0GtieIMvvwua--
