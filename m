From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: [ANNOUNCE] ipset 6.10 released
Date: Fri, 25 Nov 2011 09:49:32 +0100 (CET)
Message-ID: <alpine.DEB.2.00.1111250946440.13101@blackhole.kfki.hu>
Mime-Version: 1.0
Return-path: <netfilter-devel-owner@vger.kernel.org>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org, netfilter-devel@vger.kernel.org

Hi,

I'm happy to announce ipset 6.10, which brings some corrections and fixes:

Userspace changes:
 - Tests added to check ICMP/ICMPv6 type/code parsing
 - ICMP/ICMPv6 type/code parser bug fixed (bug reported by Sabitov)
 - ipset: fix lookup of tcp port names (Stephen Hemminger)
 - Optionally disable building the kernel module (Mathieu Bridon)
 - Make tidy complete

Kernel part changes:
 - Invert the logic to include version.h in ip_set_core.c
 - Suppress false compile-time warnings about uninitialized variable ip_to

You can download the source code of ipset from:
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
