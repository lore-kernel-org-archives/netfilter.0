From: =?iso-8859-1?q?Giancarlo=20Boaron?= <gboaron@yahoo.com.br>
Subject: No Internet Connection
Date: Fri, 10 Sep 2004 11:49:01 -0300 (ART)
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20040910144901.42036.qmail@web50204.mail.yahoo.com>
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
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Ok. So that's my super mega power iptables script I'm
testing for my internet server.

I already put the DHCP rules (my ISP doesn't have a
fixed IP address for the DHCP server. They are always
changing it... don't ask me why) but I didn't test it
yet.

I developed this script using the very good classic
idea: block everything and allow just what I want.

So, this internet server will be a firewall (as soon
as this script works), making NAT (with MASQUERADING).
I also have the SQUID for proxing and caching. 

Some users in my LAN have free pass for everything
while the rest of my users just can connect to the
mail servers (POP and SMTP) and a few users can
connect to ICQ, Messenger, etc (I really don't like
this idea, but I have to do it).

I don't use any authentication method based on user
and password. Instead, I use rules based on the MAC
address for the computers with free pass. (Ok. I know
it isn't a very safe aproach).

So, here goes my script:

INET_IP=`ifconfig eth0 | grep inet | cut -d : -f 2 |
cut -d ' ' -f 2`
INET_IFACE="eth0"

LAN_IP="192.168.0.41"
LAN_IP_RANGE="192.168.0.0/24"
LAN_IFACE="eth1"

LO_IFACE="lo"
LO_IP="127.0.0.1"

Mac1="00:e0:18:3b:af:78"
Mac2="00:50:04:9c:42:23"
Mac3="00:0e:a6:bd:e7:7f"
Mac4="00:c0:df:a5:0c:a5"

IPTABLES="/usr/sbin/iptables"

/sbin/depmod -a
/sbin/modprobe ip_tables
/sbin/modprobe ip_conntrack
/sbin/modprobe iptable_filter
/sbin/modprobe iptable_nat
/sbin/modprobe ipt_LOG
/sbin/modprobe ipt_limit
/sbin/modprobe ipt_state
/sbin/modprobe ipt_REJECT
/sbin/modprobe ip_conntrack_ftp
/sbin/modprobe ip_nat_ftp

echo "1" > /proc/sys/net/ipv4/ip_forward

$IPTABLES -F
$IPTABLES -X

$IPTABLES -P INPUT DROP
$IPTABLES -P OUTPUT DROP
$IPTABLES -P FORWARD DROP

$IPTABLES -N tcp_invalidos

$IPTABLES -A tcp_invalidos -p tcp --tcp-flags SYN,ACK
SYN,ACK \
-m state --state NEW -j REJECT --reject-with tcp-reset
$IPTABLES -A tcp_invalidos -p tcp ! --syn -m state
--state NEW -j LOG \
--log-prefix "Novo nao SYN:"
$IPTABLES -A tcp_invalidos -p tcp ! --syn -m state
--state NEW -j DROP

$IPTABLES -A OUTPUT -p tcp -j tcp_invalidos

$IPTABLES -A OUTPUT -p udp --sport 68 --dport 67 -j
ACCEPT

$IPTABLES -A OUTPUT -p all -m state --state
ESTABLISHED,RELATED -j ACCEPT

$IPTABLES -A OUTPUT -p icmp --icmp-type 8 -j ACCEPT

$IPTABLES -A OUTPUT -p tcp --dport 53 -j ACCEPT
$IPTABLES -A OUTPUT -p udp --dport 53 -j ACCEPT

$IPTABLES -A OUTPUT -p tcp --dport 80 -s $INET_IP -o
$INET_IFACE -j ACCEPT
$IPTABLES -A OUTPUT -p tcp --dport 443 -s $INET_IP -o
$INET_IFACE -j ACCEPT
$IPTABLES -A OUTPUT -p tcp --dport 21 -s $INET_IP -o
$INET_IFACE -j ACCEPT

# ICQ:
$IPTABLES -A OUTPUT -p tcp -d 64.12.163.197 -o
$INET_IFACE -j ACCEPT

$IPTABLES -A INPUT -p tcp -j tcp_invalidos

$IPTABLES -A INPUT -p udp --sport 67 --dport 68 -j
ACCEPT

$IPTABLES -A INPUT -p ALL -m state --state
ESTABLISHED,RELATED -j ACCEPT

$IPTABLES -A INPUT -p tcp --dport 53 -j ACCEPT
$IPTABLES -A INPUT -p udp --dport 53 -j ACCEPT

# SQUID:
$IPTABLES -A INPUT -i $LAN_IFACE -p tcp --dport 80 -j
ACCEPT

$IPTABLES -A FORWARD -p tcp -j tcp_invalidos

$IPTABLES -A FORWARD -m state --state
ESTABLISHED,RELATED -j ACCEPT

$IPTABLES -A FORWARD -m mac --mac-source $Mac1 -j
ACCEPT

$IPTABLES -A FORWARD -m mac --mac-source $Mac2 -j
ACCEPT

$IPTABLES -A FORWARD -m mac --mac-source $Mac3 -j
ACCEPT

$IPTABLES -A FORWARD -m mac --mac-source $Mac4 -j
ACCEPT

$IPTABLES -A FORWARD -p tcp --dport 53 -j ACCEPT
$IPTABLES -A FORWARD -p udp --dport 53 -j ACCEPT

$IPTABLES -A FORWARD -d <my pop server> -p tcp --dport
110 \
-i $LAN_IFACE -j ACCEPT

$IPTABLES -A FORWARD -d <my smtp server> -p tcp
--dport 25 \
-i $LAN_IFACE -j ACCEPT

$IPTABLES -A FORWARD -p tcp --dport 21 -i $LAN_IFACE
-j ACCEPT
$IPTABLES -A FORWARD -p tcp --dport 80 -i $LAN_IFACE
-j ACCEPT
$IPTABLES -A FORWARD -p tcp --dport 443 -i $LAN_IFACE
-j ACCEPT

$IPTABLES -t nat -A POSTROUTING -o $INET_IFACE -j SNAT
--to-source $INET_IP

That's it. Another question: When I configure this
script to run automatically after rebooting the
server, I receive this error message (3 times): "Bad
argument eth0" so the script doesn't work, neither my
Internet access from my LAN and I can't find where is
the error.

However, after rebooting the server and loggin in as
root, I can run the script from command line. It works
and my LAN can access the Internet during that short
time (about 20 minutes. However, I didn't test the
DHCP rules to ckeck if it continues to happen).

Regards
Giancarlo



__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 

