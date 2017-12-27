From: paulo bruck <paulobruck1@gmail.com>
Subject: nftables wiki
Date: Wed, 27 Dec 2017 16:25:56 -0200
Message-ID: <CANSGRxRCziVkWq2JXOmR3atDZOhzciNLFM3LK6UP_H_2NFLymQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=qPIy4S/2tW2pa+KegMToPteA0MY5sQP/iD8OE++G1Pk=;
        b=vSA7w2KdWDF7TBGe+xyHnrEl8uv3Pv0nVsM7MOxJYl1YRzBeCnBcpW9o4pZVnk0lhc
         QtpJ5JA2WvMJVox9cPZMFIodM0sr3OxWMoD8NWNl/9vzfP81dyzps2J03i/IdfrFN+al
         V8EpZYu0JiYhZHjsaHTh3BKu9DJHXV/kGaDA9Gqx9IllnGXb67BBkIKJDRT+VLzFqEIZ
         DRJvMOncPuCHK84g1F9awRAiu3zb3voghGP41nvNDYNvGjp5yWbLfvbBuq/tzwTRGiS1
         xrJH69K7/yEWwE4bdU1EwYJfRpZT76UCB66rXRauPapQYLoiW+1O3Q883l/h3MGh33ff
         Y7eQ==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hy Guys. Me again 80)

I'm  studing nftables I think it would be  better IMHO to do a cut and
paste at link below that talks about   Sets



before
############################################
Named sets

You can create the named sets with the following command:

% nft add set filter blackhole { type ipv4_addr\;}

Note that blackhole is the name of the set in this case. The type
option indicates the data type that this  set stores, which is an IPv4
address in this case. Current maximum name length is 16 characters.

% nft add element filter blackhole { 192.168.3.4 }
% nft add element filter blackhole { 192.168.1.4, 192.168.1.5 }

Then, you can use it from the rule:

% nft add rule ip input ip saddr @blackhole drop

Named sets can be updated anytime, so you can add and delete element from them.

Eric Leblond in his Why you will love nftables article shows a very
simple example to compare iptables with nftables:

ip6tables -A INPUT -p tcp -m multiport --dports 23,80,443 -j ACCEPT
ip6tables -A INPUT -p icmpv6 --icmpv6-type neighbor-solicitation -j ACCEPT
ip6tables -A INPUT -p icmpv6 --icmpv6-type echo-request -j ACCEPT
ip6tables -A INPUT -p icmpv6 --icmpv6-type router-advertisement -j ACCEPT
ip6tables -A INPUT -p icmpv6 --icmpv6-type neighbor-advertisement -j ACCEPT

Which can be expressed in nftables with a couple of rules that provide a set:

% nft add rule ip6 filter input tcp dport {telnet, http, https} accept
% nft add rule ip6 filter input icmpv6 type { nd-neighbor-solicit,
echo-request, nd-router-advert, nd-neighbor-advert } accept
####################################################

after

######################################################
Eric Leblond in his Why you will love nftables article shows a very
simple example to compare iptables with nftables:

ip6tables -A INPUT -p tcp -m multiport --dports 23,80,443 -j ACCEPT
ip6tables -A INPUT -p icmpv6 --icmpv6-type neighbor-solicitation -j ACCEPT
ip6tables -A INPUT -p icmpv6 --icmpv6-type echo-request -j ACCEPT
ip6tables -A INPUT -p icmpv6 --icmpv6-type router-advertisement -j ACCEPT
ip6tables -A INPUT -p icmpv6 --icmpv6-type neighbor-advertisement -j ACCEPT

Which can be expressed in nftables with a couple of rules that provide a set:

% nft add rule ip6 filter input tcp dport {telnet, http, https} accept
% nft add rule ip6 filter input icmpv6 type { nd-neighbor-solicit,
echo-request, nd-router-advert, nd-neighbor-advert } accept


Named sets

You can create the named sets with the following command:

% nft add set filter blackhole { type ipv4_addr\;}

Note that blackhole is the name of the set in this case. The type
option indicates the data type that this set stores, which is an IPv4
address in this case. Current maximum name length is 16 characters.

% nft add element filter blackhole { 192.168.3.4 }
% nft add element filter blackhole { 192.168.1.4, 192.168.1.5 }

Then, you can use it from the rule:

% nft add rule ip input ip saddr @blackhole drop

Named sets can be updated anytime, so you can add and delete element from them.

#############################################################

best regards
