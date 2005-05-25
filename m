From: Mike <1100100@gmail.com>
Subject: Subnets: Make Static Route or Iptables Rules
Date: Wed, 25 May 2005 13:20:11 -0400
Message-ID: <8ca4228205052510204f725724@mail.gmail.com>
References: <42948ED3.7090407@novadevices.com>
Reply-To: Mike <1100100@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42948ED3.7090407@novadevices.com>
Content-Disposition: inline
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

I have a linux routerbox with 3 nics.: =20

ppp0 goes to the internet service provider
eth1 serves as gateway to a subnet
eth2 serves as gateway to another subnet

I want LAN clients from subnet eth2 to be able to access a Samba
Server box located on subnet eth1

I have tried making a static route using --- route -n add
<destination> <gateway>   but all I get no matter what I try is: =20
SIOCADDRT: No such device

Here's my route -n

Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use Ifa=
ce
204.60.4.34     0.0.0.0         255.255.255.255 UH    0      0        0 ppp=
0
64.204.68.128   0.0.0.0         255.255.255.248 U     0      0        0 eth=
0
192.168.170.0   0.0.0.0         255.255.255.0   U     0      0        0 eth=
2
192.168.169.0   0.0.0.0         255.255.255.0   U     0      0        0 eth=
1
127.0.0.0       127.0.0.1       255.0.0.0       UG    0      0        0 lo
0.0.0.0         204.60.4.34     0.0.0.0         UG    0      0        0 ppp=
0

As a result of trying out a few extra iptables rules, I can now ping
the eth1 gateway from the eth2 subnet clients, but I still cannot
ping/reach the Samba server box on the eth1 subnet.

Here's the rules I've added in hopes of making a proper path from
subnet eth2 to eth1:

$IPTABLES -t nat -A PREROUTING -p tcp -i eth1 --source
192.168.170.0/24 -j DNAT --to-destination 192.168.169.2
$IPTABLES -t nat -A PREROUTING -p udp -i eth1 --source
192.168.170.0/24 -j DNAT --to-destination 192.168.169.2

and

$IPTABLES -t filter -A INPUT -i eth1 --source 192.168.170.0/24 -j ACCEPT

and

$IPTABLES -t filter -A FORWARD -i eth1 --source 192.168.170.0/24 -j ACCEPT

Again, to be clear, clients on subnet eth2 can ping the gateway nic
(eth1), but cannot ping the samba box located on subnet eth1.

If I can just ping that box, I can config Samba the rest of the way.

So I'm not sure if what I need for this is to create a static route,
or whether iptables rules are all I need.

Thank you for your time and patience in reading this post.

Regards,

Mike

