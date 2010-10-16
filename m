From: Carlos Mtz-Troncoso <cmartinez@uninorte.edu.co>
Subject: Port forwarding problem
Date: Sat, 16 Oct 2010 07:53:16 -0500
Message-ID: <4CB9A03C.7020700@uninorte.edu.co>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi fellows.

Google, howtos and examples couldn't help me, now I am here. I am using 
a CentOS 5.5. with kernel 2.6.18-194.17.1.el5, iptables version 1.3.5.

My server has 2 network cards, eth0 is for Internet with an IP address 
fixed, and eth1, 10.1.1.1/16 is for local network (10.1.0.0/16). In this 
server I have OpenVPN working well and the is used as gateway.

My script worked well and the last change was to add a port forwarding: 
the traffic from IP public port 2020 is sent to a internal web sever 
10.1.1.7:80. The internal server has as gateway 10.1.1.1 (my Linux 
IPTables box).

My problem is that the port forwarding is not working, here is my script.


LOOP=127.0.0.1

/sbin/modprobe ip_conntrack_ftp
/sbin/modprobe ip_nat_ftp

iptables -F
iptables -F INPUT
iptables -F OUTPUT
iptables -F FORWARD
iptables -F -t mangle
iptables -F -t nat
iptables -X

iptables -P OUTPUT ACCEPT
iptables -P INPUT DROP
iptables -P FORWARD ACCEPT

echo 1 > /proc/sys/net/ipv4/ip_forward

iptables -A INPUT -i eth0 -s $LOOP -j DROP
iptables -A FORWARD -i eth0 -s $LOOP -j DROP
iptables -A INPUT -i eth0 -d $LOOP -j DROP
iptables -A FORWARD -i eth0 -d $LOOP -j DROP

iptables -A FORWARD -i eth0 -s 172.16.0.0/12 -j DROP
iptables -A INPUT -i eth0 -s 172.16.0.0/12 -j DROP

iptables -A FORWARD -p tcp --sport 137:139 -o eth0 -j DROP
iptables -A FORWARD -p udp --sport 137:139 -o eth0 -j DROP
iptables -A FORWARD -p udp --sport 500:4500 -o eth0 -j DROP
iptables -A OUTPUT -p tcp --sport 137:139 -o eth0 -j DROP
iptables -A OUTPUT -p udp --sport 137:139 -o eth0 -j DROP

iptables -I FORWARD -o eth0 -p tcp -m multiport --dports 
25,81,3389,12796,32976,10443,50,500,4500,2020,80 -j ACCEPT
iptables -I FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -I FORWARD -j DROP

iptables -A INPUT -s $LOOP -j ACCEPT
iptables -A INPUT -d $LOOP -j ACCEPT

# Permitir pings entrantes (pueden desabilitarse)
iptables -A INPUT -p icmp --icmp-type echo-request -j ACCEPT

iptables -A INPUT -p tcp --dport 20 -j ACCEPT
iptables -A INPUT -p tcp --dport 21 -j ACCEPT
iptables -A INPUT -p tcp --dport 22 -j ACCEPT
iptables -A INPUT -p tcp --dport 53 -j ACCEPT
iptables -A INPUT -p udp --dport 53 -j ACCEPT
iptables -A INPUT -p tcp --dport 80 -j ACCEPT
iptables -A INPUT -p tcp --dport 222 -j ACCEPT
iptables -A INPUT -p tcp --dport 2020 -j ACCEPT

iptables -A INPUT -p udp --dport 1194 -j ACCEPT
iptables -A INPUT -p udp --dport 5000 -j ACCEPT

iptables -I FORWARD -i tun0 -o eth1 -j ACCEPT
iptables -I FORWARD -i eth1 -o tun0 -j ACCEPT
iptables -I FORWARD -i tun0 -o eth0 -j ACCEPT
iptables -I FORWARD -i eth0 -o tun0 -j ACCEPT
iptables -I FORWARD -i tap0 -o eth1 -j ACCEPT
iptables -I FORWARD -i eth1 -o tap0 -j ACCEPT
iptables -I FORWARD -i tap0 -o eth0 -j ACCEPT
iptables -I FORWARD -i eth0 -o tap0 -j ACCEPT

iptables -A INPUT -i eth1 -j ACCEPT
iptables -A FORWARD -i eth0 -j ACCEPT

iptables -A OUTPUT -m state --state NEW -o eth0 -j ACCEPT
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -m state --state NEW -o eth0 -j ACCEPT
iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

iptables -t nat -A PREROUTING -p tcp -i eth0 -d x.x.x.130 --dport 2020 
-j DNAT --to 10.1.1.7:80
iptables -t nat -A POSTROUTING -j SNAT -o eth0 --to-source x.x.x.130


Where is my error?

Thanks in advance.

Carlos
