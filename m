From: "Contreras Verdugo, Leonardo" <lcontreras@manquehue.cl>
Subject: redirijir paquetes a otra ip
Date: Mon, 23 Feb 2004 09:50:43 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <5B029228151AFA499070FBEE148FCD3A4AF4E1@espino.manquehue.cl>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: "'netfilter@lists.samba.org'" <netfilter@lists.samba.org>

> hola a todos:
>=20
> quisiera saber como puedo hacer para que un paquete que llega a mi
> maquina, redireccionarlo a otra maquina?. por lo que lei, me bastaria =
con
> iptables, agregando a la tabla de NAT, en la cadena PREROUTING una =
regla
> con target a DNAT --to <ip:port>. eso fu=E9 lo que hice pero no me =
funcion=F3.
> Lo que necesito es que cuando me conecto al servidor web en una red (
> http://mimaquima/ ) las paginas las vaya a buscar a otra (
> http://otramaquina/ ). lo que hice fu=E9:
>=20
>   iptables -t nat -A PREROUTING -p tcp --dport 80 -j DNAT --to
> <ip-otramaquina>:80
>=20
> esto lo prob=E9 en una sola maquina con windows2000 y vmware donde =
tengo un
> redhat 9 virtual ( el que deberia redirigir los paquetes).=20
>=20
> cualquier ayuda se las agredecer=E9
>=20
>                                                                     =
Atte.
> Leonardo Contreras
>=20
>=20
>=20

