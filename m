From: "Eduardo Spremolla" <edspremolla@antel.com.uy>
Subject: Re: Logging connections
Date: Thu, 09 Jun 2005 15:48:55 -0300
Message-ID: <1118342935.24271.3.camel@fly.in.iantel.com.uy>
References: <42A87529.3070005@pcraft.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42A87529.3070005@pcraft.com>
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
To: "Ashley M. Kirchner" <ashley@pcraft.com>
Cc: netfilter@lists.netfilter.org

So add the same rule you have in FORWARD with -j LOG before the ACCEPT
one.

-A FORWARD -i eth0 -o eth2 -p tcp -m state --state NEW -m tcp --dport =
6666 --tcp-flags SYN,RST,ACK SYN -j LOG --log-prefix=3D"punched_hole"
    -A FORWARD -i eth0 -o eth2 -p tcp -m state --state NEW -m tcp =
--dport 6666 --tcp-flags SYN,RST,ACK SYN -j ACCEPT

On Thu, 2005-06-09 at 10:58 -0600, Ashley M. Kirchner wrote:
>     I have a hole punched in our iptables configuration for an =
internet=20
> application we're using to be able to reach an internal server=20
> directly.  What I'd like to do now is log the connections that are=20
> coming in to that port.  Ideally I would want the remote address it's=20
> coming from, a time stamp and what the connection is wanting to do=20
> (send/receive.)
>=20
>     The rules related to that hole are setup like this:
>=20
>     -A PREROUTING -i eth0 -p tcp -m tcp --dport 6666 -j DNAT=20
> --to-destination 192.168.x.x
>     -A FORWARD -i eth0 -o eth2 -p tcp -m state --state NEW -m tcp=20
> --dport 6666 --tcp-flags SYN,RST,ACK SYN -j ACCEPT
>=20
--=20
Ing. Eduardo Spremolla
Jefe I+D
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

