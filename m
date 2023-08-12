From: Pierre-Philipp Braun <pbraun@nethence.com>
Subject: Re: failing fail-over - commit still in progress
Date: Sat, 12 Aug 2023 12:52:19 +0300
Message-ID: <df659821-cee6-9702-e259-9db8cf290316@nethence.com>
References: <910b44e4-06e8-19d6-45f0-06f886a2e812@nethence.com>
 <ZNYTF+uCod++Htl9@calendula>
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nethence.com;
        s=aug2022; t=1691833938;
        bh=wes5JQFPNQvaTWpzvPTq/ifbHTopBH0XgmgIAdhKSPA=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=GUfbLlmit+v1sXJF2o/kwb2V9g8+B7xOBJo78T+jy6HTm6K7kwn6cFtnVZ+KRBZv8
         DRtS9jH+JuKYi0No9rDpKZFhqcTAenzAeZ68xQPnL1+8PAAEX6Dbw56LO5JK3V5R9H
         tsFA5KYcxXWt25zdhZzu83kOGpsOR1NRDgkYVFeaK8D8hJXn9xrqPPM0JszxVJijD0
         XLY9nH4Qq0JnjeMtzsVRHQqO78Kljl8OrL/87VvKKeJhkbnEw4glSPFy9mP/jW8Lva
         5FLqEnWEfxKNpuVfiuS21L+CBIWbyjNgDQzjJ1eFP2A6QE4U+6761zcIgXDXTPaE6j
         EIAFwZSlElgFg==
Content-Language: en-US, fr
In-Reply-To: <ZNYTF+uCod++Htl9@calendula>
List-ID: <netfilter.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org


> Three nodes and FT-FW mode will not work. FT-FW would need to be
> extended to maintain sequence tracking for more than one single node.
> It is doable but this requires development effort.
> 
> For three node, you should try NOTRACK which means sync messages are
> sent from active to passive nodes without any kind of sequence
> tracking (best effort approach).

I switched to NOTRACK UDP but I get the same issue with the commit.

The inbound session is seen alright on all the nodes, although node3 (active vrrp) sees it both in internal and external cache.
The host where the guest lives sees it only in the internal cache this time.

(vrrp backup - here lives the guest)
pmr1: conntrack v1.4.7 (conntrack-tools): 203 flow entries have been shown.
pmr1: tcp      6 431976 ESTABLISHED src=176.59.99.113 dst=10.1.0.50 sport=57995 dport=22 src=10.1.0.50 dst=176.59.99.113 sport=22 dport=57995 [ASSURED] mark=0 use=1
pmr1: internal cache
pmr1: tcp      6 ESTABLISHED src=176.59.99.113 dst=10.1.0.50 sport=57995 dport=22 src=10.1.0.50 dst=176.59.99.113 sport=22 dport=57995 [ASSURED] [active since 60s]
pmr1: external cache

(vrrp backup)
pmr2: conntrack v1.4.7 (conntrack-tools): 139 flow entries have been shown.
pmr2: internal cache
pmr2: external cache
pmr2: tcp      6 ESTABLISHED src=176.59.99.113 dst=217.19.208.157 sport=57995 dport=50 [ASSURED] [active since 60s]

(active vrrp)
pmr3: tcp      6 431976 ESTABLISHED src=176.59.99.113 dst=217.19.208.157 sport=57995 dport=50 src=10.1.0.50 dst=176.59.99.113 sport=22 dport=57995 [ASSURED] mark=0 use=1
pmr3: conntrack v1.4.7 (conntrack-tools): 140 flow entries have been shown.
pmr3: internal cache
pmr3: tcp      6 ESTABLISHED src=176.59.99.113 dst=217.19.208.157 sport=57995 dport=50 src=10.1.0.50 dst=176.59.99.113 sport=22 dport=57995 [ASSURED]
[active since 60s]
pmr3: external cache
pmr3: tcp      6 ESTABLISHED src=176.59.99.113 dst=10.1.0.50 sport=57995 dport=22 [ASSURED] [active since 60s]

going for the acceptance test, node2 because active and that's a success (for once) - I didn't loose SSH connection to the guest system.
those are the states after fail-over to node2.

(backup vrrp - guest lives there)
pmr1: conntrack v1.4.7 (conntrack-tools): 198 flow entries have been shown.
pmr1: tcp      6 431992 ESTABLISHED src=176.59.99.113 dst=10.1.0.50 sport=57995 dport=22 src=10.1.0.50 dst=176.59.99.113 sport=22 dport=57995 [ASSURED] mark=0 use=1
pmr1: internal cache
pmr1: tcp      6 ESTABLISHED src=176.59.99.113 dst=10.1.0.50 sport=57995 dport=22 src=10.1.0.50 dst=176.59.99.113 sport=22 dport=57995 [ASSURED] [active since 187s]
pmr1: external cache

(active vrrp)
pmr2: conntrack v1.4.7 (conntrack-tools): 148 flow entries have been shown.
pmr2: tcp      6 431992 ESTABLISHED src=176.59.99.113 dst=217.19.208.157 sport=57995 dport=50 src=10.1.0.50 dst=176.59.99.113 sport=22 dport=57995 [ASSURED] mark=0 use=1
pmr2: internal cache
pmr2: tcp      6 ESTABLISHED src=176.59.99.113 dst=217.19.208.157 sport=57995 dport=50 src=10.1.0.50 dst=176.59.99.113 sport=22 dport=57995 [ASSURED]
mark=0 [active since 257s]
pmr2: external cache
pmr2: tcp      6 ESTABLISHED src=176.59.99.113 dst=217.19.208.157 sport=57995 dport=50 [ASSURED] [active since 636s]

(backup vrrp)
pmr3: tcp      6 431692 ESTABLISHED src=176.59.99.113 dst=217.19.208.157 sport=57995 dport=50 src=10.1.0.50 dst=176.59.99.113 sport=22 dport=57995 [ASSURED] mark=0 use=1
pmr3: conntrack v1.4.7 (conntrack-tools): 124 flow entries have been shown.
pmr3: internal cache
pmr3: tcp      6 ESTABLISHED src=176.59.99.113 dst=217.19.208.157 sport=57995 dport=50 src=10.1.0.50 dst=176.59.99.113 sport=22 dport=57995 [ASSURED]
[active since 636s]
pmr3: external cache
pmr3: tcp      6 ESTABLISHED src=176.59.99.113 dst=10.1.0.50 sport=57995 dport=22 [ASSURED] [active since 187s]

let us do it again!  Here we go, node1 became master and I lost connection.

node1 shows

[Sat Aug 12 12:43:03 2023] (pid=24942) [notice] committing all external caches
[Sat Aug 12 12:43:03 2023] (pid=24942) [notice] Committed 0 new entries
[Sat Aug 12 12:43:03 2023] (pid=24942) [notice] commit has taken 0.000017 seconds
[Sat Aug 12 12:43:03 2023] (pid=24942) [ERROR] ignoring flush command, commit still in progress
[Sat Aug 12 12:43:03 2023] (pid=24942) [notice] resync with master conntrack table
[Sat Aug 12 12:43:03 2023] (pid=24942) [notice] sending bulk update

node2 shows

[Sat Aug 12 12:37:51 2023] (pid=20216) [notice] committing all external caches
[Sat Aug 12 12:37:51 2023] (pid=20216) [ERROR] commit-create: File exists
Sat Aug 12 12:37:51 2023        tcp      6 60 SYN_RECV src=8.222.205.118 dst=10.1.0.11 sport=39230 dport=22
[Sat Aug 12 12:37:51 2023] (pid=20216) [notice] Committed 38 new entries
[Sat Aug 12 12:37:51 2023] (pid=20216) [notice] 1 entries can't be committed
[Sat Aug 12 12:37:51 2023] (pid=20216) [notice] commit has taken 0.000560 seconds
[Sat Aug 12 12:37:51 2023] (pid=20216) [ERROR] ignoring flush command, commit still in progress
[Sat Aug 12 12:37:51 2023] (pid=20216) [notice] resync with master conntrack table
[Sat Aug 12 12:37:51 2023] (pid=20216) [notice] sending bulk update

node3 shows

[Sat Aug 12 12:37:51 2023] (pid=21424) [notice] resync requested by other node
[Sat Aug 12 12:37:51 2023] (pid=21424) [notice] sending bulk update

states referring to that previously used port (57995/tcp) are as follows

(active vrrp and guest lives there)
pmr1: conntrack v1.4.7 (conntrack-tools): 198 flow entries have been shown.
pmr1: tcp      6 431958 ESTABLISHED src=176.59.99.113 dst=10.1.0.50 sport=57995 dport=22 src=10.1.0.50 dst=176.59.99.113 sport=22 dport=57995 [ASSURED] mark=0 use=1
pmr1: internal cache
pmr1: tcp      6 ESTABLISHED src=176.59.99.113 dst=10.1.0.50 sport=57995 dport=22 src=10.1.0.50 dst=176.59.99.113 sport=22 dport=57995 [ASSURED] mark=0 [active since 279s]
pmr1: external cache

(backup vrrp)
pmr2: conntrack v1.4.7 (conntrack-tools): 136 flow entries have been shown.
pmr2: tcp      6 431958 ESTABLISHED src=176.59.99.113 dst=217.19.208.157 sport=57995 dport=50 src=10.1.0.50 dst=176.59.99.113 sport=22 dport=57995 [ASSURED] mark=0 use=1
pmr2: internal cache
pmr2: tcp      6 ESTABLISHED src=176.59.99.113 dst=217.19.208.157 sport=57995 dport=50 src=10.1.0.50 dst=176.59.99.113 sport=22 dport=57995 [ASSURED]
mark=0 [active since 349s]
pmr2: external cache
pmr2: tcp      6 ESTABLISHED src=176.59.99.113 dst=217.19.208.157 sport=57995 dport=50 [ASSURED] [active since 728s]

(backup vrrp)
pmr3: tcp      6 431600 ESTABLISHED src=176.59.99.113 dst=217.19.208.157 sport=57995 dport=50 src=10.1.0.50 dst=176.59.99.113 sport=22 dport=57995 [ASSURED] mark=0 use=1
pmr3: conntrack v1.4.7 (conntrack-tools): 133 flow entries have been shown.
pmr3: internal cache
pmr3: tcp      6 ESTABLISHED src=176.59.99.113 dst=217.19.208.157 sport=57995 dport=50 src=10.1.0.50 dst=176.59.99.113 sport=22 dport=57995 [ASSURED]
[active since 728s]
pmr3: external cache
pmr3: tcp      6 ESTABLISHED src=176.59.99.113 dst=10.1.0.50 sport=57995 dport=22 [ASSURED] mark=0 [active since 279s]

I think it's not necessarily because of the three-node setup (I tried with two nodes and afair I got same commit issue).

>> Linux 5.16.20
> 
> BTW, why this kernel version? This is not any of the -stable kernels.

Because latest REISER4 *1 patch is for 5.16.  I downgraded to linux longterm 5.15 for the purpose of the tests tho, to avoid having anything too exotic.
The cluster farm is currently running linux 5.15.126 + drbd v9.2.5 module.

*1 https://lab.nethence.com/fsbench/2022-10.html

> BTW, you could merge these rules with a set, to have a less iptabl-ish
> ruleset.
> 
> With newer nftables version, I recommend to run -o/--optimization
> option to check for ruleset optimizations.

yup, thanks for the tip

In a further threat I would describe the issues I have if I switch to active/active mode by disabling external caches.
I've got another symptoms in that scenario.

-elge
