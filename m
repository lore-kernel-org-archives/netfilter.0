From: Reindl Harald <h.reindl@thelounge.net>
Subject: Re: RFC -- IPTABLES vs NFTABLES vs BPFILTER
Date: Fri, 27 Dec 2019 04:51:13 +0100
Message-ID: <81e0e24a-df5b-3c3a-f1f4-514d8406886d@thelounge.net>
References: <4c563d84-2098-9c5e-86ef-b78c704540a6@satchell.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4c563d84-2098-9c5e-86ef-b78c704540a6@satchell.net>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: list@satchell.net, netfilter@vger.kernel.org


Am 27.12.19 um 03:32 schrieb Stephen Satchell:
> 5.  I decided against populating the routing table with null routes from
> the bogon project.  I do populate the routing table with null routes
> from those netblocks that send me malicious traffic.  This mimics the
> ACL blocking I currently do in IPTABLES, with much lower overhead

i doubt that it has lower overhead than a ipset in "-t raw" PREROUTING
which happens before routing decisions or conntrack

such things simply don't belong into the default filter table

-----------------------------------------------------------------------------------------------------
IPV4 TABLE RAW (STATELESS PRE-CONNTRACK)
-----------------------------------------------------------------------------------------------------
Chain PREROUTING (policy ACCEPT 0 packets, 0 bytes)
num   pkts bytes target     prot opt in     out     source
 destination
1     163M   62G INBOUND    all  --  wan    *       0.0.0.0/0
 0.0.0.0/0
2     285M  209G ACCEPT     tcp  --  *      *       0.0.0.0/0
 0.0.0.0/0
3      43M   16G ACCEPT     udp  --  *      *       0.0.0.0/0
 0.0.0.0/0
4      29M 2356M ACCEPT     icmp --  *      *       0.0.0.0/0
 0.0.0.0/0
5       41  1460 DROP       all  --  *      *       0.0.0.0/0
 0.0.0.0/0

Chain OUTPUT (policy ACCEPT 3188K packets, 422M bytes)
num   pkts bytes target     prot opt in     out     source
 destination

Chain INBOUND (1 references)
num   pkts bytes target     prot opt in     out     source
 destination
1     112K 6110K DROP       all  --  *      *       0.0.0.0/0
 0.0.0.0/0            match-set BLOCKED_MERGED_IPV4 src
