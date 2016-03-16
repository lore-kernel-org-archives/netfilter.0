From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: [ANNOUNCE] ipset 6.29 released
Date: Wed, 16 Mar 2016 21:40:24 +0100 (CET)
Message-ID: <alpine.DEB.2.10.1603162136130.7414@blackhole.kfki.hu>
Mime-Version: 1.0
Return-path: <netfilter-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	blackhole.kfki.hu; h=mime-version:user-agent:message-id:from
	:from:date:date:received:received:received; s=20151130; t=
	1458160772; x=1459975173; bh=GDTkAeQUR7m9YVpcY4R4gDK/orX+K+VAF8P
	VV2SLQAY=; b=E67PhK2+TNc735rjkqQZhuv2mgdN5V/JFNPf5gyG4O0UtTqoM4M
	s7mFfb/xpBgQi/8YZHnYr+eUTuyzow1cEajQFl3R0IxxFcvIzEolcu+mJuePJsBp
	jMRKVZEzwEwKC385cA/5PZhY/lac+j22ckv0mPxgXjQj2LUdBCFWrO4Y=
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org, netfilter-devel@vger.kernel.org

Hi,

ipset 6.29 is released, because the configure script was broken and a
race condition was fixed in concurrent save-swap and then delete 
operations.

Userspace changes:
  - Suppress unnecessary stderr in command loop for resize and list
  - Correction in comment test
  - Support chroot buildroots (reported by Jan Engelhardt)
  - Fix "configure" breakage due to pkg-config related changes
    (reported by Jan Engelhardt)
Kernel part changes:
  - Fix race condition in ipset save, swap and delete (Vishwanath Pai)

You can download the source code of ipset from:
        http://ipset.netfilter.org
        ftp://ftp.netfilter.org/pub/ipset/
        git://git.netfilter.org/ipset.git

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
          H-1525 Budapest 114, POB. 49, Hungary
