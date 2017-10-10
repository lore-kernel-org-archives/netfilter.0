From: "Deposite Pirate" <dpirate@metalpunks.info>
Subject: nftables equivalent for ebtables BROUTING trick?
Date: Tue, 10 Oct 2017 16:55:18 +0000
Message-ID: <4ae5fa0e59d6c81beedfe2cc313ea3e9@webmail.metalpunks.info>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,

I would like to use nftables instead of {eb,ip,ip6,arp}tables on my router,
but I'm not sure it's possible to do a "trick" ebtables can do with the
BROUTING hook. I did a search engine query for "nftables BROUTING" but not
much came up that deals with the problem. I also tried to translate the
ebtables rule to nftables but that didn't work either. What I'm trying to
do with nftables is to drop all non IPv6 traffic to the underlying bridged
interfaces. With ebtables you can do:

ebtables -t broute -A BROUTING -p ! ipv6 -j DROP

The non-IPv6 traffic won't be really discarded but will be routed to the
underlying interfaces. This allows to have NAT'ed IPv4 as usual and a
bridge for IPv6. No need for hacks to proxy NDP traffic from the upstream
ISP router with this setup. nftables doesn't seem to be able to use the
BROUTING hook. But perhaps there's another way to achieve the same thing?

Regards,
