From: "Eduardo Spremolla" <edspremolla@antel.com.uy>
Subject: Re: SNAT and IPSEC
Date: Wed, 13 Apr 2005 14:29:11 -0300
Message-ID: <1113413351.4244.11.camel@fly.in.iantel.com.uy>
References: <1113329293.29536.13.camel@fly.in.iantel.com.uy>
	<1113408523.8270.16.camel@plasma.starken.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1113408523.8270.16.camel@plasma.starken.com>
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
To: Daniel Wittenberg <daniel-wittenberg@starken.com>
Cc: netfilter@lists.netfilter.org

That could be the easy way ;-)

LALO

On Wed, 2005-04-13 at 11:08 -0500, Daniel Wittenberg wrote:
> Couldn't he just SNAT the packets on his side when they become un-
> encapsulated?  I'm doing this on a couple of my vpn links.
>=20
> Dan
>=20
> On Tue, 2005-04-12 at 15:08 -0300, Eduardo Spremolla wrote:
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

