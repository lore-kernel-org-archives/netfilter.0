From: "Eduardo Spremolla" <edspremolla@antel.com.uy>
Subject: Re: How to Open POP3
Date: Wed, 01 Jun 2005 10:22:19 -0300
Message-ID: <1117632139.9065.2.camel@fly.in.iantel.com.uy>
References: <9bc7d292050531233974eca1e2@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <9bc7d292050531233974eca1e2@mail.gmail.com>
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
To: Vinod H <vinwin@gmail.com>
Cc: netfilter@lists.netfilter.org

$ipt -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
$ipt -A INPUT -p tcp -s YOUR-IP -m state --state NEW -m tcp --dport 110
-j ACCEPT


But you will need to execute this as root any time your ip change

LALO


On Wed, 2005-06-01 at 12:09 +0530, Vinod H wrote:
> Hi,
>=20
> I am not so good in netfilter/iptables
>=20
> I have Sendmail configured on my server and I am able to send and
> receive mails in the intranet. Now I want to be able to access the
> mails from outside world also but i dont want to open the port for
> every one. I want to open the pop3 port for the perticular IP (it may
> be static or dynamic IP) in the IPTABLES and close the port when not
> needed to access from outside.
>=20
> Please some one tell me how to do this and can I have some script
> which will open the port when i need and close when not needed so that
> I don't have to enter into the iptables every time.
>=20
> How to open the pop3 port for a perticular external ipaddress
>=20
> Please some one help me on this
>=20
> Thanks and Regards
>=20
> Vinod
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

