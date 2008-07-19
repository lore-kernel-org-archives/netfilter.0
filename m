From: =?ISO-8859-1?Q?Leonardo_Rodrigues_Magalh=E3es?= 
	<leolistas@solutti.com.br>
Subject: Re: More ethernet port same ip address
Date: Sat, 19 Jul 2008 11:01:07 -0300
Message-ID: <4881F3A3.3080502@solutti.com.br>
References: <48819901.6030604@unipex.it>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <48819901.6030604@unipex.it>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Michele Petrazzo - Unipex srl <michele.petrazzo@unipex.it>
Cc: netfilter@vger.kernel.org



Michele Petrazzo - Unipex srl escreveu:
> Hi all,
> this is a very strange ask (I don't find any other on the net)...
>
> I need to setup a linux box with more than one ethernet ports and eve=
ry
> one must have the same ip address. I, of course :), already tried to=20
> do it
> with a lot of solutions that linux offer (iptables+mark+ip route,=20
> bonding,
> a vlan every port), but with the same result... Packet come into
> the right port but go out through the "last" that I have set, so it w=
ill
> never arrive.=20

    have you tried setting a bridge interface ???

    do NOT give ip address to the real ethernet interfaces (ethX) .....=
=20
simply get them 'up' and them bring a bridge interface up, with the ip=20
address you need, and 'add' all the physical interfaces on the bridge=20
interface.

    that should do the job easily.

    and then get iptables rules on the bridge (probably br0) interface=20
=2E... and there you have it !

--=20


	Atenciosamente / Sincerily,
	Leonardo Rodrigues
	Solutti Tecnologia
	http://www.solutti.com.br

	Minha armadilha de SPAM, N=C3O mandem email
	gertrudes@solutti.com.br
	My SPAMTRAP, do not email it




