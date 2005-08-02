From: "Eduardo Spremolla" <edspremolla@antel.com.uy>
Subject: Re: forbidden user proxy other
Date: Tue, 02 Aug 2005 11:56:39 -0300
Message-ID: <1122994599.16568.9.camel@fly.in.iantel.com.uy>
References: <20050802023249.92C91C3909@smtp.263.net>
	<42EF2B54.4020802@mnemon.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42EF2B54.4020802@mnemon.de>
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
To: =?iso-8859-1?Q?J=F6rg_Harmuth?= <harmuth@mnemon.de>
Cc: netfilter@lists.netfilter.org

If I understand correctly, you have a social engineering problem.
If you grant one user the rights to go to Internet, and him install a
wingate to let her pals use his access, no thing in the firewall will
detect it. You must prosecute or "advice" that user that sharing his
rights is against company policy.

LALO=20

On Tue, 2005-08-02 at 10:14 +0200, J=C3=B6rg Harmuth wrote:
> bend chen schrieb:
> > hi,netfilter
> >=20
> > 	I have manager some PC,some one can used my netfilter box access =
Internet,others can't access Internet.
> > but I find some PC installed proxy program (wingate\ccproxy...)  =
proxy some user's pc access Internet.
> > how can i set my firewall to forbidden user use proxy program?
>=20
> If I understand correctly, you want to allow proxy access for some =
users
> and other users are forbidden to use the proxy.If so, what about this:
>=20
> Structure your network, put allowed users in one network segment and
> forbidden users in a different segment. Then the following rules =
should
> get you started.
>=20
> iptables -P INPUT DROP
> iptables -P FORWARD DROP
>=20
> iptables -A INPUT -i lo -j ACCEPT
> iptables -A INPUT -m state --state ESTABLISHED,RELATED \
>    -j ACCEPT
> iptables -A INPUT -s $ALLOWED_SEGMENT/$NETMASK \
>    --dport $PROXY_PORT -j ACCEPT
> [Some other rules you need]
>=20
> Finally I would like to suggest reading "man iptables" and this
> excellent tutorial by Oskar Andreasson:
>=20
> http://iptables-tutorial.frozentux.net/chunkyhtml/index.html
>=20
> Good luck,
>=20
> Joerg
>=20
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
the sender immediately, answering this e-mail and delete it as well as =
the attached files. Any use, circulation or copy of this e-mail by any =
person or entity that is not the specific addressee(s) is prohibited. =
ANTEL is not responsible for any communication emitted without =
respecting our Information Security Policy.

