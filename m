From: =?ISO-8859-1?Q?S=E9bastien_CRAMATTE?= <scramatte@zensoluciones.com>
Subject: Conntrack table full  freeze  my Heavy loaded QoS manager...
Date: Mon, 23 Apr 2007 01:27:18 +0200
Message-ID: <462BEF56.10006@zensoluciones.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------070003020105050004010101"
Return-path: <netfilter-bounces@lists.netfilter.org>
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
To: netfilter@lists.netfilter.org

This is a multi-part message in MIME format.
--------------070003020105050004010101
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello

I'm running  a  L7 QoS manager with 2.6.18 kernel  under debian sarge 3.1
The server is p4 hyper threading  + 3 gb of ram.

The server freeze under heavy traffic ...
I've increased  conntrack_max   but is insuficient !

# cat /etc/sysctl.conf
> net.ipv4.netfilter.ip_conntrack_max =3D 131072


Any ideas, tips ?

Regards

--=20
ZEN SOLUCIONES - Be in XForms take your "Concentr=E9"
S=E9bastien CRAMATTE=20

Plaza Sandoval, 5, piso 4b
30004 Murcia - ESPA=D1A

M=F3vil : +34 627 66 52 83
Fijo : +34 968 29 29 65

E-mail : scramatte@zensoluciones.com
Site : www.zensoluciones.com

Skype : scramatte
Msn : scramatte@hotmail.com
Jabber: scramatte@jabber.org
--

CONCENTR=C9
xml entreprise grade framework
http://concentre.zensoluciones.com

--
This e-mail is privileged and may contain confidential information intend=
ed only for the person(s) named above. If you receive this e-mail in erro=
r, please notify the sender immediately and delete it. E-mail and interne=
t transmissions can't be warrant privacy, integrity or correct reception.=
 The sender will not be liable for any damages resulting.=20

Este mensaje va dirigido, de manera exclusiva, a su destinatario y puede =
contener informaci=F3n confidencial. En caso de haber recibido este mensa=
je por error, informe al emisor inmediatamente y proceda a su eliminaci=F3=
n. El correo electr=F3nico y las comunicaciones por medio de Internet no =
permiten garantizar la confidencialidad de los mensajes transmitidos, as=ED=
 como tampoco su integridad o su correcta de recepci=F3n. El emisor no as=
ume responsabilidad alguna por tales circunstancias.

Ce message est destin=E9 exclusivement =E0 son destinataire et peut conte=
nir des informations confidentielles. En cas de r=E9ception d'un tel mess=
age par erreur, informez l'exp=E9diteur imm=E9diatement et proc=E9dez =E0=
 son effacement. Il n'est pas possible de garantir la confidentialit=E9, =
l'int=E9grit=E9 ou la r=E9ception correcte du courrier =E9lectronique ain=
si que des communications par internet. L'exp=E9diteur ne peut =EAtre ten=
u pour responsable d'=E9ventuels dommages commis.


--------------070003020105050004010101--

