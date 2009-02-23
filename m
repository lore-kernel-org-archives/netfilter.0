From: "Barry A Rich" <barich@trisectrix.com>
Subject: IP identification field changing with stateless NAT
Date: Mon, 23 Feb 2009 17:37:01 -0500
Message-ID: <00ee01c99607$3ef152b0$bcd3f810$@com>
Reply-To: <barich@trisectrix.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-us
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Part of our router setup accepts UPD packets from eth0 and load balances
them across two uplinks (ppp0, ppp1). Tracking of these packets is turned
off and the packets are marked:

$IPTABLES -t raw -A PREROUTING -i eth0 -p udp --sport $PORT -j NOTRACK

$IPTABLES -t mangle -A PREROUTING -p udp --sport $PORT -m statistic --mode
nth --every 2 --packet 0 -j MARK --set-mark 1

$IPTABLES -t mangle -A PREROUTING -p udp --sport $PORT -m statistic --mode
nth --every 2 --packet 1 -j MARK --set-mark 2

As the UPD packets go out each uplink, stateless NAT is used to change the
source IP address:

$TC filter add dev ppp0 parent 1:0 protocol ip prio 1 \
    handle 1 fw flowid 1:1 action nat egress $SOURCEIP/32 $UPLINK1IP

$TC filter add dev ppp1 parent 1:0 protocol ip prio 1 \
    handle 2 fw flowid 1:1 action nat egress $SOURCEIP/32 $UPLINK2IP

The routing and NAT'ing all works. The problem is the IP ID field is being
modified. The incoming packets on eth0 have sequential sequence numbers:

# tcpdump -v -i eth0
16:25:58.017870 IP (tos 0x0, ttl 64, id 5493, offset 0, flags [none], proto
UDP (17), length 62) 192.168.0.108.6970 > 64
-52-169-242.client.cypresscom.net.6982: UDP, length 34

16:25:58.099780 IP (tos 0x0, ttl 64, id 5494, offset 0, flags [none], proto
UDP (17), length 929) 192.168.0.108.6970 > 6
4-52-169-242.client.cypresscom.net.6982: UDP, length 901

16:25:58.217380 IP (tos 0x0, ttl 64, id 5495, offset 0, flags [none], proto
UDP (17), length 62) 192.168.0.108.6970 > 64
-52-169-242.client.cypresscom.net.6982: UDP, length 34

The IP ID fields on outgoing packets are non-sequential and do not match the
original eth0 value:

#tcpdump -v -i ppp0
16:24:54.129697 IP (tos 0x0, ttl 63, id 4723, offset 0, flags [none], proto
UDP (17), length 1055) 173-6-220-85.pools.sp
csdns.net.6970 > 64-52-169-242.client.cypresscom.net.6982: UDP, length 1027

16:24:54.147383 IP (tos 0x0, ttl 63, id 4725, offset 0, flags [none], proto
UDP (17), length 1108) 173-6-220-85.pools.sp
csdns.net.6970 > 64-52-169-242.client.cypresscom.net.6982: UDP, length 1080

16:24:54.171998 IP (tos 0x0, ttl 63, id 4727, offset 0, flags [none], proto
UDP (17), length 1478) 173-6-220-85.pools.sp
csdns.net.6970 > 64-52-169-242.client.cypresscom.net.6982: UDP, length 1450

# tcpdump -v -i ppp1
16:25:02.046107 IP (tos 0x0, ttl 63, id 3633, offset 0, flags [none], proto
UDP (17), length 681) 173-102-123-15.pools.s
pcsdns.net.6970 > 64-52-169-242.client.cypresscom.net.6982: UDP, length 653

16:25:02.057691 IP (tos 0x0, ttl 63, id 3635, offset 0, flags [none], proto
UDP (17), length 772) 173-102-123-15.pools.s
pcsdns.net.6970 > 64-52-169-242.client.cypresscom.net.6982: UDP, length 744

16:25:02.069756 IP (tos 0x0, ttl 63, id 3637, offset 0, flags [none], proto
UDP (17), length 739) 173-102-123-15.pools.s
pcsdns.net.6970 > 64-52-169-242.client.cypresscom.net.6982: UDP, length 711

Can someone tell me what is changing the IP ID field and how to prevent
that?

Thanks.


