From: =?iso-8859-1?q?Gr=E9goire_Leroy?= <gregoire.leroy@hyperthese.net>
Subject: Re: Fair queuing with htb
Date: Thu, 23 Dec 2010 13:30:00 +0100
Message-ID: <201012231330.06888.gregoire.leroy@hyperthese.net>
References: <201012230226.31297.gregoire.leroy@hyperthese.net> <e9bfeb9388be8dfecf83abe056c3d8fc@localhost>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart1915867.3a7Gu4qOQr";
  protocol="application/pgp-signature";
  micalg=pgp-sha256
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <e9bfeb9388be8dfecf83abe056c3d8fc@localhost>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Julien Vehent <julien@linuxwall.info>
Cc: netfilter@vger.kernel.org

--nextPart1915867.3a7Gu4qOQr
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

> Try the following filters:
>=20
> tc filter add dev $INT parent 1:0 protocol ip prio 1 handle 1 fw flowid
> 1:10 tc filter add dev $INT parent 1:0 protocol ip prio 2 handle 55 fw
> flowid 1:20
>=20
>=20
> and check your filters and classes with the following commands:
>=20
> # tc -s filter show dev eth0
> # tc -s class show dev eth0
>=20

# tc -s filter show dev eth0
filter parent 1: protocol ip pref 1 fw=20
filter parent 1: protocol ip pref 1 fw handle 0x1 classid 1:10=20
filter parent 1: protocol ip pref 2 fw=20
filter parent 1: protocol ip pref 2 fw handle 0x37 classid 1:20=20

# tc -s class show dev eth0

class htb 1:1 root rate 100000Kbit ceil 100000Kbit burst 15337b cburst 1600=
b=20
 Sent 908323001 bytes 680443 pkt (dropped 0, overlimits 0 requeues 0)=20
 rate 2976bit 2pps backlog 0b 0p requeues 0=20
 lended: 38250 borrowed: 0 giants: 0
 tokens: 19047 ctokens: 1860

class htb 1:10 parent 1:1 prio 0 rate 63000bit ceil 1200Kbit burst 15Kb cbu=
rst=20
1599b=20
 Sent 2769846 bytes 41947 pkt (dropped 0, overlimits 0 requeues 0)=20
 rate 8bit 0pps backlog 0b 0p requeues 0=20
 lended: 3697 borrowed: 38250 giants: 0
 tokens: -56194 ctokens: 144355

class htb 1:20 parent 1:1 prio 0 rate 63000bit ceil 63000bit burst 15Kb cbu=
rst=20
1599b=20
 Sent 0 bytes 0 pkt (dropped 0, overlimits 0 requeues 0)=20
 rate 0bit 0pps backlog 0b 0p requeues 0=20
 lended: 0 borrowed: 0 giants: 0
 tokens: 30476187 ctokens: 3174593

class htb 1:30 parent 1:1 prio 0 rate 88000Kbit ceil 88000Kbit burst 15Kb=20
cburst 1584b=20
 Sent 905553155 bytes 638496 pkt (dropped 0, overlimits 0 requeues 0)=20
 rate 2968bit 2pps backlog 0b 0p requeues 0=20
 lended: 80486 borrowed: 0 giants: 0
 tokens: 21656 ctokens: 2109


It seems there are packets which pass through the class 1:10.
However, I've dowloaded a 100Mo file, so it seems that most of packets pass=
=20
through the default class...

The cause could be my design...

I have a pc which downloads a file on a web server, through the proxy serve=
r.=20
They are all on the same network. The proxy server has only one network car=
d=20
(eth0).

They are linked by 100Mbit links. Squid mark packets from my pc and send th=
em=20
to netfilter.

Considering these informations, have I miss something in my tc configuratio=
n ?=20
Must I use iptables to mark incoming traffic from the web server ?

Thanks for your help,
Gr=E9goire Leroy

--nextPart1915867.3a7Gu4qOQr
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iF4EABEIAAYFAk0TQMkACgkQB3Y8MwGKx1fb4gD/X14Gk8ebTYYv4rBynPuC/lun
a9adsIhUBOVpTaPMaZgBAJqRI2M0g665QryWZfVIae7ibvGfXkksXmQmncmm3f5J
=2J3+
-----END PGP SIGNATURE-----

--nextPart1915867.3a7Gu4qOQr--
