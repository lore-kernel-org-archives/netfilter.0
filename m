From: "J.T. Moore" <jtmoore@international-auto.com>
Subject: Re: Forcing traffic out the same interface on a dual homed
	server(without using routes) ?
Date: Fri, 12 Aug 2005 11:40:54 -0400
Message-ID: <006401c59f54$3b8f1830$1500a8c0@domain.internationalauto.com>
References: <eaa1cc6d05081114501eb09f74@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
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

Felix,

Check out iproute 2 which allows you to create and use different routing =
tables based on the source ip address, incoming interface, tos etc. Many =
distirbutions already have it, try: "man ip" to see if yours does, or =
get it from http://developer.osdl.org/dev/iproute2/

For example if:=20
    eth0 ip address: 192.168.0.1
    eth0 subnet: 192.168.0.0/24
    eth1 ip address: 192.168.1.1
    eth1 subnet: 192.168.1.0/24
    default gateway attached to eth0: 192.168.0.254
    other gateway on eth1 subnet: 192.168.1.254

create an alternate routing table with iproute2 for traffic from =
192.168.1.0/24 on eth1

    ip route add 192.168.0.0/24 dev eth0 table 1
    ip route add default via 192.168.1.254 dev eth1 table 1

tell the kernel to use the alternate routing table for packets with =
source address in 192.168.1.0/24

    ip rule add from 192.168.1.0/24 table 1 priority 100

Then you can use iptables to prevent traffic from the network on eth1 =
going out eth0

    iptables -A FORWARD -i eth1 -o eth0 -j DROP

or if if the hosts on the eth1 network can talk to the hosts on the eth0 =
network but can't go passed the gateway for the eth0 network then you =
could do this

    iptables -A FORWARD -i eth1 -o eth0 -d ! 192.168.0.0/24 -j DROP


Regards,

J.T. Moore






----- Original Message -----=20
From: "Felix" <fmontes@gmail.com>
To: <netfilter@lists.netfilter.org>
Sent: Thursday, August 11, 2005 5:50 PM
Subject: Forcing traffic out the same interface on a dual homed =
server(without using routes) ?


Hi all,

If i have 2 interfaces on a linux server, say eth0 and eth1, and=20
a) default gateway is eth0 =3D production
b) there is a complex network on eth1 =3D administration
c) i can't have routing entries for the administration network
(dont ask why, its an OSI layer 9 problem (the political layer))

Can iptables restrict traffic that came in through eth1/administration =
to=20
only go out through eth1?

I think what i'm trying to do is bypass the routing decision if somehow =
it=20
was known on which interface the connection initiated. And even if =
iptables=20
could manage to send the traffic out the same interface, would it just =
be=20
dropped on the local subnet? how would it be sent to the default gateway =
on=20
that subnet?

Your enlightening comments will be appreciated.

Regards,
-Felix



