From: Jose Maria Lopez <jkerouac@bgsec.com>
Subject: Re: ram and processor cycles for a firewall machine
Date: 01 Oct 2004 13:53:01 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1096631579.5577.3.camel@nostromo.bgsecm.com>
References: <a0f69e504093023354ec7c59e@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <a0f69e504093023354ec7c59e@mail.gmail.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="utf-8"
To: netfilter <netfilter@lists.netfilter.org>

El vie, 01 de 10 de 2004 a las 08:35, Askar escribi=C3=B3:
> hi all,
> im in the process of changing my fw machine for that atm im simulating
> and testing. I got a very fair question
> 1) How much RAM and and processor would be best for moderate firewall b=
ox?
> Unfortunatly currently my company running the fw on a P-III 500MHz
> with 128MB of RAM.

With the actual price of RAM you could add some more RAM. The
processor can be OK, but I'd do some tests to see how it works.
I'm running a similar firewall in a Celeron 800Mhz and it works
well, but it's only used as a firewall and the rules are
optimized. I advice you to optimize the traversing of the rules
you have as much as you can. That can give you a performance
boost.

--=20
Jose Maria Lopez Hernandez
Director Tecnico de bgSEC
jkerouac@bgsec.com
bgSEC Seguridad y Consultoria de Sistemas Informaticos
http://www.bgsec.com
ESPA=C3=91A

The only people for me are the mad ones -- the ones who are mad to live,
mad to talk, mad to be saved, desirous of everything at the same time,
the ones who never yawn or say a commonplace thing, but burn, burn, burn
like fabulous yellow Roman candles.
                -- Jack Kerouac, "On the Road"


