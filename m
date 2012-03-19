From: Micheal Wolfskill <tdgh2323@hotmail.com>
Subject: Help with invalid packets.
Date: Mon, 19 Mar 2012 15:39:37 +0000
Message-ID: <BLU144-W3712D3E518F5611A6BD840D0420@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org


I have this rule:
=20
 $IPT=A0=A0-A INPUT -i ${PUB_IF} -m state --state INVALID -j DROP
=20
 The problem is its matching legitimate packets of visitors (including =
me) that navigate my site... As i can see in the logs.
=20

 Its not affecting the normal viewing of my site.. but I wish to know=20
why it is matching these packets as Iam sure it should not.=20
=20
 Here is the log entry in syslogd
=20
=20
 Mar 16 15:29:36=A0=A0kernel: Invalid=A0=A0IN =3Deth0 OUT=3D
 MAC=3D00:16:3e:44:bf:02:00:11:92:8b:ff:c4:08:00 SRC=3Dxxx.xxxx.xxxx.xx=
xxx DST=3Dxxxx.xxxx.xxxx.xxxx LEN=3D40
 TOS=3D0x00 PREC=3D0x00 TTL=3D47 ID=3D0 DF PROTO=3DTCP SPT=3D6367 DPT=3D=
80 WINDOW=3D0 RES=3D0x00 RST URGP=3D0

Thanks

Mike 		 	   		  