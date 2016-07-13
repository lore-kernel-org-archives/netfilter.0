From: jalvarez <jalvarez@toulouse.viveris.com>
Subject: netfilter/nftables: chain rule dumps
Date: Wed, 13 Jul 2016 14:41:26 +0200
Message-ID: <578636F6.70802@toulouse.viveris.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi,

First I want to thank the netfilter developpers for nftables as it is 
really great ! :)

My problem is mostly about libnftnl / libmnl.

I am currently trying to port an IPTC application to work with nftables 
for a high performance firewall, those rules (~50000) are updated very 
often (from 5 to 60 times per second).
I know it is not really supported, but i can't afford using nft from 
command line as it is too slow and offers less control than the low 
level C APIs.

I have been looking at the code of libmnl, libnftnl and nftables, and I 
currently didn't see any way of doing the following :
- dumping the rules for a specific chain or table. I saw it is indeed 
possible to dump the rules for a specific family as it is done in 
mnl_nft_rule_dump, but i didn't see any way of doing so for a specific 
chain.
- getting the handle id of a rule after sending a message to add it 
without the need to dump the whole ruleset. In other words, is it 
possible to retrieve the handle of the rule right after its insertion to 
the ruleset ? Or is there a reliable way to predict this handle ?

Did I miss something ? Does those features exist or are they planned ?

I would need these because I want to avoid unnecessary dumping 
operations, as they were the bottleneck of the firewall when using IPTC 
(the whole -huge- ruleset was copied from kernel space to user space and 
back each time I wanted to do something with it).

Thank you very much for your help !
