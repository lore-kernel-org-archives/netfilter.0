From: "Barry A Rich" <barich@trisectrix.com>
Subject: Load balancing across multiple PPP uplinks
Date: Thu, 30 Oct 2008 15:34:56 -0400
Message-ID: <000c01c93ac6$978d8660$c6a89320$@com>
Reply-To: <barich@trisectrix.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-us
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

I've successfully configured load balancing across multiple Ethernet
uplinks. The setup is as follows:

Uplinks:
 eth1: net=192.168.1.0/24, IP=192.168.1.130, Gateway=192.168.1.1
 eth2: net=192.168.2.0/24, IP=192.168.2.131, Gateway=192.168.2.1

Routing:
 ip route add 192.168.1.0 dev eth1 src 192.168.1.130 table uplink1
 ip route add default via 192.168.1.1 table uplink1

 ip route add 192.168.2.0 dev eth2 src 192.168.2.131 table uplink2
 ip route add default via 192.168.2.1 table uplink2

 ip route add 192.168.1.0 dev eth1 src 192.168.1.130
 ip route add 192.168.2.0 dev eth2 src 192.168.2.131

 ip rule add from 192.168.1.130 table uplink1
 ip rule add from 192.168.2.131 table uplink2

 ip route add default scope global \
  nexthop via 192.168.1.1 dev eth1 weight 1 \
  nexthop via 192.168.2.1 dev eth2 weight 1

I've tried to change the routing to use two PPP uplinks as follows:

Uplinks:
 ppp0: IP=174.150.202.179, P-t-P=68.28.241.69
 ppp1: IP=70.11.196.32, P-t-P=68.28.249.69

Routing for:
 ip route add 68.28.241.69 dev ppp0 table uplink1
 ip route add default via 174.150.202.179 table uplink1

 ip route add 68.28.249.69 dev ppp1 table uplink2
 ip route add default via 70.11.196.32 table uplink2

 ip route add 68.28.241.69 dev ppp0 src 174.150.202.179 *
 ip route add 68.28.249.69 dev ppp1 src 70.11.196.32 *

 ip rule add from 174.150.202.179 table uplink1
 ip rule add from 70.11.196.32 table uplink2

 ip route add default scope global \
  nexthop via 68.28.241.69 dev ppp0 weight 1 \
  nexthop via 68.28.249.69 dev ppp1 weight 1

* These commands cause the following error: "RTNETLINK answers: File
exists".

I'm look for advice on what's wrong with the new setup for PPP devices.

Thanks in advance.


