From: "Eduardo Spremolla" <edspremolla@antel.com.uy>
Subject: RE: ipsec and iptables
Date: Tue, 14 Feb 2006 14:24:26 -0200
Message-ID: <1139934266.22417.14.camel@fly.in.iantel.com.uy>
References: <BAY103-F18B52DF78B9CA5C62F9698B2060@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <BAY103-F18B52DF78B9CA5C62F9698B2060@phx.gbl>
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
To: Marco Berizzi <pupilla@hotmail.com>
Cc: netfilter@lists.netfilter.org

I use a trick stste on ipsec-tools howto:

iptables -t mangle -A PREROUTING -i eth0 -p esp -j MARK --set-mark 1

then to catch the uncapsulated packet:

iptables -A INPUT -m mark --mark 1 -j ACCEPT



On Tue, 2006-02-14 at 14:39 +0100, Marco Berizzi wrote:
> Andreas Stallmann wrote:
>=20
> >Hello,
>=20
> Ciao.
>=20
> >3. $IPTABLES -A INPUT -i ipsec0 -d $INTERNAL_NET -j ALLOW
> >How do I write rule no. 3 now, without ipsec interfaces at hand?
>=20
> Here is an example: policy match is much more flexible than ipsecX
> virtual interface. You can even select ipsec traffic from different
> gateway.
>=20
> iptables -A FORWARD -m policy \
>=20
> --dir in \ this is for select inbound/outbound traffic
>=20
> --pol ipsec \ this match if traffic is subject to IPsec processing
>=20
> --mode tunnel \ this is if you want to match tunnel mode
>=20
> --tunnel-dst 172.16.1.247 --tunnel-src 172.16.1.226 \
>              ^^^^^^^^^^^               ^^^^^^^^^^^^
> These are the ipsec endpoint addresses (usually public ip addresses)
>=20
> -s blablab -d $INTERNAL_NET --protocol blabla --dport blabla \
> what you want to do with this rule
>=20
> -j ACCEPT (or DROP)
>=20
> >OK, let's do some naive painting. In the following picture, my packet =
"X"=20
> >has passed the rules 1 and 2 on the INPUT chain, allowing it to pass=20
> >through to the OPENSWAN-Software. It got authenticated by openswan =
and is=20
> >now passed back to the iptables stack.
>=20
> No. Openswan has nothing to do with this schema. Openswan (when used
> with netkey) is only an IKE daemon.
>=20
> >outside------->FORWARD--------->inside
> >        |                    |
> >      INPUT                OUTPUT
> >        |_____(OPENSWAN)_X___|
> >
>=20
> >Or is it passed back to the forward chain, because after =
"unwrapping", it's=20
> >header identifies it as a packed coming from an external private =
subnet,=20
> >being directed to a internal private subnet?
>=20
> Yes.
>=20
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
the sender immediately, answering this e-mail and delete it as well as =
the attached files. Any use, circulation or copy of this e-mail by any =
person or entity that is not the specific addressee(s) is prohibited. =
ANTEL is not responsible for any communication emitted without =
respecting our Information Security Policy.

