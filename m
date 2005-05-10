From: Jose Maria Lopez Hernandez <jkerouac@bgsec.com>
Subject: Re: Problem adding connlimit rule
Date: Tue, 10 May 2005 13:51:30 +0200
Message-ID: <1115725891.948.1.camel@nostromo.bgsecm.com>
References: <20050510122425.311997D9@smtp-01.piensasolutions.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050510122425.311997D9@smtp-01.piensasolutions.com>
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

El mar, 10-05-2005 a las 13:26 +0200, Ruben Cardenal escribi=C3=B3:
> Hi,
>=20
>   I'm trying to add a quite simple rule but I get an error:
>=20
> # iptables -I INPUT -p tcp --syn --dport 25 -m connlimit --connlimit-ab=
ove
> 10 -j REJECT
> iptables: No chain/target/match by that name

Maybe you don't have the support for the connlimit match compiled
for iptables. Check if you have the file:
/lib/iptables/libipt_connlimit.so

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


