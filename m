From: Jose Maria Lopez <jkerouac@bgsec.com>
Subject: Re: going default DROP
Date: 26 Sep 2004 22:33:54 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1096228024.7416.22.camel@nostromo.bgsecm.com>
References: <a0f69e5040924223152fe70b6@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <a0f69e5040924223152fe70b6@mail.gmail.com>
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

El s=C3=A1b, 25 de 09 de 2004 a las 07:31, Askar escribi=C3=B3:
> hi,
>=20
> okay now im seriously wanted to convert the default ACCEPTED fw
> machine by my predecessor to default DROP. coz it is very hard to
> maintain ACCEPTED fw and im getting tired of monitoring tcpdump and
> then adding new rules to firewall script.
> As I told before it is a small ISP (limitations: no more then 150
> users at a time) and our clients connected to us via dialup.
> Before going to deploy my desired fw script I want to monitor the
> users traffic for a while may be I would go outside and interview few
> cyber cafes, to decide *what* to DROP and which packets to allow.
> Remember our clients are not that power users, very normal in nature,
> when online majority of them acccessing port 80, IM, chatting,
> emailing, irc etc. we have setup a cache "squid" for port 80 related
> things and its doing very well.
> Therefore I thinks it would not be difficult to deploy default DROP
> script, yes may be in starting days we could loose few clients ;)
> As im kinda new to security and iptables stuff, however I want to
> prove that this sort of  policy is possible in ISP (small) enviroment
> .
>=20
> =3Dnow can someone guide me what is the good way to monitor traffic i-e
> what ports clients accessing and then in teh light of this i would
> finialize my script.
> =3D any sample scripts for such enviroment and links ?
> Any other suggestions would be greatly appreciated.
>=20
> regards
> Askar

I think the approach your are using is the correct when dealing with
an ISP like configuration. You probably don't have power users, but
be sure that normal users are the more problematic ones, because they
will want to use nonstandard ports many times, like when using games
IM chat, DCC and thinks like that. You should make a study of what
traffic your users are using and then DROP only the traffic that can
be harmful. It's not a easy way to configuring a firewall, but I think
it's the more intelligent one when your are an ISP and you don't want
your users to be complaining all the time.


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


