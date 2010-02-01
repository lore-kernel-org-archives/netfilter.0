From: "Andre Schild" <a.schild@aarboard.ch>
Subject: How to debug RST filter ?
Date: Mon, 1 Feb 2010 08:50:15 +0100
Message-ID: <LB95CFD713BF44ce1B06C76BE068BFE90.1265010613.scalix01.aarboard.ch@MHS>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hello,

we are using Debian 2.6.26-2-amd64 with a database server listening on=20
tcp port 2638.
Usually everything works just fine, but sometimes we get connection=20
errors on the server, and then, each time we see firewall entries like=20
this in the syslog:


=46eb  1 07:41:26 sv16 kernel: [34944777.631090] RULE 17 -- DENY IN=3D=20
OUT=3Dlo SRC=3D188.myip DST=3D188.myip LEN=3D40 TOS=3D0x00 PREC=3D0x00 =
TTL=3D64 ID
=3D0 DF PROTO=3DTCP SPT=3D41562 DPT=3D2638 SEQ=3D1506091366 ACK=3D0 WIN=
DOW=3D0=20
RES=3D0x00 RST URGP=3D0
=46eb  1 07:41:29 sv16 kernel: [34944786.286850] RULE 17 -- DENY IN=3D=20
OUT=3Dlo SRC=3D188.myip DST=3D188.myip LEN=3D40 TOS=3D0x00 PREC=3D0x00 =
TTL=3D64 ID
=3D0 DF PROTO=3DTCP SPT=3D41562 DPT=3D2638 SEQ=3D1506091366 ACK=3D0 WIN=
DOW=3D0=20
RES=3D0x00 RST URGP=3D0

In the firewal we even have a rule which allows everything in/out on th=
e=20
lo interface.

It looks like there are some timeouts or state filters which do not wor=
k=20
as intended by us.

Any ideas how I can debug this ?
I can't trace all the traffic on the lo interface, because there is=20
quite heavy load/traffic
on that interface.

Andr=E9
