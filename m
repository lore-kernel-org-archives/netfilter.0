From: "Lloyd Standish" <lloyd@crnatural.net>
Subject: still can't route using fwmark
Date: Fri, 17 Apr 2009 22:40:49 -0600
Message-ID: <op.uskfabufx1lyi3@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hello,

I am still having trouble doing load balancing over ppp0 and ppp1 for a Debian Etch PC (kernel 2.6.20.3, iptables 1.3.8).  I used patch-o-matic to update my kernel sources and recompiled the kernel, and compiled and installed iptables 1.3.8.  Also all the netfilter-related kernel configuration options I need are set, I believe.

My basic problem is that no matter how packets and connections are marked with the MARK and CONNMARK targets, only the interface with a "default" entry in the main routing table is used.   In this case, that is ppp0.  It is set as the default route using "ip route add default dev ppp0."   After that, ONLY ppp0 is used for outgoing/incoming packets, even though packets/connections carry fwmark 2, which I have associated with a user-defined routing table whose default route specifies ppp1.

For example, my /etc/iproute2/rt_tables looks like this:

debiandesk:/home/lloyd/data/loadbal# cat /etc/iproute2/rt_tables
#
# reserved values
#
255     local
254     main
253     default
0       unspec
#
# local
#
#1      inr.ruhep
251     rt_link1
252     rt_link2

If $gw0 is the ppp0 gateway, and $gw1 is the ppp1 gateway, I understand the following commands set up custom tables rt_link1 and rt_link2 to use ppp0 and ppp1, respectively:

ip route flush table rt_link1 2>/dev/null
ip route add $gw0 dev ppp0 table rt_link1
ip route add default via $gw0 dev ppp0 table rt_link1

ip route flush table rt_link2 2>/dev/null
ip route add $gw1 dev ppp1 table rt_link2
ip route add default via $gw1 dev ppp1 table rt_link2

(Actually, I think only a default route for each table should be enough, and that it could be set for example as follows: ip route add table rt_link1 default dev ppp0)

I also added the following rules to link the fwmark to tables rt_link1 and rt_link2 (Is this correct?)

ip rule add fwmark 1 table rt_link1
ip rule add fwmark 2 table rt_link2

I did this to made the rules take effect:
ip route flush cache

10.60.255.254 is the gateway IP for both ppp0 and ppp1.  The local IP address for ppp0 is 10.60.10.106, and for ppp1 it is 10.60.0.249.  The following commands verify that the settings are all correct:

debiandesk:/home/lloyd/data/loadbal# ip route show
10.60.255.254 dev ppp0  proto kernel  scope link  src 10.60.10.106
10.60.255.254 dev ppp1  proto kernel  scope link  src 10.60.0.249
192.168.1.0/24 dev eth0  proto kernel  scope link  src 192.168.1.1
default dev ppp0  scope link
debiandesk:/home/lloyd/data/loadbal# ip rule show
0:      from all lookup 255
32764:  from all fwmark 0x2 lookup rt_link2
32765:  from all fwmark 0x1 lookup rt_link1
32766:  from all lookup main
32767:  from all lookup default

(I am also doing SNAT to set the destination IP to that of the proper interface.)

And yet, it appears that packets marked with fwmark 2 do NOT leave through ppp1, as I expect:

debiandesk:/home/lloyd/data/loadbal# cat /proc/net/ip_conntrack
tcp      6 431978 ESTABLISHED src=10.60.10.106 dst=94.229.68.32 sport=54788 dport=5223 packets=181 bytes=19054 src=94.229.68.32 dst=10.60.10.106 sport=5223 dport=54788 packets=176 bytes=21161 [ASSURED] mark=2 secmark=0 use=1
<snip>

And:
debiandesk:/home/lloyd/data/loadbal# netstat -i
Kernel Interface table
Iface   MTU Met   RX-OK RX-ERR RX-DRP RX-OVR    TX-OK TX-ERR TX-DRP TX-OVR Flg
eth0   1500 0         0      0      0      0     3036      0      0      0 BMRU
lo    16436 0       708      0      0      0      708      0      0      0 LRU
ppp0   1500 0      3466      0      0      0     3605      0      0      0 MOPRU
ppp1   1500 0        60      0      0      0        3      0      0      0 MOPRU

(Most packets, regardless of fwmark, are routed through ppp0, the default route.  But what about the 60 RX-OK figure for ppp1?)

Please, can someone help me find the error here?  Is some sort of configuration setting necessary to make fwmark kick in?  I do not find a kernel config option to turn FWMARK on.  Nor do I find a "multiple routing tables" setting for IPv4.  Here are my netfilter-related kernel config settings:

# Core Netfilter Configuration
#
CONFIG_NETFILTER_NETLINK=m
CONFIG_NETFILTER_NETLINK_QUEUE=m
CONFIG_NETFILTER_NETLINK_LOG=m
CONFIG_NF_CONNTRACK_ENABLED=m
CONFIG_NF_CONNTRACK_SUPPORT=y
# CONFIG_IP_NF_CONNTRACK_SUPPORT is not set
CONFIG_NF_CONNTRACK=m
CONFIG_NF_CT_ACCT=y
CONFIG_NF_CONNTRACK_MARK=y
CONFIG_NF_CONNTRACK_SECMARK=y
CONFIG_NF_CONNTRACK_EVENTS=y
CONFIG_NF_CT_PROTO_GRE=m
# CONFIG_NF_CT_PROTO_SCTP is not set
# CONFIG_NF_CONNTRACK_AMANDA is not set
CONFIG_NF_CONNTRACK_FTP=m
CONFIG_NF_CONNTRACK_H323=m
CONFIG_NF_CONNTRACK_IRC=m
CONFIG_NF_CONNTRACK_NETBIOS_NS=m
CONFIG_NF_CONNTRACK_PPTP=m
CONFIG_NF_CONNTRACK_SIP=m
CONFIG_NF_CONNTRACK_TFTP=m
CONFIG_NF_CT_NETLINK=m
CONFIG_NETFILTER_XTABLES=m
CONFIG_NETFILTER_XT_TARGET_CLASSIFY=m
CONFIG_NETFILTER_XT_TARGET_CONNMARK=m
CONFIG_NETFILTER_XT_TARGET_DSCP=m
CONFIG_NETFILTER_XT_TARGET_MARK=m
CONFIG_NETFILTER_XT_TARGET_NFQUEUE=m
CONFIG_NETFILTER_XT_TARGET_NFLOG=m
CONFIG_NETFILTER_XT_TARGET_NOTRACK=m
CONFIG_NETFILTER_XT_TARGET_SECMARK=m
CONFIG_NETFILTER_XT_TARGET_CONNSECMARK=m
CONFIG_NETFILTER_XT_MATCH_COMMENT=m
CONFIG_NETFILTER_XT_MATCH_CONNBYTES=m
CONFIG_NETFILTER_XT_MATCH_CONNMARK=m
CONFIG_NETFILTER_XT_MATCH_CONNTRACK=m
CONFIG_NETFILTER_XT_MATCH_DCCP=m
CONFIG_NETFILTER_XT_MATCH_DSCP=m
CONFIG_NETFILTER_XT_MATCH_ESP=m
CONFIG_NETFILTER_XT_MATCH_HELPER=m
CONFIG_NETFILTER_XT_MATCH_LENGTH=m
CONFIG_NETFILTER_XT_MATCH_LIMIT=m
# CONFIG_NETFILTER_XT_MATCH_MAC is not set
CONFIG_NETFILTER_XT_MATCH_MARK=m
CONFIG_NETFILTER_XT_MATCH_POLICY=m
CONFIG_NETFILTER_XT_MATCH_MULTIPORT=m
CONFIG_NETFILTER_XT_MATCH_PHYSDEV=m
CONFIG_NETFILTER_XT_MATCH_PKTTYPE=m
CONFIG_NETFILTER_XT_MATCH_QUOTA=m
CONFIG_NETFILTER_XT_MATCH_REALM=m
CONFIG_NETFILTER_XT_MATCH_SCTP=m
CONFIG_NETFILTER_XT_MATCH_STATE=m
CONFIG_NETFILTER_XT_MATCH_STATISTIC=m
CONFIG_NETFILTER_XT_MATCH_STRING=m
CONFIG_NETFILTER_XT_MATCH_TCPMSS=m
# CONFIG_NETFILTER_XT_MATCH_HASHLIMIT is not set

#
# IP: Netfilter Configuration
#
CONFIG_NF_CONNTRACK_IPV4=m
CONFIG_NF_CONNTRACK_PROC_COMPAT=y
CONFIG_IP_NF_QUEUE=m
CONFIG_IP_NF_IPTABLES=m
CONFIG_IP_NF_MATCH_IPRANGE=m
CONFIG_IP_NF_MATCH_TOS=m
CONFIG_IP_NF_MATCH_RECENT=m
CONFIG_IP_NF_MATCH_ECN=m
CONFIG_IP_NF_MATCH_AH=m
CONFIG_IP_NF_MATCH_TTL=m
CONFIG_IP_NF_MATCH_OWNER=m
CONFIG_IP_NF_MATCH_ADDRTYPE=m
CONFIG_IP_NF_FILTER=m
CONFIG_IP_NF_TARGET_REJECT=m
CONFIG_IP_NF_TARGET_LOG=m
CONFIG_IP_NF_TARGET_ULOG=m
CONFIG_IP_NF_TARGET_TCPMSS=m
CONFIG_NF_NAT=m
CONFIG_NF_NAT_NEEDED=y
CONFIG_IP_NF_TARGET_MASQUERADE=m
CONFIG_IP_NF_TARGET_REDIRECT=m
CONFIG_IP_NF_TARGET_NETMAP=m
CONFIG_IP_NF_TARGET_SAME=m
CONFIG_NF_NAT_SNMP_BASIC=m
CONFIG_NF_NAT_PROTO_GRE=m
CONFIG_NF_NAT_FTP=m
CONFIG_NF_NAT_IRC=m
CONFIG_NF_NAT_TFTP=m
# CONFIG_NF_NAT_AMANDA is not set
CONFIG_NF_NAT_PPTP=m
CONFIG_NF_NAT_H323=m
CONFIG_NF_NAT_SIP=m
CONFIG_IP_NF_MANGLE=m
CONFIG_IP_NF_TARGET_TOS=m
CONFIG_IP_NF_TARGET_ECN=m
CONFIG_IP_NF_TARGET_TTL=m
CONFIG_IP_NF_TARGET_CLUSTERIP=m
CONFIG_IP_NF_RAW=m
CONFIG_IP_NF_ARPTABLES=m
CONFIG_IP_NF_ARPFILTER=m
CONFIG_IP_NF_ARP_MANGLE=m

Here are the relevant modules loaded:

Module                  Size  Used by
ipt_MASQUERADE          3584  1
ipt_LOG                 6912  5
xt_CONNMARK             3328  3
xt_MARK                 2560  2
iptable_mangle          3072  1
iptable_filter          3200  0
xt_state                2688  1
iptable_nat             7684  1
ip_tables              12616  3 iptable_mangle,iptable_filter,iptable_nat
nf_nat                 18604  2 ipt_MASQUERADE,iptable_nat
nf_conntrack_ipv4      17932  6 iptable_nat
xt_mark                 2048  1
nf_conntrack_ftp        9984  0
xt_statistic            2560  1
xt_connmark             2560  0
nf_conntrack           60248  8 ipt_MASQUERADE,xt_CONNMARK,xt_state,iptable_nat,nf_nat,nf_conntrack_ipv4,nf_conntrack_ftp,xt_connmark
nfnetlink               6936  3 nf_nat,nf_conntrack_ipv4,nf_conntrack
x_tables               15236  10 ipt_MASQUERADE,ipt_LOG,xt_CONNMARK,xt_MARK,xt_state,iptable_nat,ip_tables,xt_mark,xt_statistic,xt_connmark
