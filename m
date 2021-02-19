From: Jozsef Kadlecsik <kadlec@mail.kfki.hu>
Subject: [ANNOUNCE] ipset 7.11 released
Date: Fri, 19 Feb 2021 21:41:36 +0100 (CET)
Message-ID: <28d6aaed-79eb-dd80-ab29-624138969de4@mail.kfki.hu>
Mime-Version: 1.0
Return-path: <netfilter-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mail.kfki.hu; h=
        mime-version:message-id:from:from:date:date:received:received
        :received:received; s=20151130; t=1613767296; x=1615581697; bh=L
        UM5fSxBk+IUYZuD8kykew4utX+YwXtCtjDkqAFzzi0=; b=WtB5aFALQPmlFCRt+
        ZLd146Gv2Pm/srtRLJmxVHXFq67bAkWT9/geTMfyn2nttK+k0NTq5uLXCIrGggj/
        u5NSihzarS09+twlcm+PwG+qADZgFKgWTn37nVsLpWpr3Yww+toRu+HEsTjCM7QB
        9VeZ7tpBheflnfSb1Bd9K1uKGo=
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org, netfilter-devel@vger.kernel.org

Hi,

I'm happy to announce ipset 7.11. The most important thing is that there 
was an argument parsin buffer overflow in the ipset userspace utility 
which is fixed in this release.

Userspace changes:
  - Parse port before trying by service name (Haw Loeung)
  - Silence unused-but-set-variable warnings (reported by
    Serhey Popovych)
  - Handle -Werror=implicit-fallthrough= in debug mode compiling
  - ipset: fix print format warning (Neutron Soutmun)
  - Updated utilities
  - Argument parsing buffer overflow in ipset_parse_argv fixed
    (reported by Marshall Whittaker)

You can download the source code of ipset from:
        http://ipset.netfilter.org
        ftp://ftp.netfilter.org/pub/ipset/
        git://git.netfilter.org/ipset.git

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.hu
PGP key : https://wigner.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics
          H-1525 Budapest 114, POB. 49, Hungary
