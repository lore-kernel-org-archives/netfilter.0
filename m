From: n_dahlem@gmx.net
Subject: UDP-conntrack/nat question
Date: Thu, 25 Sep 2003 11:26:20 +0200 (MEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <27575.1064481980@www45.gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: netfilter@lists.netfilter.org

Hi,

I'm trying to conntrack/nat a udp-based protocol with a server listening on
port x. My problem is, that the conntrack-helper sees all incoming and
outgoing packets of the control connection, while the nat-helper is only ca=
lled for
outgoing packets. Due to the nature of the protocol I need
IP_NAT_HELPER_F_ALWAYS to mangle the contents of both outgoing and incoming=
 packets (even when
there are no expected connections).

The scenario is the following:

PC1 -> MASQ -> server

The conntrack module gets a packet from PC1 (src port x, dst port x) and
parses the protocol.
The nat_module mangles the packet content and the packet is send of to the
server with the source address of MASQ (src port x, dst port x).
The conntrack_module receives a packet from Server (src port: high, dst port
x) and parses the protocol.
The nat_module isn't called.

I reqister my modules with the following tuples:

nat_module:
hlpr->tuple.dst.protonum =3D IPPROTO_UDP;
hlpr->tuple.src.u.udp.port =3D port x;
hlpr->mask.src.u.udp.port =3D 0xFFFF;
hlpr->mask.dst.protonum =3D 0xFFFF;
hlpr->flags =3D IP_NAT_HELPER_F_ALWAYS;

conntrack_module:
hlpr->tuple.src.u.udp.port =3D port x;
hlpr->tuple.dst.protonum =3D IPPROTO_UDP;
hlpr->mask.src.u.udp.port =3D 0xFFFF;
hlpr->mask.dst.protonum =3D 0xFFFF;


/proc/net/ip_conntrack lists both connections (answer&reply) as unreplied.
Can someone explain to me why the reply is seen as a new connection ? And
how I can get NAT to expect answers from randomly selected high ports ?


regards

Nikolai Dahlem

--=20
NEU F=DCR ALLE - GMX MediaCenter - f=FCr Fotos, Musik, Dateien...
Fotoalbum, File Sharing, MMS, Multimedia-Gru=DF, GMX FotoService

Jetzt kostenlos anmelden unter http://www.gmx.net

+++ GMX - die erste Adresse f=FCr Mail, Message, More! +++


