From: "CARRY Gilles" <gilles.carry@volubill.com>
Subject: Accessing physical subnets with same address range via a single
	gateway
Date: Fri, 12 Nov 2004 11:04:15 +0100
Message-ID: <1C888AFC989D0E45BA0417091408E23199E897@saturne.volubill.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
content-class: urn:content-classes:message
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi,

=20

I need to access several equipments through a single gateway. These
equipments have the same address range (172.16.32.0/24) which cannot be
modified.

=20

Here is a diagram worth a thousand words:

=20

                     gateway

(general network:GN) - eth0

                       eth1  ---- (equipments A: subnet=3D =
172.16.32.0/24)

                       eth2  ---- (equipments B: subnet=3D =
172.16.32.0/24)

                       eth3  ---- (equipments C: subnet=3D =
172.16.32.0/24)

=20

My idea is to NAT all these subnets from the general network. Equipment
A would be accessible from GN using its nonNATed subnets (172.16.32.x
...) Equipment B would be accessible from GN using NATed adrresses
(172.20.32.x-> 172.16.32.x)

Equipment C would be accessible from GN using NATed adrresses
(172.24.32.x-> 172.16.32.x)

=20

So I need to NAT each whole subnet toward a specific interface.

The problem here is twofold: routing and NATing to physical subnets that
have the same address range and attached to a single machine.

=20

Before trying with several equipments, I tried to setup a single subnet
with only one server acting as equipment B having the range:
172.16.32.0/24.

On the gateway:

      ifconfig eth2 172.16.32.100/24 up

      ifconfig eth2:1 172.20.32.100/24 up

=20

On the B equipment:

      Ifconfig eth0 172.16.32.10/24 up

=20

So I get this:

                     gateway

(general network:GN) - eth0

                       eth2   (172.16.32.100) ---- (equipment B=3D
172.16.32.10)

                       eth2:1 (172.20.32.100)

=20

ping 172.16.32.10 works.

ping 172.20.32.10 does not work (as expected!)

=20

Now I tried to setup NAT on the gateway:

iptables -t nat -A POSTROUTING -d 172.20.32.0/24 -j NETMAP --to
172.16.32.0/24

=20

I expected that pinging 172.20.32.10 from the gateway would route the
packets to eth1:1, NETMAP them as 172.16.32.10 and send them on the
wire. Unfortunately it does not work. A tcpdump from equipment B says
that 172.16.32.100 is broadcasting arp request: "who has 172.20.32.10?",
meaning that the POSTROUTING NAT didn't work.

=20

Any clue?

=20

Since I'm not a netfilter expert I'm begging for help.

I don't know if my solution correct or I'm doing something wrong.

May be this is not feasible with a single gateway?

May be I should use a combination with the ROUTE target?

=20

Thank you for your comments.

=20

The gateway runs a Linux Debian 2.6.7-1-386.

=20

=20

Best regards,

Gilles.

=20

=20

