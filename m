From: Jose Maria Lopez <jkerouac@bgsec.com>
Subject: Re: how to log dropped packet
Date: 28 Sep 2004 16:30:51 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1096381850.28905.40.camel@nostromo.bgsecm.com>
References: <web-6413785@infinito.it>  <41597366.3010108@pbl.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <41597366.3010108@pbl.ca>
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

El mar, 28 de 09 de 2004 a las 16:21, Aleksandar Milivojevic escribi=C3=B3=
:
> Use the LOG target.
>=20
> However, if this is your firewall host toward Internet, are you sure yo=
u=20
> want to log *everything* that is dropped?  There are so many worms and=20
> automatic scanning tools out there that your logs will get *huge* with=20
> nothing but crap very fast.  This is especially true for Windows=20
> specific TCP and UDP ports.  Anything that might be interesting will ge=
t=20
> completely lost in all that noise.

He could use the -m limit match to limit the number of logs
he is having. It's interesting to do so for ports like
445 and so.
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


