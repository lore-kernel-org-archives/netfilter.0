From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: [ANNOUNCE] ipset 4.1 released
Date: Wed, 11 Nov 2009 20:35:47 +0100 (CET)
Message-ID: <alpine.DEB.2.00.0911112030200.25564@blackhole.kfki.hu>
Mime-Version: 1.0
Return-path: <netfilter-devel-owner@vger.kernel.org>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org, netfilter-devel@vger.kernel.org

Hi,

A minor fix and little improvement, but it worths a new release :-):

Kernel part changes:
  - Do not use init_MUTEX either (Jan Engelhardt)
  - Improve listing/saving hash type of sets by not copying empty
    entries unnecessarily to userspace.

Userspace changes:
  - Manpage fixes and corrections (Jan Engelhardt)

As usual, the source code can be download from

        http://ipset.netfilter.org
        git://git.netfilter.org/ipset.git

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
