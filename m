From: funny guy <asteriskmail@yahoo.com>
Subject: Multiple PPTP clients behind NAT
Date: Mon, 20 Sep 2004 00:01:54 -0700 (PDT)
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20040920070154.68500.qmail@web52503.mail.yahoo.com>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Dear Rob,

Thanks for your advice. However, I still cannot make
it work. I am a very new in PPTP and iptables. Could
you please give me more help.... thanks a lot in
advance. Thanks a lot a lot for your help.

I patched kernel 2.4.26 with
patch-o-matic-ng-20040919.tar.bz2 which is the
up-to-date snapshot. 

I only applied the base options (./runme base) 
and then I applied extra (./runme extra) with the
PPTP, RTSP conntrack and transparent proxy patches.
They seem to apply without problem.

I successfully compiled the kernel, after reboot, I
have the required modules loaded:

ipt_REDIRECT
ipt_MASQUERADE
iptable_filter
ip_tables
iptable_nat
ip_nat_pptp
ip_nat_proto_gre
ip_conntrack_pptp
ip_conntrack_proto_gre
ip_conntrack

my machines configuration is as follows:

192.168.10.0/24
PPTP     |
client1->|
         |                                129.94.133.1
PPTP     |
client2->|                                   |->PPTP
         |                                   |  Server
         |->eth1->NAT->eth0->...Internet...->|
... ...->|                                   |->...
         |                                   |
PPTP     |
client n->|

configuration parameters:
A. eth1 IP = 192.168.10.1
B. eth0 IP = 129.94.60.128
C. IPs in PPTP Server: 129.94.182.130, 129.94.182.131
(These IPs cannot be accessed without VPN)
E. All clients in private LAN are windows or Mac
machines. After the VPN is setup, they will be
assigned with IP addresses of 129.94.165.3 and
129.94.165.4
F. The PPTP Server is not firewalled

I only applied two NAT rules for the above settings:
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
iptables -A FORWARD -i eth1 -j ACCEPT
echo 1 > /proc/sys/net/ipv4/ip_forward

However, I cannot establish multiple connections. The
problem is exactly as before (I mean the problem in my
previous emails). The scenario is as following:
I. I setup one connection from client 1 to the PPTP
server, then I tried to test the connection by ping
either 129.94.182.130 or 129.94.182.131. It is
working.
II. I setup the other connection from client 2 to the
same PPTP server. Then two cases will happen:
   a) if the client 1 (a Mac machine) keep pinging,
the
connection for client 2 will fail;
   b) if client 1 stop pinging, the connection can be
established.
III. After the second connection is setup. Client 2
cannot ping if client 1 keeps pinging, but the status
shows that the connection is still there.

I donot know whether it is a problem of the kernel
patch or I did not set the firewall rules correctly.

I tried to learn the firewall rules that you
suggested, but since my limited knowledge of iptables,
I donot know which ip address and network interfaces
should be applied to those rules as too many ip
addresses in my configurations. Could you please tell
me the exact rules according to my figure?

If the proble is the kernel patch, the following is my
.config file, could you please tell me which option I
did not apply correctly?

[.config]
# Networking options
#
CONFIG_PACKET=y
CONFIG_NETFILTER=y
CONFIG_FILTER=y
CONFIG_UNIX=y
CONFIG_INET=y
CONFIG_IP_MULTICAST=y
CONFIG_IP_ADVANCED_ROUTER=y
CONFIG_IP_MULTIPLE_TABLES=y
CONFIG_IP_ROUTE_FWMARK=y
CONFIG_IP_ROUTE_NAT=y
CONFIG_IP_ROUTE_TOS=y
CONFIG_NET_IPIP=m

#   IP: Netfilter Configuration
#
CONFIG_IP_NF_CONNTRACK=m
CONFIG_IP_NF_FTP=m
CONFIG_IP_NF_CT_PROTO_GRE=m
CONFIG_IP_NF_PPTP=m
CONFIG_IP_NF_PPTP_DEBUG=y
CONFIG_IP_NF_H323=m
CONFIG_IP_NF_TFTP=m
CONFIG_IP_NF_IRC=m
CONFIG_IP_NF_MMS=m
CONFIG_IP_NF_IPTABLES=m
CONFIG_IP_NF_MATCH_MAC=m
CONFIG_IP_NF_MATCH_PKTTYPE=m
CONFIG_IP_NF_MATCH_MARK=m
CONFIG_IP_NF_MATCH_MULTIPORT=m
CONFIG_IP_NF_MATCH_TOS=m
CONFIG_IP_NF_MATCH_RECENT=m
CONFIG_IP_NF_MATCH_DSCP=m
CONFIG_IP_NF_MATCH_AH_ESP=m
CONFIG_IP_NF_MATCH_STATE=m
CONFIG_IP_NF_MATCH_CONNTRACK=m
CONFIG_IP_NF_FILTER=m
CONFIG_IP_NF_NAT=m
CONFIG_IP_NF_NAT_NEEDED=y
CONFIG_IP_NF_TARGET_MASQUERADE=m
CONFIG_IP_NF_TARGET_REDIRECT=m
CONFIG_IP_NF_NAT_H323=m
CONFIG_IP_NF_NAT_LOCAL=y
CONFIG_IP_NF_NAT_PPTP=m
CONFIG_IP_NF_NAT_PROTO_GRE=m
CONFIG_IP_NF_NAT_IRC=m
CONFIG_IP_NF_NAT_MMS=m
CONFIG_IP_NF_NAT_FTP=m
CONFIG_IP_NF_NAT_TFTP=m
CONFIG_IP_NF_MANGLE=m
CONFIG_IP_NF_TARGET_TOS=m
CONFIG_IP_NF_TARGET_ECN=m
CONFIG_IP_NF_TARGET_DSCP=m
CONFIG_IP_NF_TARGET_MARK=m


__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 

