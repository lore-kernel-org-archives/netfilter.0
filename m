From: Jose Maria Lopez <jkerouac@bgsec.com>
Subject: Re: Who is connected to network
Date: 06 Jan 2005 13:36:41 +0100
Message-ID: <1104929719.21668.1.camel@nostromo.bgsecm.com>
References: <web-580674226@mail01.infosat.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <web-580674226@mail01.infosat.net>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="utf-8"
To: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

El mi=C3=A9, 05 de 01 de 2005 a las 08:10, it clown escribi=C3=B3:
> Is there a way to see who is connected to your network.
>=20
> Say if you have a wireless network and you need to know if
> someone got it right to get onto your network.
>=20
> How do you monitor that and how do you prevent it?
>=20
> Even on a normal network how could you monitor who is
> connected to your network?

You can always use a radius server to authentificate the
users and it will give you who is connected to the network.
The most obvious option for this is Freeradius, it's a little
complicate to make it run but it's very useful further.

Another option is using ntop, that can show you the machines
connected to the network.

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


