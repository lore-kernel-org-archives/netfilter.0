From: =?windows-1252?Q?Elie_Rosenblum?= <fnord@cosanostra.net>
Subject: ipset 5: bug in parser for ipv6 when restoring
Date: Tue, 21 Dec 2010 11:13:27 -0500
Message-ID: <vmime.4d10d227.18e9.441b13464d8e58aa@raven.cosanostra.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Entries added via ipset command line for ipv6 seem to work fine:
---example---
blinky:/etc/ipsets# ipset create localnets-v6 hash:net family inet6
blinky:/etc/ipsets# ipset add localnets-v6 fe80::/7
blinky:/etc/ipsets# ipset list localnets-v6
Name: localnets-v6
Type: hash:net
Header: family inet6 hashsize 1024 maxelem 65536
Size in memory: 9348
References: 0
Members:
fe00::/7
---end---

The problem occurs with restores:
---example---
blinky:/etc/ipsets# ipset save localnets-v6 > tmpset
blinky:/etc/ipsets# cat tmpset
create localnets-v6 hash:net family inet6 hashsize 1024 maxelem 65536
add localnets-v6 fe00::/7
blinky:/etc/ipsets# ipset destroy localnets-v6
blinky:/etc/ipsets# ipset restore < tmpset
ipset v5.0: Error in line 1: Syntax error: cannot parse fe00::: resolving to IPv4 address failed
---end---

The same thing happens with hash:ip and hash:ip,port type sets. It looks like restore is not sending the correct address family to the parsing functions, but command line add works correctly.

Thanks for all the great work - ipset5 has already simplified a lot of my management scripts vs. what I had to do to get what I wanted in ipset4.

