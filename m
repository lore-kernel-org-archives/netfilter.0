From: "Eduardo Spremolla" <edspremolla@antel.com.uy>
Subject: Re: Two link adsl on the same server
Date: Tue, 10 May 2005 14:30:04 -0300
Message-ID: <1115746204.26671.24.camel@fly.in.iantel.com.uy>
References: <00ee01c5557d$e1979d90$8b00000a@PIVT>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <00ee01c5557d$e1979d90$8b00000a@PIVT>
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
Content-Type: text/plain; charset="utf-8"
To: "=?iso-8859-1?Q?Sebasti=E3o_Ant=F4nio_Campos_\\=28GWA\\=29?=" <sa.campos@datasulsp.com.br>
Cc: Netfilter list <netfilter@lists.netfilter.org>

You can only do load balancing on outgoing traffic, to balance incoming
traffic, you need to use different names->

	www.your_org.com  eth0 200.168.1.19
        mail.your_org.com eth4 200.204.140.10

For the outgoing traffic use mangle PREROUTING to mark the packets
acording to the source server and use 2 ip route tables.=20


LALO =20

On Tue, 2005-05-10 at 13:32 -0300, Sebasti=C3=A3o Ant=C3=B4nio Campos =
(GWA) wrote:
> Hi!
>=20
> We have two ADSL link on the same server and we'd like to use load =
balance.
>=20
> I tried to used, but I didn't have success.
>=20
> I use on eth1 172.17.1.6 mask 255.255.0.0 my local network;
> on eth2 my first ADSL 200.168.1.19 mask 255.255.255.192 default gw =
200.204.140.1
> on eth4 my first ADSL 200.204.140.10 mask 255.255.255.192 default gw =
200.179.1.1
>=20
> This IP are static.
>=20
> On my local network I have two servers (E-mail server and one web =
server) and I need to PREROUTING with DNAT.
>=20
> And we would like to separate the port 80 and 21 using one link on =
eth0 and the port 25 and 110 other link eth4 and other ports eth0 or =
eth4 link.
>=20
> My files:
>=20
> My ifcfg-ethx files:
>=20
> #NIC SIS on board, usando link1 ADSL
> DEVICE=3Deth0
> ONBOOT=3Dyes
> #BOOTPROTO=3Ddhcp
> BOOTPROTO=3Dstatic
> BROADCAST=3D200.168.1.63
> IPADDR=3D200.168.1.19
> NETMASK=3D255.255.255.192
> NETWORK=3D200.168.1.0
> #GATEWAY=3D200.168.1.1
> ___________________________________________________________
> #Placa Realtek, Uso Local, slot 1
> DEVICE=3Deth1
> ONBOOT=3Dyes
> BOOTPROTO=3Dstatic
> IPADDR=3D172.17.1.6
> BROADCAST=3D172.17.255.255
> NETMASK=3D255.255.0.0
> NETWORK=3D172.17.0.0
> ________________________________________________________
> #NIC Realtek, link 2 ADSL
> DEVICE=3Deth4
> ONBOOT=3Dyes
> BOOTPROTO=3Dstatic
> BROADCAST=3D200.204.140.63
> IPADDR=3D200.204.140.10
> NETMASK=3D255.255.255.192
> NETWORK=3D200.204.140.0
>=20
> _________________________________________________
> file /etc/sysconfig/network
>=20
> NETWORKING=3Dyes
> HOSTNAME=3Drbz-firewall
> #GATEWAY=3D200.168.1.1
> GATEWAY=3D200.204.140.1
> ___________________________________________________
> file /etc/iproute2/rt_tables
>=20
> #
> # reserved values
> #
> #255    local
> #254    main
> #253    default
> #0      unspec
> =20
> #
> # local
> #
> #1      inr.ruhep
>=20
>=20
> Could some one help me??
>=20
> Thanks
>=20
>=20
> Sebasti=C3=A3o Ant=C3=B4nio Campos
> Infojoi Computadores Ltda
> 89.224-000 Joinville -SC - R. Iriri=C3=BA, 3587
> Cml. (47) 437-0796 - Cel. (47) 9927-5349
> tiao@infojoi.com.br
> http://www.lupusnet.com.br
--=20
Ing. Eduardo Spremolla
Jefe I+D
Antel
Uruguay


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
the sender inmediately, answering this e-mail and delete it as well as =
the attached files. Any use, circulation or copy of this e-mail by any =
person or entity that not is the specific addressee(s) is prohibited. =
ANTEL is not responsible for any communication emitted without =
respecting our Information Security Policy.

