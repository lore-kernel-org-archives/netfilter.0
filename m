From: "Sietse van Zanen" <sietse@wizdom.nu>
Subject: RE: Urgent help with firewall packet forwarding!!
Date: Thu, 1 Jun 2006 14:12:09 +0200
Message-ID: <02BB8A4AC86C564C89C7F14CF98CE0C4012785@knowledge.wizdom.nu>
References: <1177.202.123.0.206.1149096265.squirrel@mx.uom.ac.mu>
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
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: ramsurrunv@mx.uom.ac.mu, netfilter@lists.netfilter.org

A piece of advice. Educate yourself in TCP/IP, Routing and netfilter.
=20
What you are trying to do seems so darn illogical to me, that I'm not =
even going to try to understand it.
=20
Trying to route packets without routing? that's like trying to drive a =
car without an engine.... Or smoking a pipe without tobacco....
=20
Netfilter does not route packets, the routing engine in the kernel does. =
Netfilter just inspects and makes decision whether to let traffic =
through.
=20
-Sietse

________________________________

From: netfilter-bounces@lists.netfilter.org on behalf of =
ramsurrunv@mx.uom.ac.mu
Sent: Wed 31-May-06 19:24
To: netfilter@lists.netfilter.org
Subject: Urgent help with firewall packet forwarding!!



Hi to all,

This is the topology of the network I'm trying to set up:

       __________         _____________         _________
      |          |       |             |       |         |
      |      eth1|-------|eth0 FW1 eth1|-------|eth1     |
      |          |       |_____________|       |         |
PC_A--|eth0 PC_B |                             |PC_C eth0|--PC_D
      |          |        _____________        |         |
      |      eth2|-------|eth0 FW2 eth1|-------|eth2     |
      |__________|       |_____________|       |_________|



The configurations on the respective PCs are:
PC_A:
eth0 =3D 192.168.0.10/24

PC_B:
eth0 =3D 192.168.0.1/24
eth1 =3D 192.168.10.10/24
eth2 =3D 192.168.10.11/24

FW1:
eth0 =3D 192.168.10.12/24
eth1 =3D 192.168.20.12/24

FW2:
eth0 =3D 192.168.10.13/24
eth1 =3D 192.168.20.13/24

PC_C:
eth0 =3D 192.168.30.1/24
eth1 =3D 192.168.20.10/24
eth2 =3D 192.168.20.11/24

PC_D:
eth0 =3D 192.168.30.10/24


I wanted to know the following:

1) FW1 & FW2 are PCs with iptables firewalls on them. They verify the
packets from PC_A and then forwards them on towards PC_D. Is there a way
to make the firewalls forward traffic with having them do routing, that
is, only switch the packets to the other side after inspection?

2) If I put the NICs eth0 & eth1 of the firewalls FW1 & FW2, eth1 & eth2
of PC_B and PC_C on the same network, with ip forwarding enabled and
rp_filter disabled, will the FORWARD Chain of the iptables forward the
packets from PC_A to PC_D without having a look at the routing table.I
tried to do it, but it didn't work..i don't know if it's possible or =
it's
simply me making some mistakes with the routing.

Any help will be most appreciated..to all of you guys, pls give me your
comments cos I'm stuck with making this work for quite some time now :(

Warm regards,
Visham




