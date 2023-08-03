From: toml <toml@thlu.de>
Subject: Incomprehensible behavior
Date: Thu, 03 Aug 2023 16:37:59 +0200
Message-ID: <deb6fbeeb06a5c39b9f2ea7ba7a0060c3e723d64.camel@mail>
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
List-ID: <netfilter.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/markdown; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello @ all

I'm still struggling anymore with the new syntax at ApplicationLayerGateway=
/FTP and testing with smallest steps. In doing so I have now come across th=
e following effect. I have 2 test-rules here, both of which i expected to c=
ompletely block any outgoing traffic.

But as you can see from the second example in the counter, only here is blo=
cked. The first example has no effect at all, everything works as if it was=
 not blocked.

# nft list ruleset
table ip filter {
    chain output {
        type filter hook output priority 0; policy drop;
        meta pkttype { 0, 1, 2 } accept
        counter packets 0 bytes 0 reject with icmp 13
    }
}

# nft list ruleset
table ip filter {
    chain output {
        type filter hook output priority 0; policy drop;
        meta pkttype { 1, 2 } accept
        counter packets 1858 bytes 165434 reject with icmp 13
    }
}

Is this a desired behavior, when a unicast-accept virtually neutralizes the=
 complete filter? How do I deal with this problem?

Best Regards
Thomas
