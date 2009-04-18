From: Leonardo Carneiro <lscarneiro@veltrac.com.br>
Subject: Re: Learning iptables
Date: Sat, 18 Apr 2009 10:20:44 -0300
Message-ID: <49E9D3AC.5030801@veltrac.com.br>
References: <49E9C87A.1030509@veltrac.com.br> <20090418125916.GA14236@internet24.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20090418125916.GA14236@internet24.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Tks Thomas and Brian. It was very helpful.
Now i'll follow with my jorney _o/

tks again! =3D)

Thomas Jacob escreveu:
> On Sat, Apr 18, 2009 at 09:32:58AM -0300, Leonardo Carneiro wrote:
>  =20
>> Is there any good reason why someone would set an ACCEPT policy for =
all =20
>> chains first to withdraw some later? What the benefit of doing this?
>>    =20
>
> If I'd have to guess at the ruleset authors intentions, I'd say
> s/he wanted to prevent service disruptions when reloading the
> firewall scripts.
>
> Loading a lot of rules without iptables-restore can take quite some t=
ime,
> and if you have a DROP policy during the rule loading time,
> some packets that your final ruleset would pass thru will be dropped.
> Also, if your scripts terminate prematurely, you might not be able
> to remote access your machine anymore.
>
> But then again, you should load your ruleset before you bring up
> your network, so the first reason should be irrelevant. And the
> second shouldn't really matter after the initial testing phase.
>
>  =20


--=20

*Leonardo de Souza Carneiro*
*Veltrac - Tecnologia em Log=EDstica.*
lscarneiro@veltrac.com.br <mailto:lscarneiro@veltrac.com.br>
http://www.veltrac.com.br <http://www.veltrac.com.br/>
/Fone Com.: (43)2105-5600/
/Av. Higien=F3polis 1601 Ed. Eurocenter Sl. 803/
/Londrina- PR/
/Cep: 86015-010/

=09

