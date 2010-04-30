From: Simon Tennant <simon@imaginator.com>
Subject: corrupted ulog from iptables
Date: Fri, 30 Apr 2010 21:00:10 +0200
Message-ID: <4BDB28BA.40001@imaginator.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=imaginator.com;
	s=mail; t=1272654017;
	bh=ByTYsOYSFVDM9UXhI78fwKpAohQRYojZtX9HS9r5Uu8=;
	h=Message-ID:Date:From:MIME-Version:To:Subject:Content-Type:
	 Content-Transfer-Encoding;
	b=ae57hbtJSYcccrkLvPQJ8oQd1/muRRXXiJN4jy8haEmSvVqm/Pmtga6WWSPkoufdn
	 LIL8J9jWZMbDP50lfNoyAcmWQ2JUnDr+fedPtxgXrg3IvNdsLPeWUAbjduudtSG3vU
	 eGJ3aJuqqfKT2HhtN8ZrqWIcBbXGHwb3enr9em70=
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=imaginator.com;
	s=mail; t=1272654010;
	bh=ByTYsOYSFVDM9UXhI78fwKpAohQRYojZtX9HS9r5Uu8=;
	h=Message-ID:Date:From:MIME-Version:To:Subject:Content-Type:
	 Content-Transfer-Encoding;
	b=G2BOm7OTCvOSKqNj2s7rZvVU9178aGrS5Qrd83Q43zaD3LK0UIYOQ1cpvegEpVk+d
	 gjWsXWwXaC9oD4Sb3vhckfdj1G4Nw1NIQLUDR4Pjd7JGIVio6fqgafU/z5kSEjGBWg
	 oxc/+viRGhoE7WBUKjKfNoEjl73bL6XjMXf4ZJ1Y=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: netfilter@vger.kernel.org

=46irewall logging works fine on all my other hosts with an identical=20
(afaik) config.

One host with the same settings always received corrupted log files.

    * timestamps always beginning of the epoch
    * binary characters
    * lots of control characters

uname -a
2.6.31-14-server #48-Ubuntu SMP Fri Oct 16 15:07:34 UTC 2009 x86_64=20
GNU/Linux

logging is done with:

$IPTABLES -N drop-log-inbound
$IPTABLES -A drop-log-inbound -m limit --limit 60/minute -j ULOG=20
--ulog-prefix drop-log-inbound:
$IPTABLES -A drop-log-inbound -j DROP

ulogd -V
ulogd Version 1.23

iptables -V
iptables v1.4.1.1

tail -f /var/log/firewall.log [06:43am/04-29-10]
Jan 1 00:00:00 cave IN=3Dt
OUT=3D MAC=3D SRC=3D107.66.10.65 DST=3D99.116.105.118 LEN=3D8224 TOS=3D=
00 PREC=3D0x20=20
TTL=3D51 ID=3D8248 MF FRAG:4404 PROTO=3D56
Jan 1 00:00:00 cave IN=3D=EF=BF=BD OUT=3D=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=
=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD MAC=3D SRC=3D61.34.=
47.117=20
DST=3D115.101.114.47 LEN=3D28788 TOS=3D08 PREC=3D0x60 TTL=3D110 ID=3D26=
991 DF MF=20
=46RAG:3616 PROTO=3D111
Jan 1 00:00:00 cave IN OUT=3D MAC=3D SRC=3D111.109.34.62 DST=3D60.101.1=
18.101=20
LEN=3D25700 TOS=3D14 PREC=3D0x60 TTL=3D117 ID=3D31075 DF MF FRAG:3183 P=
ROTO=3D100
Jan 1 00:00:00 cave 42679 58724( IN=3DL OUT=3D MAC=3D SRC=3D56.57.53.32=
=20
DST=3D48.32.48.10 LEN=3D13367 TOS=3D10 PREC=3D0x20 TTL=3D55 ID=3D8242 M=
=46 FRAG:6194=20
PROTO=3D32

grep -v \^\# /etc/ulogd.conf
[global]
nlgroup=3D1
logfile=3D"/var/log/ulog/ulogd.log"
loglevel=3D5
plugin=3D"/usr/lib/ulogd/ulogd_BASE.so"
plugin=3D"/usr/lib/ulogd/ulogd_LOGEMU.so"
[LOGEMU]
file=3D"/var/log/firewall.log"
sync=3D1

Has anyone else had similar issues? Any ideas on what I could do to=20
diagnose this further?

S.

--=20
Simon Tennant

+44 20 7043 6756 (UK - office)
+49 17 8545 0880 (Germany - mobile)
+49 89 4209 55854 (Germany - office)
skype: simontennant
xmpp: simon@buddycloud.com

