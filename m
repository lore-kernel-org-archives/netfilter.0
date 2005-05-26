From: "Eduardo Spremolla" <edspremolla@antel.com.uy>
Subject: Re: Subnets: Make Static Route or Iptables Rules
Date: Thu, 26 May 2005 09:09:35 -0300
Message-ID: <1117109375.8314.4.camel@fly.in.iantel.com.uy>
References: <42948ED3.7090407@novadevices.com>
	<8ca4228205052510204f725724@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <8ca4228205052510204f725724@mail.gmail.com>
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
To: Mike <1100100@gmail.com>
Cc: netfilter@lists.netfilter.org

You need to allow forwarding in both directions:
$IPTABLES -t filter -A FORWARD -i eth1 --source 192.168.169.0/24 -j
ACCEPT
$IPTABLES -t filter -A FORWARD -i eth2 --source 192.168.170.0/24 -j
ACCEPT

The prerouting Dnat is not required, be sure not to nat eth1 to eth2
traffic.

LALO

On Wed, 2005-05-25 at 13:20 -0400, Mike wrote:
> I have a linux routerbox with 3 nics.: =20
>=20
> ppp0 goes to the internet service provider
> eth1 serves as gateway to a subnet
> eth2 serves as gateway to another subnet
>=20
> I want LAN clients from subnet eth2 to be able to access a Samba
> Server box located on subnet eth1
>=20
> I have tried making a static route using --- route -n add
> <destination> <gateway>   but all I get no matter what I try is: =20
> SIOCADDRT: No such device
>=20
> Here's my route -n
>=20
> Kernel IP routing table
> Destination     Gateway         Genmask         Flags Metric Ref    =
Use Iface
> 204.60.4.34     0.0.0.0         255.255.255.255 UH    0      0        =
0 ppp0
> 64.204.68.128   0.0.0.0         255.255.255.248 U     0      0        =
0 eth0
> 192.168.170.0   0.0.0.0         255.255.255.0   U     0      0        =
0 eth2
> 192.168.169.0   0.0.0.0         255.255.255.0   U     0      0        =
0 eth1
> 127.0.0.0       127.0.0.1       255.0.0.0       UG    0      0        =
0 lo
> 0.0.0.0         204.60.4.34     0.0.0.0         UG    0      0        =
0 ppp0
>=20
> As a result of trying out a few extra iptables rules, I can now ping
> the eth1 gateway from the eth2 subnet clients, but I still cannot
> ping/reach the Samba server box on the eth1 subnet.
>=20
> Here's the rules I've added in hopes of making a proper path from
> subnet eth2 to eth1:
>=20
> $IPTABLES -t nat -A PREROUTING -p tcp -i eth1 --source
> 192.168.170.0/24 -j DNAT --to-destination 192.168.169.2
> $IPTABLES -t nat -A PREROUTING -p udp -i eth1 --source
> 192.168.170.0/24 -j DNAT --to-destination 192.168.169.2
>=20
> and
>=20
> $IPTABLES -t filter -A INPUT -i eth1 --source 192.168.170.0/24 -j =
ACCEPT
>=20
> and
>=20
> $IPTABLES -t filter -A FORWARD -i eth1 --source 192.168.170.0/24 -j =
ACCEPT
>=20
> Again, to be clear, clients on subnet eth2 can ping the gateway nic
> (eth1), but cannot ping the samba box located on subnet eth1.
>=20
> If I can just ping that box, I can config Samba the rest of the way.
>=20
> So I'm not sure if what I need for this is to create a static route,
> or whether iptables rules are all I need.
>=20
> Thank you for your time and patience in reading this post.
>=20
> Regards,
>=20
> Mike
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

