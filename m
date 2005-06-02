From: Guillermo Javier Nardoni <gjnardoni@gmail.com>
Subject: Cambiar Encabezado de IP (Ayuda urgente x favor)
Date: Thu, 2 Jun 2005 20:51:50 -0300
Message-ID: <7b85e5305060216514cb1d860@mail.gmail.com>
Reply-To: Guillermo Javier Nardoni <gjnardoni@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

Hola, bueno ya he le=EDdo, configurado hice maniobras de todo tipo y no pud=
e
lograrlo
les comento cual es mi situaci=F3n:

Escenario:

Linux Box con:

eth0: (red interna 192.168.0.0/24)
ip: 192.168.0.1
nm: 255.255.255.0

eth1: (todos los servidores internos colgados de aqu=ED (son tres en total)=
)
ip: 192.168.1.1
nm: 255.255.255.0


eth2: (placa de red para conectar el router cisco 677 con conexion pppoe)
ip: 10.0.0.1
nm: 255.0.0.0

ppp0: Conexi=F3n a Internet (pppoe dhcp)

todo funciona barbaro pero necesito hacer lo siguiente


Windows 2000 server correidno un software enlatado (sobre intranet)
escuchando en los puertos 7777/2106

eth0:
ip: 192.168.1.2
nm: 255.255.255.0
gw: 192.168.2.1

el tema es que cuando un cliente hace una coneix=F3n a travez de la internf=
az
ppp0 , yo lo enruto para que
haga dnat y snat al server win2000
lo hace bien, peeeeeero lo hace con la ip del linux (externo , esto es por
ejemplo 200.43.16.125) y
yo necesito que lo hago con la ip 192.168.2.1 , sino no me funciona el
software
esto ser=EDa cambiar el source ip antes de ser enrutado pero prob=E9 de mil
maneras
y puedo lograrlo y me urge poder hacerlo ya que estoy sin poder laburar y
tengo a un mo=B4nt=F3n de clientes
colgados x este tema
agradecer=EDa una ayuda suya


reitero, anda todo bien cuando un usuario de la internet se coencta al linu=
x
box, =E9ste (el linux) rutea hacia el windows 2000 y se logra la conexi=F3n=
 sin
problemas
peeeero cuando pido el log en windows 2000 me dice que la ip desde donde se
logueo fue 200.43.16.125 (por dar un ejemplo) cuando deber=EDa de ser
la ip interna del firewall (en este caso 192.168.2.1)


Atte.-
Guillermo Javier Nardoni
Argentina.-


--=20
Atte.
Guillermo Javier Nardoni
Estudiante de Ing. en Sistemas
Tel: 03402-15540590

