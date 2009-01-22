From: "Hodapp Jim (CDI)" <Jim.Hodapp@thomson.net>
Subject: Problems adding a simple rule via iptables on an embedded Linux target
Date: Thu, 22 Jan 2009 10:20:49 -0500
Message-ID: <DF1CDCC7B707E84D99DE102AA0730F7B011E323F@INDYSMAILMB03.am.thmulti.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-class: urn:content-classes:message
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi, 
I am trying to enable a very simple firewall on an embedded target that
my team is developing. We're running a stock Linux kernel, version
2.6.18.5. Below you can see that at least for a test, I've compiled in
the main netfilter/iptables functionality into the kernel and have
enabled everything else as a module. When the target boots up, this is
what "iptables -L" outputs:

Chain INPUT (policy ACCEPT) 
target prot opt source destination 
Chain FORWARD (policy ACCEPT) 
target prot opt source destination 
Chain OUTPUT (policy ACCEPT) 
target prot opt source destination

As a simple example (one in which I know works on my local desktop
Ubuntu 8.10 machine even starting with the same policy as listed above),
I'm trying to add the rule from the shell as follows: "iptables -A INPUT
-s 0/0 -d 0/0 -p tcp --dport 22 -j ACCEPT"

What I get back is: "iptables: match `tcp' already registered." An
"iptables -L" confirms that it did not add the rule to the list. I have
not been able to find anything via google of other people having this
kind of problem, so I thought I'd email this mailing list to see what
I've missed.

Here's my netfilter/iptables kernel config section: 

# 
# IP: Virtual Server Configuration 
# 
# CONFIG_IP_VS is not set 
# CONFIG_IPV6 is not set 
# CONFIG_INET6_XFRM_TUNNEL is not set 
# CONFIG_INET6_TUNNEL is not set 
# CONFIG_NETWORK_SECMARK is not set 
CONFIG_NETFILTER=y 
# CONFIG_NETFILTER_DEBUG is not set 
# 
# Core Netfilter Configuration 
# 
CONFIG_NETFILTER_NETLINK=m 
CONFIG_NETFILTER_NETLINK_QUEUE=m 
CONFIG_NETFILTER_NETLINK_LOG=m 
CONFIG_NETFILTER_XTABLES=m 
CONFIG_NETFILTER_XT_TARGET_CLASSIFY=m 
# CONFIG_NETFILTER_XT_TARGET_CONNMARK is not set 
CONFIG_NETFILTER_XT_TARGET_MARK=m 
CONFIG_NETFILTER_XT_TARGET_NFQUEUE=m 
CONFIG_NETFILTER_XT_TARGET_NOTRACK=m 
CONFIG_NETFILTER_XT_MATCH_COMMENT=m 
# CONFIG_NETFILTER_XT_MATCH_CONNBYTES is not set 
# CONFIG_NETFILTER_XT_MATCH_CONNMARK is not set 
CONFIG_NETFILTER_XT_MATCH_CONNTRACK=m 
CONFIG_NETFILTER_XT_MATCH_DCCP=m 
CONFIG_NETFILTER_XT_MATCH_ESP=m 
CONFIG_NETFILTER_XT_MATCH_HELPER=m 
CONFIG_NETFILTER_XT_MATCH_LENGTH=m 
CONFIG_NETFILTER_XT_MATCH_LIMIT=m 
CONFIG_NETFILTER_XT_MATCH_MAC=m 
CONFIG_NETFILTER_XT_MATCH_MARK=m 
CONFIG_NETFILTER_XT_MATCH_MULTIPORT=m 
CONFIG_NETFILTER_XT_MATCH_PKTTYPE=m 
CONFIG_NETFILTER_XT_MATCH_QUOTA=m 
CONFIG_NETFILTER_XT_MATCH_REALM=m 
CONFIG_NETFILTER_XT_MATCH_SCTP=m 
CONFIG_NETFILTER_XT_MATCH_STATE=m 
CONFIG_NETFILTER_XT_MATCH_STATISTIC=m 
CONFIG_NETFILTER_XT_MATCH_STRING=m 
CONFIG_NETFILTER_XT_MATCH_TCPMSS=m 
# 
# IP: Netfilter Configuration 
# 
CONFIG_IP_NF_CONNTRACK=m 
CONFIG_IP_NF_CT_ACCT=y 
CONFIG_IP_NF_CONNTRACK_MARK=y 
# CONFIG_IP_NF_CONNTRACK_EVENTS is not set 
# CONFIG_IP_NF_CONNTRACK_NETLINK is not set 
# CONFIG_IP_NF_CT_PROTO_SCTP is not set 
CONFIG_IP_NF_FTP=m 
# CONFIG_IP_NF_IRC is not set 
# CONFIG_IP_NF_NETBIOS_NS is not set 
CONFIG_IP_NF_TFTP=m 
# CONFIG_IP_NF_AMANDA is not set 
# CONFIG_IP_NF_PPTP is not set 
# CONFIG_IP_NF_H323 is not set 
# CONFIG_IP_NF_SIP is not set 
# CONFIG_IP_NF_QUEUE is not set 
CONFIG_IP_NF_IPTABLES=m 
CONFIG_IP_NF_MATCH_IPRANGE=m 
CONFIG_IP_NF_MATCH_TOS=m 
CONFIG_IP_NF_MATCH_RECENT=m 
CONFIG_IP_NF_MATCH_ECN=m 
CONFIG_IP_NF_MATCH_DSCP=m 
CONFIG_IP_NF_MATCH_AH=m 
CONFIG_IP_NF_MATCH_TTL=m 
CONFIG_IP_NF_MATCH_OWNER=m 
CONFIG_IP_NF_MATCH_ADDRTYPE=m 
CONFIG_IP_NF_MATCH_HASHLIMIT=m 
CONFIG_IP_NF_FILTER=m 
CONFIG_IP_NF_TARGET_REJECT=m 
CONFIG_IP_NF_TARGET_LOG=m 
CONFIG_IP_NF_TARGET_ULOG=m 
CONFIG_IP_NF_TARGET_TCPMSS=m 
# CONFIG_IP_NF_NAT is not set 
CONFIG_IP_NF_MANGLE=m 
CONFIG_IP_NF_TARGET_TOS=m 
CONFIG_IP_NF_TARGET_ECN=m 
CONFIG_IP_NF_TARGET_DSCP=m 
CONFIG_IP_NF_TARGET_TTL=m 
# CONFIG_IP_NF_TARGET_CLUSTERIP is not set 
CONFIG_IP_NF_RAW=m 
# CONFIG_IP_NF_ARPTABLES is not set 


Thanks, 
Jim Hodapp 

Thomson Inc. 
Colony Project Software Engineer 

