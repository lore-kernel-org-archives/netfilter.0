From: "ganesh kumar godavari" <gkgodava@rediffmail.com>
Subject: Re: Re: need help in rate limiting tcp-syn !!
Date: 30 Jun 2002 23:22:48 -0000
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020630232248.3902.qmail@webmail9.rediffmail.com>
Reply-To: "ganesh kumar godavari" <gkgodava@rediffmail.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain;
	format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: George Georgalis <georgw@galis.org>
Cc: Antony Stone <Antony@Soft-Solutions.co.uk>, netfilter@lists.samba.org

george,
  the scripts of of great use to me.

Thanks a lot

---
ganesh

On Sun, 30 Jun 2002 George Georgalis wrote :
>On Sat, Jun 29, 2002 at 11:21:28PM -0000, ganesh kumar godavari 
>wrote:
> >hello anthony,
> >  can u please tell me how i can limit the # of packets from 
>a
> >tcp-syn flood and portscan from a particular ip(say a.b.c.d) 
> from
> >all kinds of attack if possible.
> >
> >
> >i badly need this i am currently performing some tests on DDOS 
>and
> >i need to figure this out. in a DDOS attack i want to limit the 
>#
> >of packets from a group of attack clients. i have to 
>dynamically
> >add the ip address and limit the # of packets from incomming
> >attack clients.
> >
> >can u please tell me how i can succefully protect my machine 
> from
> >a single attack client incase of 1) portscan and 2) tcp-syn
> >flood.
> >
> >Thanks for the help
> >
>
>
>I think you can find what you need from one of the two scripts 
>below.
>They are part of a tgz I found on securityfocus, called 
>'firewall-rulesets'
>
>I couldn't find it but these looks good too
>http://online.securityfocus.com/tools/2006
>http://online.securityfocus.com/archive/91/205020
>
>It sounds like you want http://www.psionic.com/products/
>  The TriSentry freeware suite (formerly the Abacus Project 
>tools)
>
>You probably know what he's trying to teach you in the docs by 
>the
>time you figure out he's trying to teach you not help you get it 
>going.
>It's been a while but the docs bugged me that way before.
>
>Here are two scripts from a securityfocus tgz... note, you'll 
>have to
>join the lines that have been broken (I didn't do it :-)
>
>// George
>
>
>
>#!/bin/bash
>#################################################################################
># 									     	#
># Created......: 17 August 2001						     	#
># Last Modified: 13/09/2001 20:28					     	#
># Author.......: Skylinux						     	#
># Version......: 0.2.2								#
># Download.....: http://home.earthlink.net/~skylinux/				#
>#										#
>#################################################################################
>#										#
># Source:									#
>#										#
># - James Stephens' Iptables script @						#
>#   http://www.cs.princeton.edu/~jns/security/iptables/index.html	 
>#
># - Linux 2.4 Packet Filtering HOWTO						#
># - Linux 2.4 NAT HOWTO								#
>#										#
>#################################################################################
>#										#
># Change Log:									#
>#										#
># v0.2.2 -added FORWARD icmp rule						#
>#										#
># v0.2	-fixed the FTP forward problem,						#
>#	-removed some "double rules",						#
># v0.11 -added NetBus,Back Orifice & Trin00 protection				#
>#										#
>#################################################################################
>#										#
># To do List:									#
>#										#
># - add Netkiller flood protection						#
># - implement script with start/stop function					#
># - add mirror function (attacker is scanning himself)				#
># - add another TCP_SERVICES_OUT_* Setting like FORWARD_PORTS_2		 
>#
># - fix the error message from the ICQ rule while starting 
>firewall		#
>#										#
>#################################################################################
>#
># Documentation
># -------------
># This firewall script is using the default policy DROP 
>EVERYTHING, in order to get all the services working you need to 
>adjust the
># "Standard Settings".
># - IPTABLES="/usr/sbin/iptables" 	=> This defines the path where 
>your "iptables" executable is. You can find it by using "whereis 
>iptables"
># - INT_IF="eth0"			=> Change "eth0" to the name of your INTERNAL 
>NIC (Network Interface Card) eg: "eth0" "eth1" "eth2"
># - BROADCAST="192.168.3.255/24"	=> Change the IP to the 
>BROADCAST address of your network. eg: "192.168.0.255/24" 
>"192.168.1.255/24"
># - EXT_IF="ppp0"			=> This is you EXTERNAL INTERFACE, if you use 
>dial up it is "ppp0", if you use broadband it is one of your 
>Ethernets.
># - FORWARD_PORTS_1="22,80"		=> These are the ports which will be 
>FORWARDED from your INTERNAL INTERFACE to your EXTERNAL INTERFACE 
>(maximum 15 ports)
># - FORWARD_PORTS_2="194,443"		=> Same as above, this is just 
>here if you need more than 15 ports (To prevent error messages 
>you should enter at least one port in here)
># - TCP_SERVICES_IN_INT_IF="6"		=> Server ports you want to 
>export to your LOCAL NETWORK. (To prevent error messages enter at 
>least one value, port 6 is Unassigned)
># - TCP_SERVICES_IN_EXT_IF="80"		=> Server ports you want to 
>export to your EXTERNAL INTERFACE (Internet). (To prevent error 
>messages enter at least one value, port 6 is Unassigned)
># - TCP_SERVICES_OUT_INT_IF="22,80"	=> If you want to access 
>ports from the machine where you install the firewall INSIDE your 
>network you need to specify the ports. (To prevent error messages 
>enter at least one value, port 6 is Unassigned)
># - TCP_SERVICES_OUT_EXT_IF="22,80"	=> Ports you want to connect 
>to OUTSIDE your local network from the machine where the firewall 
>is installed. (To prevent error messages enter at least one 
>value, port 6 is Unassigned)
># - NAMESERVER_1="XXX.XXX.XXX.XXX"	=> The IP of your EXTERNAL 
>DNS1/NAMESERVER (you can get the IP from your ISP)
># - NAMESERVER_2="XXX.XXX.XXX.XXX"	=> The IP of your EXTERNAL 
>DNS2/NAMESERVER (you can get the IP from your ISP)
># - LOOPBACK="127.0.0.0/8"		=> This is your loopback IP, don't 
>change this unless you know what you are doing
># - CLASS_A="10.0.0.0/8"		=> This will block a /8 (Class A) IP 
>coming in through your EXTERNAL interface, because it will be 
>spoofed.
># - CLASS_B="172.16.0.0/16"		=> This will block a /16 (Class B) 
>IP coming in through your EXTERNAL interface, because it will be 
>spoofed.
># - CLASS_C="192.168.0.0/16"	 	=> This will block a /24 (Class C) 
>IP coming in through your EXTERNAL interface, because it will be 
>spoofed.
># - XSERVER_PORTS="6000:6063"		=> Most X servers listen at these 
>ports, this will block the specified ports
># - ICQ_PORT_TCP="5190"			=> This is the default port where ICQ 
>connects to the ICQ network
># - ICQ_PORT_UDP="4000"			=> This is the default port where ICQ 
>connects to the ICQ network
># - TROJAN_PORTS_TCP="12345,12346"	=> This will block INCOMING 
>requests for Trojans on your Network tcp. You can add more ports 
>(max 15 ports) or use port 6 to disable this feature.
># - TROJAN_PORTS_UDP="27444,31335"	=> This will block INCOMING 
>requests for Trojans on your Network udp. You can add more ports 
>(max 15 ports) or use port 6 to disable this feature.
>#
>#
>##########
># Standard Settings
>IPTABLES="/usr/sbin/iptables"
>INT_IF="eth0"
>BROADCAST="192.168.1.255/24"
>EXT_IF="ppp0"
>FORWARD_PORTS_1="20,21,22,23,25,79,80,81,110,119"
>FORWARD_PORTS_2="194,443"
>TCP_SERVICES_IN_INT_IF="22,80"
>TCP_SERVICES_IN_EXT_IF="80"
>TCP_SERVICES_OUT_INT_IF="22,80"
>TCP_SERVICES_OUT_EXT_IF="21,22,80,119"
>NAMESERVER_1="207.217.126.81"
>NAMESERVER_2="207.217.77.82"
>LOOPBACK="127.0.0.0/8"
>CLASS_A="10.0.0.0/8"
>CLASS_B="172.16.0.0/16"
>CLASS_C="192.168.0.0/16"
>UP_PORTS="1024:65535"
>XSERVER_PORTS="6000:6063"
>ICQ_PORT_TCP="5190"
>ICQ_PORT_UDP="4000"
>TROJAN_PORTS_TCP="12345,12346,1524,27665,31337"
>TROJAN_PORTS_UDP="12345,12346,27444,31335,31337"
>#
>#
>echo "Starting Firewall ....."
># Load appropriate modules.
>modprobe ip_tables
>modprobe ip_conntrack
>modprobe ip_conntrack_ftp
>#
>##########
># Flush Rules
>$IPTABLES -F
>$IPTABLES -X
>$IPTABLES -Z
>$IPTABLES -F INPUT
>$IPTABLES -F FORWARD
>$IPTABLES -F OUTPUT
>$IPTABLES -t nat -F PREROUTING
>$IPTABLES -t nat -F POSTROUTING
>#
>#
>##########
># Changing Kernel Parameters, you need CONFIG_SYSCTL defined in 
>your kernel
>#
># SYN Cookie Protection
>/bin/echo "1" > /proc/sys/net/ipv4/tcp_syncookies
>
># Disable response to ping
>/bin/echo "1" > /proc/sys/net/ipv4/icmp_echo_ignore_all
>
># Disable response to broadcasts
>/bin/echo "1" > /proc/sys/net/ipv4/icmp_echo_ignore_broadcasts
>
># Don't accept source routed packets
>/bin/echo "0" > /proc/sys/net/ipv4/conf/all/accept_source_route
>/bin/echo "0" > /proc/sys/net/ipv4/conf/all/send_redirects
>
># Disable ICMP redirect acceptance
>/bin/echo "0" > /proc/sys/net/ipv4/conf/all/accept_redirects
>
># Enable bad error message protection
>/bin/echo "1" > 
>/proc/sys/net/ipv4/icmp_ignore_bogus_error_responses
>
># Turn on reverse path filtering
>for interface in /proc/sys/net/ipv4/conf/*/rp_filter; do
>/bin/echo "1" > ${interface}
>done
>
># Log spoofed packets, source routed packets, redirect packets
>/bin/echo "1" > /proc/sys/net/ipv4/conf/all/log_martians
>
># Enable IP forwarding
>echo "1" > /proc/sys/net/ipv4/ip_forward
>#
>#
>##########
># Rules
>#
># Standard Rules
>$IPTABLES -P INPUT DROP
>$IPTABLES -P FORWARD DROP
>$IPTABLES -P OUTPUT DROP
>#
># Deny packets claiming to be to or from a /8,/16,/24 (Class 
>A,B,C) Network ($EXT_IF)
>$IPTABLES -A INPUT -i $EXT_IF -s $CLASS_A -j DROP
>$IPTABLES -A INPUT -i $EXT_IF -d $CLASS_A -j DROP
>$IPTABLES -A INPUT -i $EXT_IF -s $CLASS_B -j DROP
>$IPTABLES -A INPUT -i $EXT_IF -d $CLASS_B -j DROP
>$IPTABLES -A INPUT -i $EXT_IF -s $CLASS_C -j DROP
>$IPTABLES -A INPUT -i $EXT_IF -d $CLASS_C -j DROP
>$IPTABLES -A OUTPUT -o $EXT_IF -s $CLASS_A -j DROP
>$IPTABLES -A OUTPUT -o $EXT_IF -d $CLASS_A -j DROP
>$IPTABLES -A OUTPUT -o $EXT_IF -s $CLASS_B -j DROP
>$IPTABLES -A OUTPUT -o $EXT_IF -d $CLASS_B -j DROP
>$IPTABLES -A OUTPUT -o $EXT_IF -s $CLASS_C -j DROP
>$IPTABLES -A OUTPUT -o $EXT_IF -d $CLASS_C -j DROP
>#
># Firewall syn/flood and port scanner protection $INT_IF
>$IPTABLES -N syn-flood_INT_IF
>$IPTABLES -F syn-flood_INT_IF
>$IPTABLES -A INPUT -i $INT_IF -p tcp --tcp-flags SYN,ACK,FIN,RST 
>RST -j syn-flood_INT_IF
>#$IPTABLES -A INPUT -i $INT_IF -p tcp --syn -j syn-flood_INT_IF
>$IPTABLES -A syn-flood_INT_IF -m limit --limit 1/s --limit-burst 
>4 -j RETURN
>$IPTABLES -A syn-flood_INT_IF -j DROP
>#
># Firewall syn/flood and port scanner protection $EXT_IF
>$IPTABLES -N syn-flood_EXT_IF
>$IPTABLES -F syn-flood_EXT_IF

>$IPTABLES -A INPUT -i $EXT_IF -p tcp --tcp-flags SYN,ACK,FIN,RST 
>RST -j syn-flood_EXT_IF
>#$IPTABLES -A INPUT -i $EXT_IF -p tcp --syn -j syn-flood_EXT_IF
>$IPTABLES -A syn-flood_EXT_IF -m limit --limit 1/s --limit-burst 
>4 -j RETURN
>$IPTABLES -A syn-flood_EXT_IF -j DROP
>#
>#  Make sure NEW tcp connections are SYN packets
>$IPTABLES -A INPUT -i $INT_IF -p tcp ! --syn -m state --state NEW 
>-j DROP
>$IPTABLES -A INPUT -i $EXT_IF -p tcp ! --syn -m state --state NEW 
>-j DROP
>#
># Block incoming fragments $INT_IF
>$IPTABLES -A INPUT -i $INT_IF -f -j LOG --log-prefix "IPTABLES 
>FRAGMENTS $INT_IF: "
>$IPTABLES -A INPUT -i $INT_IF -f -j DROP
>#
># Block incoming fragments $EXT_IF
>$IPTABLES -A INPUT -i $EXT_IF -f -j LOG --log-prefix "IPTABLES 
>FRAGMENTS $EXT_IF: "
>$IPTABLES -A INPUT -i $EXT_IF -f -j DROP
>#
># Drop broadcast packets
>$IPTABLES -A INPUT -i $EXT_IF -d $BROADCAST -j DROP
>#
># Trojan protection
>$IPTABLES -A INPUT -i $INT_IF -p tcp -m multiport --dport 
>$TROJAN_PORTS_TCP -j LOG --log-prefix "IPTABLES Trojan INT_IF: 
>"
>$IPTABLES -A INPUT -i $INT_IF -p udp -m multiport --dport 
>$TROJAN_PORTS_UDP -j LOG --log-prefix "IPTABLES Trojan INT_IF: 
>"
>$IPTABLES -A INPUT -i $INT_IF -p tcp -m multiport --dport 
>$TROJAN_PORTS_TCP -j DROP
>$IPTABLES -A INPUT -i $INT_IF -p udp -m multiport --dport 
>$TROJAN_PORTS_UDP -j DROP
>$IPTABLES -A INPUT -i $EXT_IF -p tcp -m multiport --dport 
>$TROJAN_PORTS_TCP -j LOG --log-prefix "IPTABLES Trojan EXT_IF: 
>"
>$IPTABLES -A INPUT -i $EXT_IF -p udp -m multiport --dport 
>$TROJAN_PORTS_UDP -j LOG --log-prefix "IPTABLES Trojan EXT_IF: 
>"
>$IPTABLES -A INPUT -i $EXT_IF -p tcp -m multiport --dport 
>$TROJAN_PORTS_TCP -j DROP
>$IPTABLES -A INPUT -i $EXT_IF -p udp -m multiport --dport 
>$TROJAN_PORTS_UDP -j DROP
>#
># ICQ INPUT/OUTPUT rules (I get the error message that the 
>hostname is not found, if somebody knows why PLZ let me know)
>#$IPTABLES -A OUTPUT -o $EXT_IF -p udp -d icq.mirabilis.com 
>--dport $ICQ_PORT_UDP -m state --state NEW,ESTABLISHED,RELATED -j 
>ACCEPT
>#$IPTABLES -A OUTPUT -o $EXT_IF -p tcp -d login.icq.com --dport 
>$ICQ_PORT_TCP -m state --state NEW,ESTABLISHED,RELATED -j 
>ACCEPT
>#
># icmp INPUT/OUTPUT rules $INT_IF. For a list of icmp types check 
>the end of this file.
>$IPTABLES -A INPUT -i $INT_IF -p icmp -m state --state 
>ESTABLISHED,RELATED -j ACCEPT
>$IPTABLES -A OUTPUT -o $INT_IF -p icmp -m state --state 
>NEW,ESTABLISHED,RELATED -j ACCEPT
>#$IPTABLES -A INPUT -i $INT_IF -p icmp --icmp-type 0 -j DROP
>#
># icmp INPUT/OUTPUT rules $EXT_IF. For a list of icmp types check 
>the end of this file.
>$IPTABLES -A INPUT -i $EXT_IF -p icmp -m state --state 
>ESTABLISHED,RELATED -j ACCEPT
>$IPTABLES -A OUTPUT -o $EXT_IF -p icmp -m state --state 
>NEW,ESTABLISHED,RELATED -j ACCEPT
>#$IPTABLES -A INPUT -i $EXT_IF -p icmp --icmp-type 0 -j DROP
>#
># Nameserver INPUT/OUTPUT
>$IPTABLES -A INPUT -i $EXT_IF -p udp -s $NAMESERVER_1 -m state 
>--state ESTABLISHED -j ACCEPT
>$IPTABLES -A INPUT -i $EXT_IF -p udp -s $NAMESERVER_2 -m state 
>--state ESTABLISHED -j ACCEPT
>$IPTABLES -A OUTPUT -o $EXT_IF -p udp -d $NAMESERVER_1 --dport 53 
>-m state --state NEW,ESTABLISHED -j ACCEPT
>$IPTABLES -A OUTPUT -o $EXT_IF -p udp -d $NAMESERVER_2 --dport 53 
>-m state --state NEW,ESTABLISHED -j ACCEPT
>#
># INPUT
>$IPTABLES -A INPUT -m state --state ESTABLISHED,RELATED -j 
>ACCEPT
>$IPTABLES -A INPUT -i lo -m state --state NEW,ESTABLISHED,RELATED 
>-j ACCEPT
>$IPTABLES -A INPUT -i $INT_IF -p tcp -m multiport --dport 
>$TCP_SERVICES_IN_INT_IF -m state --state NEW,ESTABLISHED -j 
>ACCEPT
>$IPTABLES -A INPUT -i $EXT_IF -p tcp -m multiport --dport 
>$TCP_SERVICES_IN_EXT_IF -m state --state NEW,ESTABLISHED -j 
>ACCEPT
>
>#$IPTABLES -A INPUT  -i $EXT_IF -p tcp --sport 21 -m state 
>--state ESTABLISHED -j ACCEPT
>$IPTABLES -A INPUT  -i $EXT_IF -p tcp --sport 20 -m state --state 
>NEW,ESTABLISHED,RELATED -j ACCEPT
>$IPTABLES -A INPUT  -i $EXT_IF -p tcp --sport $UP_PORTS --dport 
>$UP_PORTS -m state --state ESTABLISHED -j ACCEPT
>
>#
># FORWARD
>$IPTABLES -A FORWARD -i $INT_IF -o $EXT_IF -p icmp -m state 
>--state NEW,ESTABLISHED -j ACCEPT
>$IPTABLES -A FORWARD -i $INT_IF -o $EXT_IF -p udp -d 
>$NAMESERVER_1 --dport 53 -m state --state NEW,ESTABLISHED -j 
>ACCEPT
>$IPTABLES -A FORWARD -i $INT_IF -o $EXT_IF -p udp -d 
>$NAMESERVER_2 --dport 53 -m state --state NEW,ESTABLISHED -j 
>ACCEPT
>$IPTABLES -A FORWARD -i $INT_IF -o $EXT_IF -p tcp -m multiport 
>--dport $FORWARD_PORTS_1 -m state --state NEW,ESTABLISHED -j 
>ACCEPT
>$IPTABLES -A FORWARD -i $INT_IF -o $EXT_IF -p udp -m multiport 
>--dport $FORWARD_PORTS_1 -m state --state NEW,ESTABLISHED -j 
>ACCEPT
>$IPTABLES -A FORWARD -i $INT_IF -o $EXT_IF -p tcp -m multiport 
>--dport $FORWARD_PORTS_2 -m state --state NEW,ESTABLISHED -j 
>ACCEPT
>$IPTABLES -A FORWARD -i $INT_IF -o $EXT_IF -p udp -m multiport 
>--dport $FORWARD_PORTS_2 -m state --state NEW,ESTABLISHED -j 
>ACCEPT
>$IPTABLES -A FORWARD -i $INT_IF -o $EXT_IF -p udp -d 
>icq.mirabilis.com --dport $ICQ_PORT_UDP -m state --state 
>NEW,ESTABLISHED,RELATED -j ACCEPT
>$IPTABLES -A FORWARD -i $INT_IF -o $EXT_IF -p tcp -d 
>login.icq.com --dport $ICQ_PORT_TCP -m state --state 
>NEW,ESTABLISHED,RELATED -j ACCEPT
>$IPTABLES -A FORWARD -i $INT_IF -o $EXT_IF -p tcp --dport 20 -m 
>state --state ESTABLISHED -j ACCEPT
>$IPTABLES -A FORWARD -i $INT_IF -o $EXT_IF -p tcp --sport 
>$UP_PORTS --dport $UP_PORTS -m state --state ESTABLISHED,RELATED 
>-j ACCEPT
>#$IPTABLES -A FORWARD -i $EXT_IF -o $INT_IF -p tcp --sport 21 -m 
>state --state ESTABLISHED -j ACCEPT
>#$IPTABLES -A FORWARD -i $EXT_IF -o $INT_IF -p tcp --sport 20 -m 
>state --state ESTABLISHED,RELATED -j ACCEPT
>$IPTABLES -A FORWARD -i $EXT_IF -o $INT_IF -m state --state 
>ESTABLISHED,RELATED -j ACCEPT
>#
># OUTPUT
>$IPTABLES -A OUTPUT -o $EXT_IF -m state --state 
>ESTABLISHED,RELATED -j ACCEPT
>$IPTABLES -A OUTPUT -o lo -m state --state 
>NEW,ESTABLISHED,RELATED -j ACCEPT
>$IPTABLES -A OUTPUT -o $INT_IF -p tcp -m multiport --sport 
>$TCP_SERVICES_IN_INT_IF -m state --state NEW,ESTABLISHED -j 
>ACCEPT
>$IPTABLES -A OUTPUT -o $EXT_IF -p tcp -m multiport --sport 
>$TCP_SERVICES_IN_EXT_IF -m state --state NEW,ESTABLISHED -j 
>ACCEPT
>$IPTABLES -A OUTPUT -o $INT_IF -p tcp -m multiport --dport 
>$TCP_SERVICES_OUT_INT_IF -m state --state NEW,ESTABLISHED -j 
>ACCEPT
>$IPTABLES -A OUTPUT -o $EXT_IF -p tcp -m multiport --dport 
>$TCP_SERVICES_OUT_EXT_IF -m state --state NEW,ESTABLISHED -j 
>ACCEPT
>
>$IPTABLES -A OUTPUT -o $EXT_IF -p tcp --dport 20 -m state --state 
>NEW,ESTABLISHED,RELATED -j ACCEPT
>$IPTABLES -A OUTPUT -o $EXT_IF -p tcp --sport $UP_PORTS --dport 
>$UP_PORTS -m state --state ESTABLISHED,RELATED -j ACCEPT
>#
># POSTROUTING
>$IPTABLES -t nat -A POSTROUTING -o $EXT_IF -j MASQUERADE
>
>##########
># icmp types
>#
>#  0	Echo Reply				 [RFC792]
>#  1	Unassigned				    [JBP]
>#  2	Unassigned				    [JBP]
>#  3	Destination Unreachable			 [RFC792]
>#  4	Source Quench			 	 [RFC792]
>#  5	Redirect				 [RFC792]
>#  6	Alternate Host Address			    [JBP]
>#  7	Unassigned				    [JBP]
>#  8	Echo					 [RFC792]
>#  9	Router Advertisement			[RFC1256]
># 10	Router Solicitation			[RFC1256]
># 11	Time Exceeded				 [RFC792]
># 12	Parameter Problem			 [RFC792]
># 13	Timestamp				 [RFC792]
># 14	Timestamp Reply				 [RFC792]
># 15	Information Request			 [RFC792]
># 16	Information Reply			 [RFC792]
># 17	Address Mask Request                     [RFC950]
># 18	Address Mask Reply			 [RFC950]
># 19	Reserved (for Security)			   [Solo]
># 20-29	Reserved (for Robustness Experiment)	    [ZSu]
># 30	Traceroute				[RFC1393]
># 31	Datagram Conversion Error		[RFC1475]
># 32     Mobile Host Redirect              [David Johnson]
># 33     IPv6 Where-Are-You                 [Bill Simpson]
># 34     IPv6 I-Am-Here                     [Bill Simpson]
># 35     Mobile Registration Request        [Bill Simpson]
># 36     Mobile Registration Reply          [Bill Simpson]
># 37     Domain Name Request                     [Simpson]
># 38     Domain Name Reply                       [Simpson]
># 39     SKIP                                    [Markson]
># 40     Photuris                                [Simpson]
># 41-255 Reserved				    [JBP]
>##########
>echo "Firewall STARTED"
>### END ###
>
>#iptables -t nat -A PREROUTING --dport <the listening port of 
>internal host> -i <outer iface(eth0 for you)> -j DNAT --to
>#iptables -t nat -A PREROUTING -p tcp -i (inet iface) --dport 80 
>-j DNAT --to-destination xxx.xxx.xxx.xxx:80
>#iptables -t filter -A FORWARD -p tcp -d xxx.xxx.xxx.xxx --dport 
>80 -j ACCEPT
>#iptables -A OUTPUT -o $IFACE -p icmp -m state --state 
>NEW,ESTABLISHED,RELATED -j ACCEPT
>#iptables -A INPUT      -i $IFACE -p icmp -m state --state 
>ESTABLISHED,RELATED -j ACCEPT
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>----------
>+++++
>Contributed by vogt@hansenet.com
>+++++
>
>#! /bin/sh
>#
># firewall	setting up IPTables firewalling
># 				this is a debian startscript
>(/etc/init.d/firewall)
>#				other distributions may need slight
>modifications
>#
>
>IPTABLES="/sbin/iptables"
>
>set -e
>
>case "$1" in
>   start)
> 	echo "Starting firewall: "
> 	modprobe ip_conntrack
>    echo -n "setting default policy: "
>    # syncookies and NO ip-forwarding
> 	echo 1 > /proc/sys/net/ipv4/tcp_syncookies
> 	echo 0 > /proc/sys/net/ipv4/ip_forward
> 	$IPTABLES -F
> 	$IPTABLES -X
> 	$IPTABLES -Z
> 	$IPTABLES -P INPUT DROP
> 	$IPTABLES -P FORWARD DROP
> 	$IPTABLES -P OUTPUT DROP
>  	$IPTABLES -N in_icmp
>    $IPTABLES -N in_tcp
>    $IPTABLES -N in_udp
>    $IPTABLES -A INPUT -p tcp -j in_tcp
>    $IPTABLES -A INPUT -p udp -j in_udp
>    $IPTABLES -A INPUT -p icmp -j in_icmp
> 	echo "done"
> 	echo -n "spoofing, redirect and broadcast protection/logging: 
>"
> 	echo "1" > /proc/sys/net/ipv4/conf/all/log_martians
>    echo "0" > /proc/sys/net/ipv4/conf/all/accept_redirects
> 	echo "0" > /proc/sys/net/ipv4/conf/all/accept_source_route
> 	echo "1" > /proc/sys/net/ipv4/icmp_echo_ignore_broadcasts
>   	echo "done"
> 	echo -n "enabling scan detection: "
>    if [ -f /lib/modules/`uname 
>-r`/kernel/net/ipv4/netfilter/ipt_psd.o ];
>then
> 		$IPTABLES -A INPUT -m psd -m limit --limit 5/minute -j LOG
>--log-prefix '#### Port Scan ####'
> 		echo "psd enabled"
>    else
> 		$IPTABLES -A INPUT -p icmp --icmp-type echo-request -m limit
>--limit 5/minute -j LOG --log-prefix '#### Ping Scan ####'
> 		# high rate for stealth scans, since they could be
>legitimate connection
> 		# attempts as well
> 		$IPTABLES -A in_tcp -p tcp --tcp-flags SYN,ACK,FIN,RST RST
>-m limit --limit 1/s --limit-burst 5 -j LOG --log-level info 
>--log-prefix
>'#### Stealth Scan ####'
> 		$IPTABLES -A in_tcp -p tcp --tcp-flags ALL FIN,URG,PSH -m
>limit --limit 5/m -j LOG --log-level info --log-prefix '#### XMAS 
>Scan ####'
> 		$IPTABLES -A in_tcp -p tcp --tcp-flags SYN,RST SYN,RST -m
>limit --limit 5/m -j LOG --log-level info --log-prefix '#### 
>SYN/RST Scan
>####'
> 		$IPTABLES -A in_tcp -p tcp --tcp-flags SYN,FIN SYN,FIN -m
>limit --limit 5/m -j LOG --log-level info --log-prefix '#### 
>SYN/FIN Scan
>####'
> 	  echo "limited detection enabled (no ipt_psd module)"
>    fi
>    echo -n "flood, fragment and various other protections: "
> 	# we allow 4 TCP connects per second, no more
> 	$IPTABLES -N syn-flood
> 	$IPTABLES -A INPUT -p tcp --syn -j syn-flood
> 	$IPTABLES -A syn-flood -m limit --limit 1/s --limit-burst 4 
>-j
>RETURN
> 	$IPTABLES -A syn-flood -j DROP
> 	# new connections that have no syn set are most probably evil
>    $IPTABLES -A INPUT -p tcp ! --syn -m state --state NEW -j 
>DROP
> 	# invalid packets
> 	$IPTABLES -A INPUT -p tcp -m state --state INVALID -m limit 
>--limit
>10/m -j LOG --log-level info --log-prefix "### Invalid Packet 
>###"
>    $IPTABLES -A INPUT -p tcp --tcp-option 64 -m limit --limit 
>5/m -j LOG
>--log-level info --log-prefix "### Bad TCP FLAG(64) ###"
>    $IPTABLES -A INPUT -p tcp --tcp-option 128 -m limit --limit 
>5/m -j LOG
>--log-level info --log-prefix "### Bad TCP FLAG(128) ###"
> 	echo "done"
> 	echo -n "setting up ICMP: "
>    # we allow echo requests and replies
>    # could limit replies to could limit replies to related, but 
>since we
>    # answer ping requests, where would be the point in that?
> 	$IPTABLES -A in_icmp -p icmp --icmp-type  0 -j ACCEPT
> 	$IPTABLES -A in_icmp -p icmp --icmp-type  8 -j ACCEPT
>    # we need destination unreachable
> 	$IPTABLES -A in_icmp -p icmp --icmp-type  3 -j ACCEPT
>    # we are nice and allow traceroute, though it is not 
>required
> 	$IPTABLES -A in_icmp -p icmp --icmp-type 11 -j ACCEPT
> 	$IPTABLES -A in_icmp -p icmp --icmp-type 30 -j ACCEPT
>    echo "done"
>    echo -n "enabling local and outgoing traffic: "
> 	$IPTABLES -A INPUT  -i lo -j ACCEPT
> 	$IPTABLES -I in_tcp -p tcp --dport 1024:65535 -m state 
>--state
>ESTABLISHED,RELATED -j ACCEPT
>    $IPTABLES -A OUTPUT -j ACCEPT
>    # we are nice and reject instead of drop ident traffic
>    $IPTABLES -I in_tcp -p tcp --dport auth --j REJECT
>    echo "done"
> 	echo -n "enabling selected services:"
>    $IPTABLES -I in_tcp -p tcp --dport http -m state --state 
>NEW,ESTABLISHED
>-j ACCEPT
>    echo -n " http"
> 	$IPTABLES -I in_tcp -p tcp --dport ssh -m state --state
>NEW,ESTABLISHED -j ACCEPT
>    echo -n " ssh"
> 	$IPTABLES -I in_tcp -p tcp --dport smtp -m state --state
>NEW,ESTABLISHED -j ACCEPT
>    echo -n " smtp"
> 	$IPTABLES -I in_tcp -p tcp --dport imaps -m state --state
>NEW,ESTABLISHED -j ACCEPT
>    echo -n " imaps"
> 	$IPTABLES -I in_tcp -p tcp --dport domain -m state --state
>NEW,ESTABLISHED -j ACCEPT
> 	$IPTABLES -I in_udp -p udp --dport domain -m state --state
>NEW,ESTABLISHED -j ACCEPT
>    echo -n " dns"
> 	$IPTABLES -I in_tcp -p tcp --dport ftp -m state --state
>NEW,ESTABLISHED -j ACCEPT
> 	# active ftp
> 	$IPTABLES -I in_tcp -p tcp --dport ftp-data -m state --state
>ESTABLISHED,RELATED -j ACCEPT
>    echo -n " ftp"
>    # quake3
>    $IPTABLES -I in_udp -p udp --dport 1024:65535 -j ACCEPT
>    echo -n " quake (all UDP >1024)"
>    echo " - all done"
> 	echo "Firewall setup complete."
> 	;;
>   stop)
> 	echo -n "Shutting down firewall: "
> 	$IPTABLES -F
>    $IPTABLES -X
> 	$IPTABLES -P INPUT ACCEPT
> 	$IPTABLES -P FORWARD ACCEPT
> 	$IPTABLES -P OUTPUT ACCEPT
> 	echo "done"
> 	;;
>   *)
> 	N=/etc/init.d/$NAME
> 	echo "Usage: $N {start|stop}" >&2
> 	exit 1
> 	;;
>esac
>
>exit 0
>
>
>
>
>
>
>
>
>
>
>
>
>
>--
>GEORGE GEORGALIS, System Admin/Architect    cell: 347-451-8229
>Security Services, Web, Mail,            
>mailto:george@galis.org
>File, Print, DB and DNS Servers.       
>http://www.galis.org/george
>
>

_________________________________________________________
There is always a better job for you at Monsterindia.com.
Go now http://monsterindia.com/rediffin/


