From: Jose Maria Lopez Hernandez <jkerouac@bgsec.com>
Subject: Re: Problemas REDIRECT
Date: Wed, 30 Mar 2005 10:10:45 +0200
Message-ID: <1112170246.7456.12.camel@nostromo.bgsecm.com>
References: <1112134095.8721.76.camel@admin.ucbcba.edu.bo>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1112134095.8721.76.camel@admin.ucbcba.edu.bo>
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

El mar, 29-03-2005 a las 18:08 -0400, Jorge Enrique escribi=C3=B3:
> Hola a todos, una pregunta se me presento problemas con mis reglas de m=
i
> firewall.
>=20
> Estado probando los redireccionamientos la idea es la siguiente:
>=20
>=20
>               Internet
>                  |
> 		 |
> 		 V
>=20
>  		Firewall  ----> Server web
> 			    |
> 			    |-> Usuario1
>=20
>  Configure primero para q desde internet lo vean a mi server web
>=20
>  iptables -A PREROUTING -s 0/0 -d IP_PUBLICA -j DNAT -to IP_SERVER_WEB
>=20
>  Esto funciona bien pero los usuarios de mi red privada no la pueden
> acceder a mi sito en mi server web, pero desde afuera si..
>=20
>  estado viendo lo siguiente pero no me esta funcionando
>=20
>  iptables -A PREROUTING -s RED_PRIVADA -d IP_PUBLICA -p tcp --dport 443
> -j REDIRECT -to-ports 443

=C2=BFQue se supone que quieres hacer con esta regla? Seg=C3=BAn est=C3=A1=
 no
hace nada, simplemente redirige del puerto 443 al 443, lo que
no tiene sentido.

And if you can please post in English, because it's the language
used in the list.

>   Cual puede ser el problema o donde me estoy equivocando, ayuda????

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



