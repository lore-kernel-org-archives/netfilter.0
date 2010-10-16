From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Port forwarding problem
Date: Sat, 16 Oct 2010 15:13:34 +0200
Message-ID: <4CB9A4FE.1050905@plouf.fr.eu.org>
References: <4CB9A03C.7020700@uninorte.edu.co>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4CB9A03C.7020700@uninorte.edu.co>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hello,

Carlos Mtz-Troncoso a =E9crit :
>=20
> My server has 2 network cards, eth0 is for Internet with an IP addres=
s=20
> fixed, and eth1, 10.1.1.1/16 is for local network (10.1.0.0/16). In t=
his=20
> server I have OpenVPN working well and the is used as gateway.
>=20
> My script worked well and the last change was to add a port forwardin=
g:=20
> the traffic from IP public port 2020 is sent to a internal web sever=20
> 10.1.1.7:80. The internal server has as gateway 10.1.1.1 (my Linux=20
> IPTables box).
>=20
> My problem is that the port forwarding is not working, here is my scr=
ipt.
[...]
> Where is my error?

IMO the rule in FORWARD accepting the port-forwarded packets is missing=
=2E
