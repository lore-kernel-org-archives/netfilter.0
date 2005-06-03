From: CompuGenic <pablo@compugenic.com>
Subject: Re: Cambiar Encabezado de IP (Ayuda urgente x favor)
Date: Thu, 02 Jun 2005 17:55:54 -0700
Message-ID: <BAY0-SMTP020332F220A20E747F8276BC070@phx.gbl>
References: <7b85e5305060216514cb1d860@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Message-ID: <429FAA9A.6090302@compugenic.com>
In-Reply-To: <7b85e5305060216514cb1d860@mail.gmail.com>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Guillermo Javier Nardoni <gjnardoni@gmail.com>
Cc: netfilter@lists.netfilter.org

Guillermo,

Creo que lo que necesitas programar al iptables de linux es lo siguiente:
(Las reglas de abajo estan embasado en que el interface de tu red=20
interna, donde estan los clients es el eth0. Y tambien esta embasado en=20
que tu server de Windows 2000 se alcanze atravez de el interface eth1).
=20
iptables -t nat -I PREROUTING -i eth0 -p tcp -m multiport --dport=20
7777,2106 -j DNAT --to 192.168.1.2

Si eso  no te funciona, tiene que aver una de tus policies, o la orden=20
de las reglas, o otra regla (especificamente una de SNAT) que te esta=20
cambiando algo que no debe de cambiar. Si no te anda, mandama cualquier=20
regla de SNAT que tenes y te ayudo mas.

Ahora, claro que tenes que asegurar que si tenes el policy del INPUT=20
chain ( o cualquier otra cadena) que es DROP, entonces tambien tenes que=20
poner una regla para que deja pasar el packet, como lo siguiente:

iptables -I INPUT -i eth0 -p tcp -m multiport 7777,2106 -j ACCEPT

Espero que eso te ayude.

Pablo



Guillermo Javier Nardoni wrote:

>Hola, bueno ya he le=EDdo, configurado hice maniobras de todo tipo y no pu=
de
>lograrlo
>les comento cual es mi situaci=F3n:
>
>Escenario:
>
>Linux Box con:
>
>eth0: (red interna 192.168.0.0/24)
>ip: 192.168.0.1
>nm: 255.255.255.0
>
>eth1: (todos los servidores internos colgados de aqu=ED (son tres en total=
))
>ip: 192.168.1.1
>nm: 255.255.255.0
>
>
>eth2: (placa de red para conectar el router cisco 677 con conexion pppoe)
>ip: 10.0.0.1
>nm: 255.0.0.0
>
>ppp0: Conexi=F3n a Internet (pppoe dhcp)
>
>todo funciona barbaro pero necesito hacer lo siguiente
>
>
>Windows 2000 server correidno un software enlatado (sobre intranet)
>escuchando en los puertos 7777/2106
>
>eth0:
>ip: 192.168.1.2
>nm: 255.255.255.0
>gw: 192.168.2.1
>
>el tema es que cuando un cliente hace una coneix=F3n a travez de la intern=
faz
>ppp0 , yo lo enruto para que
>haga dnat y snat al server win2000
>lo hace bien, peeeeeero lo hace con la ip del linux (externo , esto es por
>ejemplo 200.43.16.125) y
>yo necesito que lo hago con la ip 192.168.2.1 , sino no me funciona el
>software
>esto ser=EDa cambiar el source ip antes de ser enrutado pero prob=E9 de mil
>maneras
>y puedo lograrlo y me urge poder hacerlo ya que estoy sin poder laburar y
>tengo a un mo=B4nt=F3n de clientes
>colgados x este tema
>agradecer=EDa una ayuda suya
>
>
>reitero, anda todo bien cuando un usuario de la internet se coencta al lin=
ux
>box, =E9ste (el linux) rutea hacia el windows 2000 y se logra la conexi=F3=
n sin
>problemas
>peeeero cuando pido el log en windows 2000 me dice que la ip desde donde se
>logueo fue 200.43.16.125 (por dar un ejemplo) cuando deber=EDa de ser
>la ip interna del firewall (en este caso 192.168.2.1)
>
>
>Atte.-
>Guillermo Javier Nardoni
>Argentina.-
>
>
> =20
>

