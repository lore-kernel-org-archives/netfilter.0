From: Leonardo Rodrigues <leolistas@solutti.com.br>
Subject: Re: How to do nat filtering in 1.4.3.2
Date: Wed, 22 Apr 2009 19:22:24 -0300
Message-ID: <49EF98A0.2030505@solutti.com.br>
References: <3276.87.196.144.12.1240436887.squirrel@webmail.decimal.pt>    <49EF9337.7000304@solutti.com.br> <3404.87.196.144.12.1240438707.squirrel@webmail.decimal.pt>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <3404.87.196.144.12.1240438707.squirrel@webmail.decimal.pt>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Jorge Bastos <mysql.jorge@decimal.pt>
Cc: netfilter@vger.kernel.org

Jorge Bastos escreveu:
> PS:Already tested and works perfectly. I guess this should be the pla=
ce i
> should used the rules to do nat filtering from the beginning, correct=
?
>
>  =20

    absolutely !!! -t filter is the place to filter. -t nat is the plac=
e=20
to do NAT-related stuff, and not filtering.

    if you wanna filter packets coming TO your firewall machine, then=20
your rules should be in INPUT chain

    if you wanna filter packets going out FROM your firewall machine,=20
then your rules should be in OUTPUT chain

    if you wanna filter packets passing your firewall (ie, getting=20
routed), then your rules should be in FORWARD chain. Remember that=20
packets go and come, so depending the case, 2 rules are necessary to=20
fully accept a forwarded packet



--=20


	Atenciosamente / Sincerily,
	Leonardo Rodrigues
	Solutti Tecnologia
	http://www.solutti.com.br

	Minha armadilha de SPAM, N=C3O mandem email
	gertrudes@solutti.com.br
	My SPAMTRAP, do not email it




