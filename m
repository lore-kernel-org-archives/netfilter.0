From: "Umar Qureshey" <umar.qureshey@lantronix.com>
Subject: RE: Wireless interface dead after enabling CONFIG_NETFILTER
Date: Wed, 2 Jun 2010 09:31:56 -0700
Message-ID: <F24C979D1AFD4E4292B911441CBA242407FCF4@2putt.int.lantronix.com>
References: <F24C979D1AFD4E4292B911441CBA242407FCF2@2putt.int.lantronix.com><AANLkTilk7GnWPlclWk1tcFqs0XvdG2So4e6WZMgFAfOK@mail.gmail.com> <AANLkTimKVKIdkw8vcgSXw54RBrRfeDROrJxdarMOvEa1@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-Class: urn:content-classes:message
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ninad Adi <adi.ninad@gmail.com>
Cc: netfilter@vger.kernel.org

Hi,

No TCP/IP traffic meaning that when I sniffed the wireless packets using WireShark, I didn't see any ARP requests or any other TCP/IP traffic but rather just the association packets with the AP (Layer 2).
Without CONFIG_NETFILTER, the kernel boots, associates with AP, and the AP assigns a DHCP address to the wireless interface.
This is puzzling to say the least.

Here are my interfaces:

# iwconfig
lo        no wireless extensions.

eth0      no wireless extensions.

wlan0     IEEE 802.11  ESSID:"insurrection54g"
          Mode:Managed  Channel:6  Access Point: 00:1A:70:EE:2C:6F
          Bit Rate=48 Mb/s   Tx-Power=0 dBm
          RTS thr=2318 B   Fragment thr=2318 B
          Encryption key:off

# ifconfig
lo        Link encap:Local Loopback
          inet addr:127.0.0.1  Mask:255.0.0.0
          UP LOOPBACK RUNNING  MTU:16436  Metric:1
          RX packets:0 errors:0 dropped:0 overruns:0 frame:0
          TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:0
          RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)

wlan0     Link encap:Ethernet  HWaddr 00:20:4A:9D:00:8C
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:0 errors:0 dropped:0 overruns:0 frame:0
          TX packets:3 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000
          RX bytes:0 (0.0 B)  TX bytes:1818 (1.7 KiB)


As you can see, wlan0 is associated but no DHCP address has been assigned.  If I force udhcpc on the wlan0 interface, it keeps sending discover probes but nothing gets output on the radio!

Any tips would be greatly appreciated.

Regards,
Umar


From: Ninad Adi [mailto:adi.ninad@gmail.com] 
Sent: Tuesday, June 01, 2010 10:13 PM
To: Umar Qureshey
Cc: netfilter@vger.kernel.org
Subject: Fwd: Wireless interface dead after enabling CONFIG_NETFILTER


What Do you Mean by no TCP/IP traffic is going on the interface ??
Can you plz specify the state of your interface ??

On Wed, Jun 2, 2010 at 3:11 AM, Umar Qureshey <umar.qureshey@lantronix.com> wrote:
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





 
**********************************************************************
This e-mail is the property of Lantronix. It is intended only for the person or entity to which it is addressed and may contain information that is privileged, confidential, or otherwise protected from disclosure. Distribution or copying of this e-mail, or the information contained herein, to anyone other than the intended recipient is prohibited.
