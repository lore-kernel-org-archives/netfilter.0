From: =?UTF-8?B?TGVvbmFyZG8gUm9kcmlndWVzIE1hZ2FsaMOjZXM=?= 
	<leolistas@solutti.com.br>
Subject: Re: More ethernet port same ip address
Date: Sat, 19 Jul 2008 13:17:48 -0300
Message-ID: <488213AC.2050508@solutti.com.br>
References: <48819901.6030604@unipex.it> <4881F3A3.3080502@solutti.com.br> <alpine.LNX.1.10.0807191613060.10846@fbirervta.pbzchgretzou.qr> <488204EB.3090902@unipex.it> <alpine.LNX.1.10.0807191739560.21244@fbirervta.pbzchgretzou.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.1.10.0807191739560.21244@fbirervta.pbzchgretzou.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="macroman"; format="flowed"
To: ML netfilter <netfilter@vger.kernel.org>



Jan Engelhardt escreveu:
>
> The fact is, you do not know in advance which is the right one.
>
>  =20

    the idea is that you dont need to worry about knowing what is the=20
right interface .... bridging code will take care of sending it to the=20
right interface. There's absoltely no 'routing' involved here !!!

    the only thing you need to be aware is that on this situation you=20
cannot have the same ip address on different physical segments. Dont=20
forget altough they are on different physical network segments, the=20
bridge interface will make them appears as being on the same physical=20
one. So, you cant have the same ip address on two physical segments,=20
because with bridging, there wont have different segments !!! You'll=20
have a single physical and logical network segment.

    if you dont have confliting ip addresses (which you absolutely cant=
=20
have), there's no need to worry about routing, about 'going on the righ=
t=20
interface' .... bridge interface will take care of everything !

--=20


	Atenciosamente / Sincerily,
	Leonardo Rodrigues
	Solutti Tecnologia
	http://www.solutti.com.br

	Minha armadilha de SPAM, N=C3=83O mandem email
	gertrudes@solutti.com.br
	My SPAMTRAP, do not email it




