From: =?ISO-8859-1?Q?Leonardo_Rodrigues_Magalh=E3es?= 
	<leolistas@solutti.com.br>
Subject: Re: how to do a MAC-based filtering for NAT
Date: Sun, 09 Dec 2007 09:31:27 -0200
Message-ID: <475BD20F.6030206@solutti.com.br>
References: <9a9df61d0712082111s90a5fa3o4d272b2c1dacc1f1@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <9a9df61d0712082111s90a5fa3o4d272b2c1dacc1f1@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Deephay <tudoxxx@gmail.com>
Cc: netfilter@vger.kernel.org


    Yes it works if you have the correct rules.

    Are these 2 FORWARD rules your only rules ????? If no, please post=20
your full ruleset.

    If yes ..... i can clearly see 2 problems.

    You have not told us about your scenario, but i'll suppose you have=
=20
the simple scenario of a linux box with 2 NICs, forwarding packets=20
between NICs. The --mac-source rule you made WILL work. But you're=20
clearly missing some rule that allow packets to came back, the replies.=
=20
You're allowing the packet to go out, but not allowing replies to get=20
back. So, 'it will not work'. Based on your scenario, you certainly nee=
d=20
some rules to allow the return traffic.

    And if these are your only 2 rules, then you're simply forwarding,=20
there's no NAT rule here. Packets will be forwarded but the original ip=
=20
address will be kept, that means, no Network Address Translation (NAT)=20
will occur. You would need some '-t nat -A POSTROUTING' rule for doing=20
the Source NAT.


Deephay escreveu:
> Greetings all,
>
> I am wondering how to do a MAC-based filtering for a NAT:
>
> iptables -P FORWARD DROP
> iptables -A FORWARD -m mac --mac-source xxxxxxxx -j ACCEPT
>
> the above things will not work, is there a way to achieve this? thank=
s!
>
>  =20

--=20


	Atenciosamente / Sincerily,
	Leonardo Rodrigues
	Solutti Tecnologia
	http://www.solutti.com.br

	Minha armadilha de SPAM, N=C3O mandem email
	gertrudes@solutti.com.br
	My SPAMTRAP, do not email it




