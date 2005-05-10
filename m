From: Jose Maria Lopez Hernandez <jkerouac@bgsec.com>
Subject: RE: Problem adding connlimit rule
Date: Tue, 10 May 2005 18:51:42 +0200
Message-ID: <1115743903.25471.2.camel@nostromo.bgsecm.com>
References: <20050510132207.647268FAC@smtp-01.piensasolutions.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050510132207.647268FAC@smtp-01.piensasolutions.com>
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

El mar, 10-05-2005 a las 15:21 +0200, Ruben Cardenal escribi=C3=B3:
> Hi,
>=20
> netfilter-bounces@lists.netfilter.org wrote:
> > El mar, 10-05-2005 a las 13:26 +0200, Ruben Cardenal escribi=C3=B3:
> >> Hi,
> >>=20
> >>   I'm trying to add a quite simple rule but I get an error:
> >>=20
> >> # iptables -I INPUT -p tcp --syn --dport 25 -m connlimit
> >> --connlimit-above 10 -j REJECT iptables: No chain/target/match by
> >> that name=20
> >=20
> > Maybe you don't have the support for the connlimit match compiled
> > for iptables. Check if you have the file:
> > /lib/iptables/libipt_connlimit.so
>=20
>   For this system libs are located under /usr/local/lib/iptables and
> libipt_connlimit.so is there.

Do you have the vanilla kernel patched with pom-ng?
I know the FC3 and RHEL kernels don't include the support
for the connlimit match, so you have to apply the last pom patches
to the iptables sources and the kernel.

If you are using the kernel bundled with a distribution then
probably it doesn't have the connlimit support.

>   Regards,
>=20
> - Ruben

Regards.

--=20

Jose Maria Lopez Hernandez
Director Tecnico de bgSEC
jkerouac@bgsec.com
bgSEC Seguridad y Consultoria de Sistemas
http://www.bgsec.com
ESPA=C3=91A

The only people for me are the mad ones -- the ones who are mad to live,
mad to talk, mad to be saved, desirous of everything at the same time,
the ones who never yawn or say a commonplace thing, but burn, burn, burn
like fabulous yellow Roman candles.
                -- Jack Kerouac, "On the Road"


