From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: [ANNOUNCE] ipset-2.4.9
Date: Wed, 11 Feb 2009 14:24:31 +0100 (CET)
Message-ID: <alpine.DEB.2.00.0902111416470.15665@blackhole.kfki.hu>
Mime-Version: 1.0
Return-path: <netfilter-devel-owner@vger.kernel.org>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org, netfilter-devel@vger.kernel.org

Hello,

(Daily releases, what a pace! :-).

In the previous release, the old include file was referred instead of the 
new one, so the faster/better hash function was *not* in use. In 2.4.9 the 
header include is fixed and now the hash types benefit from the new hash 
function.

You can download the new tarball from http://ipset.netfilter.org/ or 
directly from git://git.netfilter.org/ipset.git.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
