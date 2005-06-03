From: "Eduardo Spremolla" <edspremolla@antel.com.uy>
Subject: Re: Cambiar Encabezado de IP (Ayuda urgente x favor)
Date: Fri, 03 Jun 2005 09:29:19 -0300
Message-ID: <1117801759.16631.1.camel@fly.in.iantel.com.uy>
References: <7b85e5305060220022c818b8f@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <7b85e5305060220022c818b8f@mail.gmail.com>
Content-Class: urn:content-classes:message
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
To: Guillermo Javier Nardoni <gjnardoni@gmail.com>
Cc: netfilter@lists.netfilter.org

Gille Creo que lo que precisas es un SNAT en la cadena POSTROUTING

      I think that what you need is a SNAT in the PREROUTING chain.

LALO

On Fri, 2005-06-03 at 00:02 -0300, Guillermo Javier Nardoni wrote:
> osea, eso ya est=C3=A1 pero cuando uno inicia una conexi=C3=B3n al =
puerto
> 7777/2106 (esta conexi=C3=B3n la hacen desde internet al linux, y el =
linux
> la forwadea al windows 2000) pero la ip que reconoce windows es la de
> internet (como por ehmeplo 200.43.16.125) y yo quiero, porque sino no
> funciona, que el windows vea a (200.43.16.125 como si fuera
> 192.168.2.1, me explico?) entonces lo que necsito (a mi modo de ver
> las cosas, es cambiar el source ip( 200.43.16.125) ante cada =
conexi=C3=B3n
> entrante en el linux box para el puerto 7777/2106 por (192.168.2.1) y
> luego all=C3=AD se enrute para el windows 2000.
>=20
> digamos que el windows 2000 no tiene que enterarse que la =
conexi=C3=B3n la
> hizo una ip externa , sino como si fuera un cliente mas de la red a la
> que pertenece:D
>=20
--=20
Ing. Eduardo Spremolla
Jefe I+D
Antel
Uruguay


Este e-mail y cualquier posible archivo adjunto est=C3=A1 dirigido =
=C3=BAnicamente al destinatario del mensaje y contiene informaci=C3=B3n =
que puede ser confidencial. Si Ud. no es el destinatario correcto por =
favor notifique al remitente respondiendo este mensaje y elimine =
inmediatamente el e-mail y los posibles archivos adjuntos al mismo de su =
sistema. Est=C3=A1 prohibida cualquier utilizaci=C3=B3n, difusi=C3=B3n o =
copia de este e-mail por cualquier persona o entidad que no sean las =
espec=C3=ADficas destinatarias del mensaje. ANTEL no acepta ninguna =
responsabilidad con respecto a cualquier comunicaci=C3=B3n que haya sido =
emitida incumpliendo nuestra Pol=C3=ADtica de Seguridad de la =
Informaci=C3=B3n.
. . . . . . . . .
This e-mail and any attachment is confidential and is intended solely =
for the addressee(s). If you are not intended recipient please inform =
the sender inmediately, answering this e-mail and delete it as well as =
the attached files. Any use, circulation or copy of this e-mail by any =
person or entity that not is the specific addressee(s) is prohibited. =
ANTEL is not responsible for any communication emitted without =
respecting our Information Security Policy.

