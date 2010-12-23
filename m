From: Julien Vehent <julien@linuxwall.info>
Subject: Re: Fair queuing with htb
Date: Thu, 23 Dec 2010 01:01:05 -0500
Message-ID: <e9bfeb9388be8dfecf83abe056c3d8fc@localhost>
References: <201012230226.31297.gregoire.leroy@hyperthese.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=linuxwall.info; h=
	mime-version:content-type:date:from:to:cc:subject:in-reply-to
	:references:message-id:content-transfer-encoding; s=lnw-dkim;
	 bh=iQs7S6IkcLC71M+Y2XaILpMZGflj7BtGZEispLbgTkg=; b=YybqDlUETvr0
	9Kq20llcmmp3A5LsJAL4gVi6V/sEFF8iX4+9gAhpdFgcCUYU5rkzKDFaZPKqA0eu
	+G9ZnhkMSg9/UrI9oBG6iLQlMyUN9i6Lat5zyYIzRFdGUnQ+sZ8hoqfCQnS0eqxI
	5Bf7o58fjm7B0qLozAQ+laHvKkydpjM=
In-Reply-To: <201012230226.31297.gregoire.leroy@hyperthese.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: =?UTF-8?Q?Gr=C3=A9goire_Leroy?= <gregoire.leroy@hyperthese.net>
Cc: netfilter@vger.kernel.org

On Thu, 23 Dec 2010 02:26:21 +0100, Gr=C3=A9goire Leroy <gregoire.leroy=
@hyperthese.net> wrote:
> Hello,
>=20
> I try to make fair queuing with htb for the http protocol but my filt=
ers seem
> doesn't work.
>=20
> The packets are marked by Squid (tcp_outgoing_mark, a feature of the =
latest=20
> version of squid enables this).
>=20
> I have verified in the iptables logs that the packet are really marke=
d. Here=20
> an example :
>=20
> Dec 22 22:05:05 batman kernel: [1494086.818746] IN=3D OUT=3Deth0 SRC=3D=
172.17.0.8=20
> DST=3D172.17.0.10 LEN=3D60 TOS=3D0x00 PREC=3D0x00 TTL=3D64 ID=3D65025=
 DF PROTO=3DTCP=20
> SPT=3D40407 DPT=3D80 WINDOW=3D5840 RES=3D0x00 SYN URGP=3D0 MARK=3D0x1
>=20
> It seems work inasmuch as we can see "MARK=3D0x1".
>=20
> Below I paste my script. The relevant point is the filters : indeed, =
whatever
> the way I configure the class 1:20 and 1:10, it changes nothing.
>=20
> Have I done a misconfiguration ?
>=20
> I precise my server uses Debian Squeeze i386, and libnetfilter-conntr=
ack3 is=20
> installed.
>=20
> #!/bin/bash
> INT=3D"eth0"
> BAND=3D"12000kbit"
> RATE=3D"63kbit"
>=20
> tc qdisc del dev $INT root
> tc qdisc add dev $INT root handle 1: htb default 30
>=20
> tc class add dev $INT parent 1: classid 1:1 htb rate 100mbit burst 15=
k=20
> tc class add dev $INT parent 1:1 classid 1:10 htb rate 63kbit ceil 12=
00kbit=20
> burst 15k=20
> tc class add dev $INT parent 1:1 classid 1:30 htb rate 88mbit burst 1=
5k=20
> tc class add dev $INT parent 1:1 classid 1:20 htb rate $RATE ceil $RA=
TE burst
> 15k=20
>=20
> tc filter add dev $INT parent 1:0 protocol ip handle 0x1 fw flowid 1:=
10
> tc filter add dev $INT protocol ip handle 0x55 fw flowid 1:20
>=20

Not sure about the handle 0x1. I usually only use the decimal value.

Try the following filters:

tc filter add dev $INT parent 1:0 protocol ip prio 1 handle 1 fw flowid=
 1:10
tc filter add dev $INT parent 1:0 protocol ip prio 2 handle 55 fw flowi=
d 1:20


and check your filters and classes with the following commands:

# tc -s filter show dev eth0
# tc -s class show dev eth0

Julien
