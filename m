From: "kaushalender shekhawet" <kaushalenders@hotmail.com>
Subject: voicechat(yahoo messenger)
Date: Tue, 27 May 2003 05:34:39 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Law10-F21XJd0nRCiiO00053546@hotmail.com>
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

Hi group,


we have redhat 8 on which we are running iptables.We have problem that all 
user behind this are not able to voice chat.Plz help me on that These r the 
rules i am using


#!/bin/sh
export PATH="/usr/local/sbin:/usr/sbin:/sbin:/usr/local/bin:/usr/bin:/bin"
IPTABLES="/sbin/iptables"
IFCONFIG="/sbin/ifconfig"
# Delete and flush. Default table is "filter". Others like "nat" must be 
explicitly stated.
/sbin/iptables --table nat --flush
/sbin/iptables --delete-chain
/sbin/iptables --table nat --delete-chain
/sbin/iptables -F
# Add SysV style initialization support (ignore everything except 'stop' and 
'clear').

if [ "$1" == "stop" ] || [ "$1" == "clear" ]; then
  iptables -t filter -F > /dev/null 2>&1
  iptables -t filter -X > /dev/null 2>&1
  iptables -t nat -F > /dev/null 2>&1
  iptables -t nat -X > /dev/null 2>&1
  iptables -t mangle -F > /dev/null 2>&1
  iptables -t mangle -X > /dev/null 2>&1
  iptables -t filter -P INPUT ACCEPT > /dev/null 2>&1
  iptables -t filter -P OUTPUT ACCEPT > /dev/null 2>&1
  iptables -t filter -P FORWARD ACCEPT > /dev/null 2>&1
  iptables -t nat -P PREROUTING ACCEPT > /dev/null 2>&1
  iptables -t nat -P POSTROUTING ACCEPT > /dev/null 2>&1
  iptables -t nat -P OUTPUT ACCEPT  > /dev/null 2>&1
  iptables -t mangle -P POSTROUTING ACCEPT > /dev/null 2>&1
  iptables -t mangle -P OUTPUT ACCEPT > /dev/null 2>&1
  iptables -t mangle -P PREROUTING ACCEPT > /dev/null 2>&1
  iptables -t mangle -P INPUT ACCEPT > /dev/null 2>&1
  iptables -t mangle -P FORWARD ACCEPT > /dev/null 2>&1
  echo "-> Firewall disabled."
  exit
fi
iptables -t nat -X
iptables -t nat -P PREROUTING ACCEPT
iptables -t nat -P POSTROUTING ACCEPT
iptables -t nat -P OUTPUT ACCEPT
#iptables -t mangle -F
#iptables -t mangle -X
#iptables -t mangle -P POSTROUTING ACCEPT
#iptables -t mangle -P OUTPUT ACCEPT
/sbin/iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j REDIRECT 
--to-port 3128
/sbin/iptables -t nat -A PREROUTING -i eth1 -p tcp --dport 80 -j REDIRECT 
--to-port 3128
/sbin/iptables -A INPUT -p icmp --icmp-type 0 -j ACCEPT
/sbin/iptables -A INPUT -p icmp --icmp-type 3 -j ACCEPT
# Set up IP FORWARDing and Masquerading
/sbin/iptables --table nat --append POSTROUTING --out-interface eth0 -j 
MASQUERADE
/sbin/iptables --append FORWARD --in-interface eth0 -j ACCEPT
/sbin/iptables --table nat --append POSTROUTING --out-interface eth1 -j 
MASQUERADE
/sbin/iptables --append FORWARD --in-interface eth1 -j ACCEPT

## Ignore any broadcast icmp echo requests
if [ -e /proc/sys/net/ipv4/icmp_echo_ignore_broadcasts ]; then
    echo "1" > /proc/sys/net/ipv4/icmp_echo_ignore_broadcasts
fi
#
## Don't accept source routed packets.
if [ -e /proc/sys/net/ipv4/conf/all/accept_source_route ]
for interface in /proc/sys/net/ipv4/conf/*/accept_source_route; do
   echo "0" > $interface
  done
fi
# Automatic IP defragmenting
############################
if [ -e /proc/sys/net/ipv4/ip_always_defrag ]
then
  echo "1" > /proc/sys/net/ipv4/ip_always_defrag
fi
#
/sbin/iptables -A INPUT -p tcp -s 0/0 -d 0/0 --dport 111 -j DROP
/sbin/iptables -A INPUT -p udp -s 0/0 -d 0/0 --dport 111 -j DROP
/sbin/iptables -A INPUT -p tcp -s 0/0 -d 0/0 --dport 6668 -j DROP
/sbin/iptables -A INPUT -p udp -s 0/0 -d 0/0 --dport 6668 -j DROP
/sbin/iptables -A INPUT -p tcp -s 0/0 -d 0/0 --dport 22 -j DROP
/sbin/iptables -A INPUT -p udp -s 0/0 -d 0/0 --dport 22 -j DROP
/sbin/iptables -A INPUT -p tcp -s 0/0 -d 0/0 --dport 111 -j DROP
/sbin/iptables -A INPUT -p udp -s 0/0 -d 0/0 --dport 111 -j DROP
/sbin/iptables -A INPUT -p tcp -s 0/0 -d 0/0 --dport 135 -j DROP
/sbin/iptables -A INPUT -p udp -s 0/0 -d 0/0 --dport 135 -j DROP
/sbin/iptables -A INPUT -p tcp -s 0/0 -d 0/0 --dport 137 -j DROP
/sbin/iptables -A INPUT -p udp -s 0/0 -d 0/0 --dport 137 -j DROP
/sbin/iptables -A INPUT -p tcp -s 0/0 -d 0/0 --dport 138 -j DROP
/sbin/iptables -A INPUT -p udp -s 0/0 -d 0/0 --dport 138 -j DROP
/sbin/iptables -A INPUT -p tcp -s 0/0 -d 0/0 --dport 139 -j DROP
/sbin/iptables -A INPUT -p udp -s 0/0 -d 0/0 --dport 139 -j DROP
/sbin/iptables -A INPUT -p tcp -s 0/0 -d 0/0 --dport 445 -j DROP
/sbin/iptables -A INPUT -p udp -s 0/0 -d 0/0 --dport 445 -j DROP
/sbin/iptables -A INPUT -p tcp -s 0/0 -d 0/0 --dport 6667 -j DROP
/sbin/iptables -A INPUT -p udp -s 0/0 -d 0/0 --dport 6667 -j DROP
/sbin/iptables -A INPUT -p udp -s 0/0 -d 0/0 --dport 1025 -j DROP
/sbin/iptables -A INPUT -p udp -s 0/0 -d 0/0 --dport 1978 -j DROP
/sbin/iptables -A INPUT -p udp -s 0/0 -d 0/0 --dport 2002 -j DROP
/sbin/iptables -A INPUT -p udp -s 0/0 -d 0/0 --dport 1433 -j DROP
/sbin/iptables -A INPUT -p tcp -s 0/0 -d 0/0 --dport 1433 -j DROP
/sbin/iptables -A INPUT -p udp -s 0/0 -d 0/0 --dport 1434 -j DROP
/sbin/iptables -A INPUT -p tcp -s 0/0 -d 0/0 --dport 1434 -j DROP

#Turning on Linux kernel support for spoof and DOS (Denial Of Service) 
protection:
echo 1 >/proc/sys/net/ipv4/tcp_syncookies
echo 1 > /proc/sys/net/ipv4/ip_forward

_________________________________________________________________
Himalayan holiday! Waiting to be won. 
http://server1.msn.co.in/sp03/summerfun/index.asp Find out more.


