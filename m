From: Jose Maria Lopez Hernandez <jkerouac@bgsec.com>
Subject: Re: Change destination ip address in incoming packet
Date: Sat, 12 Mar 2005 10:35:23 +0100
Message-ID: <1110620123.8249.2.camel@nostromo.bgsecm.com>
References: <000e01c526e3$e52201d0$220510ac@ros.carabinieri.it>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <000e01c526e3$e52201d0$220510ac@ros.carabinieri.it>
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

El s=C3=A1b, 12-03-2005 a las 10:14 +0100, Tony Di Bernardo escribi=C3=B3=
:
> Hello,
> I would like to know if there is a way to change the destination IP add=
ress in the IP header of an incoming packet in a linux box. I don't want =
to do DNAT because I don't need that the packet comes back to the host. A=
ll I need is to change destination address and put the packet in the net =
again.
>=20
> Thanks
> tony

Do SNAT and DNAT, that way you change the destination IP and the origin
IP.

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



