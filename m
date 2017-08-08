From: J Doe <general@nativemethods.com>
Subject: Error on wiki.nftables.org
Date: Tue, 8 Aug 2017 17:54:54 -0400
Message-ID: <39295EC6-BEB7-4861-8346-28E0BADFCC1F@nativemethods.com>
Mime-Version: 1.0 (1.0)
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello,

I believe I have found an error on the nftables wiki on the "Jumping to chain" page [1].

Under the "jump vs goto" section, the example of jump and the example of goto repeat the destination port keyword ("dport").

Example of jump on the line after "# this is the 1 matching rule" shows:

ip saddr 1.1.1.1 ip daddr 2.2.2.2 tcp dport 111 tcp dport 222 jump other-chain

It should be:

ip saddr 1.1.1.1 ip daddr 2.2.2.2 tcp sport 111 tcp dport 222 jump other-chain

This also applies to the line after "# this is the 3 matching rule.  It shows:

ip saddr 1.1.1.1 ip daddr 2.2.2.2 tcp dport 111 tcp dport 222 accept

It should be:

ip saddr 1.1.1.1 ip daddr 2.2.2.2 tcp sport 111 tcp dport 222 accept

I attempted to change this but could not find a way to create a wiki account.  Currently one can only login if an account exists.

Thanks,
- J

Sources:
[1] https://wiki.nftables.org/wiki-nftables/index.php/Jumping_to_chain
