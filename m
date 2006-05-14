From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Cannot route through an if without ip
Date: Sun, 14 May 2006 14:00:42 +0200
Message-ID: <44671BEA.5020008@plouf.fr.eu.org>
References: <20060514080905.18403.qmail@mx1.aruba.it>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20060514080905.18403.qmail@mx1.aruba.it>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

Hello,

antonio.dibacco a =E9crit :
>=20
> I have an ethernet (eth1) without any assigned ip, nevertheless I would=
=20
> like to route through this IF but issueing the following command gives=20
> an error:
> route add -net 192.168.1.0 dev eth1

When I type this command I get an error because 192.168.1.0 is not a=20
subnet, I must add a mask or prefix length, for instance :

route add -net 192.168.1.0/24 dev eth1

> If the same IF has an address the command will be correctly executed.
> Why?

The interface has to be up and bound to IPv4. You can check this when=20
directory /proc/sys/net/ipv4/conf/eth1 exists. To force this without=20
assigning an address to the interface, just execute the following command=
 :

ifconfig eth1 0.0.0.0 up

The default source address used in locally generated packets will be=20
chosen among addresses assigned to other interfaces. You can assign it=20
statically creating the route with 'ip' instead of 'route' :

ip route add 192.168.1.0/24 dev eth1 src $LOCAL_IP

where $LOCAL_IP is a local address assigned to any interface but the=20
loopback.

Note there are possible issues regarding routing and ARP if you expect=20
to receive IPv4 traffic on eth1.
- Routing : hosts on the network reachable on eth1 must have appropriate=20
route(s) to the box addresse(s).
- ARP : your box must accept and reply to ARP requests about any local=20
address received on eth1. For this, make sure the kernel parameters=20
arp_filter, arp_announce and arp_ignore in /proc/sys/net/ipv4/conf/eth1=20
have appropriate value (default values 0 should be fine). Or you can add=20
static ARP entries on the hosts reachable on eth1.

PS: Any feedback about my reply to your previous question ?

