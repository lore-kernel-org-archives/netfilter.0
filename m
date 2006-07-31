From: Pedro Werneck <pedro.werneck@terra.com.br>
Subject: Connection through gateway fails in a random basis
Date: Sun, 30 Jul 2006 22:11:20 -0300
Message-ID: <20060730221120.7668ee28.pedro.werneck@terra.com.br>
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


Hi all


Something that seems simple here, but I cannot find anything wrong

I have two machines here, A and B. A have eth0 and eth1, and a DSL
connection (ppp0) with the modem connected to eth0. B have eth0. I have
A.eth1 connected to B.eth0, and I'm trying to use A as a gateway for B.

It works, from B I can reach anything I can do from A, with ping,
tracereroute and resolve names, but I can't use other protocols like
HTTP, FTP, IRC, and it seems to happen on a random basis. Sometimes it
works, sometimes it waits for data until timeout... I tried to find a 
pattern on it but I couldn't. I tried to use LOG and netwatch on ppp0
and eth1 to debug it, there's no data coming from the remote on these 
cases.

Someone suggested I should upgrade the kernel, so I'm using the latest
version, 2.6.17.7 #4, but still doesn't work...


Here's the ruleset I'm using on the gateway... pretty simple

<code>
#!/bin/bash 

echo 1 > /proc/sys/net/ipv4/ip_forward 

IPT="iptables --verbose"

$IPT -F
$IPT -t nat -F

$IPT -P INPUT ACCEPT
$IPT -P OUTPUT ACCEPT
$IPT -P FORWARD ACCEPT

$IPT -A INPUT -j ACCEPT -i lo
$IPT -A INPUT -j ACCEPT -s 192.168.1.0/24
$IPT -A INPUT -i ppp0 -m state --state ESTABLISHED,RELATED -j ACCEPT
$IPT -A INPUT -j ACCEPT -p tcp --dport 3306
$IPT -A INPUT -j ACCEPT -p tcp --dport 3690
$IPT -A INPUT -j ACCEPT -p tcp --dport 8000:8010
$IPT -A INPUT -j ACCEPT -p tcp --dport 8021
$IPT -A INPUT -j ACCEPT -p tcp --dport 8022
$IPT -A INPUT -j ACCEPT -p tcp --dport 8080

$IPT -A FORWARD -j ACCEPT -i ppp0 
$IPT -A FORWARD -j ACCEPT -s 192.168.1.0/24
$IPT -A FORWARD -j DROP

$IPT -t nat -A POSTROUTING -s 192.168.1.0/24 -o ppp0 -j MASQUERADE
</code>

And here's the modules I have loaded (lsmod | grep ip), in case
something is missing and I haven't noticed:

ipt_LOG                 5440  0 
ipt_MASQUERADE          2560  1 
iptable_mangle          2240  0 
iptable_nat             5636  1 
ip_nat                 12844  2 ipt_MASQUERADE,iptable_nat
ip_conntrack           36564  4 ipt_MASQUERADE,xt_state,iptable_nat,ip_nat
iptable_filter          2240  1 
ip_tables               9944  3 iptable_mangle,iptable_nat,iptable_filter
x_tables                9668  6 ipt_LOG,xt_tcpudp,ipt_MASQUERADE,xt_state,iptable_nat,ip_tables


Since it seems something very weird, I'm asking for your help here.
Any idea about what's wrong here ?


Thanks...

-- 
Pedro Werneck

