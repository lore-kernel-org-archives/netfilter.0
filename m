From: "Tim Ritberg" <tim_rit@gmx.de>
Subject: Incoming packet in wrong chain
Date: Sun, 08 Feb 2009 18:17:52 +0100
Message-ID: <20090208171752.32010@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hi!

I got Kernel 2.6.22 und do some Masquerade for my Windows boxes.

My problem get visible in this rule:
Chain INPUT (policy DROP 0 packets, 0 bytes)
113 87963 DROP_LOG 0 --  ppp0 * 0.0.0.0/0 0.0.0.0/0 state NEW

This rule is at bottom of my INPUT-Chain.

Kernel says:
DROP: IN=3Dppp0 OUT=3D MAC=3D SRC=3D217.13.68.183 DST=3D91.xx.xx.xx LEN=
=3D58 TOS=3D0x00 PREC=3D0x00 TTL=3D59 ID=3D55058 DF PROTO=3DTCP SPT=3D8=
0 DPT=3D2409 WINDOW=3D14520 RES=3D0x00 ACK URGP=3D0

This ACK packet belongs to surfing WWW and should never get into INPUT-=
Chain. The problem occurs randomly.
Is this a bug? A why hit a rule for SYN packets at ACK packets?

--=20
Jetzt 1 Monat kostenlos! GMX FreeDSL - Telefonanschluss + DSL=20
f=FCr nur 17,95 Euro/mtl.!* http://dsl.gmx.de/?ac=3DOM.AD.PD003K11308T4=
569a
