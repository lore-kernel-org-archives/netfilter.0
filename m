From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: [ANNOUNCE] ipset package kernel support changes
Date: Wed, 2 Oct 2013 23:35:02 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1310022322210.5975@blackhole.kfki.hu>
Mime-Version: 1.0
Return-path: <netfilter-devel-owner@vger.kernel.org>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org, netfilter-devel@vger.kernel.org

Hi,

The ipset package still supports kernel versions back to 2.6.32. 
Unfortunately I have no resources to keep up this support.

The ipset package release 6.20 is the last one which supports the kernel 
versions below 3.2, the next releases will work with 3.2 and above. 

Bugfixes will be backported to the 6.20 tree for one year from now and 
will be released with version numbers 6.20.x.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
          H-1525 Budapest 114, POB. 49, Hungary
