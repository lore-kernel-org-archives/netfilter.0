From: Jose Maria Lopez <jkerouac@bgsec.com>
Subject: Re: LOG de iptables con 0 bytes
Date: 28 Dec 2004 23:43:04 +0100
Message-ID: <1104256728.14057.32.camel@nostromo.bgsecm.com>
References: <028d01c4ec1e$8aaaa630$0200a8c0@ale>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <028d01c4ec1e$8aaaa630$0200a8c0@ale>
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
To: "Netfilter lista (iptables)" <netfilter@lists.netfilter.org>

El lun, 27 de 12 de 2004 a las 15:15, Alejandro Cabrera Obed escribi=C3=B3=
:
> Mi regla de LOG de iptables seguramente estaba vacia (cero pkts y bytes=
) y
> es verdad, ya lo comprobe con "iptables -L INPUT -v"....ahora les muest=
ro
> mis dos reglas en la cadena INPUT para loguear primero y luego acceder =
al
> servicio SSH. Pero ocurre que yo puedo acceder al port ssh pero NO qued=
an
> logs en el archivo /var/log/messages.
>=20
> $IPTABLES -A tcp_packets -p TCP -s 0/0 --dport 22 -j LOG --log-level
> INFO --log-prefix "SSH Access:"
> $IPTABLES -A tcp_packets -p TCP -s 0/0 --dport 22 -j allowed
>=20
> Como puedo hacer para que se logueen los ingresos ssh ??? Esta mal el o=
rden
> o algo por el estilo ???
>=20
> Mil gracias !!!!!!!!!!
>=20
> A.K.

Yo quitar=C3=ADa el "-s 0/0" de tus reglas. No creo que sirvan para nada =
y
probablemente son las que te est=C3=A1n causando el problema. Tambi=C3=A9=
n
deber=C3=ADas comprobar que tus reglas para aceptar los paquetes ESTABLIS=
HED,
RELATED,etc de connection tracking no est=C3=A9n interfiriendo con tu
capacidad para loggear y aceptar los paquetes.

Tambi=C3=A9n ten en cuenta (supongo que ya lo has hecho) que est=C3=A1s i=
ncluyendo
tus reglas en la cadena "tcp_packets" y haces el iptables -L INPUT -v de
la cadena INPUT, por lo que en principio no ver=C3=A1s los datos de los l=
ogs
de la cadena "tcp_packets".

Espero que sirva de algo. Saludos y felices fiestas.

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


