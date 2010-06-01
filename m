From: "Umar Qureshey" <umar.qureshey@lantronix.com>
Subject: RE: Wireless interface dead after enabling CONFIG_NETFILTER
Date: Tue, 1 Jun 2010 15:41:06 -0700
Message-ID: <F24C979D1AFD4E4292B911441CBA242407FCF3@2putt.int.lantronix.com>
References: <F24C979D1AFD4E4292B911441CBA242407FCF2@2putt.int.lantronix.com> <alpine.LSU.2.01.1006020006360.29726@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-Class: urn:content-classes:message
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: netfilter@vger.kernel.org

-----Original Message-----
From: Jan Engelhardt [mailto:jengelh@medozas.de] 
Sent: Tuesday, June 01, 2010 3:07 PM
To: Umar Qureshey
Cc: netfilter@vger.kernel.org
Subject: Re: Wireless interface dead after enabling CONFIG_NETFILTER

On Tuesday 2010-06-01 23:41, Umar Qureshey wrote:

>Hi,
>
>I compiled a stock 2.6.28 kernel, enabling CONFIG_NETFILTER in order to
>get support for ebtables.  After getting it the images on my system, I
>notice that the wireless interface is associating correctly with the AP
>but no TCP/IP traffic is going on the interface.  Soon as I revert back
>to an kernel version where netfilter is disabled, I get my wireless
>working fine without a hitch.

Would that version be 2.6.34?

>The following is a diff between the compile options of a working kernel
>(> # Fri May 28 11:01:46 2010) and a broken one (< # Tue Jun  1
11:44:04
>2010):
>
>4c4
>< # Tue Jun  1 11:44:04 2010
>---
>> # Fri May 28 11:01:46 2010

ugh, please use standard unified diff format. this is unreadable 
otherwise.


Hi,

Both my kernels are 2.6.28.  Only difference is that one has netfilter
enabled while the other doesn't.  Below is standard unified diff between
the two 2.6.28 kernels.

--- ./with_netfilter_enabled/config.with_netfilter.not_working
2010-06-01 11:47:43.000000000 -0700
+++ ./working_no_netfilter/config.no_netfilter.working	2010-06-01
11:31:32.000000000 -0700
@@ -1,7 +1,7 @@
 #
 # Automatically generated make config: don't edit
 # Linux kernel version: 2.6.28
-# Tue Jun  1 11:44:04 2010
+# Fri May 28 11:01:46 2010
 #
 CONFIG_ARM=y
 CONFIG_SYS_SUPPORTS_APM_EMULATION=y
@@ -354,78 +354,7 @@
 # CONFIG_TCP_MD5SIG is not set
 # CONFIG_IPV6 is not set
 # CONFIG_NETWORK_SECMARK is not set
-CONFIG_NETFILTER=y
-# CONFIG_NETFILTER_DEBUG is not set
-CONFIG_NETFILTER_ADVANCED=y
-CONFIG_BRIDGE_NETFILTER=y
-
-#
-# Core Netfilter Configuration
-#
-# CONFIG_NETFILTER_NETLINK_QUEUE is not set
-# CONFIG_NETFILTER_NETLINK_LOG is not set
-# CONFIG_NF_CONNTRACK is not set
-CONFIG_NETFILTER_XTABLES=y
-# CONFIG_NETFILTER_XT_TARGET_CLASSIFY is not set
-# CONFIG_NETFILTER_XT_TARGET_MARK is not set
-# CONFIG_NETFILTER_XT_TARGET_NFLOG is not set
-# CONFIG_NETFILTER_XT_TARGET_NFQUEUE is not set
-# CONFIG_NETFILTER_XT_TARGET_RATEEST is not set
-# CONFIG_NETFILTER_XT_TARGET_TCPMSS is not set
-# CONFIG_NETFILTER_XT_MATCH_COMMENT is not set
-# CONFIG_NETFILTER_XT_MATCH_DCCP is not set
-# CONFIG_NETFILTER_XT_MATCH_DSCP is not set
-# CONFIG_NETFILTER_XT_MATCH_ESP is not set
-# CONFIG_NETFILTER_XT_MATCH_HASHLIMIT is not set
-# CONFIG_NETFILTER_XT_MATCH_IPRANGE is not set
-# CONFIG_NETFILTER_XT_MATCH_LENGTH is not set
-# CONFIG_NETFILTER_XT_MATCH_LIMIT is not set
-# CONFIG_NETFILTER_XT_MATCH_MAC is not set
-# CONFIG_NETFILTER_XT_MATCH_MARK is not set
-# CONFIG_NETFILTER_XT_MATCH_MULTIPORT is not set
-# CONFIG_NETFILTER_XT_MATCH_OWNER is not set
-# CONFIG_NETFILTER_XT_MATCH_PHYSDEV is not set
-# CONFIG_NETFILTER_XT_MATCH_PKTTYPE is not set
-# CONFIG_NETFILTER_XT_MATCH_QUOTA is not set
-# CONFIG_NETFILTER_XT_MATCH_RATEEST is not set
-# CONFIG_NETFILTER_XT_MATCH_REALM is not set
-# CONFIG_NETFILTER_XT_MATCH_RECENT is not set
-# CONFIG_NETFILTER_XT_MATCH_SCTP is not set
-# CONFIG_NETFILTER_XT_MATCH_STATISTIC is not set
-# CONFIG_NETFILTER_XT_MATCH_STRING is not set
-# CONFIG_NETFILTER_XT_MATCH_TCPMSS is not set
-# CONFIG_NETFILTER_XT_MATCH_TIME is not set
-# CONFIG_NETFILTER_XT_MATCH_U32 is not set
-# CONFIG_IP_VS is not set
-
-#
-# IP: Netfilter Configuration
-#
-# CONFIG_NF_DEFRAG_IPV4 is not set
-# CONFIG_IP_NF_QUEUE is not set
-# CONFIG_IP_NF_IPTABLES is not set
-# CONFIG_IP_NF_ARPTABLES is not set
-CONFIG_BRIDGE_NF_EBTABLES=y
-CONFIG_BRIDGE_EBT_BROUTE=m
-CONFIG_BRIDGE_EBT_T_FILTER=m
-CONFIG_BRIDGE_EBT_T_NAT=m
-CONFIG_BRIDGE_EBT_802_3=m
-CONFIG_BRIDGE_EBT_AMONG=m
-CONFIG_BRIDGE_EBT_ARP=m
-CONFIG_BRIDGE_EBT_IP=m
-CONFIG_BRIDGE_EBT_LIMIT=m
-CONFIG_BRIDGE_EBT_MARK=m
-CONFIG_BRIDGE_EBT_PKTTYPE=m
-CONFIG_BRIDGE_EBT_STP=m
-CONFIG_BRIDGE_EBT_VLAN=m
-CONFIG_BRIDGE_EBT_ARPREPLY=m
-CONFIG_BRIDGE_EBT_DNAT=m
-CONFIG_BRIDGE_EBT_MARK_T=m
-CONFIG_BRIDGE_EBT_REDIRECT=m
-CONFIG_BRIDGE_EBT_SNAT=m
-CONFIG_BRIDGE_EBT_LOG=m
-CONFIG_BRIDGE_EBT_ULOG=m
-CONFIG_BRIDGE_EBT_NFLOG=m
+# CONFIG_NETFILTER is not set
 # CONFIG_IP_DCCP is not set
 # CONFIG_IP_SCTP is not set
 # CONFIG_TIPC is not set

 
**********************************************************************
This e-mail is the property of Lantronix. It is intended only for the person or entity to which it is addressed and may contain information that is privileged, confidential, or otherwise protected from disclosure. Distribution or copying of this e-mail, or the information contained herein, to anyone other than the intended recipient is prohibited.
