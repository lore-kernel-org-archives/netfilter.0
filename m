From: Esteban Ribicic <eribicic@UolSinectis.com>
Subject: Re: Netmeeting and messenger ports
Date: 17 May 2003 01:40:42 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1053146443.5519.6.camel@dejawu>
References: <002d01c31958$835ecb30$f000010a@pc207pca> 
	<200305131753.57809.carlosble@terra.es>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200305131753.57809.carlosble@terra.es>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: carlosble@terra.es
Cc: "Pedro C. Arias" <parias@sede.unr.edu.ar>, netfilter@lists.netfilter.org

yo use los modulos de pom (patch o matic) que estan en netfilter.org
pareciera ser que andan.

suerte


On Tue, 2003-05-13 at 13:53, Carlos Ble wrote:
> El Martes, 13 de Mayo de 2003 15:04, Pedro C. Arias escribi=F3:
> > Hello, I use NAT to connect internet my internal network trougth a Fire=
wall
> > make with iptables, i use NAT, but when somebody external to my network
> > send me a file messenger say "Error to receive File ...." somebody has =
this
> > problem ?, with netmeteeng too can't connect
> >
> > Help me ...
> >
> > Thanks
> > Pedro
> > Rosario - argentina
>=20
> Hi Pedro. I think that we both can talk in spanish but let me write in
> english to let people to correct to me if im wrong.
> There are some problems with microsoft pptp that maybe corrected with
> the linux pptp. Loock for it in google.
> For netmeeting and messenger you must open some ports. One solution is
> to do DNAT to a specified internal address. This is a example:
>=20
> # Neetmeeting ports:
> iptables -t nat -A PREROUTING -p tcp --dport 389 -i <interface> -j DNAT \
> --to 192.168.0.20
> iptables -t nat -A PREROUTING -p tcp --dport 522 -i <interface> -j DNAT \
> --to 192.168.0.20
> iptables -t nat -A PREROUTING -p tcp --dport 1503 -i <interface> -j DNAT =
\
> --to 192.168.0.20
> iptables -t nat -A PREROUTING -p tcp --dport 1720 -i <interface> -j DNAT =
\
> --to 192.168.0.20
> iptables -t nat -A PREROUTING -p tcp --dport 1731 -i <interface> -j DNAT =
\
> --to 192.168.0.20
>=20
> # Messenger ports:
> iptables -t nat -A PREROUTING -p tcp --dport xxxxx -i <interface> -j DNAT=
 \
> --to 192.168.0.20
>=20
> This corrects the problem for one user but the problem still when many
> users wants to use netmeeting. Nowdays im loocking for a solution too.
>=20
> Suerte.


