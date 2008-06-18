From: =?ISO-8859-2?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Subject: Re: Why is this traffic dropped?
Date: Wed, 18 Jun 2008 20:03:16 +0200
Message-ID: <48594DE4.9070006@freemail.hu>
References: <200806181711.m5IHBbkX023710@doug.ats.sensis.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <200806181711.m5IHBbkX023710@doug.ats.sensis.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: drabe@sensis.com
Cc: netfilter@vger.kernel.org

Douglas Rabe =EDrta:
> Greetings,
>
> I dont understand why this traffic is dropped?
>
> Jun 18 17:03:39 iahabs1 kernel: IN_DROP: IN=3Deth0 OUT=3D MAC=3D00:1c=
:23:ca:ec:1d:00:1b:53:87:68:c0:08:00 SRC=3D10.192.130.104 DST=3D192.168=
=2E51.1 LEN=3D40 TOS=3D0x00 PREC=3D0x00 TTL=3D119 ID=3D5563 DF PROTO=3D=
TCP SPT=3D35557 DPT=3D80 WINDOW=3D65149 RES=3D0x00 ACK FIN URGP=3D0=20
>
>  =20
Because it is a FIN packet... =3D  ! (NEW,RELATED or ESTABLISHED) but=20
INVALID !!!
> iahabs1:~# iptables -nvL
> Chain INPUT (policy DROP 0 packets, 0 bytes)
>  pkts bytes target     prot opt in     out     source               d=
estination        =20
>  337M   82G ACCEPT     0    --  *      *       0.0.0.0/0            0=
=2E0.0.0/0           state RELATED,ESTABLISHED=20
>  8747  559K ACCEPT     icmp --  *      *       0.0.0.0/0            0=
=2E0.0.0/0           state NEW icmp type 8=20
>   19M 2104M ACCEPT     0    --  lo     *       0.0.0.0/0            0=
=2E0.0.0/0          =20
> 14686  450K ACCEPT     2    --  eth0   *       0.0.0.0/0            2=
24.0.0.0/8        =20
> 26049 2169K ACCEPT     0    --  eth1   *       0.0.0.0/0            0=
=2E0.0.0/0          =20
> 37255 1790K ACCEPT     tcp  --  eth0   *       0.0.0.0/0            0=
=2E0.0.0/0           state NEW multiport dports 80,30001=20
> 9068K  602M ACCEPT     udp  --  eth0   *       0.0.0.0/0            0=
=2E0.0.0/0           state NEW multiport dports 3210=20
>     0     0 ACCEPT     tcp  --  eth3   *       0.0.0.0/0            0=
=2E0.0.0/0           state NEW multiport dports 80,30001=20
>    91  3640 LOG        0    --  *      *       0.0.0.0/0            0=
=2E0.0.0/0           LOG flags 0 level 4 prefix `IN_DROP: '=20
>    91  3640 DROP       0    --  *      *       0.0.0.0/0            0=
=2E0.0.0/0          =20
>
>  =20
Swifty

