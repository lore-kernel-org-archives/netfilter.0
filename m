From: Leonardo Rodrigues <leolistas@solutti.com.br>
Subject: Re: Help on outgoing packet (without NAT)
Date: Thu, 22 Sep 2011 13:39:42 -0300
Message-ID: <4E7B64CE.8060107@solutti.com.br>
References: <F5285AA949CB440A96444F060C17749A@poweredge1800> <alpine.LNX.2.01.1109191737100.32518@frira.zrqbmnf.qr> <9C0FCAA46B9040869B79B468CCA7391C@poweredge1800> <alpine.LNX.2.01.1109191755180.6194@frira.zrqbmnf.qr> <5b10ceef17baa191e62d2d9357257887@decimal.pt> <1316641645.9850.225.camel@andybev-desktop> <675a49fcb8ddc3c241fab160c59946d8@decimal.pt>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <675a49fcb8ddc3c241fab160c59946d8@decimal.pt>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="macroman"; format="flowed"
To: ML netfilter <netfilter@vger.kernel.org>

Em 22/09/11 12:58, Jorge Bastos escreveu:
>
> Correct, local generated packets.
> Tried:
>
> iptables -I OUTPUT -d 5.5.5.5 -p tcp --dport 80 --redirect-to=20
> 192.168.1.221:80
>
> I'm missing something but not sure what, but it's on the redirect par=
t.

     Your rule is absolutely incomplete and nonsense

     packet redirections should be done on the NAT table. If no table i=
s=20
specified on the command, you'll work on the filter table, which is not=
=20
the one you want here. So '-t nat' is needed.

     the '--redirect-to' is not an argument for any of the known target=
s=20
i know .... but as it seems you want to redirect some packet to another=
=20
machine, than you'll probably want the DNAT target. Anyway, you have no=
t=20
specified any target, so iptables simply doesnt know what to do.

     calling the correct target with correct argument, your rule should=
=20
look something like:

iptables -t nat -I OUTPUT -d 5.5.5.5 -p tcp --dport 80 -j DNAT=20
--to-destination 192.168.1.221

     no need to specify the :80 port to the destination target. If you=20
want to redirect to the same port, you dont need to specify that. You=20
would need to specify if you were changing ports.

--=20


	Atenciosamente / Sincerily,
	Leonardo Rodrigues
	Solutti Tecnologia
	http://www.solutti.com.br

	Minha armadilha de SPAM, N=C3=83O mandem email
	gertrudes@solutti.com.br
	My SPAMTRAP, do not email it




