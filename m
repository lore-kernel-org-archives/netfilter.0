From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: [ANNOUNCE] ipset 6.2 released
Date: Sun, 27 Mar 2011 21:30:35 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1103272124170.3535@blackhole.kfki.hu>
Mime-Version: 1.0
Return-path: <netfilter-devel-owner@vger.kernel.org>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org, netfilter-devel@vger.kernel.org

Hi,

I'm happy to announce ipset 6.2.

Important note: if you want to use the list:set type with timeout, you 
must upgrade, because in earlier releases the type in the timeout variant 
was completely broken. The bugs did not affect other types or the list:set 
type without timeout.

kernel part:
 - list:set timeout variant fixes
 - References are protected by rwlock instead of mutex
 - Add explicit text message to detect patched kernel (netlink.patch)
 - Timeout can be modified for already added elements

userspace part:
 - Manpage update

You can download the source code from:
        http://ipset.netfilter.org
        ftp://ftp.netfilter.org/pub/ipset/
        git://git.netfilter.org/ipset.git

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
