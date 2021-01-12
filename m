From: "Rafael David Tinoco" <rafaeldtinoco@ubuntu.com>
Subject: NFULNL_CFG_F_CONNTRACK and IPv6
Date: Tue, 12 Jan 2021 13:14:23 -0300
Message-ID: <57c4adaf-69c0-4135-a89c-095ed4785d22@www.fastmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org
Cc: Ken-ichirou MATSUZAWA <chamaken@gmail.com>, Pablo Neira Ayuso <pablo@netfilter.org>

Hello list, Ken-ichirou and Pablo,

I'm developing github.com/rafaeldtinoco/conntracker and, during my tests, I 
realized that the feature:

NFULNL_CFG_F_CONNTRACK

does not seem to be giving me conntrack feature for IPv6 (as it does with 
IPv4).I have checked xtables-monitor code and IPv6 tracing seems to be
working when using libnftnl.. but I want to maintain compatibility to old
distros when nf-tables is not available/used.

bug: https://github.com/rafaeldtinoco/conntracker/issues/1

TL;DR version is:

I have a conntrack NEW,ESTABLISHED rule for everything in raw (so all the flows 
are accounted). To each identified flow, listened through libnetfilter-
conntrack, I add a rule to trace its events.

I map conntrack <-> trace relation through NFULNL_CFG_F_CONNTRACK feature, this 
way I know exactly through which rules that flow passed.

Example:

 UDPv4 [  2] src = 10.250.91.1 (port=1024) to dst = 10.250.91.255 (port=57621)
	table: raw, chain: PREROUTING, type: rule, position: 1
        table: nat, chain: OUTPUT, type: policy, position: 1
        table: nat, chain: POSTROUTING, type: policy, position: 2
        table: filter, chain: INPUT, type: policy, position: 1
        table: filter, chain: OUTPUT, type: policy, position: 1

Unfortunately with:

nflog_nlmsg_parse(nlh, attrs), my attrs[NFULA_CT] is always NULL for IPv6:

 TCPv6 [  0] src = fe80::1453:5dff:fe1a:ca68 (port=1024) to dst = fe80::216:3eff:fe7f:aedd (port=22) (confirmed)
ICMPv6 [  0] src = fe80::1453:5dff:fe1a:ca68 to dst = fe80::216:3eff:fe7f:aedd (type=0 | code=0) (confirmed)
ICMPv6 [  1] src = fe80::1453:5dff:fe1a:ca68 to dst = fe80::3c76:fdff:fea2:82b4 (type=0 | code=0)

This can also be observed with:

libnetfilter-log/utils/nf-log.c code (if BUILD_NFCT)

which I used as a base for this part of the code.

Is there a reason why IPv6 conntrack info is not being sent through netlink ?

Thanks in advance!

-rafaeldtinoco
