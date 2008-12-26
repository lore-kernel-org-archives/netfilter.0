From: =?UTF-8?B?TGVvbmFyZG8gUm9kcmlndWVzIE1hZ2FsaMOjZXM=?= 
	<leolistas@solutti.com.br>
Subject: Re: multiple exclusive DNAT does not work
Date: Fri, 26 Dec 2008 16:57:20 -0200
Message-ID: <49552910.2030503@solutti.com.br>
References: <S1751268AbYLZSRi/20081226181738Z+155@vger.kernel.org> <49552652.1040705@gipi.kg>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <49552652.1040705@gipi.kg>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="macroman"; format="flowed"
To: Aleksei Bebinov <alex@gipi.kg>
Cc: netfilter@vger.kernel.org



Aleksei Bebinov escreveu:
> I do so :
> ---------------
> cat /etc/config/kg-nets | while read LINE
> do
> #iptables -t nat -A PREROUTING -i br-lan -d  !  $LINE -p tcp -m
> multiport --dports  80 -j DNAT --to-destination pr.oxy.ip:3128
>
> done
> --------------------------------------------
>
> My script cat the file line by line and add excluding rules ( with ! =
)
> of nets that i dont need to redirect.
> BUT!
> if only one rule ( for one subnet) persist in table - it works fine, =
and
> if i ll add second  - with second net -  all the traffic redirecting =
to
> proxy - without any  exclusions.
>
>  =20

    wrong rule for your needs. Maybe:

for LINE in `cat /etc/config/kg-nets`; do
    iptables -t nat -A PREROUTING -i br-lan -d $LINE -p tcp --dport 80=20
-j ACCEPT
done
iptables -t nat -A PREROUTING -i br-lan -p tcp --dport 80 -j DNAT=20
--to-destination pr.oxy.ip:3128

    will do it.

    if someone asks me ONE single tip for making iptables easier, i=20
would say "do NOT use negation rules, those with !" ..... they work jus=
t=20
fine, but people rarely understands that it wont allow multiple=20
exclusions and will keep fighting with that. Anyway, anything done with=
=20
negation rules can be written in other single (and easier to understood=
)=20
rules.




--=20


	Atenciosamente / Sincerily,
	Leonardo Rodrigues
	Solutti Tecnologia
	http://www.solutti.com.br

	Minha armadilha de SPAM, N=C3=83O mandem email
	gertrudes@solutti.com.br
	My SPAMTRAP, do not email it




