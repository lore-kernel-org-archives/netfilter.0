From: Carl Lei <me@xecycle.info>
Subject: nft tproxy failed to redirect on one system
Date: Fri, 11 Aug 2023 12:00:43 +0800
Message-ID: <6C790DD9C154BA04+20230811120043.0c3c6302@xcws1>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi all,

I have two systems with very similar config, but tproxy failed to
redirect on one of them.  I have a program listening on *:1081, and
want to redirect daddr 198.18.0.0/16 & tcp to this program; I set in
the route table like

local 198.18.0.0/16 dev lo proto static scope host

without policy selectors in `ip rule`; and my (incomplete) nftables
config is like:

table inet filter {

    chain input {
        type filter hook input priority filter; policy drop;
        ct state vmap {
            related : accept, established : accept,
            invalid : drop,
            new : jump input-new,
        }
    }

    chain input-new {
        iifname vmap {
            vbr0 : jump input-new-isolated,
            lo : accept,
        }
        icmp type echo-request accept
    }

    chain input-new-isolated {
        meta mark 42 counter accept
        fib daddr . iif type != { local, broadcast, multicast } drop
        icmp type echo-request accept
        icmpv6 type { echo-request, } accept
        reject
    }

    chain mangle {
        type filter hook prerouting priority mangle; policy accept;
        ip daddr 198.18.0.0/16 meta l4proto tcp tproxy ip to :1081 meta
    mark set 42 accept }
}

Sorry for being incomplete, but I added nftrace before these rules and
saw packets went through the same chain of rules, first hitting tproxy
in mangle, then meta mark 42 counter accept in input-new-isolated.  But
on one system it works for local programs AND network-received packets,
on another system it works only for local programs.  On the bad system
the packets instead gets directed to whatever program originally
listening on the original port, or rejected; e.g. I have an nginx
listening on 0.0.0.0:80 but no programs on 443, then curl http in a vm
connected to vbr0 goes to my nginx, and curl https gets rejected.  I
expect them to go to that program listening on 1081.

What should I check next?

