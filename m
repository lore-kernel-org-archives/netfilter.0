From: <rwaeger@m-logix.de>
Subject: Problems with policy based routing
Date: 16 May 2003 10:27:47 UT
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000147C2.3EC4D93D@192.168.206.251>
Mime-Version: 1.0
Content-Transfer-Encoding: 7Bit
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
To: netfilter@lists.netfilter.org

Hi!

Maybe a routing and iptables guru can help me....

We're trying to setup a policy based Linux router to route "normal" 
services (like http(s) or ftp) over a DSL line and all other services
(like smtp, ssh, pop3) over a leased line. The leased line router is 
listening to an official IP net. There are some internal servers (mail 
and web) which are using official IPs (but nated at Firewall-1). All 
traffic for and from these servers have to go over eth1. 

What happens:
An external mail server sends a mail to the internal mail server (static IP is
153.233.136.210). Incoming packets reaches the internal mail server (logged in 
the Check Point Log). The internal mail server sends some packets out to the 
sender mail server. These packets doesn't go over eth1 and the leased line router, 
but go over eth2 and DSL. Mail doesn't work. Only what really works is http(s). 

We don't want to use static routes (together with source routing) for all static 
IPs (officials), if possible. Does anyone have an idea to solve this problem?

Thanx in advance

Raffi


Used Kernel is 2.4.20. No patches applied.

This is the constellation we are using:


       internet                                internet
          |                                       |
          |                                       | NAT
          |                                       |
   -----------------                      -----------------
  |   Leased Line   |                    |       DSL       |
  | 154.233.136.193 |                    |   192.168.1.1   |
   -----------------                      -----------------
           \                                     /
            \                                   /
             \                                 /
              \                               /
               \                             /
                \                           /
                 \                         /
                  \                       /
                   \                     /
                    \                   /
              eth1   \                 /   eth2
154.233.136.194/30    -----------------    192.168.1.2/24
                     |  Linux Router   |
                     |  policy based   |
                      -----------------
                              |
                        eth0  | 
          154.233.136.198/30  |
                              |
                              |
                              |
                              |
                              |
                              |
                              |  if1
                              |  154.233.136.197/30
                      -----------------
                     |   Check Point   |
                     |    Firewall     |
                      -----------------




And this is the simple policy. Do not wonder about the routing entries, - they 
are necessary at present.

#!/bin/sh

# Global vars
MARK_FOR_DSL=2
MARK_FOR_LEASEDLINE=3

# Recreate standard routing table
ip route flush all
ip route add 154.233.136.196/30 dev eth0 proto kernel scope link src 154.233.136.198
ip route add 154.233.136.192/30 dev eth1 proto kernel scope link src 154.233.136.194
ip route add 192.168.1.0/24 dev eth2 proto kernel scope link src 192.168.1.2
ip route add 154.233.136.224/27 via 154.233.136.197 dev eth0
ip route add 154.233.136.200/29 via 154.233.136.197 dev eth0
ip route add 154.233.136.208/28 via 154.233.136.197 dev eth0
ip route add default via 192.168.1.1 dev eth2
ip route flush cache

# Flush iptables
iptables -t mangle -F PREROUTING
iptables -F INPUT

# ACCEPT ping
iptables -A OUTPUT -p icmp -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT 
iptables -A INPUT -p icmp -m state --state ESTABLISHED,RELATED  -j ACCEPT 

# ACCEPT local connections
iptables -A INPUT -p tcp -s 127.0.0.1 --dport 25 -j ACCEPT
iptables -A INPUT -p tcp -s 127.0.0.1 --dport 22 -j ACCEPT
iptables -A INPUT -p tcp -s 127.0.0.1 --dport 98 -j ACCEPT
iptables -A INPUT -p tcp -s 127.0.0.1 --dport 515 -j ACCEPT
iptables -A INPUT -p tcp -s 127.0.0.1 --dport 901 -j ACCEPT
iptables -A INPUT -p tcp -s 127.0.0.1 --dport 1024 -j ACCEPT

# DROP connections to eth0 (154.233.136.198, internal) for specific ports
iptables -A INPUT -p tcp -d {154.233.136.198} --dport 25 -j DROP
iptables -A INPUT -p tcp -d {154.233.136.198} --dport 22 -j DROP
iptables -A INPUT -p tcp -d {154.233.136.198} --dport 98 -j DROP
iptables -A INPUT -p udp -d {154.233.136.198} --dport 514 -j DROP
iptables -A INPUT -p tcp -d {154.233.136.198} --dport 515 -j DROP
iptables -A INPUT -p tcp -d {154.233.136.198} --dport 587 -j DROP
iptables -A INPUT -p tcp -d {154.233.136.198} --dport 901 -j DROP
iptables -A INPUT -p tcp -d {154.233.136.198} --dport 1024 -j DROP

# MARK for leased line traffic
iptables -t mangle -A PREROUTING -p tcp -s 154.233.136.196/30 -d ! 154.233.136.196/30 --dport 22 -j MARK --set-mark MARK_FOR_LEASEDLINE
iptables -t mangle -A PREROUTING -p tcp -s 154.233.136.196/30 -d ! 154.233.136.196/30 --dport 25 -j MARK --set-mark MARK_FOR_LEASEDLINE
iptables -t mangle -A PREROUTING -p tcp -s 154.233.136.196/30 -d ! 154.233.136.196/30 --dport 110 -j MARK --set-mark MARK_FOR_LEASEDLINE
iptables -t mangle -A PREROUTING -p tcp -s 154.233.136.196/30 -d ! 154.233.136.196/30 --dport 119 -j MARK --set-mark MARK_FOR_LEASEDLINE
          
# MARK for DSL traffic
iptables -t mangle -A PREROUTING -p tcp -s 154.233.136.196/30 -d ! 154.233.136.196/30 --dport 80 -j MARK --set-mark MARK_FOR_DSL
iptables -t mangle -A PREROUTING -p tcp -s 154.233.136.196/30 -d ! 154.233.136.196/30 --dport 443 -j MARK --set-mark MARK_FOR_DSL
iptables -t mangle -A PREROUTING -p tcp -s 154.233.136.196/30 -d ! 154.233.136.196/30 --dport ftp-data -j MARK --set-mark MARK_FOR_DSL
iptables -t mangle -A PREROUTING -p tcp -s 154.233.136.196/30 -d ! 154.233.136.196/30 --dport ftp -j MARK --set-mark MARK_FOR_DSL
      
# Telnet and SSH with minimum delay
iptables -t mangle -A PREROUTING -p tcp --dport ssh -j TOS --set-tos 0x10
iptables -t mangle -A PREROUTING -p tcp --dport telnet -j TOS --set-tos 0x10

# HTTP traffic for internal web server
iptables -t mangle -A PREROUTING -p tcp -s 154.233.136.212/255.255.255.255 -d ! 154.233.136.196/30 -j MARK --set-mark MARK_FOR_LEASEDLINE
      
# Do not allow redirects
echo 0 > /proc/sys/net/ipv4/conf/all/send_redirects
echo 0 > /proc/sys/net/ipv4/conf/default/send_redirects
echo 0 > /proc/sys/net/ipv4/conf/eth1/send_redirects
echo 0 > /proc/sys/net/ipv4/conf/eth2/send_redirects
      
# Make entries in rt_tables if necessary
if (test -z "`awk '/202 dsl.out/' /etc/iproute2/rt_tables`"); then
   echo 202 dsl.out >> /etc/iproute2/rt_tables
fi

if (test -z "`awk '/203 leasedline.out/' /etc/iproute2/rt_tables`"); then                                    
      echo 203 leasedline.out >> /etc/iproute2/rt_tables                                                        
fi

# Delete existing policy
ip rule del lookup dsl.out
ip rule del lookup leasedline.out
ip rule del table dsl.out
ip rule del table leasedline.out

# Rules for MARKs
ip rule add fwmark 2 table dsl.out
ip rule add fwmark 3 table leasedline.out

# Default routes for tables dsl.out and leasedline.out
ip route add default via 154.233.136.193 dev eth1 table leasedline.out
ip route add default via 192.168.1.1 dev eth2 table dsl.out
ip route add throw 154.233.136.210/32 table leasedline.out
ip route flush cache

-------


