From: Jose Maria Lopez <jkerouac@bgsec.com>
Subject: Re: UDP packet storm
Date: 28 Dec 2004 23:43:02 +0100
Message-ID: <1104256475.14057.27.camel@nostromo.bgsecm.com>
References: <1139dfe204122711405ed3a4e7@mail.gmail.com>
	<558224e304122712367f38de5d@mail.gmail.com>
	<558224e304122712386be36d59@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <558224e304122712386be36d59@mail.gmail.com>
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

El lun, 27 de 12 de 2004 a las 21:38, ASHISH escribi=C3=B3:
> I would suggest the following method:-
>=20
> 1. Go through  the network activity logs, and estimate the average no
> of packets per unit time that you consider as normal to your packet.
>=20
> 2. Then think of a tolerance margin.
>=20
> 3. Write appropriate rules for limting the rate of packets.
>=20
> I would recommend genarating a cron job that estimates the average
> number of packets per unit time after every day, and update the rule
> in filter table. Again optimal estimation is not a trivial job as it
> depends on several factors.

I agree with all. I just would like to add that if the storm
comes to a destination port you don't use (normally the ones
from Netbios) then just drop them down.

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


