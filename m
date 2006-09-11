From: Pedro Werneck <pedro.werneck@terra.com.br>
Subject: Problems with nat/forwarding on gateway
Date: Sun, 10 Sep 2006 21:33:58 -0300
Message-ID: <20060910213358.39f29020.pedro.werneck@terra.com.br>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org


Hi


I always configured linux gateways with DSL-pppoe, but now I have to do
it with dhcp and I can't get it working. 

I checked both interfaces at the gateway machine and the packets from
the LAN reach it, but the responses don't get back past it. 

I had the same problem with pppoe, but it was related to MTU size, and I
tried the same now but it doesn't work, so it seems a problem within the
eth connected to the router and the machines inside the LAN. I searched
for information on this but there's nothing beside the trivial tutorials
on DSL setup. Since I'm testing with a pretty simple rules set, I'd like
to ask if there's anything wrong, or if the problem may be at the
routing tables.

This is what I'm using... eth1 is connected to DSL, eth0 to the router.

iptables -P INPUT DROP
iptables -P OUTPUT ACCEPT
iptables -P FORWARD ACCEPT
iptables -A INPUT -j ACCEPT -i lo
iptables -A INPUT -j ACCEPT -s 192.168.1.0/24
iptables -A INPUT -j ACCEPT -i eth1 -m state --state ESTABLISHED,RELATED
iptables -t nat -A POSTROUTING -s 192.168.1.0/24 -j MASQUERADE
iptables -A FORWARD -j ACCEPT -i eth1
iptables -A FORWARD -j ACCEPT -s 192.168.1.0/24
iptables -A FORWARD -j DROP
iptables -A INPUT -j ACCEPT -p tcp --dport 21
iptables -A INPUT -j ACCEPT -p tcp --dport 22
iptables -A INPUT -j ACCEPT -p tcp --dport 80


Thanks for any help... 

-- 
Pedro Werneck

