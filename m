From: "Eduardo Spremolla" <edspremolla@antel.com.uy>
Subject: Re: can you specify incoming *AND* outgoing NIC on a FORWARD rule?
Date: Thu, 14 Apr 2005 10:12:25 -0300
Message-ID: <1113484346.6180.4.camel@fly.in.iantel.com.uy>
References: <1113425048.3544.169.camel@seberino.spawar.navy.mil>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1113425048.3544.169.camel@seberino.spawar.navy.mil>
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
To: Christian Seberino <seberino@spawar.navy.mil>
Cc: netfilter@lists.netfilter.org

Forwarding is about passing packets from one nic to other.
INPUT and OUTPUT are between a nic and the host itself.
The packets not destined to or coming from your machine do not pass
through INPUT and OUTPUT chains.

LALO=20

On Wed, 2005-04-13 at 13:44 -0700, Christian Seberino wrote:
> FORWARD only table where rules can have -i *and* -o ??
>=20
> It seems to make sense that you could specify 2 NICs
> with FORWARD but not with INPUT or OUTPUT.
>=20
> Is that right?
>=20
> Chris
>=20
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
the sender inmediately, answering this e-mail and delete it as well as =
the attached files. Any use, circulation or copy of this e-mail by any =
person or entity that not is the specific addressee(s) is prohibited. =
ANTEL is not responsible for any communication emitted without =
respecting our Information Security Policy.

