From: Tasha Smith <tashamaillist@yahoo.com>
Subject: Re: VPN and getting through IPTABLES firewall
Date: Thu, 4 Dec 2003 07:44:46 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031204154446.5747.qmail@web60301.mail.yahoo.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org



Thank You Jeremy 

That worked ;)
Just going to to clean up some rules now.




Thanks Tasha@---<-----



--- Tasha Smith <tashamaillist@yahoo.com> wrote:
> Hi Boyz,
> 
> Details:
> IPTABLES-1.2.7a
> Kernel-2-4.20
> RedHat-7.3 - Firewall Machine
> 
> Windows 2000 (192.168.0.1) LAN MAchine
> VPN Client:
> 4_65.18
> Security ESP,Triple DES, SHA
> Windows 2000 (192.168.0.1) LAN MAchine
>  
> I am having troubles trying to get my VPN to work working. I am running Windows
> 2000
> on my LAN and have a Redhat 7.3 machine as my firewall running iptables-1.2.7a. I
> have my rules set up to forward to port UDP 500 but it still wont connect it makes
> it to BANNER check then CUTS out. I will post all my rules at the bottom. The
> thing
> is i can connect when i add this rule:
> $iptables -A FORWARD -i eth1 -o eth0 -s 192.168.0.0/24 -j ACCEPT
> 
> I didnt want to just add this rule because of secruity and i really would like to
> know why it doesnt work when i added these rules which i thought they were used by
> VPN:
> 
> $iptables -A FORWARD -i eth1 -p tcp -m multiport
> --dport1040,1043,1046,1047,1048,1050,1051,1052,1098,1054 -j ACCEPT
> $iptables -A FORWARD -i eth1 -p udp --dport 500 -j ACCEPT
> $iptables -A FORWARD -i eth1 -p udp --dport 10000 -j ACCEPT
> 
> If somebody could please shed some light on this for me ;) please and or help me
> create my rules to get VPN connected to my work. If you need anymore informationi
> could post right away. 
> Here are all my rules, and yes the IP's all have been changed ;-)
> 
> ---SNIP---
> 
> 
> #!/bin/bash/
> #
> # chkconfig: 2345 08 92
> # description: This script applies iptables.
> #
> # Enable broadcast echo protection
> echo 1 > /proc/sys/net/ipv4/icmp_echo_ignore_broadcasts
> 
> # Disable source routed packets
> for f in /proc/sys/net/ipv4/conf/*/accept_source_route; do
>         echo 0 > $f
> done
> 
> # Enable syn cookie protection.
> echo 1 > /proc/sys/net/ipv4/tcp_syncookies
> 
> # Disable ICMP Redirect Acceptence
> for f in /proc/sys/net/ipv4/conf/*/accept_redirects; do
>         echo 0 > $f
> done
> 
> # Drop spoofed packets comeing in on an interface, ehich if replied
> # to,would result the reply going out another interface.
> for f in /proc/sys/net/ipv4/conf/*/rp_filter; do
>      echo 1 > $f
> done
> 
> # Dont't send Redirect Messages
> for f in /proc/sys/net/ipv4/conf/*/send_redirects; do
>         echo 0 > $f
> done
> 
> # Log packets with impossiable addreses.
> for f in /proc/sys/net/ipv4/conf/*/log_martians; do
>     echo 1 > $f
> done
> 
> #Where my iptables are located
> iptables="/usr/local/sbin/iptables"
> 
> # This will also update my ipaddress.
> IP_INET=`/sbin/ifconfig eth0 | grep inet | cut -d: -f2 | cut -d\  -f1`
> 
> # Remove any existing rules from all chains.
> $iptables --flush
> $iptables -t nat --flush
> $iptables -t mangle --flush
> 
> # Unlimited access on the loopback interface.
> $iptables -A INPUT  -i lo -j ACCEPT
> $iptables -A OUTPUT -o lo -j ACCEPT
> 
> # Set the default policy to drop.
> $iptables --policy INPUT DROP
> $iptables --policy FORWARD DROP
> $iptables --policy OUTPUT ACCEPT
> 
> $iptables -t nat --policy PREROUTING ACCEPT
> $iptables -t nat --policy OUTPUT ACCEPT
> $iptables -t nat --policy POSTROUTING ACCEPT
> 
> $iptables -t mangle --policy PREROUTING ACCEPT
> $iptables -t mangle --policy OUTPUT ACCEPT
> 
> # All of the bits are cleared
> $iptables -A INPUT -p tcp --tcp-flags ALL NONE -j DROP
> $iptables -A FORWARD -p tcp --tcp-flags ALL NONE -j DROP
> # SYN and FIN are both set
> $iptables -A INPUT -p tcp --tcp-flags SYN,FIN SYN,FIN -j DROP
> $iptables -A FORWARD -p tcp --tcp-flags SYN,FIN SYN,FIN -j DROP
> # SYN and RST are both set.
> $iptables -A INPUT -p tcp --tcp-flags SYN,RST SYN,RST -j DROP
> $iptables -A FORWARD -p tcp --tcp-flags SYN,RST SYN,RST -j DROP
> # FIN and RST are both set
> $iptables -A INPUT -p tcp --tcp-flags FIN,RST FIN,RST -j DROP
> $iptables -A FORWARD -p tcp --tcp-flags FIN,RST FIN,RST -j DROP
> # FIN is the only bit set, without the expected accompanyuing ACK
> $iptables -A INPUT -p tcp --tcp-flags ACK,FIN FIN -j DROP
> $iptables -A FORWARD -p tcp --tcp-flags ACK,FIN FIN -j DROP
> # PSH is the only bit set, without the expected accompaying ACK
> $iptables -A INPUT -p tcp --tcp-flags ACK,PSH PSH -j DROP
> $iptables -A FORWARD -p tcp --tcp-flags ACK,PSH PSH -j DROP
> # URG is the only bit set, without the expected accompayning ACK
> $iptables -A INPUT -p tcp --tcp-flags ACK,URG URG -j DROP
> $iptables -A FORWARD -p tcp --tcp-flags ACK,URG URG -j DROP
> 
> # Allow stateful connections
> $iptables -A INPUT   -m state --state ESTABLISHED,RELATED -j ACCEPT
> $iptables -A OUTPUT  -m state --state ESTABLISHED,RELATED -j ACCEPT
> $iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
> 
> # Drop Invalid connection
> $iptables -A INPUT -m state --state INVALID -j LOG \
>           --log-prefix "Invalid input: "
> $iptables -A INPUT -m state --state INVALID -j DROP
> 
> $iptables -A OUTPUT -m state --state INVALID -j LOG \
>           --log-prefix "Invalid output: "
> $iptables -A OUTPUT -m state --state INVALID -j DROP
> 
> $iptables -A FORWARD -m state --state INVALID -j LOG \
>           --log-prefix "Invalid forward: "
> $iptables -A FORWARD -m state --state INVALID -j DROP
> 
> # Dropped packets that pretend to be coming in from PRIVATE ADDRESSes.
> $iptables -A INPUT   -i eth0 -s 10.0.0.1/8     -j DROP
> $iptables -A FORWARD -i eth0 -s 10.0.0.1/8     -j DROP
> $iptables -A INPUT   -i eth0 -s 169.254.0.0/16 -j DROP
> $iptables -A FORWARD -i eth0 -s 169.254.0.0/16 -j DROP
> $iptables -A INPUT   -i eth0 -s 172.16.0.0/12  -j DROP
> $iptables -A FORWARD -i eth0 -s 172.16.0.0/12  -j DROP
> $iptables -A INPUT   -i eth0 -s 192.168.0.0/24 -j DROP
> $iptables -A FORWARD -i eth0 -s 192.168.0.0/24 -j DROP
> # iptables -A INPUT   -i eth0 -s 127.0.0.1/8    -j DROP
> $iptables -A FORWARD -i eth0 -s 127.0.0.1/8    -j DROP
> 
> # Allow SSH Access
> if [ "$CONNECTION_TRACKING" = "1" ]; then
>    $iptables -A INPUT -i $eth0 -p tcp \
>    -s 132.161.42.159  --sport 1024:65985 \
>    -d $IP_INET --dport 22 \
>    -m state --state NEW -j ACCEPT
> fi
> 
> $iptables -A INPUT -i eth0 -p tcp \
>    -s 132.161.42.159 --sport 1024:65985 \
>    -d $IP_INET --dport 22 -j ACCEPT
> 
> 
> # Allow Access for DNS UDP for my ISP DNS server.
> if [ "$CONNECTION_TRACKING" = "1" ]; then
>    $iptables -A OUTPUT -o eth0 -p udp \
>             -s $IP_INET --sport 1024:65985 \
>             -d 202.98.4.130 --dport 98 \
>             -m state --state NEW -j ACCEPT
> fi
> 
> $iptables -A OUTPUT -o eth0 -p udp \
>          -s $IP_INET     --sport 1024:65985 \
>          -d 202.98.4.130 --dport 98 -j ACCEPT
> 
> 
> if [ "$CONNECTION_TRACKING" = "1" ]; then
>     $iptables -A OUTPUT -o eth0 -p udp \
>              -s $IP_INET --sport 1024:65985 \
>              -d 202.98.4.150 --dport 98 \
>              -m state --state NEW -j ACCEPT
> fi
> 
> $iptables -A OUTPUT -o eth0 -p udp \
>          -s $IP_INET --sport 1024:65985 \
>          -d 202.98.4.150 --dport 98 -j ACCEPT
> 
> $iptables -A INPUT -i eth1 -p udp --dport 98 -j ACCEPT
> 
> # Allow access for my ISP DHCP server.
> if [ "$CONNECTION_TRACKING" = "1" ]; then
>     $iptables -A OUTPUT -o eth0 -p udp \
>              -s $IP_NET --sport 1024:65985 \
>              -d 202.98.4.129 --dport 67 \
>              -m state --state NEW -j ACCEPT
> fi
> 
=== message truncated ===


__________________________________
Do you Yahoo!?
Protect your identity with Yahoo! Mail AddressGuard
http://antispam.yahoo.com/whatsnewfree

