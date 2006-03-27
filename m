From: "Eduardo Spremolla" <edspremolla@antel.com.uy>
Subject: Re: Multiple IP addresses
Date: Mon, 27 Mar 2006 09:24:34 -0300
Message-ID: <1143462275.17996.8.camel@fly.in.iantel.com.uy>
References: <9a6de10603261753s33408f9cnb5ce6f9ae7b4f75d@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <9a6de10603261753s33408f9cnb5ce6f9ae7b4f75d@mail.gmail.com>
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
Content-Type: text/plain; charset="iso-8859-1"
To: Will Twomey <termina@gmail.com>
Cc: netfilter@lists.netfilter.org

On Sun, 2006-03-26 at 19:53 -0600, Will Twomey wrote:
> I apologize if this is the wrong list, but...
>=20
> I would like to have several (3?) ip addresses on one interface (eth0,
> eth0:1, etc.), and forward each of those IP addresses to another
> interface (192.168.0.1, 192.168.1.1, 192.168.2.1, etc.)

-t nat PREROUTING -i eth0 -d myip1 -j DNAT --to 192.168.0.1
-t nat PREROUTING -i eth0 -d myip2 -j DNAT --to 192.168.1.1
-t nat PREROUTING -i eth0 -d myip3 -j DNAT --to 192.168.2.1




> Does anyone have an advice for me, or a good place to learn how to do =
this?
>=20
> If someone has an iptables/netfilter script that does this, I'd love
> to see it. :D
>=20
> Thanks!
>=20
> --
> Will Twomey
> http://UnhandledExceptions.com
>=20


Este e-mail y cualquier posible archivo adjunto est=E1 dirigido =
=FAnicamente al destinatario del mensaje y contiene informaci=F3n que =
puede ser confidencial. Si Ud. no es el destinatario correcto por favor =
notifique al remitente respondiendo este mensaje y elimine =
inmediatamente el e-mail y los posibles archivos adjuntos al mismo de su =
sistema. Est=E1 prohibida cualquier utilizaci=F3n, difusi=F3n o copia de =
este e-mail por cualquier persona o entidad que no sean las =
espec=EDficas destinatarias del mensaje. ANTEL no acepta ninguna =
responsabilidad con respecto a cualquier comunicaci=F3n que haya sido =
emitida incumpliendo nuestra Pol=EDtica de Seguridad de la =
Informaci=F3n.
. . . . . . . . .
This e-mail and any attachment is confidential and is intended solely =
for the addressee(s). If you are not intended recipient please inform =
the sender immediately, answering this e-mail and delete it as well as =
the attached files. Any use, circulation or copy of this e-mail by any =
person or entity that is not the specific addressee(s) is prohibited. =
ANTEL is not responsible for any communication emitted without =
respecting our Information Security Policy.

