From: "Ananda Kumar K. M" <ananda.m@aricent.com>
Subject: xtables-addons make error!
Date: Wed, 25 Jul 2012 15:46:36 +0530
Message-ID: <F0E76CB07831FC428915BAED654A50B7390A99C8@GUREXMB02.ASIAN.AD.ARICENT.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hi,
i am using linux fedora system (kernel version 2.6.35.6) with i686 archetecture and trying to cross compile xtables-addon1.45 for powerpc platform.

1)  i have used powerpc compiled iptables devel files
2)  ./configure --target=powerpc
3) make
4) on giving make i get following error

 /usr/bin/ld: cannot find -lxtables
collect2: ld returned 1 exit status
make[3]: *** [libxt_CHAOS.so] Error 1

 is something wrong with this procedure, why do i get link error with respect to '-lxtables'

Regards,
Anand




===============================================================================
Please refer to http://www.aricent.com/legal/email_disclaimer.html
for important disclosures regarding this electronic communication.
===============================================================================
