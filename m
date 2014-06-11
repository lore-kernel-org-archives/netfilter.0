From: Michael <pistenflitzer@alpenjodel.de>
Subject: Problems to get started with nftables
Date: Wed, 11 Jun 2014 20:25:11 +0200
Message-ID: <op.xiag4xyrdwu75w@alpenjodel.de>
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter user mailinglist <netfilter@vger.kernel.org>

Dear all,

I have some problems, that might well be due to my lack of understanding
nftables: My rules look like this:

table filter {
        chain input {
                 type filter hook input priority 0;
                 icmp type { echo-request } limit rate 5/second counter accept
        }
}

table ip6 filter {
        chain input {
                 type filter hook input priority 0;
                 icmpv6 type { nd-neighbor-advert, nd-neighbor-solicit, nd-router-advert } ip6 hoplimit 255 counter log prefix "log1: " accept
                 icmpv6 type { echo-request } limit rate 5/second counter accept
        }
}

table inet filter {
        chain input {
                 type filter hook input priority 1;
                 ct state { established, related } accept
                 ct state invalid counter log prefix "log2: " drop
                 iif lo accept
#                 udp sport bootps dport bootpc accept
                 counter log prefix "log3: " drop
        }

        chain output {
                 type filter hook output priority 1;
                 ct state { new, established, related } accept
                 ct state invalid counter log prefix "log4: " drop
                 oif lo accept
        }
}


What I observe when I load these rules is that the accept in the log1 line is
not enough to accept the packets. They are ultimately dropped in the log3
rule. How do I get the packets through both rule chains?

The second problem is in the
#                 udp sport bootps dport bootpc accept
line. I've seen examples with this syntax, but it's not accepted for me. What
is the correct syntax to filter on both dport and sport? I've tried using and
or &, but that didn't work either.

And finally: Is there a way to match the destination mac address of an
incoming packet?

I'm running nftables 0.2 on kernel 3.14.4.

Best,
Michael
