From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: [ANNOUNCE] ipset-2.4.3 released
Date: Sat, 25 Oct 2008 15:09:48 +0200 (CEST)
Message-ID: <Pine.LNX.4.64.0810251505360.30759@blackhole.kfki.hu>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org, netfilter-deve@blackhole.kfki.hu

Hello,

The newest release of the week of ipset releases ;-) contains a small fix 
to compile ipset cleanly in all environments:

  - Include file <limits.h> was missing from userspace set type
    modules, reported by Krzysztof Oledzki and Sven Wegener.

You can download the source of ipset from the webpage or svn:

        http://ipset.netfilter.org/
        svn co https://svn.netfilter.org/netfilter/trunk/ipset

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
