From: "Andreas Granheim" <andreasg@client.no>
Subject: Access to two identical subnets
Date: Tue, 31 Aug 2004 15:03:49 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <9F6B4CE6934BDF4BB50BCF2491C9F69001A4ED@CSMAIL.client.no>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hello
The goal is that all computers on the 192.168.1.0 net should have access
to two identical 10.50.50.0 subnets.
=20
Like this:
=20
=20
     ____________192.168.1.0 subnet_______________________ =20
                                  |
                             ___|____
                             |    FW   |
                           / |_______|\
 10.50.50.0 ->     /                  \   <-- 10.100.50.0
        ________ /               ____\_____
       /                               |               |

      /                                |Iptables   |____
_________        =20
     /                                                         \
|                |
__/_____                       10.50.50.0   -->      \______|    VPN 1
|
|Router1 |
\=20
 |__________________                                                 WAN
10.50.50.0 Subnet (A)
______\_
=20
|             |
=20
|  VPN 2   |
=20
/
                                   ___________________________/

                                                   10.50.50.0 Subnet (B)
=20
When computers on the 192.168.1.0 subnet ping 10.50.50.0 the FW routes
10.50.50.0 traffic to Router1 who handles the rest, this works fine.
=20
But when I shall access the other 10.50.50.0 Subnet, who I call Subnet
B, the thoughts were that if I instead use 10.100.50.0, the FW routes
this to the IPTABLES box.=20
Then mangles this to 10.50.50.0 and then goes through the vpn tunnel and
to the right IP at Subnet B.
=20
=20
Untill now I've got the routing going to the VPN 1 box. Using: iptables
-t nat -A PREROUTING -s 192.168.1.0/25 -d 10.100.50.5 -j DNAT
-to-destination 10.50.50.5
=20
When I ping 10.100.50.5 (linux server on B Subnet) from 192.168.1.35
(linux comp), I LOG in the VPN 1 box:
=20
12206.080946 192.168.1.35 -> 10.50.50.5: icmp: echo request
12207.081074 192.168.1.35 -> 10.50.50.5: icmp: echo request
=20
But it doesn't get any reply.
=20
The output NIC on IPTABLES box is on the 10.100.6.0 net, who also the
VPN 1 box stands on.
The 10.100.6.0 and the 192.168.1.0 net is in a group on the VPN 1 box,
who routes the traffic from these nets to the 10.50.50.0 net via the VPN
TUNNEL.
=20
If I ping from the IPTABLES box to 10.50.50.5, I get echo reply, but not
from the 192.168.1.35 machine.
=20
134.344974 10.100.6.3 -> 10.50.50.5: icmp: echo request
134.491585 10.50.50.5 -> 10.100.6.3: icmp: echo reply
=20
=20
What must I do, will this work at all?
=20
Do I need other rules?
=20
Will be happy for answers/suggestions :-)
