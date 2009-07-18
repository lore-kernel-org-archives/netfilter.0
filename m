From: Patrick McHardy <kaber@trash.net>
Subject: Re: HFSC scheduling and Linux vlans
Date: Sat, 18 Jul 2009 08:22:04 +0200
Message-ID: <4A616A0C.4000005@trash.net>
References: <bf0e93a30907172138lea3f7efu9656f58e360a64eb@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <bf0e93a30907172138lea3f7efu9656f58e360a64eb@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: =?ISO-8859-15?Q?Jorge_D=E1vila?= <jorgedavilalopez@gmail.com>
Cc: netfilter@vger.kernel.org

Jorge D=E1vila wrote:
> The actual configuration works using HTB scheduling but when I tried
> apply the HFSC configuration there is no traffic through any
> interfaces.
>=20
> This is the output
>=20
> tc -s filter show dev eth1; tc -s class show dev eth1
> filter parent 1: protocol ip pref 1 fw
> filter parent 1: protocol ip pref 1 fw handle 0x17 classid 1:23
> filter parent 1: protocol ip pref 1 fw handle 0x30 classid 1:48
> filter parent 1: protocol ip pref 2 fw
> filter parent 1: protocol ip pref 2 fw handle 0x10 classid 1:16
> filter parent 1: protocol ip pref 3 fw
> filter parent 1: protocol ip pref 3 fw handle 0x20 classid 1:32
> filter parent 1: protocol ip pref 3 fw handle 0x80 classid 1:128
> filter parent 1: protocol ip pref 4 fw
> filter parent 1: protocol ip pref 4 fw handle 0x5 classid 1:5
> filter parent 1: protocol ip pref 4 fw handle 0x15 classid 1:21
> filter parent 1: protocol ip pref 6 fw
> filter parent 1: protocol ip pref 6 fw handle 0x4 classid 1:4
> filter parent 1: protocol ip pref 6 fw handle 0x6 classid 1:6
> filter parent 1: protocol ip pref 6 fw handle 0x9 classid 1:9
> filter parent 1: protocol ip pref 7 fw
> filter parent 1: protocol ip pref 7 fw handle 0x2 classid 1:102
> filter parent 1: protocol ip pref 7 fw handle 0x3 classid 1:3
> filter parent 1: protocol ip pref 7 fw handle 0x7 classid 1:7
> filter parent 1: protocol ip pref 7 fw handle 0x8 classid 1:8
> filter parent 1: protocol ip pref 7 fw handle 0xa classid 1:10
> filter parent 1: protocol ip pref 7 fw handle 0xe classid 1:14
> filter parent 1: protocol ip pref 7 fw handle 0x11 classid 1:17
> filter parent 1: protocol ip pref 7 fw handle 0x13 classid 1:19

You're missing arp classification.
