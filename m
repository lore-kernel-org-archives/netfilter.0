From: Jose Maria Lopez <jkerouac@bgsec.com>
Subject: Re: MAC addresses
Date: 13 Sep 2004 17:57:52 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1095079543.6971.1.camel@nostromo.bgsecm.com>
References: <200409111150.50506.bulliver@badcomputer.no-ip.com>
	<20040911220159.4cee40bb@oldskool.actisystem.nix>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20040911220159.4cee40bb@oldskool.actisystem.nix>
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

El s=C3=A1b, 11 de 09 de 2004 a las 22:01, active escribi=C3=B3:
> On "Sat 11 of September 2004" Darren Kirby wrote:
>=20
> > Are MAC addresses unique for all ethernet cards? What I would like to
> > know is could I use this rule to allow ssh connections ONLY from my
> > notebook no matter what its current IP address happens to be, and dro=
p
> > all other connection requests?
>=20
> Yes. MAC addresses are set in the card by the manufacturer. This is a
> good method to control input traffic.
>=20
> For more info: http://www.webopedia.com/TERM/M/MAC_address.html

But have in mind that some operating systems let you change the
MAC address of the card. By example, Linux let you do that, and
that can fool some kinds of traffic control.


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


