From: George Esperanza <george_esperanza@yahoo.com>
Subject: Port Forwarding Problem
Date: Sun, 17 Jul 2005 22:17:37 -0700 (PDT)
Message-ID: <20050718051737.46295.qmail@web31512.mail.mud.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hello everyone!

I have just installed a Slackware Linux 10.1 as my
firewall and my Internet gateway and i have a Web
server inside my private Network.  I'm trying to test
if i can forward all incoming http request to my Web
server.  I've found  a simple script and modified it
to work for my IP settings, but its not working.  I've
been searching this for almost 2 days now and still
can't make it to work. 

I have Slackware 9.0 with iptables scripts (running at
home) that has forwarding rules which is working
perfectly.  I tried that script too in Slackware 10.1
but still not working.  

Please help... 

George

Here's my script:

#!/bin/sh

IPTPATH="/usr/sbin/iptables"
/sbin/modprobe ip_conntrack
/sbin/modprobe iptable_filter
/sbin/modprobe iptable_mangle
/sbin/modprobe iptable_nat
/sbin/modprobe ipt_MASQUERADE
/sbin/modprobe ip_nat_ftp
/sbin/modprobe ip_conntrack_ftp

echo "1" > /proc/sys/net/ipv4/ip_forward
echo "1" > /proc/sys/net/ipv4/tcp_syncookies
echo "1" >
/proc/sys/net/ipv4/icmp_echo_ignore_broadcasts
echo "0" >
/proc/sys/net/ipv4/conf/all/accept_source_route
echo "1" >
/proc/sys/net/ipv4/conf/all/secure_redirects
echo "1" > /proc/sys/net/ipv4/conf/all/log_martians

$IPT -P INPUT DROP
$IPT -P OUTPUT DROP
$IPT -P FORWARD DROP

$IPT -A INPUT -i lo -j ACCEPT
$IPT -A INPUT -m state --state INVALID -j DROP
$IPT -A OUTPUT -m state --state INVALID -j DROP
$IPT -A FORWARD -m state --state INVALID -j DROP

$IPT -A INPUT -m state --state ESTABLISHED,RELATED -j
ACCEPT
$IPT -A OUTPUT -m state --state ESTABLISHED,RELATED -j
ACCEPT
$IPT -A FORWARD -m state --state ESTABLISHED,RELATED
-j ACCEPT

# eth0 - internal network
# eth1 - external network (with static IP)
$IPT -A OUTPUT -d 0/0 -m state --state NEW -p tcp -m
multiport \
        --dport 80,443 -o eth1 -j ACCEPT
$IPT -A FORWARD -d 0/0 -m state --state NEW -p tcp -m
multiport \
        --dport 80,443 -o eth1 -i eth0 -j ACCEPT

$IPT -A OUTPUT -o eth1 -j LOG
$IPT -A FORWARD -j LOG

$IPT -t nat -A POSTROUTING -o eth1 -j SNAT --to
X.X.X.X
$IPT -t nat -A PREROUTING -i eth1 -p tcp -d X.X.X.X
--dport 80 -j DNAT \
    --to 192.168.0.10:80


		
____________________________________________________
Start your day with Yahoo! - make it your home page 
http://www.yahoo.com/r/hs 
 

