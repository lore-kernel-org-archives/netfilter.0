From: =?UTF-8?B?0b3SieG2rOG4s+KEoA==?= <vtol@gmx.net>
Subject: [nftables] frame logging with vmap?
Date: Wed, 7 Oct 2020 07:38:00 +0000
Message-ID: <0b6d114f-2baa-d883-5053-a5eb96f6a611@gmx.net>
Reply-To: vtol@gmx.net
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1602056322;
        bh=lWw9LBQL1vG9WAKnRnbX1d8APgEwtitkXC0BZK9e78M=;
        h=X-UI-Sender-Class:From:Reply-To:To:Subject:Date;
        b=CEkEVIQmzQsTla89o7ggwPEzCuePlalpPk8LOKV9gwrrqJLUo/CjxZ8WEGrkxKrbK
         gOTTDun0Nv3WfqsoWJTVrzwzs+f0JkW2XK6gWnMCRLMq4Wm2LGEa7Zkk5bHbQYCboc
         BW7ZyEQfTgry/V41IBdl3IeB2WMYogPOjQoucjC8=
Content-Language: en-GB
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

How to log frames that been processed as part of a vmap?


map foo {
 =C2=A0 type icmpv6_type . icmpv6_code : verdict
 =C2=A0 elements =3D {
 =C2=A0=C2=A0=C2=A0 1 . 0 : accept,
 =C2=A0=C2=A0=C2=A0 1 . 1 : accept,
 =C2=A0=C2=A0=C2=A0 1 . 2 : accept,
 =C2=A0=C2=A0=C2=A0 1 . 3 : accept,
 =C2=A0=C2=A0=C2=A0 1 . 4 : accept,
 =C2=A0=C2=A0=C2=A0 1 . 5 : accept,
 =C2=A0=C2=A0=C2=A0 1 . 6 : accept,
 =C2=A0=C2=A0=C2=A0 1 . 7 : accept,
 =C2=A0=C2=A0=C2=A0 1 . 8 : accept,
 =C2=A0=C2=A0=C2=A0 2 . 0 : accept,
 =C2=A0=C2=A0=C2=A0 3 . 0 : accept,
 =C2=A0=C2=A0=C2=A0 3 . 1 : accept,
 =C2=A0=C2=A0=C2=A0 4 . 0 : accept,
 =C2=A0=C2=A0=C2=A0 4 . 1 : accept,
 =C2=A0=C2=A0=C2=A0 4 . 2 : accept,
 =C2=A0=C2=A0=C2=A0 128 . 0 : accept,
 =C2=A0 }
}


putting the log statement after the vmap, e.g.:

icmpv6 type . icmpv6 code vmap @foo log flags all prefix "bar: ";


 =C2=A0does not produce any logging, supposedly since the verdict being=20
terminal and processed prior the log statement. Putting it before the=20
rule however:

log flags all prefix "bar: "icmpv6 type . icmpv6 code vmap @foo;

logs frames out of context of this rule, it logs everything frame that=20
is processed in the chain prior the vmap statement is processed, e.g.:

FW bar: IN=3Dbr-lan OUT=3Dpppoe-wan MACSRC=3Db0:10:41:ba:be:5f=20
MACDST=3Dd8:58:d7:00:79:7a MACPROTO=3D0800 SRC=3D192.168.84.205=20
DST=3Dxxx.xxx.59.84 LEN=3D28 TOS=3D0x00 PREC=3D0x00 TTL=3D4 ID=3D25008 DF=
 PROTO=3DUDP=20
SPT=3D61905 DPT=3D36653 LEN=3D8




