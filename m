From: "J. Bakshi" <joydeep@infoservices.in>
Subject: How to detect nmap scan ?
Date: Sun, 24 Jan 2010 21:16:08 +0530
Message-ID: <20100124211608.090639bf@infoservices.in>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Dear list,

I am trying to detect nmap scan so that I can apply DROP or blacklisting rules on those. To do my experiment I have written a very basic firewall rule sets with out any special DROP/REJECT and let the packets come into my box. But none of my namp logs are triggered. Only the very first LOG shows that my box is under scan as it logs all incoming packets. I guess that the nmap detection logs are bypassed some how. Could someone provide me an insight to fix it ?

Here is my firewall

```````````
IFACE=eth0
## Flush all
iptables -F
iptables -X

# Reset the iptables counters
iptables -Z
iptables -t nat -Z 2>/dev/null
iptables -t mangle -Z

## set policy
echo -e "\E[33;1m Setting default INPUT/FORWARD/OUTPUT policy to DROP"

iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP

echo -e "\E[33;1mAllow unlimited traffic on the loopback interface"
iptables -A INPUT  -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT

echo -e "\E[33;1mAllow already established and related"
iptables -A INPUT -i $IFACE -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A OUTPUT -o $IFACE -m state --state NEW,ESTABLISHED,RELATED  -j ACCEPT


#--------------------------------------------------------------#
echo -e "\E[33;1mMake sure NEW tcp connections are SYN packets"
iptables -A INPUT -i $IFACE -p tcp ! --syn -m state --state NEW -j DROP

#VERY FIRST LOG
iptables -A INPUT -p tcp   -j LOG --log-prefix ":Allow packets to COME here:" 

iptables -A INPUT -p icmp -j LOG --log-prefix ":Allow ICMP packets to COME here:"

echo -e "\E[33;1mActivating user rules"

# (NMAP) FIN/URG/PSH
####################
iptables -A INPUT -p tcp --tcp-flags ALL FIN,URG,PSH -j LOG --log-prefix "Stealth XMAS scan: "
	  

# SYN/RST/ACK/FIN/URG
#####################
iptables -A INPUT -p tcp --tcp-flags ALL SYN,RST,ACK,FIN,URG -j LOG --log-prefix "Stealth XMAS-PSH scan: "	  

# ALL/ALL
#########
iptables -A INPUT -p tcp --tcp-flags ALL ALL -j LOG  --log-prefix "Stealth XMAS-ALL scan: "

# NMAP FIN Stealth
##################
iptables -A INPUT -p tcp --tcp-flags ALL FIN -j LOG  --log-prefix "Stealth FIN scan: "

# SYN/RST
#########
iptables -A INPUT -p tcp --tcp-flags SYN,RST SYN,RST -j LOG  --log-prefix "Stealth SYN/RST scan: "

# SYN/FIN (probably)
####################
iptables -A INPUT -p tcp --tcp-flags SYN,FIN SYN,FIN -j LOG  --log-prefix "Stealth SYN/FIN scan?: "

# Null scan
###########
iptables -A INPUT -p tcp --tcp-flags ALL NONE -j LOG  --log-prefix "Stealth Null scan: "

iptables -A INPUT  -p icmp  -j ACCEPT
iptables -A INPUT -j ACCEPT
`````````````````````````````````

kernel version 2.6.31
iptables v1.4.6

Thanks


