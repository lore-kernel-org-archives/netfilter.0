From: Micol lupen <galaxi_999@yahoo.it>
Subject: IPTABLES PROBLEM
Date: Tue, 8 Nov 2005 18:08:07 +0100 (CET)
Message-ID: <20051108170808.94047.qmail@web26603.mail.ukl.yahoo.com>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi guys, thanks for all.
I have this problem whith iptables:,   
Io gestisco una rete con 10 pc (indirizzo e'
I have a lan whit 10 pc (use win9X) and have ip
10.10.10.2 ecc..)
Tree days ago Telecom build in my farm the adsl (using
router adsl cisco )  
i wont to create a firewall and use natting for pc 
I build a pc whit Slackware 10.1 
and i do this script:
----Information LAN--------
eth0: 10.10.10.50 netmask 255.255.255.0 (ETHO IS
connected to switch ) 
eth1:178.133.80.74 netmask 255.255.255.248 (IP
STATIC,GIVE ME THIS IP FROM TELECOM )
gatway 78.133.80.73 netmask 255.255.255.248
(GATWAY IP, GIVE ME THIS FROM TELECOM )
 DNS 151.99.125.1 (DNS IP, GIVE ME FROM TELECOM )
------SCRIPT FOR ETHERNET
CONFIGURATION----------------


//ETHERNET INTERFACE file conf.ps
!/bin/bash
ifconfig eth0 10.10.10.50 netmask 255.255.255.0
ifconfig eth1 178.133.80.74 netmask 255.255.255.248
route add -net default gw 178.133.80.73 netmask
255.255.255.248 
# END SCRIPT CONF.PS

//--- I WRITE IN /etc/resolv.conf 
NAMESERVER=151.99.125.1

//--------FIREWALL SCRIPT firewall.ps

#!/bin/bash
IPTAB=iptables
NAMESERVER=151.99.125.1  
IPADD=178.133.80.74 


# IMPORTANT UTILITY 
echo 1 > /proc/sys/net/ipv4/tcp_syncookies
echo 1 > /proc/sys/net/ipv4/ip_forward 
echo 0 >
/proc/sys/net/ipv4/conf/all/accept_source_route 
echo 1 > /proc/sys/net/ipv4/icmp_echo_ignore_all
echo 1 >
/proc/sys/net/ipv4/icmp_echo_ignore_broadcasts 
echo 1 > /proc/sys/net/ipv4/conf/all/log_martians
#CLEAR ALL
$IPTAB -F
$IPTAB -X
$IPTAB -Z
$IPTAB -t nat -F
$IPTAB -t nat -X
# DROP ALL
$IPTAB -P INPUT DROP
$IPTAB -P FORWARD DROP
$IPTAB -P OUTPUT  DROP

$IPTAB -A INPUT -i lo -j ACCEPT
$IPTAB -A OUTPUT -o lo -j ACCEPT 

# FROM LAN TO INTERNET  
$IPTAB -A INPUT -s 10.10.10.0/24 -i eth0 -j ACCEPT  
# FORWORDING
$IPTAB -A FORWARD -i eth0 -s 10.10.10.0/24 -j ACCEPT
$IPTAB -A FORWARD -i eth1 -d 10.10.10.0/24 -j ACCEPT
# QUERY DNS (SERVER-> CLIENT)
$IPTAB -A INPUT -i eth1 -p udp -s $NAMESERVER --sport
53 -m state --state ESTABLISHED -j ACCEPT
$IPTAB -A INPUT -i eth1 -p tcp -s $NAMESERVER --sport
53 -m state --state ESTABLISHED
#QUERY DNS (CLIENT-> SERVER)
$IPTAB -A OUTPUT -o eth1 -p udp -d $NAMESERVER --dport
53 -m state --state NEW,ESTABLISHED -j ACCEPT
$IPTAB -A OUTPUT -o eth1 -p tcp -d $NAMESERVER --dport
53 -m state --state NEW,ESTABLISHED -j ACCEPT    
#HTTP E HTTPS
$IPTAB -A INPUT -i eth1 -p tcp --sport 80 -m state
--state ESTABLISHED -j ACCEPT
$IPTAB -A OUTPUT -o eth1 -p tcp --dport 80 -m state
--state NEW,ESTABLISHED -j ACCEPT 
$IPTAB -A INPUT -i eth1 -p tcp --sport 443 -m state
--state ESTABLISHED -j  ACCEPT
$IPTAB -A OUTPUT -o eth1 -p tcp --dport 443 -m state
--state NEW,ESTABLISHED -j ACCEPT
#NAT
$IPTAB -t nat -A POSTROUTING -o eth1 -s 10.10.10.0/24
-j SNAT --to $IPADD
 #fine

WHEN I START TO FIREWALL THE CLIENT CAN'T TO GO TO
INTERNET, HELP ME !!!!
P.S. excuse me for my bad english 
REGADS 
MICOL  
 

Grazie mille


	

	
		
___________________________________ 
Yahoo! Mail: gratis 1GB per i messaggi e allegati da 10MB 
http://mail.yahoo.it

