From: Ray Leach <spoons@rchq.co.za>
Subject: Re: Multi ISP router/firewall ...
Date: Wed, 28 Mar 2007 07:51:58 +0200
Message-ID: <1175061118.21066.34.camel@rayw.internal>
References: <3564089.276511175009558150.JavaMail.www@wwinf1504>
Reply-To: spoons@rchq.co.za
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <3564089.276511175009558150.JavaMail.www@wwinf1504>
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
To: pierre.juhen@wanadoo.fr
Cc: Netfilter <netfilter@lists.netfilter.org>

On Tue, 2007-03-27 at 17:32 +0200, Pierre JUHEN wrote:
> Suggested reading : http://www.ssi.bg/~ja/nano.txt
>=20
> It explains how the routing is done.
>=20
> Using the ROUTE patch, you force the routing outside the=20
> routing table.
>=20
> When a packet comes back on an established connection,
> the kernel lookup in the cache, with the input interface=20
> as part of the matching.
>=20
> Since in the cache, you have the other interface (ISP1)
> for this connection, it doesn't route the packet.
>=20
> You should use something else than the ROUTE target, for example
> what is explained in nano.txt.
>=20
>=20

Hi

I tried both methods - iptables using the ROUTE target as well as using
iptables to mark the packets, then using iproute2 to lookup and route
using a table with an ip fwmark rule.

In both cases, the traffic is routed out and return traffic comes back
in the correct interface, but it does not get NATed backed to the
client.

iptables -A FORWARD -i eth0 -p tcp --dport 80 -s 10.0.0.3 -j ACCEPT
iptables -A FORWARD -i eth4 -p tcp --sport 80 -d 10.0.0.3 -j ACCEPT

iptables -A FORWARD -t mangle -p tcp --dport 80 -s 10.0.0.3 -j MARK
--set-mark 0x4

iptables -A POSTROUTING -t nat -o eth4 -p tcp --dport 80 -s 10.0.0.3 -j
SNAT --to 10.1.0.2

ip rule del fwmark 4 table 4 priority 32000
ip route flush table 4
ip route add table 4 default via 10.1.0.1
ip rule add fwmark 4 table 4 priority 32000
ip route flush cache


What am I doing wrong?

Looking in /proc/net/ip_conntrack I can find an entry for http traffic
from machine at ip 10.0.0.3 created by the SNAT rule above. When the
traffic returns back in eth4 it seems to disappear on the firewall ...

Regards

Ray

>=20
> > Message du 27/03/07 14:54
> > De : "Ray Leach" <spoons@rchq.co.za>
> > A : "Netfilter" <netfilter@lists.netfilter.org>
> > Copie =E0 :=20
> > Objet : Multi ISP router/firewall ...
> >=20
> > Hi All
> >=20
> > I've been trying to configure a router/firewall with 5 zones (2 of whic=
h
> > are ISP links) unsuccessfully.
> >=20
> > So far I've managed to patch the kernel with the ROUTE target, and I've
> > got rules as follows:
> >=20
> > FORWARD chain filter table:
> > ACCEPT     0    --  ethxx0 eth4    10.0.0.0/24    0.0.0.0/0          =20
> > ACCEPT     0    --  eth4   ethxx0  0.0.0.0/0      10.0.0.0/24
> >=20
> > FORWARD chain mangle table:
> > ROUTE      tcp  --  *      *       10.0.0.67    !192.168.1.0/24      tc=
p
> > dpts:80:90 ROUTE oif:eth4 continue
> >=20
> >=20
> > POSTROUTING chain nat table:
> > SNAT       0    --  *      eth4    0.0.0.0/0    0.0.0.0/0  to:10.1.0.2
> >=20
> >=20
> > ethxx0 is my internal LAN
> > eth4 is my 2nd ISP connection
> > 10.0.0.67 is my workstation
> > 10.1.0.2 is the ip bound to eth4
> >=20
> > The other ISP link is working, we host around 12 websites on servers in
> > our DMZ, we have outgoing web browsing, email, MSN, etc. using various
> > nat rules for that interface, they all work.
> >=20
> > I can see using tcpdump that the packets are leaving my workstation,
> > being mangles to change the route, going out the 2nd ISP link, coming
> > back into the 2nd ISP link, but then they disappear.
> >=20
> > My forwarding rules as shown above do not show any traffic.
> >=20
> > This has me stumped.
> >=20
> > As I've stated, I have nat (both SNAT and DNAT) working on the other IS=
P
> > interface on the same machine.
> >=20
> > Where should I start looking?
> >=20
> > Regards
> >=20
> > Ray
> > --=20
> > Raymond Leach
> > RCHQ Hobbies (http://www.rchq.co.za/)
> > (T)+27-82-575-6975 (F)+27-86-652-2773
> >=20
> >=20
> >=20
> >
>=20
>=20
>=20
--=20
Raymond Leach
RCHQ Hobbies (http://www.rchq.co.za/)
(T)+27-82-575-6975 (F)+27-86-652-2773


