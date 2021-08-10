From: Jozsef Kadlecsik <kadlec@netfilter.org>
Subject: [ANNOUNCE] ipset 7.15 released
Date: Tue, 10 Aug 2021 11:20:51 +0200 (CEST)
Message-ID: <37635e40-d279-8f10-a3d1-c33d36923836@netfilter.org>
Mime-Version: 1.0
Return-path: <netfilter-devel-owner@vger.kernel.org>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org, netfilter-devel@vger.kernel.org

Hi,

The new ipset 7.15 release contains a single fix against the previous 
version: a condition was wrongly placed in the hash:ip,port,net kernel 
module. Please upgrade to the new release.

Kernel part changes:
  - netfilter: ipset: Fix maximal range check in hash_ipportnet4_uadt() 
    (Nathan Chancellor)

You can download the source code of ipset from:
        https://ipset.netfilter.org
        ftp://ftp.netfilter.org/pub/ipset/
        git://git.netfilter.org/ipset.git

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
          H-1525 Budapest 114, POB. 49, Hungary
