From: Jose Maria Lopez <jkerouac@bgsec.com>
Subject: Re: What is the application sending packet out?
Date: 04 Feb 2005 22:07:26 +0100
Message-ID: <1107551244.24666.21.camel@nostromo.bgsecm.com>
References: <1107549694.8323.7.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1107549694.8323.7.camel@localhost.localdomain>
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

El vie, 04 de 02 de 2005 a las 21:41, Mohammad Khan escribi=C3=B3:
> Hello List,
>=20
> I am not sure about some packet was trying to go out from my router.
> Is there a way to know, what application(s) is/are sending those
> packets?
>=20
> Thanks
> Mohammad

Yes, it's very easy. Just use ethereal to capture the packets
and identify the ports the application it's using to send the
packets, then use lsof -i to see what application it's using
that port.

Regards.

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


