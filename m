From: =?UTF-8?B?TGVvbmFyZG8gUm9kcmlndWVzIE1hZ2FsaMOjZXM=?= 
	<leolistas@solutti.com.br>
Subject: Re: IPTables : How to force data coming from ethX being output by
 the same device
Date: Wed, 23 Apr 2008 14:31:40 -0300
Message-ID: <480F727C.20608@solutti.com.br>
References: <c4ecb9830804230703q3f3cc02doc03c34a293d6014c@mail.gmail.com> <480F49BE.60600@solutti.com.br> <alpine.LNX.1.10.0804231641310.13697@fbirervta.pbzchgretzou.qr> <480F4CD9.4020006@solutti.com.br> <alpine.LNX.1.10.0804231717190.13697@fbirervta.pbzchgretzou.qr> <480F57D8.1060704@solutti.com.br> <480F64E0.50209@208.195-224-87.telenet.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <480F64E0.50209@208.195-224-87.telenet.ru>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="macroman"; format="flowed"
To: ML netfilter <netfilter@vger.kernel.org>



Alexei Ustyuzhaninov escreveu:
>
> I don't think any routing may be done without iptables. A simple=20
> example: you have two internet connections and want to route all=20
> outgoing smtp traffic (dst port=3D25) to one provider and the rest of=
=20
> the traffic - to the other provider. How can you do this without=20
> marking packets with iptables?
>

    OK ..... but i have 2 internet connections and want some specific=20
IPs (my servers, for example) to go out on link1 and all the other=20
machines reaches internet through link2, then it can be done without=20
iptables, with plain source routing rules.


--=20


	Atenciosamente / Sincerily,
	Leonardo Rodrigues
	Solutti Tecnologia
	http://www.solutti.com.br

	Minha armadilha de SPAM, N=C3=83O mandem email
	gertrudes@solutti.com.br
	My SPAMTRAP, do not email it




