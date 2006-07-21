From: James Marcinek <jmarc1@jemconsult.biz>
Subject: Help with IPtables and NAT
Date: Fri, 21 Jul 2006 19:19:37 -0400
Message-ID: <44C16109.20704@jemconsult.biz>
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

Hello Everyone,

I've been running my Red Hat box as a router for my small network for 
the past couple of years with no problems (if it works don't fix it). I 
have another live IP address that I would like use. I would like any 
traffic destined for this 'new' address to forward (DNAT) traffic to a 
system in my intranet. I don't want to blindly allow all traffic, just 
certain ones based off of rules. I have attempted to do this a couple of 
time but without success. Below is my current topology (real IP's have 
been substituted for 172.10.10.x addresses:



                                                                        
                   Internet
                                                                       
                          |
                                                                        
                         |
                                                                        
                         |
                                                                        
           -------------------------
                                                                        
           | 172.10.10.1 eth0        |
                                                                        
           |                                    |
                                                                        
           |                                    |
                                                                        
           | 192.168.0.1 eth1         |
                                                                        
           -------------------------
                                                                        
                          |
                                                                        
                          |
                                                                        
                          |
                                                                        
                 Intranet (private network)


Here's what I would like to have:

                                                                        
                   Internet
                                                                       
                          |
                                                                        
                         |
                                                                        
                         |
                                                                        
           -------------------------
                                                                        
           | 172.10.10.1 eth0        |
                                                                        
           | 172.10.10.2 eth0:0     |
                                                                        
           |                                    |
                                                                        
           | 192.168.0.1 eth1        |
                                                                        
           -------------------------
                                                                        
                          |
                                                                        
                          |
                                                                        
                          |
                                                                        
                 Intranet (private network)
                                                                        
                          |
                                                                        
                          
----------------------------------------->172.10.10.2 traffic to 192.168.0.2

I have bound the 2 IP addresses to the external NIC on my system (RHEL 
4). I have attempted at modifying the script and have reverted to my 
original to start over. Here's my current config:

# First drop everything (lets you open what you want)
iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP
 
# User-defined chain for ACCEPTed TCP packets
iptables -N okay
iptables -A okay -p TCP --syn -j ACCEPT
iptables -A okay -p TCP -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A okay -p TCP -j DROP
 
# INPUT chain rules
iptables -A INPUT -p ALL -i eth1 -s 192.168.0.0/24 -j ACCEPT
iptables -A INPUT -p ALL -i lo -s 127.0.0.1 -j ACCEPT
iptables -A INPUT -p ALL -i lo -s 192.168.0.1 -j ACCEPT
iptables -A INPUT -p ALL -i lo -s 172.10.10.1 -j ACCEPT
iptables -A INPUT -p ALL -i eth1 -d 192.168.0.255 -j ACCEPT
 
# Rules for incoming packets from the Internet
 
# Packets for established connections
iptables -A INPUT -p ALL -d 172.10.10.1 -m state --state 
ESTABLISHED,RELATED -j ACCEPT
 
# TCP rules
iptables -A INPUT -p TCP -i eth0 -s 0/0 --destination-port 21 -j okay
iptables -A INPUT -p TCP -i eth0 -s 0/0 --destination-port 22 -j okay
iptables -A INPUT -p TCP -i eth0 -s 0/0 --destination-port 25 -j okay
iptables -A INPUT -p TCP -i eth0 -s 0/0 --destination-port 80 -j okay
iptables -A INPUT -p TCP -i eth0 -s 0/0 --destination-port 443 -j okay
iptables -A INPUT -p TCP -i eth0 -s 0/0 --destination-port 953 -j okay
iptables -A INPUT -p TCP -i eth0 -s 0/0 --destination-port 993 -j okay
 
# UDP rules
iptables -A INPUT -p UDP -i eth0 -s 0/0 --destination-port 53 -j ACCEPT
iptables -A INPUT -p UDP -i eth0 -s 0/0 --destination-port 2074 -j ACCEPT
iptables -A INPUT -p UDP -i eth0 -s 0/0 --destination-port 4000 -j ACCEPT
iptables -A INPUT -p UDP -i eth0 -s 0/0 --destination-port 953 -j ACCEPT
 
# ICMP rules
 
# FORWARD chain rules
iptables -A FORWARD -i eth1 -j ACCEPT
iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
 
 
# OUTPUT chain rules
iptables -A OUTPUT -p ALL -s 127.0.0.1 -j ACCEPT
iptables -A OUTPUT -p ALL -s 192.168.0.1 -j ACCEPT
iptables -A OUTPUT -p ALL -s 172.10.10.1 -j ACCEPT
 
# POSTROUTING
iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to-source 172.10.10.1

###################

This has been working fine for me. I've been modifying it and things 
haven't been going well for me I have to say. Would I would like to do 
is forward any traffic that is going to eth0:0 and send it to an 
internal system. I don't want everything open on this system. This is my 
latest concoction:

# First drop everything (lets you open what you want)
iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP
iptables -t nat -P PREROUTING DROP
iptables -t nat -P POSTROUTING DROP
 
# PREROUTING chain rules
# iptables -t nat -i PREROUTING 1 -d 172.10.10.2 -j LOG --loglevel debug
iptables -t nat -A PREROUTING -d 172.10.10.2 -p tcp --dport 80 -j DNAT 
--to-dest 192.168.0.2
iptables -t nat -A PREROUTING -d 172.10.10.2 -p tcp --dport 443 -j DNAT 
--to-dest 192.168.0.2
iptables -t nat -A PREROUTING -d 172.10.10.2 -p tcp --dport 21 -j DNAT 
--to-dest 192.168.0.2
iptables -t nat -A PREROUTING -d 172.10.10.2 -p tcp --dport 22 -j DNAT 
--to-dest 192.168.0.2
iptables -t nat -A PREROUTING -d 172.10.10.2 -p tcp --dport 25 -j DNAT 
--to-dest 192.168.0.2
iptables -t nat -A PREROUTING -d 172.10.10.2 -p tcp --dport 953 -j DNAT 
--to-dest 192.168.0.2
iptables -t nat -A PREROUTING -d 172.10.10.2 -p tcp --dport 993 -j DNAT 
--to-dest 192.168.0.2
iptables -t nat -A PREROUTING -d 172.10.10.2 -p udp --dport 53 -j DNAT 
--to-dest 192.168.0.2
iptables -t nat -A PREROUTING -d 172.10.10.2 -p udp --dport 53 -j DNAT 
--to-dest 192.168.0.2
 
# User-defined chain for ACCEPTed TCP packets
iptables -N okay
iptables -A okay -p TCP --syn -j ACCEPT
iptables -A okay -p TCP -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A okay -p TCP -j DROP
 
# INPUT chain rules
iptables -A INPUT -p ALL -i eth1 -s 192.168.0.0/24 -j ACCEPT
iptables -A INPUT -p ALL -i lo -s 127.0.0.1 -j ACCEPT
iptables -A INPUT -p ALL -i lo -s 192.168.0.1 -j ACCEPT
iptables -A INPUT -p ALL -i lo -s 172.10.10.1 -j ACCEPT
iptables -A INPUT -p ALL -i lo -s 172.10.10.2 -j ACCEPT
iptables -A INPUT -p ALL -i eth1 -d 192.168.0.255 -j ACCEPT
 
# Rules for incoming packets from the Internet
 
# Packets for established connections
iptables -A INPUT -p ALL -d 172.10.10.1 -m state --state 
ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -p ALL -d 172.10.10.2 -m state --state 
ESTABLISHED,RELATED -j ACCEPT
 
# TCP rules
iptables -A INPUT -p TCP -i eth0 -s 0/0 --destination-port 21 -j okay
iptables -A INPUT -p TCP -i eth0 -s 0/0 --destination-port 22 -j okay
iptables -A INPUT -p TCP -i eth0 -s 0/0 --destination-port 25 -j okay
iptables -A INPUT -p TCP -i eth0 -s 0/0 --destination-port 80 -j okay
iptables -A INPUT -p TCP -i eth0 -s 0/0 --destination-port 443 -j okay
iptables -A INPUT -p TCP -i eth0 -s 0/0 --destination-port 953 -j okay
iptables -A INPUT -p TCP -i eth0 -s 0/0 --destination-port 993 -j okay
 
# UDP rules
iptables -A INPUT -p UDP -i eth0 -s 0/0 --destination-port 53 -j ACCEPT
iptables -A INPUT -p UDP -i eth0 -s 0/0 --destination-port 2074 -j ACCEPT
iptables -A INPUT -p UDP -i eth0 -s 0/0 --destination-port 4000 -j ACCEPT
iptables -A INPUT -p UDP -i eth0 -s 0/0 --destination-port 953 -j ACCEPT
 
# ICMP rules
 
# FORWARD chain rules
iptables -A FORWARD -i eth1 -j ACCEPT
iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
 
# iptables -A FORWARD -i eth0 -d 192.168.0.2 -j ACCEPT
 
# OUTPUT chain rules
iptables -A OUTPUT -p ALL -s 127.0.0.1 -j ACCEPT
iptables -A OUTPUT -p ALL -s 192.168.0.1 -j ACCEPT
iptables -A OUTPUT -p ALL -s 172.10.10.1 -j ACCEPT
# iptables -A OUTPUT -p ALL -s 172.10.10.2 -j ACCEPT
iptables -t nat -A OUTPUT -d 172.10.10.2 -p ALL -j DNAT --to-destination 
192.168.0.2
 
# POSTROUTING
iptables -t nat -A POSTROUTING -s 192.168.0.2 -j SNAT --to-source 
172.10.10.2
iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to-source 172.10.10.1

I put all of the ports that I want allowed to go to the internal system 
in the PREROUTING table. Is this the right way to do it? I would hope 
that somebody can look at this and tell me what I'm doing wrong and what 
I'm missing.

Thanks,

James



