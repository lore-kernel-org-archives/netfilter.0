From: Alexis <alexis@attla.net.ar>
Subject: Re: redirijir paquetes a otra ip
Date: Mon, 23 Feb 2004 10:51:17 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1077544276.1666.5.camel@pepelui.baicom>
References: <5B029228151AFA499070FBEE148FCD3A4AF4DF@espino.manquehue.cl>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <5B029228151AFA499070FBEE148FCD3A4AF4DF@espino.manquehue.cl>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="utf-8"
To: "Contreras Verdugo, Leonardo" <lcontreras@manquehue.cl>
Cc: "'netfilter@lists.samba.org'" <netfilter@lists.samba.org>

echo 1 > /proc/sys/net/ipv4/ip_forward

iptables -P FORWARD ACCEPT

y la regla que esta debajo.



On Mon, 2004-02-23 at 09:42, Contreras Verdugo, Leonardo wrote:
> hola a todos:
>=20
> quisiera saber como puedo hacer para que un paquete que llega a mi maquin=
a,
> redireccionarlo a otra maquina?. por lo que lei, me bastaria con iptables=
,
> agregando a la tabla de NAT, en la cadena PREROUTING una regla con target=
 a
> DNAT --to <ip:port>. eso fu=C3=A9 lo que hice pero no me funcion=C3=B3. L=
o que
> necesito es que cuando me conecto al servidor web en una red (
> http://mimaquima/ ) las paginas las vaya a buscar a otra (
> http://otramaquina/ ). lo que hice fu=C3=A9:
>=20
>   iptables -t nat -A PREROUTING -p tcp --dport 80 -j DNAT --to
> <ip-otramaquina>:80
>=20
> esto lo prob=C3=A9 en una sola maquina con windows2000 y vmware donde ten=
go un
> redhat 9 virtual ( el que deberia redirigir los paquetes).=20
>=20
> cualquier ayuda se las agredecer=C3=A9
>=20
>                                                                     Atte.
> Leonardo Contreras
>=20
>=20



