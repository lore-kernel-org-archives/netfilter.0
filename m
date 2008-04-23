From: =?UTF-8?B?TGVvbmFyZG8gUm9kcmlndWVzIE1hZ2FsaMOjZXM=?= 
	<leolistas@solutti.com.br>
Subject: Re: IPTables : How to force data coming from ethX being output by
 the same device
Date: Wed, 23 Apr 2008 12:38:00 -0300
Message-ID: <480F57D8.1060704@solutti.com.br>
References: <c4ecb9830804230703q3f3cc02doc03c34a293d6014c@mail.gmail.com> <480F49BE.60600@solutti.com.br> <alpine.LNX.1.10.0804231641310.13697@fbirervta.pbzchgretzou.qr> <480F4CD9.4020006@solutti.com.br> <alpine.LNX.1.10.0804231717190.13697@fbirervta.pbzchgretzou.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.1.10.0804231717190.13697@fbirervta.pbzchgretzou.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="macroman"; format="flowed"
To: Jan Engelhardt <jengelh@computergmbh.de>
Cc: ML netfilter <netfilter@vger.kernel.org>



Jan Engelhardt escreveu:
>
> It is not completely not related. By changing things such as
> nfmark, TOS field, source or destination address, routing can
> be influenced, so I would not say it's totally unrelated :)
>  =20

    Changing all these parameters will do nothing if you dont have=20
appropriate routing rules that uses them as routing criteria parameters=
=2E

    Well .... yes, it's not completly unrelated, iptables really can=20
'help' routing decisions with those things.

    iptables can be used to help routing decisions, but this is not the=
=20
only way of doing it. You can have your source routing rules and get=20
advanced routing without iptables rules, it's not required, but yes can=
=20
be used sometimes. On pretty advanced routing situations, maybe iptable=
s=20
'helping' rules would be necessary, but advanced routing can be done=20
without iptables.


--=20


	Atenciosamente / Sincerily,
	Leonardo Rodrigues
	Solutti Tecnologia
	http://www.solutti.com.br

	Minha armadilha de SPAM, N=C3=83O mandem email
	gertrudes@solutti.com.br
	My SPAMTRAP, do not email it




