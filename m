From: Guillermo Javier Nardoni <gjnardoni@gmail.com>
Subject: Re: Cambiar Encabezado de IP (Ayuda urgente x favor)
Date: Fri, 3 Jun 2005 00:02:50 -0300
Message-ID: <7b85e5305060220022c818b8f@mail.gmail.com>
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

osea, eso ya est=E1 pero cuando uno inicia una conexi=F3n al puerto
7777/2106 (esta conexi=F3n la hacen desde internet al linux, y el linux
la forwadea al windows 2000) pero la ip que reconoce windows es la de
internet (como por ehmeplo 200.43.16.125) y yo quiero, porque sino no
funciona, que el windows vea a (200.43.16.125 como si fuera
192.168.2.1, me explico?) entonces lo que necsito (a mi modo de ver
las cosas, es cambiar el source ip( 200.43.16.125) ante cada conexi=F3n
entrante en el linux box para el puerto 7777/2106 por (192.168.2.1) y
luego all=ED se enrute para el windows 2000.

digamos que el windows 2000 no tiene que enterarse que la conexi=F3n la
hizo una ip externa , sino como si fuera un cliente mas de la red a la
que pertenece:D

--=20
Atte.
Guillermo Javier Nardoni
Estudiante de Ing. en Sistemas
Tel: 03402-15540590

