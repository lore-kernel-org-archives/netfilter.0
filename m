From: Chris Brenton <cbrenton@chrisbrenton.org>
Subject: Re: How to DNAT the only NetBios broadcast traffic
	(03:00:00:00:00:01)??
Date: Mon, 14 Jun 2004 14:25:39 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1087237538.2010.7.camel@grendel>
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
Content-Type: text/plain; charset="windows-1252"
To: bassam@palettemm.com
Cc: netfilter <netfilter@lists.netfilter.org>

On Mon, 2004-06-14 at 00:08, Bassam A. Al-Khaffaf wrote:
>
> In fact I got stuck on how to forward ONLY and ONLY the NETBIOS
> broadcast traffic (03:00:00:00:00:01) from any machine on LAN2 to the
> domain controller on LAN1. Take note that the NETBIOS traffic is
> carried on IEEE 802.3 Ethernet.

I think you are confused. _NetBEUI_ transmits to 3:0:0:0:0:01, not
NetBIOS/IP. These are NetBEUI _multicasts_, not broadcasts.

If you are actually using NetBEUI your options are:
1) bridge the traffic
2) Upgrade to NetBIOS/IP or SMB/IP

If you are actually using NetBIOS/IP already, your options are:
1) setup a WINS server
2) create lmhosts entries on the client

> I wrote the following iptable rule, but here all the traffic will be
> directed from LAN2 to the domain controller on LAN1
>=20
> Iptables =96t nat =96A PREROUTING =96I eth1 =96j DNAT =96to-destination
> 192.168.1.231

If you are using NetBEUI, your problem is not iptables. Your problem is
you are using a non-routable protocol. As mentioned above, you need to
use a bridge or switch over to something IP based.

HTH,
Chris



