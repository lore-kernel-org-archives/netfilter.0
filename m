From: Jose Maria Lopez <jkerouac@bgsec.com>
Subject: Re: web server in DMZ
Date: 28 Sep 2004 16:27:41 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1096376341.28905.27.camel@nostromo.bgsecm.com>
References: <web-6416739@infinito.it>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <web-6416739@infinito.it>
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

El mar, 28 de 09 de 2004 a las 12:21, hamals@infinito.it escribi=C3=B3:
> I have a big problem
>=20
> I have a web server in my DMZ, I reach it with his=20
> internal IP 192.168.1.10 from my internal LAN, but I can't=20
> reach them with his public IP.
>=20
> I did a DNAT and from internet everythings is ok, my web=20
> server is working in right by DNAT.
>=20
> Where is the problem?

If you have a public IP in the external NIC of your
server then it should be working OK. I don't know if
you want it to respond directly to Internet or via
DNAT. Anyway it should work as you have it configured.
Check the IP in the external NIC.

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


