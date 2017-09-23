From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: [ANNOUNCE] ipset 6.34 released
Date: Sat, 23 Sep 2017 20:58:46 +0200 (CEST)
Message-ID: <alpine.DEB.2.11.1709232053580.11869@blackhole.kfki.hu>
Mime-Version: 1.0
Return-path: <netfilter-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        blackhole.kfki.hu; h=mime-version:user-agent:message-id:from
        :from:date:date:received:received:received; s=20151130; t=
        1506193126; x=1508007527; bh=NY0EC/YFkyHjP0vEoum+JK6GytSrXtb0uwE
        lSWwIt8k=; b=GcpU4+un5R1bwon4enmS7IlcXS3GHbzpABjkir7Exfsrd4TTaCx
        tCaFSI2CEsoPautUZyoL+4LuwEJTHV3Ms4usNoVuF2uU64tzFHVNHUBB8yMvj3I7
        jzl3nOeVY6yJ82TXffZuKvtVYURJTwU4VhI3SJQFezbXY17wVTXY7uTs=
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org, netfilter-devel@vger.kernel.org

Hi,

I'm happy to announce ipset 6.34, which fixes a couple bugtrack issues.
(Due to the missing function from libipset.map, v6.33 could not
successfully be built on all systems.)

Userspace changes:
  - testsuite: Make sure it can be run over ssh :-)
  - Reset state after a command failed, when multiple ones are issued
    (bugzilla id #1158, reported by Dimitri Grischin)
  - Handle padding attribute properly in userspace.
  - Test to check the fix to add an IPv4 range containing more than 2^31
    addresses
  - Fix the include guards on the include/libipset/linux_ip_set*.h
    (bugzilla id #1139, suggested by Quentin Armitage)
  - New function added in commit 54802b2c is missing from libipset.map
    (bugzilla id #1182, reported by irherder@gmail.com)

Kernel part changes:
  - Fix adding an IPv4 range containing more than 2^31 addresses
    (bugzilla id #1005, reported by Oleg Serditov and Oliver Ford)

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
