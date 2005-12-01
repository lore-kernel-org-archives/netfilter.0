From: Rudi Starcevic <tech@wildcash.com>
Subject: Re: dumb question...route from local eth1 to eth2 and vice versa
Date: Thu, 01 Dec 2005 17:05:33 +1000
Message-ID: <438EA0BD.3070804@wildcash.com>
References: <000001c5f642$ab8b8890$0101000a@sterenborg.info>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------060603050404050901090905"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <000001c5f642$ab8b8890$0101000a@sterenborg.info>
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
To: netfilter@lists.netfilter.org

This is a multi-part message in MIME format.
--------------060603050404050901090905
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hi,

Eek .. let me try that again.
My earlier post has an old copy of the iptables
script. I've timmed it down so it should all work
with a simple default = ACCEPT iptables firewall.

I have two scripts I use to do something similar to this.

I figured this out just reading howto's on the web so
it could be fully wrong and I may get flamed for posting them.

What the scipts does is connect two networks and is
an internet gateway for both.

I think this setup should work OK for your gaming setup.
Just edit the networks to suit what you need.

The Linux router box has 2 NICs

eth0: 192.168.1.0/24
eth1: 192.168.3.0/24

The default gateway is the ADSL modem: 192.168.1.254

Both networks can see each other, the machines on the
192.168.3.0/24 network set their gateway as the Linux box
which in turn forwards their traffic to it default gw 192.168.1.254.

The script uses 'iproute' and 'iptables'.

Any feedback much appreciated.

Thanks.
Kind regards,
Rudi.



--------------060603050404050901090905
Content-Type: text/plain;
 name="ip_a_route_1.sh"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="ip_a_route_1.sh"

#!/bin/sh

echo "Network Setup Start"

echo "Flushing NICs"
ip addr flush eth0
ip addr flush eth1

ip link set eth0 down
ip link set eth1 down

ip link set eth0 up
ip link set eth1 up

echo "Routing Tables:"
cat /etc/iproute2/rt_tables 
### example file ###
## reserved values
##
#255	local
#254	main
#253	default
#0	unspec
##
## local
##
##1	inr.ruhep
#200	implan
#201	inet
### example end ###

echo "Setup NIC 0"
ip addr add 192.168.3.10/24 dev eth0 brd +

echo "Setup NIC 1"
ip addr add 192.168.1.1/24 dev eth1 brd +

ip addr list
ip route list

echo "Setup Default Route [ inet table ]"
ip route add default via 192.168.1.254 proto static table inet

echo "Setup LAN Route [ implan table ]"
ip route add 192.168.3/24 via 192.168.3.10 proto static table implan

ip route list

echo "Setup LAN ip rule"
ip rule add to 192.168.3/24 prio 16000 table implan

echo "Setup Internet ip rule"
ip rule add to 0/0 prio 17000 table inet

echo "Flushing ip route cache"
ip route flush cache

--------------060603050404050901090905--

