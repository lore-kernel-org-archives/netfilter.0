From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: How to DNAT the only NetBios broadcast traffic
	(03:00:00:00:00:01)??
Date: Mon, 14 Jun 2004 10:45:43 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1087224343.5243.39.camel@localhost>
References: <001b01c451c5$3c734150$1d01a8c0@palettemm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <001b01c451c5$3c734150$1d01a8c0@palettemm.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="utf-8"
To: bassam@palettemm.com
Cc: netfilter@lists.netfilter.org

On Mon, 2004-06-14 at 00:08, Bassam A. Al-Khaffaf wrote:
> Dear All,
>=20
>    I am implementing a Linux box gateway that lunch my own firewall (I
> wrote my own iptables rules). The gateway connects two LANs, LAN1:
> 192.168.1.0/24 and LAN2: 192.168.0.0/24. LAN1 contains a windows 2000
> server domain controller IP: 192.168.1.231 and LAN2 contains my
> clients based on windows xp.
>=20
> =20
>=20
> In fact I got stuck on how to forward ONLY and ONLY the NETBIOS
> broadcast traffic (03:00:00:00:00:01) from any machine on LAN2 to the
> domain controller on LAN1. Take note that the NETBIOS traffic is
> carried on IEEE 802.3 Ethernet.
>=20
> =20
>=20
> I wrote the following iptable rule, but here all the traffic will be
> directed from LAN2 to the domain controller on LAN1
>=20
> Iptables =E2=80=93t nat =E2=80=93A PREROUTING =E2=80=93I eth1 =E2=80=93j =
DNAT =E2=80=93to-destination
> 192.168.1.231
>=20
> =20
>=20
> So can anybody help me on how can I forward the traffic with
> destination MAC address 03:00:00:00:00:01 from LAN2 to the domain
> controller (192.168.1.231) on LAN1?
>=20
> =20
<snip>
I have always used some kind of NetBIOS Name Service in a routed
environment just so that I do not have to handle the broadcasts.  In
fact, I usually do this in a large switched environment as well to
minimize the broadcast traffic.

Where it is absolutely necessary, I have implemented a UDP helper to
turn the broadcast packets into unicast packets (similar to DHCP relay).
--=20
John A. Sullivan III
Chief Technology Officer
Nexus Management
+1 207-985-7880
john.sullivan@nexusmgmt.com
---
If you are interested in helping to develop a GPL enterprise class
VPN/Firewall/Security device management console, please visit
http://iscs.sourceforge.net=20


