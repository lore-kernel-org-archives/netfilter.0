From: "Eduardo Spremolla" <edspremolla@antel.com.uy>
Subject: Re: FC4 iptables, VPN and SNAT
Date: Tue, 14 Feb 2006 13:26:10 -0200
Message-ID: <1139930770.22417.2.camel@fly.in.iantel.com.uy>
References: <00f301c63171$b87ca600$b00aa8c0@a2smark>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <00f301c63171$b87ca600$b00aa8c0@a2smark>
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
To: mark@alpha2.com
Cc: netfilter@lists.netfilter.org

What kind of VPN do you setup? ipsec?
What are your routing tables? policies?
How far are the 2 public ip? same subnet?

LALO


On Tue, 2006-02-14 at 09:19 -0500, Mark L. Wise wrote:
> (Sorry for the double post I forgot the subject...)
>=20
> Hello all!
>=20
> I am struggling with what I think is an iptables issue...
>=20
> I have the following Net-to-Net VPN set up between to FC4 boxes:
>=20
> 192.168.20.0/24-->192.168.20.2(gw)-->$PUBLICIP1 ...
> $PUBLICIP2<--192.168.30.100(gw)<--192.168.30.0/24
>=20
> With no firewall rules (iptables) entered, I can ping from =
192.168.20.70 to
> 192.168.30.33 without any problem.  However, I cannot get to outside
> internet addresses.  If I add:
>=20
> iptables -t nat -A POSTROUTING --dst ! 192.168.30.0/24 -j SNAT =
--to-source
> $PUBLICIP1
>=20
> to the 192.168.20.2(gw) machine's iptables, I can get out of the =
firewall to
> the internet from the 192.168.20.0/24 net, BUT MY VPN TRAFFIC DOES NOT =
REACH
> THE OTHER SIDE.
>=20
> So it seems that I can either have my VPN traffic between the nets OR =
be
> able to get to the internet (WWW, etc.) but I cannot have both.
>=20
> Anyone have any ideas???
>=20
> Mark L. Wise, President
> Alpha II Service, Inc.
> 1312 Epworth Ave
> Reynoldsburg, Ohio 43068-2116
> 614 868-5033 (Phone)
> 614 868-1060 (Fax)
>=20
>=20
>=20
>=20
>=20
>=20
--=20
Ing. Eduardo Spremolla
Gerente de Desarrollo Aplicado
Antel
Uruguay


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

