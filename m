From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: More ethernet port same ip address
Date: Sat, 19 Jul 2008 18:34:44 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0807191831580.21244@fbirervta.pbzchgretzou.qr>
References: <48819901.6030604@unipex.it> <4881F3A3.3080502@solutti.com.br> <alpine.LNX.1.10.0807191613060.10846@fbirervta.pbzchgretzou.qr> <488204EB.3090902@unipex.it> <alpine.LNX.1.10.0807191739560.21244@fbirervta.pbzchgretzou.qr>
 <488213AC.2050508@solutti.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <488213AC.2050508@solutti.com.br>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="utf-8"
To: =?UTF-8?Q?Leonardo_Rodrigues_Magalh=C3=A3es?= <leolistas@solutti.com.br>
Cc: ML netfilter <netfilter@vger.kernel.org>


On Saturday 2008-07-19 18:17, Leonardo Rodrigues Magalh=C3=A3es wrote:
> Jan Engelhardt escreveu:
>>
>> The fact is, you do not know in advance which is the right one.
>
>   the idea is that you dont need to worry about knowing what is the r=
ight
> interface .... bridging code will take care of sending it to the righ=
t
> interface. There's absoltely no 'routing' involved here !!!

Except that I explained why routing fails...

>   the only thing you need to be aware is that on this situation you c=
annot
> have the same ip address on different physical segments.

Yes you can. If you meant "the same subnet", then that's more correct.

No need to lecture me, I've been there, done that, and did it all.
In fact, having the right ARP entries is enough to make routing select
the right interface, you do not strictly need a bridge interface.

> Dont forget altough
> they are on different physical network segments, the bridge interface=
 will make
> them appears as being on the same physical one. So, you cant have the=
 same ip
> address on two physical segments, because with bridging, there wont h=
ave
> different segments !!! You'll have a single physical and logical netw=
ork
> segment.
>
>   if you dont have confliting ip addresses (which you absolutely cant=
 have),
> there's no need to worry about routing, about 'going on the right int=
erface'
> .... bridge interface will take care of everything !
>
> --=20
>
>
> 	Atenciosamente / Sincerily,
> 	Leonardo Rodrigues
> 	Solutti Tecnologia
> 	http://www.solutti.com.br
>
> 	Minha armadilha de SPAM, N=C3=83O mandem email
> 	gertrudes@solutti.com.br
> 	My SPAMTRAP, do not email it
>
>
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

