From: Matt Zagrabelny <mzagrabe@d.umn.edu>
Subject: Both { tcp, udp} in meta vmap
Date: Thu, 18 Nov 2021 18:44:22 -0600
Message-ID: <CAOLfK3XWGpo9OdjQy68DRp2BQ0ttaNsAznO3ed=Xg6Uky4mC0w@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p7.oit.umn.edu 4HwHxG3hRsz9vZ8G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=d.umn.edu; s=google;
        h=mime-version:from:date:message-id:subject:to;
        bh=nzMK1AapIdW5uVZDdLU+OG7XHFOXC+C9YPp3j0H6Ie0=;
        b=W86nUPurWAW720IQ50JBHVDGXPXJxf2VlArznSYLn4P1ghmOZ9UcjFpiMpKAPFTfDv
         DTZN+iuAq5RXZDozWJBORtbnDquoWpvLKn2ISqnI5qPIuVunu0prgi8q5M74pqHUFUcX
         w5NZBUIg8JgcTY/UbqYVX7202ZlcT7It/Ue1qdInXyOUxUP1RVIZhYHiKfQA/b0mzFV/
         UVsJrEF4m1CBgnybJ4HkZp4IqypVgjdlqPetxNs+EQtF6WEpYCwTPioL5Kdz1tBQ9vdZ
         +sQq3K3QnlhhrB06P/aJ1tr307O5i1IxU9lpB+bGn2WpFhx1Zh0wKUMcCkiCXEE88U25
         tq4w==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter <netfilter@vger.kernel.org>

Greetings,

I have the following rules:

table inet filter {
        chain input {
                type filter hook input priority 0; policy drop;
                ip6 nexthdr ipv6-icmp icmpv6 type { nd-router-advert,
nd-neighbor-solicit, nd-neighbor-advert } accept
                ct state vmap { invalid : drop, established : accept,
related : accept }
                tcp dport { 1812, 1813 } meta protocol vmap { ip :
jump radius_ipv4, ip6 : jump radius_ipv6 }
        }

        # contrived chains...
        chain radius_ipv4 {
                ip saddr { 127.0.0.0/8, } accept
        }

        chain radius_ipv6 {
                ip6 saddr { ::1 } accept
        }
}

I'd like to change the "tcp dport { 1812, 1813 }" to "{ tcp, udp }
dport { 1812, 1813 }", but I'm getting the error:

Error: syntax error, unexpected dport
Nov 18 18:14:52 localhost nft[5816]: { tcp, udp } dport { 1812, 1813 }
meta protocol vmap {

I see in the man page under the "RAW PAYLOAD EXPRESSION" there exists
the idea of giving a list or protocols...

       Matching destination port of both UDP and TCP.

           inet filter input meta l4proto {tcp, udp} @th,16,16 { 53, 80 }

       The above can also be written as

           inet filter input meta l4proto {tcp, udp} th dport { 53, 80 }

Is what I'm trying to do solvable with meta and vmap in one rule, or
should I just create two meta vmap rules?

Thanks for helping me learn and use nftables.

Cheers,

-m
