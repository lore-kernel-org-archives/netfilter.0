From: netfilter_user <netfilter_user@o2.pl>
Subject: SNMP and IPTABLES
Date: Sat, 2 Aug 2003 11:36:13 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1934869742.20030802113613@o2.pl>
Reply-To: netfilter_user <netfilter_user@o2.pl>
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
To: netfilter@lists.netfilter.org

hello everyone,

This is my problem:

As a gateway in my network is a PC with Linux ( Slackware 8.1 ), and
also on this machine is installed MRTG that listen for SNMP. I want to use SNMP
only in local ( internal ) network. I know that SNMP
use 161 and 162 port. There are no problems with comunication between
Linux machine and local hosts via SNMP.

BUT: the problem is when MRTG try to receive SNMP information from this
same machine that is installed ( MRTG is installed on Linux machine -
gateway). I dont know why because i set: iptables -A INPUT -i eth1 -p tcp -m multiport --dport 21,80,161,3128 -j ACCEPT
                                         iptables -A INPUT -i eth1 -p udp -m multiport --dport 80,67,161 -j ACCEPT
                              ...and it should resolve problem...but
                              it wont

!!!!!THIS IS IMPORTANT!!!!
when I set all INPUT ACCETP then it works. So there is no problem with
snmp and MRTG but with my iptables config :/

                                         
I use:
NET-SNMP version:  5.0.7
iptables v1.2.6a

This is my iptables config:


insmod ip_conntrack
insmod ip_conntrack_ftp

iptables -P FORWARD DROP
iptables -P INPUT DROP
iptables -P OUTPUT ACCEPT

iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -p tcp -m multiport --dport 22 -j ACCEPT
iptables -A INPUT -i eth1 -p tcp -m multiport --dport 21,80,161,3128 -j ACCEPT
iptables -A INPUT -i eth1 -p udp -m multiport --dport 80,67,161 -j ACCEPT

iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -i eth1 -p tcp -m multiport --dport 21,22,25,110,1111,6112 -j ACCEPT
iptables -A FORWARD -i eth1 -p udp -m multiport --dport 53,6112,13073,23083,23073 -j ACCEPT

iptables -I INPUT -p icmp --icmp-type echo-request -s 0.0.0.0/0 -m limit --limit 1/s -j ACCEPT
iptables -I INPUT -p icmp --icmp-type echo-request -s 0.0.0.0/0 -j DROP


#===NAT=================================================================================
modprobe iptable_nat
iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE
echo 1 > /proc/sys/net/ipv4/ip_forward


Will be thankful for any good advice

-- 
Best regards,
   mailto:netfilter_user@o2.pl


