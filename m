From: "Eduardo Spremolla" <edspremolla@antel.com.uy>
Subject: Re: Postrouting causes wrong src port with ipsec
Date: Wed, 22 Mar 2006 10:40:57 -0300
Message-ID: <1143034858.16972.6.camel@fly.in.iantel.com.uy>
References: <1143017563.3486.352.camel@hawk.mlab.se>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1143017563.3486.352.camel@hawk.mlab.se>
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
To: Hans Schillstrom <hans.schillstrom@erimatic.se>
Cc: netfilter@lists.netfilter.org

Here are my potsrouting:

Chain POSTROUTING (policy ACCEPT)
target     prot opt source               destination
ACCEPT     all  --  10.1.0.0/16          10.3.0.0/16
MASQUERADE  all  --  10.1.0.0/16          anywhere

10.1.0.0/16 is my LAN and 10.3.0.0 the remote over ipsec LAN

The ACCEPT roule prevent the MASQ.

LALO

On Wed, 2006-03-22 at 09:52 +0100, Hans Schillstrom wrote:
> Hello
> I have a problem with postrouting and ipsec
> when the post routing chain is empty everything works fine,
> but when it's not empty the source port is modified on received
> packets !! ( Sending to port 80 gives a reply from port 1)
>=20
> I have tried with all combinations of this two distro:s
> Fedora 4 kernel 2.6.15-1.1831 running iptables v1.3.0=20
> and Redhat ES 4 kernel 2.6.9-22 and iptables v1.2.11
> and the result is the same. (It's a native ipsec26 stack not KLIPS)
>=20
> My postrouting chain looks like this:
>=20
> Chain POSTROUTING (policy ACCEPT 7387 packets, 591K bytes)
>  pkts bytes target     prot opt in   out   source     destination
>  257K   28M MASQUERADE  all  --  *   eth0  0.0.0.0/0  !172.23.0.0/16
>     0     0 MASQUERADE  tcp  --  *   eth0  0.0.0.0/0   0.0.0.0/0
>     1    56 MASQUERADE  udp  --  *   eth0  0.0.0.0/0   0.0.0.0/0
>=20
>=20
> client:
> +-----------+
> | 172.24.1.2| Http Client
> +-----------+
>      | <- Tracepoint 1 (eth0)
> +-------------+
> |172.24.1.1   | eth0 Strongswan 2.6.2 runing:
> |81.227.205.39| eth1 Linux version 2.6.9-22.EL
> +-------------+
>      |
>    Internet
>      |
> +--------------+
> |213.204.187.40| eth2 Stronswan 2.6.2
> |172.23.0.2    | eth0 Linux 2.6.15-1.1833_FC4
> +--------------+
>       | <- Tracepoint 2 (eth0)
> +-------------+
> |172.23.0.254 | Router/FW=20
> |172.23.1.254 | Clavister
> +-------------+
>       |
> +-------------+
> |172.23.1.3   | http Server
> +-------------+
>=20
> ->tcpdump in Tracepoint 2
> 00:13:22.533400 IP (tos 0x0, ttl 127, id 2541, offset 0, flags [none],
> proto 6, length: 75) 172.23.1.3.80 > 172.24.1.2.32871: P [tcp sum ok]
> 1:24(23) ack 118 win 65418 <nop,nop,timestamp 42430074 1538753435>
>   0x0000:  4500 004b 09ed 0000 7f06 d78b ac17 0103  E..K............
>   0x0010:  ac18 0102 0050 8067 be59 cca9 4935 c1b7  .....P.g.Y..I5..
>   0x0020:  8018 ff8a 98dd 0000 0101 080a 0287 6e7a  ..............nz
>   0x0030:  5bb7 839b 4854 5450 2f31 2e30 2033 3032  [...HTTP/1.0.302
>   0x0040:  2052 6564 6972 6563 740d 0a              .Redirect..
>=20
> ->tcpdump in Tracepoint 1
> 00:13:22.544901 IP (tos 0x0, ttl 125, id 2541, offset 0, flags [none],
> proto 6, length: 75) 172.23.1.3.1 > 172.24.1.2.32871: P [tcp sum ok]
> 3193556137:3193556160(23) ack 1228259767 win 65418 <nop,nop,timestamp
> 42430074 1538753435>
>   0x0000:  4500 004b 09ed 0000 7d06 d98b ac17 0103  E..K....}.......
>   0x0010:  ac18 0102 0001 8067 be59 cca9 4935 c1b7  .......g.Y..I5..
>   0x0020:  8018 ff8a 992c 0000 0101 080a 0287 6e7a  .....,........nz
>   0x0030:  5bb7 839b 4854 5450 2f31 2e30 2033 3032  [...HTTP/1.0.302
>   0x0040:  2052 6564 6972 6563 740d 0a              .Redirect..
>=20
> Regards
> /Hans
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

