From: George Georgalis <george@galis.org>
Subject: port/ip forwarding with nat
Date: Wed, 22 May 2002 11:35:08 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020522113508.A6023@trot.haven.dom>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.samba.org


Hi, I'm new to this list and I know this is a frequent question... could
not find my answer in the faq, man, or the archives I looked at; and
would appreciate some direction. :)

I'm setting up a firewall to provide masq for a LAN and IP/port
forwarding (transparent proxy) to machines on a DMZ or LAN.

In the past I used ipchains masq, with a program, redir, which handled
the proxy functions from userspace. I'm trying to use firewall.dom:24 to
connect to host.intranet:22 now, later there will be many connections
of this type.

I've tried variations on #1 (in script, commented out below), but two
problems persist. When #1 and #2 are in place computers on the LAN can
not connect to port 24 on the internet, and port 24 connections from the
internet also get dropped by the forward chain policy.


LANIF=eth0
EXTIF=eth1
TCP_SERVICES="22,25,53,80,113"
UDP_SERVICES="22,53"

iptables -F
iptables -X
iptables -Z
iptables -F INPUT
iptables -F FORWARD
iptables -F OUTPUT
iptables -t nat -F OUTPUT
iptables -t nat -F PREROUTING
iptables -t nat -F POSTROUTING

echo 0 > /proc/sys/net/ipv4/icmp_echo_ignore_all
echo 1 > /proc/sys/net/ipv4/icmp_echo_ignore_broadcasts
echo 0 > /proc/sys/net/ipv4/conf/all/accept_source_route
echo 0 > /proc/sys/net/ipv4/conf/all/send_redirects
echo 0 > /proc/sys/net/ipv4/conf/all/accept_redirects
echo 1 > /proc/sys/net/ipv4/icmp_ignore_bogus_error_responses
for interface in /proc/sys/net/ipv4/conf/*/rp_filter; do echo 1 > $interface ; done
echo 1 > /proc/sys/net/ipv4/conf/all/log_martians
echo 1 > /proc/sys/net/ipv4/tcp_syncookies
echo 1 > /proc/sys/net/ipv4/ip_forward

iptables -P INPUT DROP
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -i $EXTIF -m state --state NEW -p tcp -m multiport --dport $TCP_SERVICES -j ACCEPT
iptables -A INPUT -i $EXTIF -m state --state NEW -p udp -m multiport --dport $UDP_SERVICES -j ACCEPT
iptables -A INPUT -i $LANIF -m state --state NEW -j ACCEPT
iptables -A INPUT -i lo     -m state --state NEW -j ACCEPT
iptables -A INPUT -j LOG --log-prefix "FW_INPUT  "

iptables -P FORWARD DROP
iptables -A FORWARD -i $LANIF -o $EXTIF -j ACCEPT
iptables -A FORWARD -i $EXTIF -m state --state ESTABLISHED,RELATED -j ACCEPT
#1 iptables -A FORWARD  -p tcp --dport 24 -j ACCEPT
iptables -A FORWARD -j LOG --log-prefix "FW_FORWARD  "

#2 iptables -t nat -A PREROUTING -p tcp -d 1.2.3.4 --dport 24 -j DNAT --to-destination 192.168.1.1:22
iptables -t nat -A POSTROUTING -o $EXTIF -j MASQUERADE

iptables -P OUTPUT ACCEPT


I must not be understanding some basic concept because this seems
straight forward.  Is it okay to use only $LANIF and $EXTIF for the
rules or should I be referencing the subnets (LANIF=192.168.0.0/16
EXTIF=1.2.3.0/24 and the firewall is 1.2.3.4)? What's wrong with #1? 
Is #2 okay? Should I add anything to /proc/sys/net/*?

Thanks,
// George

-- 
GEORGE GEORGALIS, System Admin/Architect    cell: 347-451-8229 
Security Services, Web, Mail,            mailto:george@galis.org 
File, Print, DB and DNS Servers.       http://www.galis.org/george 

