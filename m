From: Robert Gil <rgil@bodybuildingdiscount.com>
Subject: ICMP, SYN, ACK flooding
Date: Fri, 05 Dec 2003 17:11:10 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3FD1027E.70007@bodybuildingdiscount.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

In this script for iptables i cant seem to get the icmp flood protection 
to work. Im limiting the icmp to 1/s and a burst of 4... (under ping of 
death), same goes for syn flood allthough im not quite sure how to test 
syn/ack/fin/xmas flooding. And how can i go about closing all ports to 
syn packets except the ones listed so i dont have the responding. 
Perhaps i have some things in the wrong order. Any help would be great.
                                                                        
              ~Rob Gil
#######################################################
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT ACCEPT

iptables -A INPUT -j ACCEPT -p tcp --dport 21
iptables -A INPUT -j ACCEPT -p tcp --dport 22
iptables -A INPUT -j ACCEPT -p tcp --dport 25
iptables -A INPUT -j ACCEPT -p tcp --dport 80
iptables -A INPUT -j ACCEPT -p tcp --dport 110
iptables -A INPUT -j ACCEPT -p tcp --dport 443

iptables -A INPUT -p tcp -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -p udp -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -p tcp ! --syn -m state --state NEW -j DROP

# Flood Protection
# SYN
iptables -A FORWARD -p tcp --syn -m limit --limit 1/s -j ACCEPT
                                                                                                      

# Port Scan
iptables -A FORWARD -p tcp --tcp-flags SYN,ACK,FIN,RST RST -m limit \
--limit 1/s  -j ACCEPT
                                                                                                      

# Ping Of Death
iptables -A FORWARD -p icmp --icmp-type echo-request -m limit --limit 
1/s \ --limit-burst 4 -j ACCEPT

#ICMP REQ (ECHO)
#iptables -A INPUT -p icmp --icmp-type echo-request -j ACCEPT
                                                                                

#ICMP REP (ECHO)
#iptables -A INPUT -i eth0 -p icmp --icmp-type echo-reply -j ACCEPT

# Refuse Loopback From Outside
iptables -A INPUT -i eth0 -d 127.0.0.0/8 -j DROP
# Kill Fragments
#iptables -A INPUT -i eth0 -f -j LOG --log-level debug --log-prefix 
"IPTABLES \ FRAGMENTS: "
iptables -A INPUT -i eth0 -f -j DROP

echo 1 > /proc/sys/net/ipv4/ip_forward




