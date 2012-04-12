From: Vishal Jumar <vishaljumar@live.com>
Subject: =?windows-1256?Q?Help_with_?= =?windows-1256?Q?INVALID_pa?=
 =?windows-1256?Q?ckets_rule?= =?windows-1256?Q?._Best_way?=
 =?windows-1256?Q?_to_see_th?= =?windows-1256?Q?e_actual_p?=
 =?windows-1256?Q?acket_islo?= =?windows-1256?Q?ating_the_?=
 =?windows-1256?Q?rest=3F=FE?=
Date: Thu, 12 Apr 2012 16:25:45 +0000
Message-ID: <BLU155-W39963085CD8F1B244A4730CB3A0@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-9"
To: netfilter@vger.kernel.org


Hello all.

Iam having many entries product of this rule in my syslog...=20

iptables -A INPUT -m state --state INVALID -j LOG --log-prefix " Invali=
d NOT DROPPED"

Output:
=3D=3D> /var/log/messages <=3D=3D
Apr 12 10:10:04 server3 kernel:=A0 Invalid NOT DROPPED IN=3Deth0 OUT=3D=
 MAC=3D40:40:f1:21:08:d9:e0:5f:b9:4a:5f:ff:08:00 SRC=3D50.50.193.113 DS=
T=3D164.177.152.170 LEN=3D40 TOS=3D0x00 PREC=3D0x00 TTL=3D109 ID=3D2657=
3 DF PROTO=3DTCP SPT=3D56602 DPT=3D80 WINDOW=3D16425 RES=3D0x00 ACK FIN=
 URGP=3D0


How can I view the packet that this rule match is originating?=A0 There=
=A0 must be a better way then sniffing all the traffic for 15 min from =
port 80.. because that would produce toooo much data.

Regards,
Vishal
 		 	   		 =20
