From: Joe Riley <irie@networks.org>
Subject: Download speeds drastically reduced through iptables
Date: Fri, 7 May 2004 00:10:12 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040507071012.20BD77266@sitemail.everyone.net>
Reply-To: irie@networks.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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

dear mailing list.
I am having a problem with my iptables setup, the server sharing the connection (192.168.0.1) gets download speeds of 120kb/sec, the problem is is that the box being masqueraded (192.168.0.2) - behind the firewall only gets no more than 30-40kb/sec. this slow speed is comparable to a 256kbit isdn .. and it really bothers me.

what is the secret for unlocking the speed in iptables?

here is my script:
-----------------------------------------------------
#!/bin/sh
ifconfig eth0 inet 192.168.0.1 netmask 255.255.255.0 broadcast 192.168.0.255
modprobe ip_tables
modprobe iptable_filter
modprobe ip_conntrack
modprobe ip_conntrack_ftp
modprobe ip_conntrack_irc
modprobe iptable_nat
modprobe ip_nat_ftp
modprobe ip_nat_irc
echo 1 > /proc/sys/net/ipv4/ip_forward
/usr/sbin/iptables -t nat -A PREROUTING -d 65.77.170.112 -p tcp --dport 1:64999 -j DNAT --to 192.168.0.2
/usr/sbin/iptables -t nat -A PREROUTING -d 65.77.170.112 -p udp --dport 1:65535 -j DNAT --to 192.168.0.2
/usr/sbin/iptables -t nat -A POSTROUTING -o wlan0 -s 192.168.0.2 -j MASQUERADE
/usr/sbin/iptables -t nat -P POSTROUTING ACCEPT
#block worm ports
/usr/sbin/iptables -A FORWARD -d 192.168.0.2 -p tcp --dport 5000 -j DROP
/usr/sbin/iptables -A FORWARD -d 192.168.0.2 -p tcp --dport 1025 -j DROP
/usr/sbin/iptables -A FORWARD -d 192.168.0.2 -p tcp --dport 445 -j DROP
/usr/sbin/iptables -A FORWARD -d 192.168.0.2 -p tcp --dport 139 -j DROP
/usr/sbin/iptables -A FORWARD -d 192.168.0.2 -p tcp --dport 135 -j DROP
/usr/sbin/iptables -A FORWARD -d 192.168.0.2 -p udp --dport 123 -j DROP
/usr/sbin/iptables -A FORWARD -d 192.168.0.2 -p udp --dport 135 -j DROP
/usr/sbin/iptables -A FORWARD -d 192.168.0.2 -p udp --dport 137 -j DROP
/usr/sbin/iptables -A FORWARD -d 192.168.0.2 -p udp --dport 138 -j DROP
/usr/sbin/iptables -A FORWARD -d 192.168.0.2 -p udp --dport 445 -j DROP
/usr/sbin/iptables -A FORWARD -d 192.168.0.2 -p udp --dport 500 -j DROP
/usr/sbin/iptables -A FORWARD -d 192.168.0.2 -p udp --dport 1032 -j DROP
/usr/sbin/iptables -A FORWARD -d 192.168.0.2 -p udp --dport 1900 -j DROP
/usr/sbin/iptables -A INPUT -i wlan0 -p tcp -m tcp --tcp-flags FIN,SYN,RST,PSH,ACK,URG NONE -j DROP
/usr/sbin/iptables -A INPUT -i wlan0 -p tcp -m tcp --tcp-flags SYN,FIN SYN,FIN -j DROP
/usr/sbin/iptables -A INPUT -i wlan0 -p tcp -m tcp --tcp-flags SYN,RST SYN,RST -j DROP
/usr/sbin/iptables -A INPUT -i wlan0 -p tcp -m tcp --tcp-flags FIN,RST FIN,RST -j DROP
/usr/sbin/iptables -A INPUT -i wlan0 -p tcp -m tcp --tcp-flags ACK,FIN FIN -j DROP
/usr/sbin/iptables -A INPUT -i wlan0 -p tcp -m tcp --tcp-flags ACK,URG URG -j DROP





_____________________________________________________________
Proud member of United Networks Email, visit or report abuse at  http://networks.org/

