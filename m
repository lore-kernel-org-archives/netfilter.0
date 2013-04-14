From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: [ANNOUNCE] ipset 6.18 released
Date: Sun, 14 Apr 2013 20:40:29 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1304142033480.7793@blackhole.kfki.hu>
Mime-Version: 1.0
Return-path: <netfilter-devel-owner@vger.kernel.org>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org, netfilter-devel@vger.kernel.org

Hi,

The new ipset version is a bugfix release and three kernel part bugs are 
fixed in it. The most important is the hash:*net* patch: if such a set is 
resized and there are elements in the set with the "nomatch" flag, then 
those elements are not matched properly after the resize.

Kernel part changes:
  - bitmap:ip,mac: fix listing with timeout (reported by Yoann JUET)
  - hash:*net*: nomatch flag not excluded on set resize
  - list:set: update reference counter when last element pushed off

You can download the source code of ipset from:
        http://ipset.netfilter.org
        ftp://ftp.netfilter.org/pub/ipset/
        git://git.netfilter.org/ipset

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
          H-1525 Budapest 114, POB. 49, Hungary
