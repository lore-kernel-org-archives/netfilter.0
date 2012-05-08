From: Flo Wohlfart <wohlfart@in.tum.de>
Subject: Filtering of bogus ICMP packets
Date: Tue, 08 May 2012 11:19:10 +0200
Message-ID: <4FA8E50E.9010007@in.tum.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi,

I am using NAT (Network Address Translation) on a router running Debian 
Linux. Outgoing ICMP TTL exceeded packets (type 11) with a bogus 
checksum in the ICMP header are not blocked by this router.

My OpenWRT router, however, blocks outgoing ICMP TTL exceeded messages 
with a bogus ICMP checksum.

Debian and OpenWRT both use netfilter/iptables for NAT and packet 
filtering. How can one tell netfilter to filter bogus ICMP packets or 
not? Is there a configuration option? Which is the standard behavior?

Regards
Florian Wohlfart
