From: Marcio Veloso Antunes <mveloso@tecnologiaip.com.br>
Subject: Something weird
Date: Wed, 1 Oct 2008 08:34:51 -0300
Message-ID: <200810010834.51705.mveloso@tecnologiaip.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi people,

  I'm asking for help because i'm getting crazy. :)

  I have PPPoE connection Up, all my traffic is correctly masqueraded BUT an specific route is not being masqueraded, look:

root@fw:/etc/ppp# iptables -L -nv -t nat
...
Chain POSTROUTING (policy ACCEPT 1759 packets, 154K bytes)
 pkts bytes target     prot opt in     out     source               destination
    0     0 MASQUERADE  all  --  *      ppp0    172.18.0.128/28      0.0.0.0/0
   54  4477 MASQUERADE  all  --  *      ppp0    172.18.0.0/24        0.0.0.0/0

root@fw:/etc/ppp# tcpdump -i ppp0 -n port 5060
tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
listening on ppp0, link-type LINUX_SLL (Linux cooked), capture size 96 bytes
08:24:04.072325 IP 172.18.0.13.5060 > 200.198.184.204.5060: SIP, length: 422
08:24:06.076677 IP 172.18.0.13.5060 > 200.198.184.204.5060: SIP, length: 422

My route table is:
root@fw:/etc/ppp# route -n
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
200.198.184.204 0.0.0.0         255.255.255.255 UH    0      0        0 ppp0
200.222.117.82  0.0.0.0         255.255.255.255 UH    0      0        0 ppp0
10.8.0.1        0.0.0.0         255.255.255.255 UH    0      0        0 tun0
200.198.184.196 10.8.0.1        255.255.255.252 UG    0      0        0 tun0
200.198.184.200 10.8.0.1        255.255.255.248 UG    0      0        0 tun0
172.18.2.128    0.0.0.0         255.255.255.240 U     0      0        0 eth0
172.18.0.0      0.0.0.0         255.255.255.0   U     0      0        0 eth0
172.18.1.0      0.0.0.0         255.255.255.0   U     0      0        0 eth0
172.25.0.0      10.8.0.1        255.255.255.0   UG    0      0        0 tun0
172.21.0.0      10.8.0.1        255.255.255.0   UG    0      0        0 tun0
172.20.0.0      10.8.0.1        255.255.0.0     UG    0      0        0 tun0
127.0.0.0       0.0.0.0         255.0.0.0       U     0      0        0 lo
0.0.0.0         0.0.0.0         0.0.0.0         U     0      0        0 ppp0

and my masquerade config is:
...
IPTABLES="/usr/sbin/iptables"
EXT="ppp0"
NET_INTERNA="172.18.0.0/24"
...
$IPTABLES -t nat -A POSTROUTING -o $EXT -s $NET_INTERNA                -j MASQUERADE

Can you bring me some light on why packets from 172.18.0.13 are crossing ppp0 whithout being masqueraded ?
I am lost.

Thanks a lot,

-- 
Marcio Veloso Antunes
Tecnologia IP Ltda
+55.21.3005.3004
+55.11.3588.0802
+55.21.8539.2949
