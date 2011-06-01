From: Nicolas Cavallari <Nicolas.Cavallari@lri.fr>
Subject: Bogus MAC in netfilter-queue for IF_MULTICAST_LOOPed packets.
Date: Wed, 01 Jun 2011 11:36:30 +0200
Message-ID: <4DE6081E.7060404@lri.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Multicast packets sent from local applications that use the
IF_MULTICAST_LOOP are to be sent to the specified interface as well as
being delivered to all local applications on the host listening for the
right multicast address. But i found that the looped packets for local
applications are being filtered in PREROUTING.

I want to accept them to not break local applications that depends on
it, but there isn't an easy way to accept them.

but in PREROUTING i also have a NFQUEUE target for incoming multicast
packets to do MAC-based accounting/filtering/marking, and these looped
packets are delivered with bogus source MAC addresses.

I found out that this bogus MAC address is taken from the IP header. For
example, the given looped packet :
45 00 00 3d 00 00 40 00 ff 11 ce 05 0a 00 01 02 e0 00 00 fb ....
yield this sMAC : 40:00:ff:11:ce:05, as if the IP header was treated as
a MAC header.

The LOG target display these packets as having no MAC address (Indeed,
the multicast loop code strips the MAC header). By looking at the code,
nf_queue.c and ipk_LOG.c access the mac address in different ways, and i
don't know which one should be used and what should be fixed.
