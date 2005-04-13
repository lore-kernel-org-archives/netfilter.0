From: "Eduardo Spremolla" <edspremolla@antel.com.uy>
Subject: Re: SNAT and IPSEC
Date: Wed, 13 Apr 2005 09:01:21 -0300
Message-ID: <1113393681.4244.3.camel@fly.in.iantel.com.uy>
References: <1113329293.29536.13.camel@fly.in.iantel.com.uy>
	<425C1D5F.7000302@lopsch.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <425C1D5F.7000302@lopsch.com>
Content-class: urn:content-classes:message
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
To: Daniel Lopes <lopsch@lopsch.com>
Cc: netfilter@lists.netfilter.org

Yes, the OpenSwan is mutch more clear, yuo have the packet with the
originals ip in the nat post chain to the tunn0 device.=20

Is there any chance to aplay NETMAP to the source ip on PREROUTING ?

LALO=20

On Tue, 2005-04-12 at 21:11 +0200, Daniel Lopes wrote:
> Eduardo Spremolla schrieb:
> > I have 2 local networks 10.2.2.0/24 and 10.37.130.0/24 =
interconnected by
> > a ipsec tunnel running on kernel 2.6 native ipsec. So far so good.
> >=20
> > Now the admin of 10.37.130.0 wants me to NAT my network to 10.3.3.0
> > because he had a ip conflict. I cant SNAT because when the packet =
goes
> > to nat post it has been encapsulated in ESP and had the firewalls
> > address, as you can see in the bottom log snipe.I try to use NETMAP =
in
> > mangle PREROUTING, but it changes the dest ip , not the source.
> >=20
> > Is this possible?
> >=20
> > Thanks in advance for any clue.
> >=20
> > LALO
> >=20
> According to http://www.shorewall.net/netmap.html, besides I =
don=C2=B4t=20
> really know how and when NETMAP interacts, it should work if you use =
an=20
> Interface for IPSec like the alternative IPSec stack implemented by=20
> FreeS/WAN. For the native stack I don=C2=B4t know if it will work you =
will=20
> need to know when it exactly interacts. It will probably only work =
when=20
> implemented directly into the IPSec stack.
>=20


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

