From: Clist <clist@uah.es>
Subject: Re: Consulta iptables v1.2.11
Date: Mon, 13 Dec 2004 16:19:04 +0100
Message-ID: <200412131619.04806.clist@uah.es>
References: <1102950391.4817.81.camel@admin.ucbcba.edu.bo>
Reply-To: clist@uah.es
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1102950391.4817.81.camel@admin.ucbcba.edu.bo>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org
Cc: Jorge Enrique <nunezj@ucbcba.edu.bo>

hola Jorge Enrique,

192.168.107.0/24 esto es notaci=C3=B3n cdir, verdad?=20
creo que el iptables no la admite, usa 192.168.107.0/255.255.255.0

=2Dp ALL es superfluo, no pongas nada...
=20
los modulos suele cargarlos =C3=A9l mismo, con tal de que a=C3=B1adas el ma=
tch necesario
 ejmp a=C3=B1ade '-m tcp' si vas a usar -p tcp

a=C3=B1ade iptables -I INPUT -m state --state RELATED;ESTABLISHED -j ACCEPT
esto ahorra evaluar todas las reglas para cada paquete de una conexi=C3=B3n=
 ya en curso.

quizas el conntrack de ftp no lo cargue, eso me pasa a veces a mi,=20

por lo demas todo bien.

Un saludo

On Monday 13 December 2004 16:06, Jorge Enrique wrote:
> Hola a todos, el viernes pasado termine de configuar mi firewall en
> fedora core 3, en el cual tengo corriendo el squid todo bien,, estado
> queiendo colocar algunas reglas con el iptables donde me sale el
> siguiente error:
>=20
> Ejecutando reglas y configuracion de iptables para servidor
> ...1...2...3...4...iptables v1.2.11: multiple -s flags not allowed
> Try `iptables -h' or 'iptables --help' for more information.
> Bad argument `22'
> Try `iptables -h' or 'iptables --help' for more information.
>=20
>=20
> En las reglas que estoy utilizando donde coloco el flag -s es en las
> siguientes.
> $IPTABLES -A INPUT -p ALL -i eth1 -s 192.168.107.0/24 -j ACCEPT
> $IPTABLES -A INPUT -p ALL -i eth1 -s 192.168.108.0/24 -j ACCEPT
> $IPTABLES -A INPUT -p ALL -i eth1 -s 192.168.105.0/24 -j ACCEPT
>=20
> donde hago referencia a las subredes que se tienen de origen
> como referencia estos son los modulos que estoy utilizando
>=20
> /sbin/depmod -a
> /sbin/modprobe ip_conntrack
> /sbin/modprobe iptable_filter
> /sbin/modprobe iptable_mangle
> /sbin/modprobe iptable_nat
> /sbin/modprobe ipt_LOG
> /sbin/modprobe ipt_limit
> /sbin/modprobe ipt_state
> /sbin/modprobe ip_nat_ftp
> /sbin/modprobe ip_conntrack_ftp
>=20
> Alguna idea porq me sale este error.
>=20
>=20
>=20
>=20
>=20

=2D-=20
=2D------------------------------------------------
Clister UAH
=2D------------------------------------------------

