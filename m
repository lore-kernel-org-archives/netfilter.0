From: Jose Maria Lopez Hernandez <jkerouac@bgsec.com>
Subject: Re: PSD comments
Date: Fri, 25 Feb 2005 13:38:05 +0100
Message-ID: <1109335085.31146.9.camel@nostromo.bgsecm.com>
References: <00cf01c51b32$88fd3ee0$09603fca@southern>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <00cf01c51b32$88fd3ee0$09603fca@southern>
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

El vie, 25-02-2005 a las 17:37 +0530, hareram escribi=C3=B3:
> Hi all
>=20
>=20
> iam planning to deploy Portscan Detect module
> at my back bone
>=20
> how far this module can work with my 100MB network
> or i need to Look for IDS
>=20
> does any one put some coments on this
>=20
> hare
>=20

My personal experience says you better try an IDS, it's
much more capable of detecting portscans. But if you
want to stop some of them you can also have some rules
to stop some TCP flags combinations that identifies
portscans.

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



