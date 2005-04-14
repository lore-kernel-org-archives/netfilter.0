From: "Eduardo Spremolla" <edspremolla@antel.com.uy>
Subject: Re: SNAT and IPSEC
Date: Thu, 14 Apr 2005 12:19:18 -0300
Message-ID: <1113491959.6180.17.camel@fly.in.iantel.com.uy>
References: <1113329293.29536.13.camel@fly.in.iantel.com.uy>
	<425C1D5F.7000302@lopsch.com>
	<1113393681.4244.3.camel@fly.in.iantel.com.uy>
	<d3j9vh$tnf$1@sea.gmane.org> <425E783F.5070502@lopsch.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <425E783F.5070502@lopsch.com>
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

Are these patches incorporated in some iptables version so far?

I'm running 1.2.9-2.3.1 now. and do not have development environment in
that box, as a secure measure.

Thanks to every body who replayed so far.

LALO

On Thu, 2005-04-14 at 16:03 +0200, Daniel Lopes wrote:
> Michael Muenz schrieb:
> > Hi,
> >=20
> >=20
> >>"Eduardo Spremolla" <edspremolla@antel.com.uy> schrieb im=20
> >>Newsbeitragnews:1113393681.4244.3.camel@fly.in.iantel.com.uy...
> >>Yes, the OpenSwan is mutch more clear, yuo have the packet with the
> >>originals ip in the nat post chain to the tunn0 device.=20
> >=20
> >=20
> >>Is there any chance to aplay NETMAP to the source=20
> >>ip on PREROUTING ?
> >=20
> >=20
> > I never used NETMAP but this is from the description:
> > It can be applied to the PREROUTING chain to alter the destination =
of
> > incoming connections, to the POSTROUTING chain to alter the source=20
> > of outgoing connections, or both (with separate rules).
> >=20
> > You want to alter the source (10.2.2.0/24) and that's an outgoing =
conn.
> > (Of course vice versa) ..
> >=20
> > So perhaps this will work:
> > iptables -t nat -A POSTROUTING -s 10.2.2.0/24 -d 10.37.130.0/24 \
> >    -j NETMAP --to 10.3.3.0/24
> > iptables -t nat -A PREROUTING -s 10.37.130.0/24 -d 10.3.3.0/24 \
> >    -j NETMAP --to 10.2.2.0/24
> >=20
> > - Michael
> >=20
> >=20
> >=20
> >=20
> No it won=C2=B4t that=C2=B4s the problem because with native IPSec the =
packets=20
> only pass the chains once (without the patches). So they arrive tunnel =

> encapsulated at the POSTROUTING chain. But with the patches it would=20
> probably work.
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

