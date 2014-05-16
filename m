From: Andreas Herz <andi@geekosphere.org>
Subject: Use the src ip from the routing table for SNAT (not the first if IP)
Date: Fri, 16 May 2014 17:00:07 +0200
Message-ID: <20140516150007.GD10939@kvmbude>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

I have the following IPs configure on the related device:

4: eth1: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast
state UP qlen 1000
    link/ether 00:50:56:a2:02:de brd ff:ff:ff:ff:ff:ff
    inet 10.0.12.2/24 brd 10.0.12.255 scope global eth1
    inet 10.0.13.4/24 scope global eth1:0

So 10.0.12.2 is the primary IP for eth1 and 10.0.13.4 is the second (or
sometimes called alias) IP.

"ip route" looks like this:

255.255.255.255 dev eth0  scope link 
192.168.0.95 dev eth0  scope link  src 192.168.0.83 
10.0.20.0/24 dev eth2  proto kernel  scope link  src 10.0.20.1 
192.168.0.0/24 dev eth0  proto kernel  scope link  src 192.168.0.83 
10.0.12.0/24 dev eth1  proto kernel  scope link  src 10.0.12.2 
10.0.13.0/24 dev eth1  proto kernel  scope link  src 10.0.13.4 
224.0.0.0/24 dev eth0  scope link 
127.0.0.0/8 dev lo  scope link 
default via 10.0.12.1 dev eth1  src 10.0.13.4

So the default gateway is the 10.0.12.1 and have routes to the
10.0.12.0/24 net and the 10.0.13.0/24 net.
As you can see, the src ip is defined in the routing table.
So except for packets to the 10.0.12.0/24 net, i want the src ip to be
10.0.13.4 instead of 10.0.12.2.

When i have a simple -j MASQUERADE rule in the nat POSTROUTING i get
SNAT, but since MASQUERADE calls "inet_select_addr" with the
rt->gateway, the src ip defaults back to 10.0.12.2 since it's the first
IP on this device.

MASQUERDE calls "rt = skb_rtable(skb);" and thus receives for
"rt->gateway" the related gateway (10.0.12.1 most of the time) and send
this to "inet_select_addr" which matches 10.0.12.1 with the device IP
10.0.12.2 and returns this success.

Is there any way to force the use of the src that is declared in the
routing table?

I know i could use -j SNAT with the specific source, but i'm interested
in the routing table part.

Or is there a function like ip_route_output_key that could be used, so i
can write my own TARGET module based on MASQUERADE?
So like packet matches the last ip route line and sees that the gateway
is 10.0.12.1 but it has to use 10.0.13.4 as source ip.

tl;dr how can i use the information from the "ip route" to have SNAT use
the definition from that routing table.

Thanks

-- 
Andreas Herz
