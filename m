From: Jose Maria Lopez <jkerouac@bgsec.com>
Subject: Re: ip alias
Date: 28 Sep 2004 16:27:38 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1096376206.25284.24.camel@nostromo.bgsecm.com>
References: <20040928051024.692C0BE3@sterenborg.info>
	<008601c4a553$4cd4ce60$936ffea9@alpha>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <008601c4a553$4cd4ce60$936ffea9@alpha>
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

El mar, 28 de 09 de 2004 a las 14:04, John Black escribi=C3=B3:
> > You say "it will not let me out". Is that out to the internet ?
> > I can't see the use for the above :
> > - You assign an ip alias to eth0:0
> > - You forward all traffic coming in on eth0 (that is directed to the
> > aliased ip 192.168.1.23) to 161.31.31.23
> > By doing this you won't get access to the internet.
>=20
> but, how would you forward outgoing traffic to this address?  So=20
> all traffic generated on 192.168.1.23 is see coming from 161.31.31.23?
>=20
> john

You can use SNAT to do this, just make a rule that does SNAT
from 192.168.1.23 to 161.31.31.23.

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


