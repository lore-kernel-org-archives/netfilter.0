From: Anthony.Golia@morganstanley.com
Subject: NAT weirdness when using default rtr load balancing
Date: Tue, 21 Oct 2003 14:34:12 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F957C24.2040808@morganstanley.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi.  Running into trouble with SNAT.  Any help is appreciated.  Got a 
machine with two ints on two different subnets and one /32 IP tied to 
the loopback:

saias12 /ms/user/g/goliaa 1$ ip addr show
1: lo: <LOOPBACK,NOARP,UP> mtu 16436 qdisc noqueue
     link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
     inet 127.0.0.1/8 brd 127.255.255.255 scope host lo
     inet 172.31.254.254/32 brd 127.255.255.255 scope global lo:0
2: eth0: <BROADCAST,MULTICAST,NOTRAILERS,UP> mtu 1500 qdisc pfifo_fast 
qlen 100
     link/ether 00:50:8b:75:f7:58 brd ff:ff:ff:ff:ff:ff
     inet 172.31.245.41/24 brd 172.31.245.255 scope global eth0
3: eth1: <BROADCAST,MULTICAST,UP> mtu 1500 qdisc pfifo_fast qlen 100
     link/ether 00:50:8b:75:f7:57 brd ff:ff:ff:ff:ff:ff
     inet 172.31.246.41/24 brd 172.31.246.255 scope global eth1

load balancing outgoing traffic out both subnets with two def routers of 
equal weight:

saias12 /ms/user/g/goliaa 2$ ip route show
172.31.246.0/24 dev eth1  scope link
172.31.245.0/24 dev eth0  proto kernel  scope link  src 172.31.245.41
127.0.0.0/8 dev lo  scope link
default
	nexthop via 172.31.246.1  dev eth1 weight 1
	nexthop via 172.31.245.1  dev eth0 weight 1

iptables -t nat -A POSTROUTING -p tcp -m tcp --dport 9 -j SNAT --to 
172.31.254.254

cause i want all outgoing traffic on port 9 to go out with that src ip. 
that works.  but when the traffic comes back in, it gets changed to the 
ip of one of eth0 or eth1.  why?  FYI:  this doesn't happen if i have 
just one default router:

start a tcp connection from this machine to 144.14.15.234 (just some 
other machine):

saias12 /ms/user/g/goliaa 2# tethereal -i eth0 -f "port 9"
Capturing on eth0

   0.000000 172.31.254.254 -> 144.14.15.234 TCP spidrweb > discard [SYN] 
Seq=3422061520 Ack=0 Win=5840 Len=0
   0.002121 144.14.15.234 -> 172.31.245.41 TCP discard > spidrweb [SYN, 
ACK] Seq=3425048263 Ack=3422061521 Win=5792 Len=0

the first pkt is expected (src ip got changed by NAT).  But the second 
pkt got changed to the IP of eth0.  But 144.14.15.234 did not send the 
pkt to 172.31.245.41, it sent it to 172.31.254.254.




-- 
Cheers,
Anthony


