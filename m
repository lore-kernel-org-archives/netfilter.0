From: dknyvice <dknyvice@yahoo.com>
Subject: iptables mangle prerouting filter not working
Date: Mon, 2 Jul 2007 18:08:24 +0100 (BST)
Message-ID: <629090.18762.qm@web50401.mail.re2.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
To: iptables <netfilter@lists.netfilter.org>

The configuration is like that, i been provided by my
ISP  a set of
WAN ip. And i configure my firewall eth0 as external
interface and eth1
as my internal interface for all the server with WAN
ip. I using
mangle prerouting to do the filter. Problem here is
after i configure
all and enable the DROP rule for each interface. my
server all can
seem access the server outside the firewall.In short,
i can only go in
to the WAN side server but connection from WAN side to
internet been block
especially DNS server. I try to disable the drop rule
but it will open
all my WAN server to the internet. I configure the
INPUT table to
filter who can ssh to the firewall. The rest is in
mangle prerouting
table. Please help.
(i do the mtr trace route to yahoo with the drop rule
enable, and it
seem like the last and 1st hop is the internal
interface and
connection stuck there. It work well with the drop
rule disabled)

eth0 = external
eth1 = internal

#!/bin/sh
#
#
#
#
# flush all rule before generate a new set of rule
iptables -F
iptables -t mangle -F
iptables -t mangle -P PREROUTING ACCEPT

#access to local ssh
#iptables -A INPUT -p tcp -m state --state NEW -m tcp
--dport 22 -j ACCEPT
iptables -A INPUT -s 21xxxxxxxxx -p tcp -m state
--state NEW -m tcp
--dport 22 -j ACCEPT
iptables -A INPUT -s 1xxxxxxxxxxx/255.255.255.0 -p tcp
-m state
--state NEW -m tcp --dport 22 -j ACCEPT
iptables -A INPUT -s 6xxxxxxxxxxxx/255.255.255.252 -p
tcp -m state
--state NEW -m tcp --dport 22 -j ACCEPT
iptables -A INPUT -s 2xxxxxxxxxxxxxx/255.255.255.192
-p tcp -m state
--state NEW -m tcp --dport 22 -j ACCEPT
iptables -A INPUT  -p tcp -m state --state NEW -m tcp
--dport 53 -j ACCEPT
iptables -A INPUT -p tcp -m state --state NEW -m tcp
--dport 22 -j DROP

# make mangle table default to drop
#iptables -t mangle -P PREROUTING DROP



#external network to internal network
#ACCESS TO SEGMENT

2xxxxxxxxxxxxxx/28==========================================================================================================

===========
#iptables -t mangle -A PREROUTING -p all -s 0/0 -d
20xxxxxxxxxxx/28 -j ACCEPT

#xxxxxxxxxxxxx
iptables -t mangle -A PREROUTING -p tcp -s
20xxxxxxxxxxxxx --sport
8282 -d 20xxxxxxxxxxx -j ACCEPT

iptables -t mangle -A PREROUTING -p tcp -s
20xxxxxxxxxxxxx -d
20xxxxxxxxxxxxxxx --dport 8282 -j ACCEPT

iptables -t mangle -A PREROUTING -p tcp -m multiport
-s 0/0 -d
2xxxxxxxxxxxxx/28 --destination-ports 80,443 -j ACCEPT

iptables -t mangle -A PREROUTING -p tcp -s 0/0 --sport
25 -d
20xxxxxxxxxxxxxxx/28 -j ACCEPT

iptables -t mangle -A PREROUTING -i eth0 -p tcp -m
multiport -s
1xxxxxxxxxxxxx/24 --source-ports
1433,1434,22,20,21,3389,3306 -d
20xxxxxxx/28 -j ACCEPT

iptables -t mangle -A PREROUTING -i eth0 -p tcp -m
multiport -s
2xxxxxxxxxxxxx/27 --source-ports
1433,1434,22,20,21,3389,3306 -d
20xxxxxxxx/28 -j ACCEPT

iptables -t mangle -A PREROUTING -i eth0 -p tcp -m
multiport -s
2xxxxxxxxxxxx/27 --source-ports
1433,1434,22,20,21,3389,3306

-d 20xxxxxxxxxxxxxx/28 -j ACCEPT
iptables -t mangle -A PREROUTING -i eth0 -p tcp -m
multiport -s
2xxxxxxxxxxx/27 --source-ports
1433,1434,22,20,21,3389,3306 -d
20xxxxxxxxxxxxx/28 -j ACCEPT

------DNS--------
iptables -t mangle -A PREROUTING -i eth0 -p udp -s
20xxxxxxxxx/28 -d
20xxxxxxxxxxx/32 -j ACCEPT
iptables -t mangle -A PREROUTING -i eth0 -p udp -s
20xxxxxxxxxxx/30 -d
2xxxxxxxxxxxxx/32 -j ACCEPT
iptables -t mangle -A PREROUTING -i eth0 -p tcp -s
20xxxxxxxxxxxxx/28
-d 2xxxxxxxxxxx/32 -j ACCEPT
iptables -t mangle -A PREROUTING -i eth0 -p tcp -s
20xxxxxxxx/30 -d
2xxxxxxxxxxxx/32 -j ACCEPT
iptables -t mangle -A PREROUTING -i eth0 -p udp -d
20xxxxxxxxxxx/32 -j ACCEPT
iptables -t mangle -A PREROUTING -i eth0 -p tcp -d
2xxxxxxxxxxx/32 -j ACCEPT

---------------------------------
iptables -t mangle -A PREROUTING -i eth0 -p tcp -m
multiport -s
1xxxxxxxx/24 -d 2xxxxxxxxxxxxx/28 --destination-ports
20,21,22,1433,1434,3389,3306 -j ACCEPT

iptables -t mangle -A PREROUTING -i eth0 -p tcp -m
multiport -s
2xxxxxxxx/29 -d 2xxxxxxxxxxxx/28 --destination-ports
20,21,22,1433,1434,3389,3306 -j ACCEPT

iptables -t mangle -A PREROUTING -i eth0 -p tcp -m
multiport -s
2xxxxxxxxxxxxx/29 -d 2xxxxxxxxx/30 --destination-ports
20,21,22,1433,1434,3389,3306 -j ACCEPT

iptables -t mangle -A PREROUTING -i eth0 -p tcp -m
multiport -s
6xxxxxxxxxxxx/30 -d 2xxxxxxxxxxx/28
--destination-ports
20,21,22,1433,1434,3389,3306 -j ACCEPT

iptables -t mangle -A PREROUTING -i eth0 -p tcp -m
multiport -s
6xxxxxxxxxxxxx -d 2xxxxxxxxxxxxx/28
--destination-ports
20,21,22,1433,1434,3389,3306 -j ACCEPT

iptables -t mangle -A PREROUTING -i eth0 -p tcp -m
multiport -s
6xxxxxxxxxxxx -d 2xxxxxxxxxxxx/28 --destination-ports
20,21,22,1433,1434,3389,3306 -j ACCEPT

iptables -t mangle -A PREROUTING -i eth0 -p tcp -m
multiport -s
2xxxxxxxxxxxxx/27 -d 2xxxxxxxxxxx/28
--destination-ports
20,21,22,1433,1434,3389,3306 -j ACCEPT

iptables -t mangle -A PREROUTING -i eth0 -p tcp -m
multiport -s
2xxxxxxxxxxxxx/27 -d 2xxxxxxxxxxx/28
--destination-ports
20,21,22,1433,1434,3389,3306 -j ACCEPT

iptables -t mangle -A PREROUTING -i eth0 -p tcp -m
multiport -s
2xxxxxxxxxxxx/27 -d 2xxxxxxxxxxx/28
--destination-ports
20,21,22,1433,1434,3389,3306 -j ACCEPT

iptables -t mangle -A PREROUTING -i eth0 -p tcp -m
multiport -s
2xxxxxxxxxxxxxx/26 -d 2xxxxxxxxxxxx/28
--destination-ports
20,21,22,1433,1434,3389,3306 -j ACCEPT

iptables -t mangle -A PREROUTING -i eth0 -p tcp -m
multiport -s
1xxxxxxxxxxxx/27 -d 2xxxxxxxxxxxxxx/28
--destination-ports
20,21,25,3389 -j ACCEPT

#xxxxxxxxx
iptables -t mangle -A PREROUTING -i eth0 -p tcp -s
1xxxxxxxxxxx/24 -d
2xxxxxxxxxxxx --dport 80 -j ACCEPT
iptables -t mangle -A PREROUTING -i eth0 -p tcp -s
2xxxxxxxxxxxxx/29
-d 2xxxxxxxxxxxx--dport 80 -j ACCEPT
iptables -t mangle -A PREROUTING -i eth0 -p tcp -s
6xxxxxxxxxxx/30 -d
2xxxxxxxxx --dport 80 -j ACCEPT
iptables -t mangle -A PREROUTING -i eth0 -p tcp -s
2xxxxxxxxxxxx/27 -d
2xxxxxxxxxxxx --dport 80 -j ACCEPT
iptables -t mangle -A PREROUTING -i eth0 -p tcp -s
2xxxxxxxxxxxx/27 -d
2xxxxxxxxx --dport 80 -j ACCEPT
iptables -t mangle -A PREROUTING -i eth0 -p tcp -s
2xxxxxxxxxxxxxx/27
-d 2xxxxxxxxxxxxx --dport 80 -j ACCEPT

#xxxxxxxx
iptables -t mangle -A PREROUTING -i eth0 -p tcp -s
2xxxxxxxxxxx/32 -d
2xxxxxxxxx/32 --dport 8383 -j ACCEPT
iptables -t mangle -A PREROUTING -i eth0 -p tcp -s
2xxxxxxxxx4/32
--sport 8383 -d 2xxxxxxxxxxx/32 -j ACCEPT

iptables -t mangle -A PREROUTING -i eth0 -p tcp -s
2xxxxxxxxxxxx7/32
-d 2xxxxxxxxxxx/32 --dport 8383 -j ACCEPT
iptables -t mangle -A PREROUTING -i eth0 -p tcp -s
2xxxxxxxxxxxx/32
--sport 8383 -d 2xxxxxxxxxxxxxxx/32 -j ACCEPT

#8080
iptables -t mangle -A PREROUTING -i eth0 -p tcp -s
2xxxxxxxxxxxxxx
--sport 8080 -d 2xxxxxxxxxxxxxx/28 -j ACCEPT


#============================================================================================================================

==============================

#==========================================================================================================================
#iptables -t mangle -A PREROUTING -i eth1 -p all      
  -j LOG
--log-level debug --log-prefix "ETH1 DROP :"
#iptables -t mangle -A PREROUTING -i eth1 -p all      
  -s 0/0
         -d 0/0          -j DROP
#==========================================================================================================================

#================================================================================================================
#iptables -t mangle -A PREROUTING -i eth0 -p all      
  -j LOG
--log-level debug --log-prefix "ETH0 DROP :"
iptables -t mangle -A PREROUTING -i eth0  -p all -s
2xxxxxxxxx/28 -d
2xxxxxxxxxxx/32   -j ACCEPT
iptables -t mangle -A PREROUTING -i eth0  -p all -s
2xxxxxxxxxxx/32 -d
xxxxxxxxxxxxx/28 -j ACCEPT
iptables -t mangle -A PREROUTING -i eth0 -p all       
         -j DROP

#================================================================================================================

#internal network to external network
#SEGMENT

2xxxxxxxxxxxx/28#############################################################################################################

####
#ICMP
iptables -t mangle -A PREROUTING -i eth1 -p icmp -s
2xxxxxxxxx/28 -d
0/0 -j ACCEPT
#ALL ACCESS
iptables -t mangle -A PREROUTING -i eth1 -p tcp -s
20xxxxxxxxxxxx/28
 -d 0/0 --dport 80 -j ACCEPT
iptables -t mangle -A PREROUTING -i eth1 -p tcp -s
20xxxxxxxxxxxxx/28
  -d 0/0 --dport 443 -j ACCEPT
iptables -t mangle -A PREROUTING -i eth1 -p tcp -m
multiport -s
20xxxxxxxxxxx/28 --source-ports
80,443,20,21,22,1433,1434,3389,3306,8383,53 -d 0/0 -j
ACCEPT

iptables -t mangle -A PREROUTING -i eth1 -p tcp -m
multiport -s
20xxxxxxxxxxx/28        -d 0/0 --destination-ports
25,1433,1434,22,20,21,3389,3306,8080,53 -j ACCEPT

#iptables -t mangle -A PREROUTING -i eth1 -p udp -s
20xxxxxxxxxxxx/28
-d 2xxxxxxxxxxxx/32 -j ACCEPT

#iptables -t mangle -A PREROUTING -i eth1 -p udp -s
2xxxxxxxxxxx/30 -d
2xxxxxxxxxxxxx/32 -j ACCEPT
#iptables -t mangle -A PREROUTING -i eth1 -p tcp -s
2xxxxxxxxxxxxx/28
-d 2xxxxxxxxxxxxx/32 -j ACCEPT
#iptables -t mangle -A PREROUTING -i eth1 -p tcp -s
20xxxxxxxxxxx/30
-d 2xxxxxxxxxxxxx/32 -j ACCEPT
iptables -t mangle -A PREROUTING -i eth1 -p udp -d
2xxxxxxxxxxxx/32 -j ACCEPT
iptables -t mangle -A PREROUTING -i eth1 -p tcp -d
2xxxxxxxxxxxxxx/32 -j ACCEPT


iptables -t mangle -A PREROUTING -i eth1 -p udp -s
2xxxxxxxxx/28
--sport 161 -d 0/0 -j ACCEPT
iptables -t mangle -A PREROUTING -i eth1 -p tcp -s
2xxxxxxxxxxxx/28 -d
203.142.17.134/32 --dport 8383 -j ACCEPT
iptables -t mangle -A PREROUTING -i eth1 -p tcp -s
2xxxxxxxxxxx/28 -d
2xxxxxxxxxxx/32 --dport 8383 -j ACCEPT

#To xxxxxxxxx
iptables -t mangle -A PREROUTING -i eth1 -p tcp -s
2xxxxxxxxx -d
2xxxxxxxxxxx--dport 8282 -j ACCEPT
iptables -t mangle -A PREROUTING -i eth1 -p tcp -s
2xxxxxxxxx --sport
8282 -d 2xxxxxxxxxxxx -j ACCEPT

#To xxxxxxxxxxxxx
iptables -t mangle -A PREROUTING -i eth1 -p tcp -s
2xxxxxxxxxxx/28 -d
192.xxxxxxx        -j ACCEPT
iptables -t mangle -A PREROUTING -i eth1 -p tcp -s
2xxxxxxxxx/28 -d
192.xxxxxx     -j ACCEPT
#############################################################################################################################

#############


#==========================================================================================================================
#iptables -t mangle -A PREROUTING -i eth1 -p all      
  -j LOG
--log-level debug --log-prefix "ETH1 DROP :"
#iptables -t mangle -A PREROUTING -i eth1 -p all      
  -s 0/0
         -d 0/0          -j DROP
#==========================================================================================================================
#iptables -t mangle -A PREROUTING -i eth1 -p all -s
2xxxxxxxxx/32     -j ACCEPT
iptables -t mangle -A PREROUTING -i eth1  -p all -s
2xxxxxxxxx/28 -d
2xxxxxxxxx/32   -j ACCEPT
iptables -t mangle -A PREROUTING -i eth1  -p all -s
2xxxxxxxx/32 -d
2xxxxxxx/28 -j ACCEPT

iptables -t mangle -A PREROUTING -i eth1 -p all       
 -s 0/0
        -d 0/0          -j DROP

Send instant messages to your online friends http://uk.messenger.yahoo.com 

