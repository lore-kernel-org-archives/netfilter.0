From: Jose Maria Lopez <jkerouac@bgsec.com>
Subject: Re: Limiting access to some number from random users.
Date: 16 Oct 2004 14:30:05 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1097857100.16630.27.camel@nostromo.bgsecm.com>
References: <20041014074601.27218.qmail@web60406.mail.yahoo.com>
	<1097755804.1708.14.camel@wolfpack.ljm.dom>
	<200410151048.28634.rio@martin.mu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200410151048.28634.rio@martin.mu>
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

El vie, 15 de 10 de 2004 a las 12:48, Rio Martin. escribi=C3=B3:
> Folks,
> I need to know how to limit access to some number from bulk random user=
s.
> Let say, i have 256 PCs connecting to Internet daily.=20
> I want to limit my users accessing to Internet only for 100 users durin=
g peak=20
> time. But these 100users must be selected in random.
>=20
> Need a fresh idea how to do that with iptables. Should i apply special=20
> patches?
> Thanks ..
>=20
> Regards,
> Rio Martin.

Maybe you can use conntrack and limit the SYN packets (NEW packets)
with the limit match, this will give you some control over the
number of connections that are made (not the total number but the
number of connections in a given time).

But have in mind that this will not work for sessions, just for
connections, that means that maybe someone it's using the www and
some connections will work and some not, because a huge number of
connections are made for the same page (ads, images from other
sites, etc). Maybe you can use persistent connections in the
browsers so the connections are not broken.
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


