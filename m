From: "Stiven Andre" <stiven_a@hotmail.com>
Subject: Strange iptables behavior
Date: Thu, 28 Nov 2002 01:26:33 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <F2230AmSS7U1Pd1DTM100010c28@hotmail.com>
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

>From: "Stiven Andre" <stiven_a@hotmail.com>
>To: linux-il@linux.org.il
>Subject: Strange iptables behavior
>Date: Wed, 27 Nov 2002 17:28:05 +0200
>
>Hi List.
>
>I have my home network being masqueraded by linux router(RH8.0).
>Network topology:
>Linux router(192.168.1.1): eth0 to LAN, eth1 to adsl modem.
>LAN = 192.168.1.*
>
>I wrote iptables script that masquerades my network, but the problem is 
>when I run the script from the first time from /etc/rc.d/rc.local it works. 
>But if I then rerun it manualy (by root of couse) it stops working. Inside 
>hosts don't have access to the internet. My script does clear all old rules 
>at the start of it but it doesn't help or else...
>I tryed to clear all old rules manualy and then run the script, no luck 
>still not working. I tryed to unload all iptables modules then "insmod 
>ip_tables" and after that to run the script again, nothing it doesn't help 
>too... Can someone understand what is going on ? Why it works only the 
>first time ? After the second excution the rules are seem to be the same 
>but inside hosts can't ping internet.
>There is 2 LOG targets in the script, first with prefix "FORWARD PACKET" 
>and second with prefix "MASQ RULE MATCHED", after the first excution of the 
>script. I see 2 logs for each packet, first "FORWARD PACKET" and then "MASQ 
>RULE MATCHED" but after the second excution, when the NAT doesn't work the 
>logs doesn't show "MASQ RULE MATCHED"...
>
>Best Regards.
>S.A.
>
>The script:
>
>
>#!/bin/sh
>IPTABLES="/sbin/iptables"
>
># Reset all.
>$IPTABLES -P INPUT ACCEPT
>$IPTABLES -P OUTPUT ACCEPT
>$IPTABLES -P FORWARD ACCEPT
>$IPTABLES -F
>$IPTABLES -X
>$IPTABLES -t nat -F
>
># Modules and targets:
>/sbin/modprobe ipt_LOG
>/sbin/modprobe ipt_REJECT
>/sbin/modprobe ipt_MASQUERADE
>/sbin/modprobe ip_nat_ftp
>/sbin/modprobe ip_nat_irc
>/sbin/modprobe ip_conntrack_ftp
>/sbin/modprobe ip_conntrack_irc
>
># IP Forwarding And Dynamic IP support:
>echo "1" > /proc/sys/net/ipv4/ip_forward
>echo "1" > /proc/sys/net/ipv4/ip_dynaddr
>
># Create chains for packet types:
>$IPTABLES -N tcp_packets
>$IPTABLES -N udp_packets
>$IPTABLES -N icmp_packets
>
># INPUT TABLE:
># Permit ADSL, gre Tunnel (Protocol 47), loopback and a broadcast.
>$IPTABLES -A INPUT -p 47 -s 10.0.0.138 -j ACCEPT
>$IPTABLES -A INPUT -p tcp -s 10.0.0.138 --sport 1723 -j ACCEPT
>$IPTABLES -A INPUT -s 127.0.0.1 -j ACCEPT
>$IPTABLES -A INPUT -p ALL -d 192.168.1.255 -j ACCEPT
># Ensure that established sessions will not die
>$IPTABLES -A INPUT -p ALL -m state --state ESTABLISHED,RELATED -j ACCEPT
># Allow FTP active and passive port commands:
>#$IPTABLES -A INPUT -p tcp --sport 21 -m state --state ESTABLISHED -j 
>ACCEPT
>#$IPTABLES -A INPUT -p tcp --sport 20 -m state --state ESTABLISHED,RELATED 
>-j ACCEPT
># Send all other traffic to it's chain:
>$IPTABLES -A INPUT -p tcp -j tcp_packets
>$IPTABLES -A INPUT -p udp -j udp_packets
>$IPTABLES -A INPUT -p icmp -j icmp_packets
>
># OUTPUT TABLE:
># Permit all.
>$IPTABLES -A OUTPUT -j ACCEPT
>
># FORWARD TABLE:
>$IPTABLES -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
>
># tcp_packets TABLE:
># World accessible services:
>#$IPTABLES -A tcp_packets -p tcp --dport 21 --syn -j ACCEPT # FTP
>#$IPTABLES -A tcp_packets -p tcp --dport 80 --syn -j ACCEPT # HTTP
># Private services:
>$IPTABLES -A tcp_packets -s 192.168.1.10/32 -p tcp --dport 23 --syn -j 
>ACCEPT # Telnet
>$IPTABLES -A tcp_packets -s 192.168.1.10/24 -p tcp --dport 139 --syn -j 
>ACCEPT # NetBIOS-ssn
>
># udp_packets TABLE:
># Private services:
>$IPTABLES -A udp_packets -s 192.168.1.10/24 -p udp --dport 137 -j ACCEPT # 
>NetBIOS-sn
>$IPTABLES -A udp_packets -s 192.168.1.10/24 -p udp --dport 138 -j ACCEPT # 
>NetBIOS-dgm
>
># MASQUERADING:
>$IPTABLES -t nat -A POSTROUTING -o ppp0 -j LOG --log-level DEBUG 
>--log-prefix "matched MASQ RULE: "
>$IPTABLES -t nat -A POSTROUTING -o ppp0 -j MASQUERADE
>
># Set defaults to drop:
>$IPTABLES -P INPUT ACCEPT
>$IPTABLES -P OUTPUT ACCEPT
>$IPTABLES -P FORWARD ACCEPT
>
># Debug
>$IPTABLES -A FORWARD -j LOG --log-level DEBUG --log-prefix "FORWARD PACKET: 
>"
>$IPTABLES -A INPUT -j LOG --log-level DEBUG --log-prefix "INPUT PACKET: "
>$IPTABLES -A OUTPUT -j LOG --log-level DEBUG --log-prefix "OUTPUT PACKET: "
>
>_________________________________________________________________
>STOP MORE SPAM with the new MSN 8 and get 2 months FREE* 
>http://join.msn.com/?page=features/junkmail
>
>
>=================================================================
>To unsubscribe, send mail to linux-il-request@linux.org.il with
>the word "unsubscribe" in the message body, e.g., run the command
>echo unsubscribe | mail linux-il-request@linux.org.il


_________________________________________________________________
The new MSN 8: advanced junk mail protection and 2 months FREE* 
http://join.msn.com/?page=features/junkmail


