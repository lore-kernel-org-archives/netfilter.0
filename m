From: Jose Maria Lopez <jkerouac@bgsec.com>
Subject: Re: ipt_state
Date: 26 Sep 2004 22:33:57 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1096228311.31631.27.camel@nostromo.bgsecm.com>
References: <e73cec800409241231211e671c@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <e73cec800409241231211e671c@mail.gmail.com>
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
To: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

El vie, 24 de 09 de 2004 a las 21:31, www.piratehosting.net escribi=C3=B3=
:
> i have decided to remove ipcontrack
> i have to remove the mods used by it first.
> however this one i cannot remove and i need too.
> rmmod ipt_state
> ERROR: Module ipt_state is in use
>=20
> how can i remove ipt_state

You must remove all the rules that use the -m state module, if
you don't want the system to use ipconntrack. But you should
reconsider your option, ipconntrack it's so useful that don't
know if it's a good idea to deactivate it. If you have real
reasons to do it then drop all the rules with -m state and
you are done.

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


