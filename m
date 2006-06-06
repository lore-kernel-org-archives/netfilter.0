From: sean <seandarcy2@gmail.com>
Subject: used wiki rules: still no azureus connection
Date: Tue, 06 Jun 2006 12:14:32 -0400
Message-ID: <e649l9$d0u$1@sea.gmane.org>
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

I'm trying  to set up iptables on a router to allow azureus 
connections.

I have 10.10.8.1 (AMD64) connected to a linux box 
192.168.2.3 (GATEWAY), itself connected to a dsl router.
GATEWAY has:

kernel-2.6.16
iptables-1.3.0

No iptables on AMD64:

iptables -L
Chain INPUT (policy ACCEPT)
target     prot opt source               destination

Chain FORWARD (policy ACCEPT)
target     prot opt source               destination

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination

I've set up a simple iptables script on GATEWAY based on the 
azureus wiki:


sh -x rc.iptables
+ EXTIF=eth1
+ IPT=/sbin/iptables

+ /sbin/iptables --flush
+ /sbin/iptables -t nat --flush
+ /sbin/iptables -t mangle --flush
+ /sbin/iptables -X
+ /sbin/iptables -t nat -X

+ /sbin/iptables -A INPUT -i lo -j ACCEPT
+ /sbin/iptables -t nat -A POSTROUTING -o eth1 -j MASQUERADE

+ AMD64_IP=10.10.8.1
+ BT_PORT=6881
+ AZ_PORT=21734

+ /sbin/iptables -t nat -A PREROUTING -p tcp -i eth1 --dport 
6881 -j DNAT --to-destination 10.10.8.1:6881
+ /sbin/iptables -t nat -A PREROUTING -p udp -i eth1 --dport 
6881 -j DNAT --to-destination 10.10.8.1:6881
+ /sbin/iptables -A FORWARD -p tcp -i eth1 --dport 6881 -j 
ACCEPT
+ /sbin/iptables -A FORWARD -p udp -i eth1 --dport 6881 -j 
ACCEPT

+ /sbin/iptables -t nat -A PREROUTING -p tcp -i eth1 --dport 
21734 -j DNAT --to-destination 10.10.8.1:21734
+ /sbin/iptables -t nat -A PREROUTING -p udp -i eth1 --dport 
21734 -j DNAT --to-destination 10.10.8.1:21734
+ /sbin/iptables -A FORWARD -p tcp -i eth1 --dport 21734 -j 
ACCEPT
+ /sbin/iptables -A FORWARD -p udp -i eth1 --dport 21734 -j 
ACCEPT

+ /sbin/iptables -N block
+ /sbin/iptables -A block -m state --state 
ESTABLISHED,RELATED -j ACCEPT
+ /sbin/iptables -A block -i '!' eth1 -j ACCEPT
+ /sbin/iptables -A block -j LOG --log-prefix 'IPTables_DROP  '
+ /sbin/iptables -A block -j DROP

+ /sbin/iptables -A INPUT -j block
+ /sbin/iptables -A FORWARD -j block

I've tried  ( as you can see ) both ports 6881 and 21734. 
Neither work.  Regular masquerading works just fine.

In syslog on GATEWAY I find log messages such as:

Jun  6 10:20:18 gateway kernel: IPTables_DROP  IN=eth1 OUT= 
MAC=00:e0:98:88:d3:5e:00:11:50:22:1b:9e:08:00 
SRC=200.158.216.107 DST=192.168.2.3 LEN=293 TOS=0x00 
PREC=0x00 TTL=107 ID=61586 PROTO=UDP SPT=16867 DPT=6881 LEN=273

why wasn't this nat'd to AMD64  by:
  + /sbin/iptables -t nat -A PREROUTING -p udp -i eth1 
--dport 6881 -j DNAT --to-destination 10.10.8.1:6881


iptables -L
Chain FORWARD (policy ACCEPT)
target     prot opt source               destination
ACCEPT     tcp  --  anywhere             anywhere 
  tcp dpt:6881
ACCEPT     udp  --  anywhere             anywhere 
  udp dpt:6881
ACCEPT     tcp  --  anywhere             anywhere 
  tcp dpt:21734
ACCEPT     udp  --  anywhere             anywhere 
  udp dpt:21734
block      all  --  anywhere             anywhere
.............

iptables -t nat -n -L
Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination

Chain POSTROUTING (policy ACCEPT)
target     prot opt source               destination
MASQUERADE  all  --  0.0.0.0/0            0.0.0.0/0

Chain PREROUTING (policy ACCEPT)
target     prot opt source               destination
DNAT       tcp  --  0.0.0.0/0            0.0.0.0/0 
  tcp dpt:6881 to:10.10.8.1:6881
DNAT       udp  --  0.0.0.0/0            0.0.0.0/0 
  udp dpt:6881 to:10.10.8.1:6881
DNAT       tcp  --  0.0.0.0/0            0.0.0.0/0 
  tcp dpt:21734 to:10.10.8.1:21734
DNAT       udp  --  0.0.0.0/0            0.0.0.0/0 
  udp dpt:21734 to:10.10.8.1:21734


any help appreciated.

sean


