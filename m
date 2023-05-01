From: Rvfg <i@rvf6.com>
Subject: ct state vmap no longer works on 6.3 kernel
Date: Mon, 1 May 2023 21:58:52 +0800
Message-ID: <a2c6386f-d339-9774-387a-f20fa8aa28e6@rvf6.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=rvf6.com; s=dkim;
        t=1682949536; bh=YKVdRMs33lOOYEPAty7tXp7ssjdiWJxmXiLoG5iienY=;
        h=Date:To:From:Subject;
        b=IevmabzfGrT8I9LYbvjX4aee+wrpyFdMAU0f6chCyWAPdpQGTfD9lVPHsL9+Nn9Vs
         LPIvcT2e3WUT1F15hIULS86dDuiDdUliAy8nTQylpq2Q7h94Swm3qL7ZjABWAQpVGw
         I5m7HJJsKDqjob7BrmCnHk53i8jupExrDRABnlq31pO0k76Smzuo3l45qCs0MCIyse
         uq6eDuJhkcHv9r4HZOEvt0bQuEScB4Lm4tdvdSVKUdnDZImuDYwODnEEnReDSRmWdA
         aSigs/aZn1Gzh5DoAdgARvtzi+ZqWW6K4w/ASf9CStSOqMsPjHj3xDM2Su2Q/bRuF6
         4qrrPKvInlH0g==
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: netfilter@vger.kernel.org

Hi. I recently upgraded to 6.3 kernel and I noticed my nftables starts 
dropping incoming ipv6 router advertisement packets. Here is my input 
chains:

|chain input {||
||        type filter hook input priority filter; policy drop;||
||        iifname "lo" accept comment "trusted interfaces"||
||        ct state vmap { invalid : drop, established : accept, related 
: accept, * : jump input-allow }||
||}||
||
||chain input-allow {||
||        meta l4proto ipv6-icmp meta nftrace set 1||
||        tcp dport { 22, 22000 } accept||
||        udp dport { 21027, 22000 } accept||
||        icmp type echo-request limit rate 20/second accept comment 
"allow ping"||
||        icmpv6 type != { nd-redirect, 139 } accept||
||        ip6 daddr fe80::/64 udp dport 546 accept comment "DHCPv6 client"||
||}|

This setup used to work fine. But now RA packets never go through the 
input-allow chain (not show up in nftrace). Something must be wrong in 
the "ct state vmap" rule. I'm able to work around this by adding a "jump 
input-allow" rule at the ending of "chain input".

I found 
https://github.com/torvalds/linux/commit/d9e7891476057b24a1acbf10a491e5b9a1c4ae77 
might be relevant (not tested yet). I'm not very familiar with the 
kernel. But the return NFT_BREAK in nft_ct_fast.c caught my eye. Is this 
the cause?

Thanks.

