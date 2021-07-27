From: Jozsef Kadlecsik <kadlec@netfilter.org>
Subject: [ANNOUNCE] ipset 7.13 released
Date: Tue, 27 Jul 2021 12:35:16 +0200 (CEST)
Message-ID: <f5d9071-7558-17a-9cd1-6ac0922710@netfilter.org>
Mime-Version: 1.0
Return-path: <netfilter-devel-owner@vger.kernel.org>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org, netfilter-devel@vger.kernel.org

Hi,

I'm happy to announce ipset 7.13 - 7.12 was released but not announced due 
to additional fixes required in two patches.

Thanks to Pablo for the ipset to nftables translation infrastructure!

Userspace changes:
7.13
  - When parsing protocols by number, do not check it in /etc/protocols.
  - Add missing hunk to patch "Allow specifying protocols by number"

7.12
  - Allow specifying protocols by number (Haw Loeung)
  - Fix example in ipset.8 manpage discovered by Pablo Neira Ayuso.
  - tests: add tests ipset to nftables (Pablo Neira Ayuso)
  - add ipset to nftables translation infrastructure (Pablo Neira Ayuso)
  - lib: Detach restore routine from parser (Pablo Neira Ayuso)
  - lib: split parser from command execution (Pablo Neira Ayuso)
  - Fix patch "Parse port before trying by service name"

Kernel part changes:
7.13
  - Limit the maximal range of consecutive elements to add/delete fix

7.12
  - Limit the maximal range of consecutive elements to add/delete
  - Backport "netfilter: use nfnetlink_unicast()"
  - Backport "netfilter: nfnetlink: consolidate callback type"
  - Backport "netfilter: nfnetlink: add struct nfnl_info and
    pass it to callbacks"
  - Backport "netfilter: add helper function to set up the
    nfnetlink header and use it"

You can download the source code of ipset from:
        http://ipset.netfilter.org
        ftp://ftp.netfilter.org/pub/ipset/
        git://git.netfilter.org/ipset.git

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.hu
PGP key : https://wigner.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics
          H-1525 Budapest 114, POB. 49, Hungary
