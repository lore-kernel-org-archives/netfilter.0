From: "Patrick" <pat@pat.i989.net>
Subject: Re: my system is under syn-flood attack
Date: Mon, 23 Sep 2002 14:03:48 +0800 (HKT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1203.202.64.212.174.1032761028.squirrel@pat.i989.net>
References: <002201c262ae$36db04b0$9801010a@redhat73>
Reply-To: pat@pat.i989.net
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <002201c262ae$36db04b0$9801010a@redhat73>
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

Please try to implement the syn-flood rule in prerouting chain:
please goto the following web site for reference:

http://www.samag.com/documents/s=1824/sam0201h/0201h_s1.htm



> my box is redhat 7.3 apache 1.3.26
>
> from last week . some guys use syn-flood and ping death to attack my
> system

> i use flowing script:
> #!/bin/sh
>
> IPTABLES="/sbin/iptables"
>
> echo "Flushing rules..."
> $IPTABLES -F
> $IPTABLES -X
>
> #Set default policies to DROP
> $IPTABLES -F INPUT
> $IPTABLES -F OUTPUT
> $IPTABLES -F FORWARD
> $IPTABLES -P INPUT ACCEPT
> $IPTABLES -P OUTPUT ACCEPT
>
>
> LOOP_IF="lo"
>
>
> ###########################################################################
> #----Set network sysctl options-----#
> echo "--Setting sysctl options--"
>
> echo "Disabling IP Spoofing attacks"
> echo 2 > /proc/sys/net/ipv4/conf/all/rp_filter
>
> echo "Disabling respond to broadcast pings"
> echo 1 > /proc/sys/net/ipv4/icmp_echo_ignore_broadcasts
>
> echo "Blocking source routing"
> echo 0 > /proc/sys/net/ipv4/conf/all/accept_source_route
>
> echo "Kill timestamps"
> echo 0 > /proc/sys/net/ipv4/tcp_timestamps
>
> echo "Enable SYN Cookies"
> echo 1 > /proc/sys/net/ipv4/tcp_syncookies
>
> echo "Kill redirects"
> echo 0 > /proc/sys/net/ipv4/conf/all/accept_redirects
>
> echo "Enabling bad error message protection"
> echo 1 > /proc/sys/net/ipv4/icmp_ignore_bogus_error_responses
>
> echo "Logging martians (packets with impossible addresses)"
> echo 1 > /proc/sys/net/ipv4/conf/all/log_martians
>
> echo "Reducing DoS'ing ability by reducing timeouts"
> echo 60 > /proc/sys/net/ipv4/tcp_fin_timeout
> echo 2400 > /proc/sys/net/ipv4/tcp_keepalive_time
> echo 0 > /proc/sys/net/ipv4/tcp_window_scaling
> echo 0 > /proc/sys/net/ipv4/tcp_sack
> echo "Done..."
>
> #########################################################################
> echo "--Setting up standard rules--"
>
> echo "Allow unlimited traffic on the loopback interface"
> $IPTABLES -A INPUT -i lo -j ACCEPT
> $IPTABLES -A OUTPUT -o lo -j ACCEPT
>
> echo "Enabling SYN-FLOODING PROTECTION"
> $IPTABLES -N syn-flood
> $IPTABLES -A INPUT -p tcp --syn -j syn-flood
> $IPTABLES -A syn-flood -m limit --limit 1/s --limit-burst 4 -j RETURN
> $IPTABLES -A syn-flood -j DROP
>
> echo "Making sure NEW tcp connections are SYN packets"
> $IPTABLES -A INPUT -p tcp ! --syn -m state --state NEW -j DROP
>
> echo "Logging fragments caught"
> $IPTABLES -N fragments
> $IPTABLES -A INPUT -f -j fragments
> $IPTABLES -A fragments -j LOG --log-prefix "IPTABLES FRAGMENTS:"
> $IPTABLES -A fragments -j DROP
>
> echo "Refusing spoofed packets pretending to be from your IP address"
> #$IPTABLES -A INPUT -s $NET_IPADDR -j DROP
> echo "Done..."
>
> but it's no use how can i protect my system from syn flood?? i have no
> hardware firewall a




