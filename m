From: J Doe <general@nativemethods.com>
Subject: Question regarding flow table selectors
Date: Mon, 14 Aug 2017 18:43:49 -0400
Message-ID: <F525A3F3-1F8C-4D8E-83D8-1BBCB81E7135@nativemethods.com>
Mime-Version: 1.0 (1.0)
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello,

I have a question regarding flow tables.

On the wiki [1], there is an example of a single selector flow table:

add rule filter input tcp dport 22 ct state new flow table ssh-ftable { ip saddr limit rate 10/second } accept

From this example, I am under the impression that:

* For inbound IPv4 TCP traffic to destination port 22 with state new
* The selector is the IPv4 source address of the connection

What I do not understand is if the connection rate limit is used to filter the flow table results (from nft list flow...), or whether this is used to restrict traffic on the rule (only allow traffic that is up to 10 packets per second).

Which one is it ?

Thanks,

- J

Sources
[1] https://wiki.nftables.org/wiki-nftables/index.php/Flow_tables
