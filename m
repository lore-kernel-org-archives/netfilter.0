From: Jozsef Kadlecsik <kadlec@netfilter.org>
Subject: [ANNOUNCE] ipset 7.17 released
Date: Fri, 30 Dec 2022 13:42:47 +0100 (CET)
Message-ID: <c4a91b1a-821f-9c3b-735-fca0c554d950@netfilter.org>
Mime-Version: 1.0
Return-path: <netfilter-devel-owner@vger.kernel.org>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org, netfilter-devel@vger.kernel.org

Hi,

I'm happy to announce ipset 7.17, which includes two important fixes: 
handle 0/0 subnets properly in hash:net,port,net types and a reworking
to add/delete multiple entries in one step for all hash types.

Userspace changes:
  - Tests: When verifying comments/timeouts, make sure entries don't 
    expire
  - Tests: Make sure the internal batches add the correct number of 
    elements
  - Tests: Verify that hash:net,port,net type can handle 0/0 properly
  - Makefile: Create LZMA-compressed dist-files (Phil Sutter)

Kernel part changes:
 - netfilter: ipset: Rework long task execution when adding/deleting 
   entries
 - netfilter: ipset: fix hash:net,port,net hang with /0 subnet

You can download the source code of ipset from:
        https://ipset.netfilter.org
        git://git.netfilter.org/ipset.git

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.hu
PGP key : https://wigner.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics
          H-1525 Budapest 114, POB. 49, Hungary

