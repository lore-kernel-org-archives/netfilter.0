From: Justin Friel <capn_shoe@yahoo.com>
Subject: DNAT: Unable to Forward Ports, Why?
Date: Sun, 30 May 2004 12:17:38 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040530191738.31092.qmail@web60008.mail.yahoo.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi all,

I recently turned an old pentium computer into a
gateway server for may LAN.  For the most part, my
script works great and I have even seen a performance
increase over my old SpeedStream DSL router.  The one
problem is that I can't seem to forward outside
requests for port 80 (or 21 or 22 for that matter) to
a computer inside the LAN.  

To be sure, apache is listening on port 80, as I can
connect from the loopback device and from other
computers on the LAN using its private IP. When I try
to connect using my (dynamic) external IP the
connection is refused.  As I mentioned earlier, I have
tried forwarding to the ssh and ftp ports with the
same results.

I have read the howtos and searched google but can't
figure out exactly what I am doing wrong.  Here is the
relavant portion of my iptables script:

#!/bin/bash

. /etc/sysconfig/rc
. $rc_functions

IPT=`which iptables`
EXT_IP=`ifconfig ppp0 | grep addr: | awk '{print $2}'
| sed 's/addr://'`
EXT_IF="ppp0"
INT_IF="eth0"
LAN="192.168.1.0/24"
CLASS_A="10.0.0.0/8"
CLASS_B="172.16.0.0/12"
CLASS_C="192.168.0.0/16"
CLASS_D_MULTICAST="224.0.0.0/4"
CLASS_E_RESERVED="240.0.0.0/5"

case "$1" in
	start)
		echo "Starting Firewall..."
		# Clean up old settings:
		$IPT -F
		$IPT -F -t nat
		$IPT -X
		# adjust /proc
		echo 1 > /proc/sys/net/ipv4/tcp_syncookies
		echo 1 > /proc/sys/net/ipv4/ip_forward
		echo 0 > /proc/sys/net/ipv4/tcp_ecn
		echo 2 > /proc/sys/net/ipv4/ip_dynaddr
		for IF in /proc/sys/net/ipv4/conf/*/rp_filter ;
		do
			echo 1 > $IF
		done
		# load some modules
		# modprobe ip_conntrack_irc
		# modprobe ip_nat_irc
		modprobe ip_conntrack_ftp
		modprobe ip_nat_ftp
		# Allow unlimited local traffic:
		$IPT -A INPUT -i lo -j ACCEPT
		$IPT -A OUTPUT -o lo -j ACCEPT
		$IPT -A INPUT -i $INT_IF -j ACCEPT
		$IPT -A OUTPUT -o $INT_IF -j ACCEPT
		# Forward and all internal packets:
		$IPT -I FORWARD -i $INT_IF -j ACCEPT
		$IPT -I FORWARD 2 -m state --state
ESTABLISHED,RELATED -j ACCEPT
		# Open port 22
		# $IPT -A INPUT -i $EXT_IF -p tcp --dport 80 -j
ACCEPT
		# Forward port 22
		$IPT -A FORWARD -d $EXT_IP -p tcp --dport 80 -j
ACCEPT
		$IPT -t nat -A PREROUTING -p tcp --dport 80 -i
$EXT_IF \
		 -j DNAT --to-destination 192.168.1.2:80
		# Masquerade
		$IPT -t nat -A POSTROUTING -s $LAN -o $EXT_IF -j
MASQUERADE
		# icmp rules
		$IPT -A OUTPUT -p icmp -m state --state NEW -j
ACCEPT
		$IPT -A INPUT -p icmp -m state --state
ESTABLISHED,RELATED \
		 -j ACCEPT
		$IPT -A INPUT -p icmp --icmp-type echo-request -m
limit \
		 --limit 1/s -i ppp0 -j ACCEPT
		# Reject queries to identd
		$IPT -A INPUT -p tcp --dport 113 \
		 -j REJECT --reject-with tcp-reset
		$IPT -A OUTPUT -p tcp --sport 113 -m state --state
RELATED \
		 -j ACCEPT
		# Log stuff
		$IPT -A INPUT -j LOG --log-prefix "iptables:INPUT "
		$IPT -A FORWARD -j LOG --log-prefix
"iptables:FORWARD "
		$IPT -A OUTPUT  -j LOG --log-prefix "iptables:OUTPUT
"
		$IPT -I INPUT 1 -p tcp -m state --state INVALID -j
LOG \
		 --log-prefix "iptables:INVALID"
		# Block reserved private IP's from entering the
network
		$IPT -A INPUT -i $EXT_IF -s $CLASS_A -j DROP
		$IPT -A INPUT -i $EXT_IF -s $CLASS_B -j DROP
		$IPT -A INPUT -i $EXT_IF -s $CLASS_C -j DROP
		$IPT -A INPUT -i $EXT_IF -s $CLASS_D_MULTICAST -j
DROP
		$IPT -A INPUT -i $EXT_IF -s $CLASS_E_RESERVED -j
DROP
		$IPT -A FORWARD -i $EXT_IF -s $CLASS_A -j DROP
		$IPT -A FORWARD -i $EXT_IF -s $CLASS_B -j DROP
		$IPT -A FORWARD -i $EXT_IF -s $CLASS_C -j DROP
		$IPT -A FORWARD -i $EXT_IF -s $CLASS_D_MULTICAST -j
DROP
		$IPT -A FORWARD -i $EXT_IF -s $CLASS_E_RESERVED -j
DROP
		# apply icmp type match blocking
		$IPT -A INPUT -p icmp --icmp-type redirect -j DROP
		$IPT -A INPUT -p icmp --icmp-type
router-advertisement -j DROP
		$IPT -A INPUT -p icmp --icmp-type
router-solicitation -j DROP
		$IPT -A INPUT -p icmp --icmp-type
address-mask-request -j DROP
		$IPT -A INPUT -p icmp --icmp-type address-mask-reply
-j DROP
		# Set Default Policy (drop everything):
		$IPT -P INPUT DROP
		$IPT -P OUTPUT DROP
		$IPT -P FORWARD DROP
		$IPT -I INPUT 2 -p tcp -m state --state INVALID -j
DROP
		;;

	stop)
...

The output for route is:

Kernel IP routing table
Destination     Gateway         Genmask         Flags
Metric Ref    Use Iface
66.32.216.1     *               255.255.255.255 UH   
0      0        0 ppp0
192.168.1.0     *               255.255.255.0   U    
0      0        0 eth0
default         66.32.216.1     0.0.0.0         UG   
0      0        0 ppp0

And the output for iptables -L is:

Chain INPUT (policy DROP)
target     prot opt source               destination  
      
LOG        tcp  --  anywhere             anywhere     
      state INVALID LOG level warning prefix
`iptables:INVALID' 
DROP       tcp  --  anywhere             anywhere     
      state INVALID 
ACCEPT     all  --  anywhere             anywhere     
      
ACCEPT     all  --  anywhere             anywhere     
      
ACCEPT     icmp --  anywhere             anywhere     
      state RELATED,ESTABLISHED 
ACCEPT     icmp --  anywhere             anywhere     
      icmp echo-request limit: avg 1/sec burst 5 
REJECT     tcp  --  anywhere             anywhere     
      tcp dpt:ident reject-with tcp-reset 
LOG        all  --  anywhere             anywhere     
      LOG level warning prefix `iptables:INPUT ' 
DROP       all  --  10.0.0.0/8           anywhere     
      
DROP       all  --  172.16.0.0/12        anywhere     
      
DROP       all  --  192.168.0.0/16       anywhere     
      
DROP       all  --  224.0.0.0/4          anywhere     
      
DROP       all  --  240.0.0.0/5          anywhere     
      
DROP       icmp --  anywhere             anywhere     
      icmp redirect 
DROP       icmp --  anywhere             anywhere     
      icmp router-advertisement 
DROP       icmp --  anywhere             anywhere     
      icmp router-solicitation 
DROP       icmp --  anywhere             anywhere     
      icmp address-mask-request 
DROP       icmp --  anywhere             anywhere     
      icmp address-mask-reply 

Chain FORWARD (policy DROP)
target     prot opt source               destination  
      
ACCEPT     all  --  anywhere             anywhere     
      
ACCEPT     all  --  anywhere             anywhere     
      state RELATED,ESTABLISHED 
ACCEPT     tcp  --  anywhere             66.32.220.29 
      tcp dpt:http 
LOG        all  --  anywhere             anywhere     
      LOG level warning prefix `iptables:FORWARD ' 
DROP       all  --  10.0.0.0/8           anywhere     
      
DROP       all  --  172.16.0.0/12        anywhere     
      
DROP       all  --  192.168.0.0/16       anywhere     
      
DROP       all  --  224.0.0.0/4          anywhere     
      
DROP       all  --  240.0.0.0/5          anywhere     
      

Chain OUTPUT (policy DROP)
target     prot opt source               destination  
      
ACCEPT     all  --  anywhere             anywhere     
      
ACCEPT     all  --  anywhere             anywhere     
      
ACCEPT     icmp --  anywhere             anywhere     
      state NEW 
ACCEPT     tcp  --  anywhere             anywhere     
      tcp spt:ident state RELATED 
LOG        all  --  anywhere             anywhere     
      LOG level warning prefix `iptables:OUTPUT ' 
Chain PREROUTING (policy ACCEPT)
target     prot opt source               destination  
      
DNAT       tcp  --  anywhere             anywhere     
      tcp dpt:http to:192.168.1.2:80 

Chain POSTROUTING (policy ACCEPT)
target     prot opt source               destination  
      
MASQUERADE  all  --  192.168.1.0/24       anywhere    
       

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination  
      
Chain PREROUTING (policy ACCEPT)
target     prot opt source               destination  
      

Chain INPUT (policy ACCEPT)
target     prot opt source               destination  
      

Chain FORWARD (policy ACCEPT)
target     prot opt source               destination  
      

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination  
      

Chain POSTROUTING (policy ACCEPT)
target     prot opt source               destination

I'd also include any logged messages, however trying
to connect to those ports generates none.

Sorry for being so windy about this whole thing, I'm
just trying to include any info you may need.


Thanks for the help.       


	
		
__________________________________
Do you Yahoo!?
Friends.  Fun.  Try the all-new Yahoo! Messenger.
http://messenger.yahoo.com/ 

