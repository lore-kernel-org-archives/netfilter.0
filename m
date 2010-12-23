From: =?iso-8859-1?q?Gr=E9goire_Leroy?= <gregoire.leroy@hyperthese.net>
Subject: Fair queuing with htb
Date: Thu, 23 Dec 2010 02:26:21 +0100
Message-ID: <201012230226.31297.gregoire.leroy@hyperthese.net>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart2122125.zx3zvTSZOu";
  protocol="application/pgp-signature";
  micalg=pgp-sha256
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org

--nextPart2122125.zx3zvTSZOu
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello,

I try to make fair queuing with htb for the http protocol but my filters se=
em=20
doesn't work.

The packets are marked by Squid (tcp_outgoing_mark, a feature of the latest=
=20
version of squid enables this).

I have verified in the iptables logs that the packet are really marked. Her=
e=20
an example :

Dec 22 22:05:05 batman kernel: [1494086.818746] IN=3D OUT=3Deth0 SRC=3D172.=
17.0.8=20
DST=3D172.17.0.10 LEN=3D60 TOS=3D0x00 PREC=3D0x00 TTL=3D64 ID=3D65025 DF PR=
OTO=3DTCP=20
SPT=3D40407 DPT=3D80 WINDOW=3D5840 RES=3D0x00 SYN URGP=3D0 MARK=3D0x1

It seems work inasmuch as we can see "MARK=3D0x1".

Below I paste my script. The relevant point is the filters : indeed, whatev=
er=20
the way I configure the class 1:20 and 1:10, it changes nothing.

Have I done a misconfiguration ?

I precise my server uses Debian Squeeze i386, and libnetfilter-conntrack3 i=
s=20
installed.

#!/bin/bash
INT=3D"eth0"
BAND=3D"12000kbit"
RATE=3D"63kbit"

tc qdisc del dev $INT root
tc qdisc add dev $INT root handle 1: htb default 30

tc class add dev $INT parent 1: classid 1:1 htb rate 100mbit burst 15k=20
tc class add dev $INT parent 1:1 classid 1:10 htb rate 63kbit ceil 1200kbit=
=20
burst 15k=20
tc class add dev $INT parent 1:1 classid 1:30 htb rate 88mbit burst 15k=20
tc class add dev $INT parent 1:1 classid 1:20 htb rate $RATE ceil $RATE bur=
st=20
15k=20

tc filter add dev $INT parent 1:0 protocol ip handle 0x1 fw flowid 1:10
tc filter add dev $INT protocol ip handle 0x55 fw flowid 1:20

Thanks for your help,
Gr=E9goire Leroy


--nextPart2122125.zx3zvTSZOu
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iF4EABEIAAYFAk0SpT0ACgkQB3Y8MwGKx1c2cQEAksyUn0UewKkSqXjm26/BtU7g
nvfUUUSSxP1+yBIi5WgA/0lTcW9IJ5UbbcaQ5Gh5lLwPlpK9ENPFr/5nfm7eCG9p
=sm4I
-----END PGP SIGNATURE-----

--nextPart2122125.zx3zvTSZOu--
