From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: [ANNOUNCE] ipset-4.2 released
Date: Sun, 24 Jan 2010 15:58:41 +0100 (CET)
Message-ID: <alpine.DEB.2.00.1001241554550.19199@blackhole.kfki.hu>
Mime-Version: 1.0
Return-path: <netfilter-devel-owner@vger.kernel.org>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org, netfilter-devel@vger.kernel.org

Hi,

A new version of ipset released, which fixes a listing/saving bug. Here 
follows the changelog:

kernel part:
  - nethash and ipportnethash types counted every entry twice
    which could produce bogus entries when listing/saving these types
    of sets (bug reported by Husnu Demir)

userspace:
  - Checking null entries when listing/saving hash types of sets
    deleted because it's unnecessary and can mask possible errors.

As usual, the source can be download from

        http://ipset.netfilter.org
        git://git.netfilter.org/ipset.git

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
