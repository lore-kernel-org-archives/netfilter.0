From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: How do I read my state from this log?
Date: Thu, 07 Jan 2010 12:39:52 +0100
Message-ID: <4B45C808.8030700@plouf.fr.eu.org>
References: <4B44E71A.5060301@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4B44E71A.5060301@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hello,

MargoAndTodd a =E9crit :
>=20
> How do I determine the "state" from from this logged packet?
>=20
> kernel: dsl-out Everything Else IN=3D OUT=3Deth1 SRC=3D192.168.1.46=20
> DST=3Dxxx.yyy.zzz.www LEN=3D60 TOS=3D0x00 PREC=3D0x00 TTL=3D64 ID=3D5=
2504 DF=20
> PROTO=3DTCP SPT=3D60588 DPT=3D52423 WINDOW=3D5840 RES=3D0x00 SYN URGP=
=3D0

LOG does not report the conntrack state. You can create different rules
with different --log-prefix chains for each state.
