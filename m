From: Tom <tom@foscore.com>
Subject: proper ICMPv6 syntax for specific daddr
Date: Wed, 7 Sep 2022 10:10:41 -0400
Message-ID: <dc512913-d28a-9224-ad5a-e68828975766@foscore.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foscore.com;
        s=deliv; t=1662559844;
        bh=wr9pSLBgarpoyyM9qcnhVj/MQJzQz/KMRqEgKE9BD60=;
        h=Date:To:From:Subject:From;
        b=XXDI5tNP4GO+/22FyVrfjw9QSN7I84s+G3Dxf5bJPC0IINK136DKA1DVPCzhnygvB
         neiPljaXmG8lRgsqL4vji3hhLhtIIHtLAETzo1DjAeVgeIHKCtb6JxRhcxx96EUzCW
         bbUVKVaCbC/z3j99JDMHomGcV4a4BEkxQf9IEWPk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foscore.com;
        s=deliv; t=1662559842;
        bh=wr9pSLBgarpoyyM9qcnhVj/MQJzQz/KMRqEgKE9BD60=;
        h=Date:To:From:Subject:From;
        b=OAuqOuz/qAKuskA+j5XJZe9/cH7LJfeCLZxyWRXU5Zh39gd80N56cLG5ygkpBiXFh
         IFnxb61Cf2BdFtL3CDlsocOZyG/WXKXoQucz5WYc3byoKVgPIDnfUzxn0FMNroLK9G
         yXvaPKl50W3kGOHTu8BYpB/O+FvQBfoq7EpjCutQ=
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

I can successfully enable ping for IPv6 using this rule:

nft add rule ip6 filter input ip6 nexthdr icmpv6 counter limit rate 5/second accept

I have one physical ethernet card which is assigned five IPv6 addresses.
What I want to do is enable it for only 2 of 5 IPv6 addresses, like so:

nft add rule ip6 filter input ip6 daddr xxxx:43:a:83::5 ip6 nexthdr icmpv6 counter limit rate 5/second accept
nft add rule ip6 filter input ip6 daddr xxxx:43:a:83::6 ip6 nexthdr icmpv6 counter limit rate 5/second accept

...but what happens is that the first IPv6 will work, but not the second. If I reverse the order, sometimes the second
rule still works but now the first doesn't.  I've tried using sets like so:

nft add rule ip6 filter input ip6 daddr @trusted ip6 nexthdr icmpv6 counter limit rate 5/second accept
nft add rule ip6 filter input ip6 daddr @admin ip6 nexthdr icmpv6 counter limit rate 5/second accept

... with the same result: the second rule is ignored. What am I doing wrong? Is there something about ICMP and multiple IP addresses

on one interface that I'm not aware of? How do I write multiple rules that each enable one daddr?
