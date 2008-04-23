From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Loopback security...
Date: Wed, 23 Apr 2008 11:44:04 +0200
Message-ID: <480F04E4.9080103@plouf.fr.eu.org>
References: <480D47F6.9080808@riverviewtech.net> <480DC570.80303@solutti.com.br> <480DF156.5060801@riverviewtech.net> <480E1752.2040308@solutti.com.br> <480E4596.9030000@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <480E4596.9030000@riverviewtech.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

Grant Taylor a =E9crit :
>=20
> To me, the concept of the loopback interface is just a very unique=20
> network interface.  Personally I could be equally happy with an ether=
net=20
> interface with a loopback plug in it used as the loopback interface w=
ith=20
> in the system.

Indeed, the loopback interface is a very unique network interface. It i=
s=20
more than just an ethernet interface with a loopback plug. Not only doe=
s=20
it loop back traffic, but also the kernel knows about it.
