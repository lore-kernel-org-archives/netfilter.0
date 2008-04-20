From: Petr Pisar <petr.pisar@atlas.cz>
Subject: conntrack-tools can't filter IPv6 address
Date: Sun, 20 Apr 2008 19:04:57 +0000 (UTC)
Message-ID: <slrng0n4ud.ilc.petr.pisar@album.ics.muni.cz>
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello,

I'm using latest stable varsion of conntrack-tools with latest libraries
on Linux 2.6.24.3 and I think conntrack tool can't filter IPv6 address
in opposite to IPv4 address.

If I write something like 

# conntrack -L -f ipv6 -d '2002:5ab0:12ed:1:20c:f1ff:fe85:7b99'

I will get a lot of IPv6 records that doesn't match the destination
address. (The same for -s match). Matching IPv6 seems broken.

-- Petr


