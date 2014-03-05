From: Enrique Huerta de la Fuente <ehuerta@ixer.mx>
Subject: MASQUERADE rule does not work with routing table and bridge
Date: Tue, 4 Mar 2014 18:47:19 -0600 (CST)
Message-ID: <1102937548.23818.1393980439979.JavaMail.root@ixer.mx>
References: <396104199.23817.1393979999577.JavaMail.root@ixer.mx>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <396104199.23817.1393979999577.JavaMail.root@ixer.mx>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter <netfilter@vger.kernel.org>

Hi,

I have two routing tables: telmex (br3)  y bbs (br2); both have your property gateway and i set up the routing rules. I can connect to ip2 and ip3 from internet. And the default gateway in the main routing table is ip2.
From te linux router i can output to internet by the gateway ip2, but when i mark certain traffic for outgoing by br3 and masquerade its, not masquerade!!

I know that the traffic output is by eth2 (br3) because i log with ebtables (ebtables -I OUTPUT) but the ip source is ip2.

I disable CONNTRACK for traffic outgoing by br3, but nothing. When i change  default gateway in the main routing to ip3,  it works fine.

The problem is that the MASQUERADE rule does not work with routing table and bridge.

Any idea?


                                                                 ________
                                          +------------+        /
                                          |            |       |
                            +-------------+ Provider 1 +-------
        __                  |ip2          |            |     /
    ___/  \_         +------+-------+     +------------+    |
  _/        \__      |     br2      |                      /
 /             \     |              |                      |
| Local network -----+ Linux router |                      |     Internet
 \_           __/    |              |                      |
   \__     __/       |     br3      |                      \
      \___/          +------+-------+     +------------+    |
                            |ip3          |            |     \
                            +-------------+ Provider 2 +-------
                                          |            |       |
                                          +------------+        \________



# ip route ls
139.132.201.56/29 dev br2  proto kernel  scope link  src 139.132.201.58 
188.126.250.96/28 dev br3  proto kernel  scope link  src 188.126.250.98 
192.168.122.0/24 dev virbr0  proto kernel  scope link  src 192.168.122.1 
192.168.168.0/21 dev br0  proto kernel  scope link  src 192.168.172.254 
192.168.168.0/21 dev br1  proto kernel  scope link  src 192.168.172.253 
default via 139.132.201.62 dev br2

# ip rule ls
0:      from all lookup local 
32755:  from all fwmark 0x5 lookup telmex 
32756:  from 188.126.250.98 lookup telmex 
32757:  from 139.132.201.58 lookup bbs 
32758:  from all fwmark 0x3 lookup bbs 
32766:  from all lookup main 
32767:  from all lookup default

# ip route ls table bbs
139.132.201.56/29 dev br2  scope link  src 139.132.201.58 
default via 139.132.201.62 dev br2


# ip route ls table telmex
188.126.250.96/28 dev br3  scope link  src 188.126.250.98 
default via 188.126.250.97 dev br3

E.Huerta
