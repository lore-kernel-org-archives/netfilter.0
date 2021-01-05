From: Christian Perle <christian.perle@secunet.com>
Subject: BUG: IPv4 conntrack reassembles forwarded packets
Date: Tue, 5 Jan 2021 13:12:08 +0100
Message-ID: <20210105121208.GA11593@cell>
Reply-To: <christian.perle@secunet.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org, netdev@vger.kernel.org
Cc: steffen.klassert@secunet.com

Hello,

During testing several tunnel scenarios, I noticed a problematic
behaviour of IPV4 conntrack.


BUG: IPv4 conntrack reassembles forwarded packets
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Conntrack needs to reassemble fragments in order to have complete
packets for rule matching. However the IPv4 stack should not change
forwarded packets if not explicitely told to do so.
Unwanted reassembly can even lead to packet loss.

Consider the following setup:

            +--------+       +---------+       +--------+
            |Router A|-------|Wanrouter|-------|Router B|
            |        |.IPIP..|         |..IPIP.|        |
            +--------+       +---------+       +--------+
           /                  mtu 1400                   \
          /                                               \
+--------+                                                 +--------+
|Client A|                                                 |Client B|
|        |                                                 |        |
+--------+                                                 +--------+

Router A and Router B use IPIP tunnel interfaces to tunnel traffic
between Client A and Client B over WAN. Wanrouter has MTU 1400 set
on its interfaces.

Detailed setup for Router A
---------------------------
Interfaces:
eth0: 10.2.2.1/24
eth1: 192.168.10.1/24
ipip0: No IP address, local 10.2.2.1 remote 10.4.4.1
Routes:
192.168.20.0/24 dev ipip0    (192.168.20.0/24 is subnet of Client B)
10.4.4.1 via 10.2.2.254      (Router B via Wanrouter)
No iptables rules at all.

Detailed setup for Router B
---------------------------
Interfaces:
eth0: 10.4.4.1/24
eth1: 192.168.20.1/24
ipip0: No IP address, local 10.4.4.1 remote 10.2.2.1
Routes:
192.168.10.0/24 dev ipip0    (192.168.10.0/24 is subnet of Client A)
10.2.2.1 via 10.4.4.254      (Router A via Wanrouter)
No iptables rules at all.

Path MTU discovery
------------------
Running tracepath from Client A to Client B shows PMTU discovery is working
as expected:

clienta:~# tracepath 192.168.20.2
 1?: [LOCALHOST]                      pmtu 1500
 1:  192.168.10.1                                          0.867ms
 1:  192.168.10.1                                          0.302ms
 2:  192.168.10.1                                          0.312ms pmtu 1480
 2:  no reply
 3:  192.168.10.1                                          0.510ms pmtu 1380
 3:  192.168.20.2                                          2.320ms reached
     Resume: pmtu 1380 hops 3 back 3

Router A has learned PMTU (1400) to Router B from Wanrouter.
Client A has learned PMTU (1400 - IPIP overhead =3D 1380) to Client B
from Router A.

Send large UDP packet
---------------------
Now we send a 1400 bytes UDP packet from Client A to Client B:

clienta:~# head -c1400 /dev/zero | tr "\000" "a" | nc -u 192.168.20.2 5000

The IPv4 stack on Client A already knows the PMTU to Client B, so the
UDP packet is sent as two fragments (1380 + 20). Router A forwards the
fragments between eth1 and ipip0. The fragments fit into the tunnel and
reach their destination.

Adding conntrack iptables rule =3D=3D> packet loss
----------------------------------------------
Now on Router A the following iptables rule is added:

routera:~# iptables -t mangle -A PREROUTING -m state \
  --state ESTABLISHED -j ACCEPT

When sending the large UDP packet again, Router A now reassembles the
fragments before routing the packet over ipip0. The resulting IPIP
packet is too big (1400) for the tunnel PMTU (1380) to Router B, it is
dropped on Router A before sending.

Client A cannot do anything to fix this, because it already respects the
PMTU (1380) to Client B and sends fragments fitting into it.

The problem also happens when using IPSec tunnels with XFRM interfaces
(this is the actual use case, the setup above just uses IPIP for
simplicity).

IPv6 does it right
------------------
When testing a similar setup with IPv6 and ip6tnl interfaces, the
conntrack ip6tables rule does not affect the forwarded UDP fragments.
Though reassembly takes place for conntrack, the reassembled packet is
not forwarded.

So the solution would be making IPv4 behaving like IPv6, using reassembly
for conntrack reasons *only* and not forwarding the reassembly result
but the original fragments.


Regards,
  Christian Perle
--=20
Christian Perle
Senior Berater / Senior Consultant
Netzwerk- und Client-Sicherheit / Network & Client Security
=D6ffentliche Auftraggeber / Public Authorities
secunet Security Networks AG

Tel.: +49 201 54 54-3533, Fax: +49 201 54 54-1323
E-Mail: christian.perle@secunet.com
Ammonstra=DFe 74, 01067 Dresden, Deutschland
www.secunet.com

secunet Security Networks AG
Sitz: Kurf=FCrstenstra=DFe 58, 45138 Essen, Deutschland
Amtsgericht Essen HRB 13615
Vorstand: Axel Deininger (Vors.), Torsten Henn, Dr. Kai Martius, Thomas Ple=
ines
Aufsichtsratsvorsitzender: Ralf Wintergerst
