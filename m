From: Torsten Krah <tkrah@fachschaft.imn.htwk-leipzig.de>
Subject: ipsec tunnel problem with snat taking place on gateway
Date: Thu, 15 Dec 2005 16:32:32 +0100
Message-ID: <1134660753.13512.9.camel@web.mittelerde.home>
Reply-To: tkrah@fachschaft.imn.htwk-leipzig.de
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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

Hello.

I am using ipsec-tools-0.6.x and a kernel 2.6.14 .

Following network setup is used:

Network A is a non private network, so all addresses are routable
without NAT, lets call it 141.57.23.0 for example purpose. 

141.57.23.1 is the main gateway, which is connected to outside world.
There's no NAT taking place there. 

Now i got a BOX in Network A, which got 3 interfaces: 

eth0 - 141.57.23.18 -> connected to Network A 
eth1 - 192.168.1.1 -> private Network, WLAN Access Point Interface -
only UDP Packets on OpenVPN Port can pass and DHCP for initial Access. 
tap0 - 10.1.0.1 OpenVPN device (Network B), all RoadWarriors which want
to surf the WLAN me provides get IP's in range 10.1.0.100 - 10.1.0.200 -
for http,ftp connections they have to use proxy at 141.57.23.13 . 

All connections are nated at this BOX, with postrouting rule a SNAT to
141.57.23.18 is taking place. 

iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to-source 141.57.23.18 

So far it works fine. No problems with this setup. 

And now the addon which causes the problem: 

Network A with 141.57.23.x should communicate over IPSec only. 

So for eth0 a new VPN should be opened with ipsec so i can drop all
other packets which didnt came in through esp protocol. 

Setup is working for Network A, Box 18 could reach all others in
network, lets take 13 (proxy) as example - Tunnel is established
successfull and they can communicate with each other. 

But for Boxes in Network B (10.1.0.x) only Box 18 is reachable, all
other connections for which a tunnel is needed arent reachable, 13 for
example. ( connection for which no esp tunnel is needed according to
ipsec.conf are still reachable, of cause ... its like original setup
without IPSec). 

A ping from Box in Network B to B looks like the following in tcpdump

On tap0 it comes in on Router Box 10.1.0.1. 
On eth0 same box proto esp theres no paket seen.
On eth0 same box normal icmp traffic generated from the Box in Network B
is seen - so SNAT is taking place, but the packet now have to go through
the ipsec tunnel, but it takes the unencrypted way ... which it shouldnt
do because the destination host exspects encrypted packets from that
host.

I know that the packets are shown twice in the chain, but there is no
crypted packet - only the uncrypted is there.

The OpenVPN have to be there, it shouldnt be removed for Network B - but
the need for ipsec in Network A is there too, so i am searching for a
solution, to got these two networks communicate with each other, so i
wonder, if theres a design error i got, a error in general because of
protocol specification or the thing which maybe is the one i hope, i
forgot some aspects to configure or remember.

Any hints are welcome.

kind regards

Torsten


