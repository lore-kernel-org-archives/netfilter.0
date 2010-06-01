From: "Umar Qureshey" <umar.qureshey@lantronix.com>
Subject: Wireless interface dead after enabling CONFIG_NETFILTER
Date: Tue, 1 Jun 2010 14:41:01 -0700
Message-ID: <F24C979D1AFD4E4292B911441CBA242407FCF2@2putt.int.lantronix.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-Class: urn:content-classes:message
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,

I compiled a stock 2.6.28 kernel, enabling CONFIG_NETFILTER in order to
get support for ebtables.  After getting it the images on my system, I
notice that the wireless interface is associating correctly with the AP
but no TCP/IP traffic is going on the interface.  Soon as I revert back
to an kernel version where netfilter is disabled, I get my wireless
working fine without a hitch.

Anyone notice this before?

The following is a diff between the compile options of a working kernel
(> # Fri May 28 11:01:46 2010) and a broken one (< # Tue Jun  1 11:44:04
2010):

4c4
< # Tue Jun  1 11:44:04 2010
---
> # Fri May 28 11:01:46 2010
357,428c357
< CONFIG_NETFILTER=y
< # CONFIG_NETFILTER_DEBUG is not set
< CONFIG_NETFILTER_ADVANCED=y
< CONFIG_BRIDGE_NETFILTER=y
< 
< #
< # Core Netfilter Configuration
< #
< # CONFIG_NETFILTER_NETLINK_QUEUE is not set
< # CONFIG_NETFILTER_NETLINK_LOG is not set
< # CONFIG_NF_CONNTRACK is not set
< CONFIG_NETFILTER_XTABLES=y
< # CONFIG_NETFILTER_XT_TARGET_CLASSIFY is not set
< # CONFIG_NETFILTER_XT_TARGET_MARK is not set
< # CONFIG_NETFILTER_XT_TARGET_NFLOG is not set
< # CONFIG_NETFILTER_XT_TARGET_NFQUEUE is not set
< # CONFIG_NETFILTER_XT_TARGET_RATEEST is not set
< # CONFIG_NETFILTER_XT_TARGET_TCPMSS is not set
< # CONFIG_NETFILTER_XT_MATCH_COMMENT is not set
< # CONFIG_NETFILTER_XT_MATCH_DCCP is not set
< # CONFIG_NETFILTER_XT_MATCH_DSCP is not set
< # CONFIG_NETFILTER_XT_MATCH_ESP is not set
< # CONFIG_NETFILTER_XT_MATCH_HASHLIMIT is not set
< # CONFIG_NETFILTER_XT_MATCH_IPRANGE is not set
< # CONFIG_NETFILTER_XT_MATCH_LENGTH is not set
< # CONFIG_NETFILTER_XT_MATCH_LIMIT is not set
< # CONFIG_NETFILTER_XT_MATCH_MAC is not set
< # CONFIG_NETFILTER_XT_MATCH_MARK is not set
< # CONFIG_NETFILTER_XT_MATCH_MULTIPORT is not set
< # CONFIG_NETFILTER_XT_MATCH_OWNER is not set
< # CONFIG_NETFILTER_XT_MATCH_PHYSDEV is not set
< # CONFIG_NETFILTER_XT_MATCH_PKTTYPE is not set
< # CONFIG_NETFILTER_XT_MATCH_QUOTA is not set
< # CONFIG_NETFILTER_XT_MATCH_RATEEST is not set
< # CONFIG_NETFILTER_XT_MATCH_REALM is not set
< # CONFIG_NETFILTER_XT_MATCH_RECENT is not set
< # CONFIG_NETFILTER_XT_MATCH_SCTP is not set
< # CONFIG_NETFILTER_XT_MATCH_STATISTIC is not set
< # CONFIG_NETFILTER_XT_MATCH_STRING is not set
< # CONFIG_NETFILTER_XT_MATCH_TCPMSS is not set
< # CONFIG_NETFILTER_XT_MATCH_TIME is not set
< # CONFIG_NETFILTER_XT_MATCH_U32 is not set
< # CONFIG_IP_VS is not set
< 
< #
< # IP: Netfilter Configuration
< #
< # CONFIG_NF_DEFRAG_IPV4 is not set
< # CONFIG_IP_NF_QUEUE is not set
< # CONFIG_IP_NF_IPTABLES is not set
< # CONFIG_IP_NF_ARPTABLES is not set
< CONFIG_BRIDGE_NF_EBTABLES=y
< CONFIG_BRIDGE_EBT_BROUTE=m
< CONFIG_BRIDGE_EBT_T_FILTER=m
< CONFIG_BRIDGE_EBT_T_NAT=m
< CONFIG_BRIDGE_EBT_802_3=m
< CONFIG_BRIDGE_EBT_AMONG=m
< CONFIG_BRIDGE_EBT_ARP=m
< CONFIG_BRIDGE_EBT_IP=m
< CONFIG_BRIDGE_EBT_LIMIT=m
< CONFIG_BRIDGE_EBT_MARK=m
< CONFIG_BRIDGE_EBT_PKTTYPE=m
< CONFIG_BRIDGE_EBT_STP=m
< CONFIG_BRIDGE_EBT_VLAN=m
< CONFIG_BRIDGE_EBT_ARPREPLY=m
< CONFIG_BRIDGE_EBT_DNAT=m
< CONFIG_BRIDGE_EBT_MARK_T=m
< CONFIG_BRIDGE_EBT_REDIRECT=m
< CONFIG_BRIDGE_EBT_SNAT=m
< CONFIG_BRIDGE_EBT_LOG=m
< CONFIG_BRIDGE_EBT_ULOG=m
< CONFIG_BRIDGE_EBT_NFLOG=m
---
> # CONFIG_NETFILTER is not set



Thanks.
 
**********************************************************************
This e-mail is the property of Lantronix. It is intended only for the person or entity to which it is addressed and may contain information that is privileged, confidential, or otherwise protected from disclosure. Distribution or copying of this e-mail, or the information contained herein, to anyone other than the intended recipient is prohibited.
