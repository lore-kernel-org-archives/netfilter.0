From: Leonardo Rodrigues <leolistas@solutti.com.br>
Subject: Re: Help on outgoing packet (without NAT)
Date: Thu, 22 Sep 2011 14:02:24 -0300
Message-ID: <4E7B6A20.2080207@solutti.com.br>
References: <F5285AA949CB440A96444F060C17749A@poweredge1800> <alpine.LNX.2.01.1109191737100.32518@frira.zrqbmnf.qr> <9C0FCAA46B9040869B79B468CCA7391C@poweredge1800> <alpine.LNX.2.01.1109191755180.6194@frira.zrqbmnf.qr> <5b10ceef17baa191e62d2d9357257887@decimal.pt> <1316641645.9850.225.camel@andybev-desktop> <675a49fcb8ddc3c241fab160c59946d8@decimal.pt> <4E7B64CE.8060107@solutti.com.br> <da2100d26099890bb06e4b87ab5cac93@decimal.pt>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <da2100d26099890bb06e4b87ab5cac93@decimal.pt>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="macroman"; format="flowed"
To: ML netfilter <netfilter@vger.kernel.org>

Em 22/09/11 13:44, Jorge Bastos escreveu:
>
> Well I was convinced that, since I'm not using NAT on this machine,=20
> this couldn't be done on the NAT table.
> Thanks, after all, it works.

     Yes now you're using NAT .... we usually say NAT to some kind of=20
SOURCE NAT, for example done on cable/DSL modens. but any kind of=20
address translation is a NAT, including your case in which you want to=20
change the destination of some packet, usually known as port forwarding=
=2E=20
Yes it's a NAT, a Destination NAT.

     if i'm not mistaken, just pay attention that as you're using NAT=20
and you'll have packets flowing 'through' your machine, you must have t=
he

/proc/sys/net/ipv4/ip_forward

     set to 1

     you also need appropriate FORWARD rules to allow that packets to=20
flow through your machine. If you're running with the default FORWARD=20
ACCEPT default rule and no rules there, than you'll have no problem. Bu=
t=20
keep in mind that packets are going through filter table, FORWARD chain=
=20
and ip_forward must be enabled for that to work.


--=20


	Atenciosamente / Sincerily,
	Leonardo Rodrigues
	Solutti Tecnologia
	http://www.solutti.com.br

	Minha armadilha de SPAM, N=C3=83O mandem email
	gertrudes@solutti.com.br
	My SPAMTRAP, do not email it




