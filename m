From: leroy christophe <christophe.leroy@c-s.fr>
Subject: issue with nftable - goto : Operation not supported
Date: Tue, 25 Nov 2014 18:29:53 +0100
Message-ID: <5474BC91.6060108@c-s.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Using nft, i'm trying to jump to another table from the end of a table 
and I get the following error.

root@localhost:~# nft add rule filter input  goto accs
<cmdline>:1:1-31: Error: Could not process rule: Operation not supported
add rule filter input goto accs
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

What could be the reason ?

I'm using
* nftables-20141121
* gmp-4.3.2
* libmnl-1.0.3
* libnfnetlink-1.0.1
* libnftnl-20141121
* libnetfilter_conntrack-1.0.4

Christophe

