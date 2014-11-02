From: Dennis Jacobfeuerborn <dennisml@conversis.de>
Subject: Recommended hardware for iptables based firewall/router
Date: Sun, 02 Nov 2014 04:51:28 +0100
Message-ID: <5455AA40.6050302@conversis.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,
we recently bought an Uqbiquity EdgeRouter Pro but it seems the claims
about 2 Mio. pps that it should be able to handle are not real-world
numbers. We are running about 120mbit through this system and are
already seeing the two risc cores struggling with high softirq load and
packet drops.

So my question is what a good hardware base would look like for a linux
based firewall using iptables/conntrack/ipset. Do offload features help
or can't these be used because iptables needs to process the packets
anyway? I assume multiqueuing would be nice too.
The idea is to be able to actually process 1gbit of traffic i.e. handle
two gbit ports (WAN and LAN) at wire-speed.

Does anyone have any specific recommendations for NICs and maybe tips
for other bottlenecks to look out for?

Regards,
  Dennis
