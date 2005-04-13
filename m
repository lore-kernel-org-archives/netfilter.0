From: "Eduardo Spremolla" <edspremolla@antel.com.uy>
Subject: Re: SNAT and IPSEC
Date: Wed, 13 Apr 2005 12:45:51 -0300
Message-ID: <1113407151.4244.9.camel@fly.in.iantel.com.uy>
References: <1113329293.29536.13.camel@fly.in.iantel.com.uy>
	<20050413145846.GA30293@bender.817west.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050413145846.GA30293@bender.817west.com>
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
Content-Type: text/plain; charset="iso-8859-1"
To: Jason Opperisano <opie@817west.com>
Cc: netfilter@lists.netfilter.org

How can I know if the patches are in my version:

kernel 		2.6.10-1.771_FC2
iptables 	1.2.9-2.3.1
ipsec-tools 	0.5-2.fc2

I will test it. I did not set the POSTROUTING SNAT rule, since I
understand make no sense in the ESP packet.

Thanks for the clue.

LALO

On Wed, 2005-04-13 at 10:58 -0400, Jason Opperisano wrote:
> On Tue, Apr 12, 2005 at 03:08:12PM -0300, Eduardo Spremolla wrote:
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
>=20
> dunno if this will help or not; as i have lost my test lab, but have =
you
> applied the ipsec patches from PoM:
>=20
>   ipsec-01-output-hooks
>   ipsec-02-input-hooks
>   ipsec-03-policy-lookup
>   ipsec-04-policy-checks
>=20
> it is my understanding that these patches make packets traverse the
> netfilter hooks twice:  once clear, and again encrypted.
>=20
> -j
>=20
> --
> "Peter: I call it... Petoria. I was going to call it Peterland,
>  but that gay bar by the airport took it."
>         --Family Guy
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

