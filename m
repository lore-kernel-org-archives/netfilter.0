From: =?koi8-r?B?6cfP0tgg79PJzg==?= <osin@vita-samara.ru>
Subject: pom-ng h323-conntrack-nat failure
Date: Mon, 21 Mar 2005 17:47:30 +0400
Message-ID: <000301c52e1c$86d38be0$7900000a@vita.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: netfilter@lists.netfilter.org

kernel 2.6.11
iptables-1.3.1.
patch-o-matic-ng-20050320


# ./runme h323-conntrack-nat
Hey! KERNEL_DIR is not set.
Where is your kernel source directory? [/usr/src/linux]
Hey! IPTABLES_DIR is not set.
Where is your iptables source code directory? [/usr/src/iptables]
Loading patchlet 
definitions............................................................................................. 
done
Welcome to Patch-o-matic ($Revision: 3733 $)!

Kernel:   2.6.11, /usr/src/linux
Iptables: 1.3.1, /usr/src/iptables
Each patch is a new feature: many have minimal impact, some do not.
Almost every one has bugs, so don't apply what you don't need!
-------------------------------------------------------
Already applied:

Testing h323-conntrack-nat... not applied
The h323-conntrack-nat patch:
   Author: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>, Max Kellermann 
<max@duempel.org>
   Status: Alpha


This adds CONFIG_IP_NF_H323: H.323/netmeeting support module for netfilter
connection tracking and NAT. H.323 uses/relies on the following data 
streams:

        Port            Description
        389             Internet Locator Server (TCP)
        522             User Location Server (TCP)
        1503            T.120 Protocol (TCP)
        1720            H.323 (H.225 call setup, TCP)
        1731            Audio call control (TCP)
        Dynamic         H.245 call control (TCP)
        Dynamic         RTCP/RTP streaming (UDP)

The H.323 conntrack/NAT modules support the connection tracking/NATing of
the data streams requested on the dynamic ports. The helpers use the
search/replace hack from the ip_masq_h323.c module for the 2.2 kernel
series.

At the very minimum, H.323/netmeeting (video/audio) is functional by letting
trough the 1720 port and loading these H.323 module(s).

The H.323 conntrack/NAT modules do not support

- H.245 tunnelling
- H.225 RAS (gatekeepers)
-----------------------------------------------------------------
Do you want to apply this patch [N/y/t/f/a/r/b/w/q/?] Y
unable to find ladd slot in src 
/tmp/pom-19236/include/linux/netfilter_ipv4/ip_conntrack.h
-----------------------------------------------------------------
Do you want to apply this patch [N/y/t/f/a/r/b/w/q/?]
.... 


