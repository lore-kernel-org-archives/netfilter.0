From: "per jarevez" <perj8@hotmail.com>
Subject: Problem: NAT table POSTROUTING chain not capturing some packets...
Date: Sat, 14 Jun 2003 20:53:02 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Sea1-F69zQT456UnHAa0000a2be@hotmail.com>
Mime-Version: 1.0
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Here are some details...

Masquerading ALL packets that are going out ppp0.
# iptables -t nat -vnL POSTROUTING
Chain POSTROUTING (policy ACCEPT 248 packets, 12728 bytes)
pkts bytes target     prot opt in     out     source               
destination

  638 32633 MASQUERADE  all  --  *      ppp0    0.0.0.0/0            
0.0.0.0/0

   55  4752 MASQUERADE  all  --  *      !ppp0   10.0.0.0/8           
0.0.0.0/0

Packets to 65.24.XXX.238 not masqueraded out ppp0 for some reason?!?!!
# tcpdump -npi ppp0
16:36:32.122893 10.1.0.100.2662 > 65.24.XXX.238.50112: S 
824948389:824948389(0)
ack 3074025037 win 5 (DF)
16:36:38.166449 10.1.0.100.2662 > 65.24.XXX.238.50112: S 
830991959:830991959(0)
ack 3074025037 win 5 (DF)
16:36:50.130391 10.1.0.100.2662 > 65.24.XXX.238.50112: S 
842955892:842955892(0)
ack 3074025037 win 5 (DF)

What the kernel routing looks like after witnessing the above tcpdump..
# ip route ls cache | grep 65.24
65.24.XXX.238 via 65.XXX.XXX.4 dev ppp0  src 65.XXX.XXX.2
10.1.0.100 from 65.24.XXX.238 dev ppp1  src 65.XXX.XXX.2

My routing table...
# ip route
10.1.0.100 dev ppp1  proto kernel  scope link  src 10.1.0.1
10.0.0.6 via 10.0.0.6 dev ipsec0
65.XXX.XXX.4 dev ppp0  proto kernel  scope link  src 65.XXX.XXX.2
172.16.50.0/24 dev vmnet8  proto kernel  scope link  src 172.16.50.1
172.16.205.0/24 dev vmnet1  proto kernel  scope link  src 172.16.205.1
10.0.0.0/16 dev eth0  scope link
10.0.0.0/16 dev ipsec0  proto kernel  scope link  src 10.0.0.1
10.1.0.0/16 dev eth0  proto kernel  scope link  src 10.1.0.1
127.0.0.0/8 dev lo  scope link
default via 65.XXX.XXX.4 dev ppp0

The routing policy...
# ip rule
0:      from all lookup local
32766:  from all lookup main
32767:  from all lookup 253


Now the question is how the heck did the packets (see tcpdump) NOT get 
masqueraded out ppp0?

_________________________________________________________________
Tired of spam? Get advanced junk mail protection with MSN 8. 
http://join.msn.com/?page=features/junkmail


