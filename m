From: Ludovic Ducros <ludovic.ducros@isep.fr>
Subject: Problem with h323-conntrack-nat.patch
Date: Mon, 16 Sep 2002 11:16:48 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <DGEFLNBBHJDEGJNHJIEMOEECCEAA.ludovic.ducros@isep.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

   Hi all,

   I have a very big problem to install the h323-conntrack-nat.patch.
I have a Linux Red Hat 7.3 with a 2.4.18-3 kernel : that's my gateway to
access the Internet.
I would like to use netmeeting on a computer with Win2000 connected to this
gateway.

Here is what I did :

1 - I untar the linux kernel sources 2.4.18 in /usr/src/linux-2.4.18
2 - I did the same with iptables-1.2.7a.
3 - In the directory patch-o-matic, I ran './runme extra' to patch with
h323-conntrack-nat.patch
    Here is the result :

****************************************************************************
*****

-------------------------------------------------------
Testing... h323-conntrack-nat.patch NOT APPLIED ( 3 missing files)
The newnat/h323-conntrack-nat patch:
   Author: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
   Status: Alpha

   This adds CONFIG_IP_NF_H323: H.323/netmeeting support module for
netfilter
   connection tracking and NAT. H.323 uses/relies on the following data
streams:

   Port         Description
   389          Internet Locator Server (TCP)
   522          User Location Server (TCP)
   1503                 T.120 Protocol (TCP)
   1720         H.323 (H.225 call setup, TCP)
   1731         Audio call control (TCP)
   Dynamic              H.245 call control (TCP)
   Dynamic              RTCP/RTP streaming (UDP)

   The H.323 conntrack/NAT modules support the connection tracking/NATing of
   the data streams requested on the dynamic ports. The helpers use the
   search/replace hack from the ip_masq_h323.c module for the 2.2 kernel
   series.

   At the very minimum, H.323/netmeeting (video/audio) is functional by
letting
   trough the 1720 port and loading these H.323 module(s).

   The H.323 conntrack/NAT modules do not support

   - H.245 tunnelling
   - H.225 RAS (gatekeepers)
-----------------------------------------------------------------
Do you want to apply this patch [N/y/t/f/a/r/b/w/v/q/?] y
Testing patch newnat/h323-conntrack-nat.patch...
   Placed new Config.in line
   Placed new Config.in line
   Placed new Configure.help entry
   Placed new Makefile line
Could not find place to slot in ip_conntrack.h line
Could not find place to slot in ip_conntrack.h line
Could not find place to slot in ip_conntrack.h line
TEST FAILED: patch NOT applied.

[Press enter to continue]

****************************************************************************
*****

At this point, I don't know what to do.
However, I tried other combinations with kernel version 2.4.16 & 2.4.18 and
iptables-1.2.6a & 1.2.7a, but all of them failed with the same trouble.
I cannot apply the needed patch.
I have been running in this problem for 15 days !!

   Any idea would be welcomed.

   Thanks a lot for your help.

   Ludo.


