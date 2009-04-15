From: =?koi8-r?Q?=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF_?=
	 =?koi8-r?Q?=EB=CF=D3=D4=C9=CB?= <casper@meteor.dp.ua>
Subject: Re: NAT and a public IP
Date: Wed, 15 Apr 2009 21:05:30 +0300
Message-ID: <1239818730.4307.6.camel@casper.meteor.dp.ua>
References: <4658.204.184.27.217.1239814019.squirrel@mail.bloomfield.k12.mo.us>
Reply-To: casper@meteor.dp.ua
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4658.204.184.27.217.1239814019.squirrel@mail.bloomfield.k12.mo.us>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="koi8-r"
To: sgmayo@mail.bloomfield.k12.mo.us
Cc: netfilter@vger.kernel.org

=F7 =F3=D2=C4, 15/04/2009 =D7 11:46 -0500, sgmayo@mail.bloomfield.k12.m=
o.us =D0=C9=DB=C5=D4:
> I have my machines on a private network that are then NATed to one of=
 my
> public IPs.
>=20
> i.e.
> IPTABLES -t nat -A POSTROUTING -o eth0 -j SNAT --to-source $Public_IP
>=20
> Every once in a bit I need to do something with a public IP other tha=
n the
> one that is SNATed.  I usually just plug the machine into the public =
side
> of the switch and let it have a public IP.
>=20
> I was just curious if there was a way that I could stick the public I=
P
> machine inside my private network and have my IPTABLEs route anything
> coming from ETH1 (my private network card) with a public IP that is w=
ithin
> my public IP range, to just go on to the outside world without gettin=
g
> SNATed.
>=20
> In othewords if I put public ip xx.xx.xx.xx in a windows machine and =
stuck
> it in my private network then it would still have public ip xx.xx.xx.=
xx
> instead of $Public_IP (from the above SNAT) when it came out of my bo=
x.

I would do that like this:

iptables -t nat -A POSTROUTING -o ext_if -s $Privat_IP2 -j SNAT
--to-source $Public_IP2
iptables -t nat -A PREROUTING -i ext_if -d $Public_IP2 -j DNAT
--to-destination $Privat_IP2

--=20
=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF =EB=CF=D3=D4=C9=CB <casper@meteor.dp.=
ua>

