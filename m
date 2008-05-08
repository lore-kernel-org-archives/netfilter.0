From: =?ISO-8859-2?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Subject: Re: accept rule not working.
Date: Thu, 08 May 2008 11:28:18 +0200
Message-ID: <4822C7B2.3070006@freemail.hu>
References: <200805072125.m47LPku7018772@indigo.cs.bgu.ac.il>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <200805072125.m47LPku7018772@indigo.cs.bgu.ac.il>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: "eial@cs.bgu.ac.il" <eial@cs.bgu.ac.il>
Cc: netfilter@vger.kernel.org

eial@cs.bgu.ac.il =EDrta:
> 607K  804M ACCEPT     all  --  eth0   *       0.0.0.0/0            0.=
0.0.0/0           state RELATED,ESTABLISHED
>    0     0 ACCEPT     tcp  --  eth0   *       192.168.113.94       0.=
0.0.0/0           state NEW tcp spt:80
>  930  574K LOG        all  --  eth0   *       0.0.0.0/0            0.=
0.0.0/0           LOG flags 0 level 4 prefix `Rejected: '
>  930  574K REJECT     all  --  eth0   *       0.0.0.0/0            0.=
0.0.0/0           reject-with icmp-port-unreachable
>
> rejection log example:
> Rejected: IN=3Deth0 OUT=3D MAC=3Dmymacaddress SRC=3D192.168.113.94 DS=
T=3D192.168.114.2 LEN=3D40 TOS=3D0x00 PREC=3D0x00 TTL=3D52 ID=3D0 DF PR=
OTO=3DTCP SPT=3D80 DPT=3D59173 WINDOW=3D0 RES=3D0x00 RST URGP=3D0
>
>  =20
Yes... Correct...
These packets are not in the state of NEW,RELATED,ESTABLISHED...
Maybe just INVALID...

Swifty


