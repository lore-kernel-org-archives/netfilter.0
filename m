From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Invalid argument Error : DNAT rule at OUTPUT chain in arm-linux
 box
Date: Fri, 12 Oct 2007 17:33:50 +0200
Message-ID: <470F93DE.5060307@plouf.fr.eu.org>
References: <470f9225.1997600a.2d3f.3a27@mx.google.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <470f9225.1997600a.2d3f.3a27@mx.google.com>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Hello,

Sathish Kumar.R a =E9crit :
>=20
> I have a problem while executing the followng DNAT rule at arm-linux =
box,
>=20
> Box =3D "Linux 2.4.27-uc1 #6 Mon Oct 8 22:12:01 IST 2007 armv5b unkno=
wn"
> iptables version: "iptables v1.2.7a"
>=20
> Executed Rule
> -------------
> iptables -t nat -A OUTPUT -p tcp --dport 80 -j DNAT --to-destination
> 10.0.1.1
> iptables: Invalid argument
> ..
>=20
> the above rule executed on intel box without any errors,
> even the same rule at PREROUTING chain working successfully on arm-li=
nux box
> but in OUTPUT chain, i am getting this trouble, as "iptables: Invalid
> argument" =20

NAT in the OUTPUT chain is optional until version 2.4.29. Check that=20
your kernel has CONFIG_IP_NF_NAT_LOCAL=3Dy.
