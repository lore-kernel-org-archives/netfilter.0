From: "Eduardo Spremolla" <edspremolla@antel.com.uy>
Subject: Re: port filtering
Date: Thu, 02 Jun 2005 11:59:53 -0300
Message-ID: <1117724394.13839.14.camel@fly.in.iantel.com.uy>
References: <1117723215.10257.6.camel@debianbox>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1117723215.10257.6.camel@debianbox>
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
To: "Sadus ." <sadus@swiftbin.net>
Cc: netfilter@lists.netfilter.org

I suppose you have a firewall that allow outgoing traffic on port 21 ?
or is incoming?

Any way you can't tell if the traffic on port 21 if ftp , telnet or http
without looking a hi layers protos. Don't know of any support for that
in netfilter. May be you need to setup a transparent proxy.


LALO =20

On Thu, 2005-06-02 at 17:40 +0300, Sadus . wrote:
> Is there a way to do port filtering as in allow only FTP protocol use
> port 21 and no other protocol such as opening apache on port 21 or
> openning SSH on port 443 which should ONLY be used for HTTPS?
>=20
> thanks
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

