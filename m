From: MarshallJ@switch.aust.com
Subject: Prioritising traffic on multiple VPN's through a single Internet connection
Date: Mon, 10 Mar 2003 10:09:52 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <OF1FE05E57.B3751850-ON4A256CE4.00811534@ussbris>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi all,

I've been racking my brains on how to prioritise traffic using QoS on vpn 
traffic - we have a single internet connection and 5 or more vpn's at a 
time. I want to make a telnet session on one vpn have a higher priority / 
separate bandwidth allocation to say a ftp session on a different vpn 
connection.

At present I can control the traffic on each vpn individually. Since all 
the vpn's go through the same internet connection, my current 
configuration can't prioritise between the vpn's - a high-volume transfer 
on one vpn basically kills the rest.

I was hoping to create a tunnel on the local machine which I can forward 
all traffic (except that destined for the local LAN) and prioritise the 
traffic going through that tunnel. Then once the packet comes out the 
other side of the packet, pass it through the vpn's to their proper 
destination.

I was able to create a tunnel and see the packets go in and out (watching 
either end of the tunnel with tcpdump - I used vtun without compression or 
encryption enabled, is there something better I can use?) but I was unable 
to re-route the packets after that. I am doing this on a test machine, 
kernel 2.4.20 with advanced routing and QoS enabled. There are no iptables 
rules set on this machine and the default action is ACCEPT, so the packets 
aren't being blocked.

Here is an ASCII diagram of what I'm wanting to do to outbound traffic:

+--------+    +---------+    +---------+            +--------+
|Main    |    |         |    | Shaped  +--->VPN1--->|        |
|Routing +--->|Loopback +--->| Routing +--->VPN2--->|Internet|
|Table   |    |Tunnel   |    | Table   +----------->|        |
+--------+    +---------+    +---------+            +--------+


My ifconfig looks like this:

eth0      Link encap:Ethernet  HWaddr 00:02:E3:1F:8B:8A
          inet addr:10.10.10.231  Bcast:10.10.10.255  Mask:255.255.255.0
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:54868 errors:0 dropped:0 overruns:0 frame:0
          TX packets:26065 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:100
          RX bytes:53091479 (50.6 MiB)  TX bytes:2189666 (2.0 MiB)
          Interrupt:11

eth1      Link encap:Ethernet  HWaddr 02:00:07:E3:9E:3D
          inet addr:202.xx.xx.xx  Bcast:0.0.0.0  Mask:255.255.255.252
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:33523091 errors:0 dropped:0 overruns:0 frame:0
          TX packets:32774503 errors:33 dropped:0 overruns:0 carrier:66
          collisions:22688 txqueuelen:100
          Interrupt:9 Base address:0x6200

lo        Link encap:Local Loopback
          inet addr:127.0.0.1  Mask:255.0.0.0
          UP LOOPBACK RUNNING  MTU:16436  Metric:1
          RX packets:409 errors:0 dropped:0 overruns:0 frame:0
          TX packets:409 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:0
          RX bytes:32598 (31.8 KiB)  TX bytes:32598 (31.8 KiB)

tun0      Link encap:Point-to-Point Protocol
          inet addr:10.50.1.1  P-t-P:10.50.1.1  Mask:255.255.255.252
          UP POINTOPOINT RUNNING NOARP MULTICAST  MTU:1412  Metric:1
          RX packets:0 errors:0 dropped:0 overruns:0 frame:0
          TX packets:118 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:10
          RX bytes:0 (0.0 b)  TX bytes:19452 (18.9 KiB)

tun1      Link encap:Point-to-Point Protocol
          inet addr:10.50.1.2  P-t-P:10.50.1.2  Mask:255.255.255.252
          UP POINTOPOINT RUNNING NOARP MULTICAST  MTU:1412  Metric:1
          RX packets:118 errors:0 dropped:0 overruns:0 frame:0
          TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:10
          RX bytes:19452 (18.9 KiB)  TX bytes:0 (0.0 b)

My ip rule look like this:
0:      from all lookup local
32765:  from all iif tun1 lookup shaped
32766:  from all lookup main
32767:  from all lookup default

My main ip route looks like this:

10.50.1.0/30 dev tun0  proto kernel  scope link  src 10.50.1.1
10.50.1.0/30 dev tun1  proto kernel  scope link  src 10.50.1.2
10.10.10.0/24 dev eth0  proto kernel  scope link  src 10.10.10.231
default dev tun0  scope link

My shaped ip route looks like this:
10.5.7.0/24 dev tun2  scope link
10.10.6.0/24 dev tun3  scope link
10.5.6.0/24 dev tun4  scope link
default via 202.xx.xx.xx dev eth1

/proc/sys/net/ipv4/ip_forward is set to 1.

I would imagine that with this setup, any outbound packets would first go 
via the main routing table, going either to the local LAN or via tun0. 
When they come out of tun1, they are then routed using the shaped routing 
table, and then sent down the relevant tun2/3/4/internet link.

I'm obviously missing something. When I do a tcpdump on the tun0 and tun1 
interfaces and try to ping an address, I see packets being on both 
interfaces but I don't see any further routing - or where the packet may 
have ended up. I have a feeling that I'm trying to get it to do something 
it's not meant to do.

Any help appreciated, and any better methods would be great.

Regards,
Josh Marshall.

