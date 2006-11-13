From: Danny <dineshg@hostway.com>
Subject: Iptables for load balancing internet traffic
Date: Mon, 13 Nov 2006 22:26:24 +0530
Message-ID: <4558A3B8.9080905@hostway.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi everyone,


Is there a perfect solution to use iptables for load balancing outgoing 
internet traffic ?

I am using Debian Sarge 3.1 [ kernel 2.4.27 ] [ iptables v1.2.11 ]  I 
chose this kernel specifically for this purpose.

I have tried the below 2 techniques  : -


1 > Tried using random patch
iptables -t mangle -A OUTPUT -o ! eth0    -m random --average 50 -j MARK 
--set-mark 1
iptables -t mangle -A PREROUTING -i eth0  -m random --average 50 -j MARK 
--set-mark 1
ip ro add table 10 default via 10.90.101.1  dev eth2
ip ru add fwmark 1 table 10
ip ro fl ca


iptables -t mangle -A OUTPUT -o ! eth0   -m random --average 50 -j MARK 
--set-mark 2
iptables -t mangle -A PREROUTING -i eth0 -m random --average 50 -j MARK 
--set-mark 2
ip ro add table 20 default via 10.90.102.1 dev eth3
ip ru add fwmark 2 table 20
ip ro fl ca


iptables -t nat -A POSTROUTING -o eth2 -j SNAT --to 10.90.101.2
iptables -t nat -A POSTROUTING -o eth3 -j SNAT --to 10.90.102.2
ip ro add default nexthop via 10.90.101.1  dev eth2 weight 1 nexthop via 
10.90.102.1 dev eth3 weight 1

#-------------end -------------
Well this didnt do the job for me ! It was breaking TCP connections. It 
was load balancing UDP packets well though !


2> Tried using nth patch
iptables -t mangle -A PREROUTING -i eth0 -m state --state NEW   -m nth 
--every 2 --counter 2  --packet 0  -j CONNMARK  --set-mark 1
iptables -t mangle -A PREROUTING -i eth0 -m state --state NEW   -m nth 
--every 2 --counter 2  --packet 1  -j CONNMARK  --set-mark 2
iptables -t nat -A POSTROUTING -o eth2 -j SNAT --to 10.90.101.2
iptables -t nat -A POSTROUTING -o eth3 -j SNAT --to 10.90.102.2
ip ro add table 10 default via 10.90.101.1  dev eth2
ip ru add fwmark 1 table 10
ip ro fl ca
ip ro add table 20 default via 10.90.102.1 dev eth3
ip ru add fwmark 2 table 20
ip ro fl ca
ip ro add default nexthop via 10.90.101.1  dev eth2 weight 1 nexthop via 
10.90.102.1 dev eth3 weight 1
#----end

This kept the tcp connections intact. But it wasnt distributing the 
internet traffic evenly.
The ditribution of connections through the links are not even.

# iptables -L PREROUTING -t mangle -nv
Chain PREROUTING (policy ACCEPT 82796 packets, 20M bytes)
pkts bytes target     prot opt in     out     source               
destination
  8   480 CONNMARK   all  --  eth0   *       0.0.0.0/0            
0.0.0.0/0           state NEW every 2th counter #2 packet #0 CONNMARK 
set 0x1
  8   480 CONNMARK   all  --  eth0   *       0.0.0.0/0            
0.0.0.0/0           state NEW every 2th counter #2 packet #1 CONNMARK 
set 0x2

-- this shows that connections have been marked evenly. But 
/proc/net/ip_conntrack doesnt show even number of connections.

# sed  's/^.*\(mark=[12]\).*$/\1/g'   /proc/net/ip_conntrack  | grep -v 
"mark=0"
mark=2
mark=2
mark=2
mark=2
mark=2
mark=2
mark=2
mark=1
mark=2
mark=2


Most of the connections here are marked 2. [ sometime most of them are 
marked 1 ]



Is there any other perfect solution for load balancing internet traffic ?

I have gone through many forums, but I havent got the perfect solution yet.


Thank you,
Danny



