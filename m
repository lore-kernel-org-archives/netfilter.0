From: Jeff Kletsky <netfilter@allycomm.com>
Subject: [nftables][git] Current nftables HEAD requires new version of
 libnftnl
Date: Fri, 25 Aug 2017 10:17:54 -0700
Message-ID: <00ce74ec-0be9-fbcb-be8d-191c80127fa5@wagsky.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: netfilter@vger.kernel.org

If anyone else tries a local build of nftables based on the current HEAD

~/build/nftables$ git log -1
commit d3d56d0fe1856b7fe27584eb90e8349e883cd56b (HEAD -> master, tag: 
2017-08-25, origin/master, origin/HEAD)
Author: Pablo Neira Ayuso <pablo@netfilter.org>
Date:   Thu Aug 24 17:56:38 2017 +0200


a current version of libnftl appears required to avoid the following error

netlink_linearize.c: In function 'netlink_gen_exthdr_stmt':
netlink_linearize.c:836:28: error: 'NFTNL_EXPR_EXTHDR_SREG' undeclared 
(first use in this function)
   netlink_put_register(nle, NFTNL_EXPR_EXTHDR_SREG, sreg);
                             ^

The version of libnftl that caused that error was build from HEAD as of 
2017-08-19



The version of libnftl I am now using successfully is

~/build/libnftnl$ git log -1
commit 75fd5f1cd6fff96a6aef97a14f7916c984da53ef (HEAD -> master, tag: 
2017-08-25, origin/master, origin/HEAD)
Author: Florian Westphal <fw@strlen.de>
Date:   Fri Jul 28 12:29:35 2017 +0200


Jeff


