From: "Steven Mugassa" <steven.mugassa@intafrica.com>
Subject: Transparent web-caching with NetCache
Date: Fri, 4 Jul 2003 10:59:39 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <NHBBIEHHKBHELDDLACFGOEMNCOAA.steven.mugassa@intafrica.com>
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
Content-Type: text/plain; charset="us-ascii"
To: Netfilter <netfilter@lists.netfilter.org>

Hello everybody,

I have the following setup of the network


Internet
  |
  |
|Core router|
  |
  |
 eth0(public IP)
  |
|----------|--eth2<->ProxyOut--|--------|
|TestServer|                   |NetCache|
|----------|--eth3<-> ProxyIn--|--------|
  |
 eth1(192.168.1.1)
  |
  |
 LAN(192.168.1.0/24)

eth2=10.10.10.201, ProxyOut=10.10.10.240 (network of eth2 and ProxyOut is
10.10.10.128/25)
eth3=10.10.10.126, ProxyIn=10.10.10.100  (network of eth3 and ProxyIn is
10.10.10.0/25)
Gateway of NetCache is eth2


I want to do transparent web-caching (using NetCache)of all http requests
from LAN
The traffic flow is to be as follows:
 LAN HTTP request -> TestServer ->(via eth3->ProxyIn) NetCache ->(via
ProxyOut->eth2) TestServer -> Core -> Internet
 HTTP reply from Internet -> Core -> TestServer -> NetCache -> TestServer ->
LAN HTTP reply



The configurations in the TestServer are to be as follows:

#Mark (mark 2) all packets originated from the LAN (eth1) going to
destination port 80
TestServer# iptables -A PREROUTING -i eth1 -t mangle -p tcp --dport 80 -j
MARK --set-mark 2

#Mark (mark 3) all packets from source port 80 (coming thru eth0-internet)
TestServer# iptables -A PREROUTING -i eth0 -t mangle -p tcp --sport 80 -j
MARK --set-mark 3


#Setup iproute2 so it will route packets with "mark" 2 and "mark" 3 to
NetCache

#2 ip route tables: www.out (to destination port 80) and www.in (from source
port 80)

#Route packets to destination port 80 to www.out (IP of ProxyIn) - via eth3
TestServer# echo 202 www.out >> /etc/iproute2/rt_tables
TestServer# ip rule add fwmark 2 table www.out
TestServer# ip route add default via 10.10.10.100 dev eth3 table www.out

#Route packets from source port 80 to www.in (IP of proxy out) - via eth2
TestServer# echo 202 www.in >> /etc/iproute2/rt_tables
TestServer# ip rule add fwmark 3 table www.in
TestServer# ip route add default via 10.10.10.240 dev eth2 table www.in

TestServer# ip route flush cache

Now my question is, "Is this approach correct one, will it work according to
the traffic flow i have shown?". Will web-traffic loop (i.e loop btn
TestServer&NetCache) be avoided by this approach?

Please advice,

Thanks in advance.

Steven








-


-










