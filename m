From: =?koi8-r?Q?=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF_?=
	 =?koi8-r?Q?=EB=CF=D3=D4=C9=CB?= <casper@meteor.dp.ua>
Subject: Re: How to do a "double" NAT ?
Date: Wed, 08 Jul 2009 03:18:33 +0300
Message-ID: <1247012313.8471.18.camel@casper.meteor.dp.ua>
References: <9948385e0907071348g3aa24b91of296401ff38e3eea@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <9948385e0907071348g3aa24b91of296401ff38e3eea@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: David =?UTF-8?Q?Bala=C5=BEic?= <xerces9@gmail.com>
Cc: netfilter@vger.kernel.org

=D0=92 =D0=92=D1=82=D0=BE, 07/07/2009 =D0=B2 22:48 +0200, David Bala=C5=
=BEic =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> Hi!
>=20
> I have a bit specific, but not that unusual problem.
>=20
> I have linux 2.4 (OpenWRT 1.0) running on a home router.
> ppp0 has the connection to outside world and br0 is the local network
> and is "NAT-ed".
>=20
> I also have a vlan0 interface with IP address  192.168.1.1. On that
> network there is a host that has a HTTP server on port 80 and accepts
> connections only from 192.168.1.x.
>=20
> What I want is to set up a rule that allows outside hosts (the entire
> internet, ok maybe limited to a single IP) access to that port and of
> course masquerades it to appear as if coming from 192.168.1.x.
>=20
> There I'm lost. I have good unix experience, but managed to avoid
> packet filters until now ;-)

iptables -t nat -A PREROUTING -i ppp0 -p tcp -d <ppp0_IP> --dport 80 -j
DNAT --to-destination 192.168.1.1
iptables -t nat -A POSTROUTING -o br0 -p tcp -d 192.168.1.1 --dport 80
-j SNAT --to-source <br0_IP>

I managed to avoid VLAN setups, so the above will work for the case
without vlan when HTTP server is connected to br0.

--=20
=D0=9F=D0=BE=D0=BA=D0=BE=D1=82=D0=B8=D0=BB=D0=B5=D0=BD=D0=BA=D0=BE =D0=9A=
=D0=BE=D1=81=D1=82=D0=B8=D0=BA <casper@meteor.dp.ua>

