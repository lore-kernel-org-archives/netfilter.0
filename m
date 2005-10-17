From: Michael Bonfils <iptables@cabinetrichard.fr>
Subject: Another Question about PPTP
Date: Mon, 17 Oct 2005 14:53:14 +0200
Message-ID: <43539EBA.3020207@cabinetrichard.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Netfilter (E-Mail)" <netfilter@lists.netfilter.org>

Hello,

I've a private network and a firewall box under linux.

I don't manage from a computer in my network to connect to several 
extern PPTP server.

In a perfect world, there can be severals connection PPTP at the same 
time but it's not very important.

. A private network in 192.3.4.0/24
. a Firewall Linux Debian Testing with a proper Kernel 2.4.27, 
patch-o-matic and Iptables (kernel & iptables rebuild after applied 
'PPTP connection tracking and NAT helper' patch)

The script :
#!/bin/bash
#script /etc/firewall.sh


# ETHERNET
ETH_NET=eth1
IP_NET=84.96.23.163
# INTRANET
ETH_PRIALL=192.3.4.0/24
ETH_PRI=eth0
IP_PRI=192.3.4.2

# forwarding
echo 1 > /proc/sys/net/ipv4/ip_forward

# je ne veux pas de spoofing
if [ -e /proc/sys/net/ipv4/conf/all/rp_filter ]
then
    for filtre in /proc/sys/net/ipv4/conf/*/rp_filter
    do
           echo 1 > $filtre
    done
fi

# PING
echo 0 > /proc/sys/net/ipv4/icmp_echo_ignore_all
echo 0 > /proc/sys/net/ipv4/icmp_echo_ignore_broadcasts

# flush all
iptables -F
iptables -X

iptables -A FORWARD -p 47 -m state --state NEW -i $ETH_PRI -j ACCEPT
iptables -A FORWARD -p tcp --dport 1723 -m state --state $ETH_PRI -i 
eth1 -j ACCEPT


The kernel is build with :

#
# Networking options
#
CONFIG_PACKET=y
CONFIG_NETFILTER=y
CONFIG_UNIX=y
CONFIG_INET=y
#
#   IP: Netfilter Configuration
#
CONFIG_IP_NF_CONNTRACK=y
CONFIG_IP_NF_FTP=y
CONFIG_IP_NF_CT_PROTO_GRE=y
CONFIG_IP_NF_PPTP=y
CONFIG_IP_NF_IPTABLES=y
CONFIG_IP_NF_MATCH_LIMIT=y
CONFIG_IP_NF_MATCH_MARK=y
CONFIG_IP_NF_MATCH_MULTIPORT=y
CONFIG_IP_NF_MATCH_STATE=y
CONFIG_IP_NF_FILTER=y
CONFIG_IP_NF_TARGET_REJECT=y
CONFIG_IP_NF_NAT=y
CONFIG_IP_NF_NAT_NEEDED=y
CONFIG_IP_NF_TARGET_MASQUERADE=y
CONFIG_IP_NF_TARGET_REDIRECT=y
CONFIG_IP_NF_NAT_PPTP=y
CONFIG_IP_NF_NAT_PROTO_GRE=y
CONFIG_IP_NF_NAT_FTP=y
CONFIG_IP_NF_MANGLE=y
CONFIG_IP_NF_TARGET_MARK=y
CONFIG_IP_NF_TARGET_LOG=y


Thanks for any help,
Michael


