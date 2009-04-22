From: "Jorge Bastos" <mysql.jorge@decimal.pt>
Subject: Re: How to do nat filtering in 1.4.3.2
Date: Wed, 22 Apr 2009 23:18:27 +0100 (WEST)
Message-ID: <3404.87.196.144.12.1240438707.squirrel@webmail.decimal.pt>
References: <3276.87.196.144.12.1240436887.squirrel@webmail.decimal.pt>
    <49EF9337.7000304@solutti.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <49EF9337.7000304@solutti.com.br>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Leonardo Rodrigues <leolistas@solutti.com.br>
Cc: netfilter@vger.kernel.org

(sending the second time 'cause message got bloqued 1st)
Hum well,
I'm doing the ACCEPT to the ports I want to be reachable to the out wor=
ld,
and in the end add a DROP so that the rest of the ports get unreachable=
,
well it was working.
In fact I didn't spent many time when I've built this rules, and they h=
ave
about 5 years, I'm just checking this 'cause of this new situation.

Going to try the FORWARD and report success or not.

Thanks,
Jorge,

PS:Already tested and works perfectly. I guess this should be the place=
 i
should used the rules to do nat filtering from the beginning, correct?


> Jorge Bastos escreveu:
>>
>> I use this, to allow the users that are using my linux machine, acti=
on
>> as
>> a router, to connect to the outside world only to the ports I want, =
and
>> block some stuff.
>> How to do this now on?
>>
>>
>
>     now you'll have to do it on the place you should have done that:
>
> iptables -t filter -A FORWARD ......
>
> or simply
>
> iptables -A FORWARD
>
> if not specified, -t filter is used.
>
>
>     your rules are strange .... usually default action for NAT tables
> are ACCEPT. Of course that can be changed, but that would require tha=
t
> you really understand what you're doing. Your default policy is proba=
bly
> ACCEPT and, in that case, ACCEPT rules arent necessary at all.
>
>
> --
>
>
> 	Atenciosamente / Sincerily,
> 	Leonardo Rodrigues
> 	Solutti Tecnologia
> 	http://www.solutti.com.br
>
> 	Minha armadilha de SPAM, N=C3O mandem email
> 	gertrudes@solutti.com.br
> 	My SPAMTRAP, do not email it
>
>
>
>
>


