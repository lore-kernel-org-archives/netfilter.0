From: Paulo Ricardo Bruck <paulobruck1@gmail.com>
Subject: invalid type
Date: Tue, 28 Sep 2021 14:39:25 -0300
Message-ID: <CANSGRxSmW1HZwtZReU10S0Yf1bN2B1f1cV=P1OMbig2mx8=j4Q@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=fXtfYGMZZ+kkkU+9AnczIw9Ve9eJ55tdVUgkkcjYLRs=;
        b=kSjQneOr0SFg1OY1Is9INoWyo1t70vVgLsK10mFMXCwy4PnPmTEpocQFy7EDitX2Lc
         41gOIvFW2bFf9J5O3bwviIIjWKrs9Px03ByPWctNQhP3SbDhxgcszTkzm2hBiL5dZ/cg
         MoPRTtS4FEDdXhgGzViOMmR7TXNWE0MxEaPmRT44Gjn96+6lcRyCs6bNDGr5YRpHKINg
         /Hs1vMlwyCIc07h0SOHHI8Xn4naUFaTPp/V6bwQwB8kgTjUlj2qtAwrQrDlvTWokIpy0
         /Ub1Wz+EK1ZRI5S8QADdYiqddACEU5Vkk7E2W6K1U3hlvAlNZpI1bE+Ow3ZPl2S8Yyo6
         K44w==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi All

I have been studing portknocking and I see a problem like mine that
someone observed (  https://bbs.archlinux.org/viewtopic.php?id=239378)
and I have no clue how to solve.

This example is almost the same as nftables wiki:
https://wiki.nftables.org/wiki-nftables/index.php/Port_knocking_example
and result at same problem....

add set inet filter clientes_ipv4 { type ipv4_addr; flags timeout; }
add set inet filter clientes_ipv6 { type ipv6_addr; flags timeout; }

add set inet filter toctoc_aberta_ipv4 { type ipv4_addr . inet_service;
flags timeout; }
add set inet filter toctoc_aberta_ipv6 { type ipv6_addr . inet_service;
flags timeout; }

add inet filter INPUT tcp dport 21 add @toctoc_aberta_ipv4 {ip saddr . 2
2 timeout 60s}
add inet filter INPUT tcp dport 21 add @toctoc_aberta_ipv6 {ip6 saddr
. 22 timeout 60s}

after that:
nft list rulerset
.......
tcp dport 21 add @toctoc_aberta_ipv4 { ip saddr . 0x16 [invalid type]
timeout 1m }


Ubuntu 20.04
nftables 0.9.3-2

--
Paulo Ricardo Bruck consultor
