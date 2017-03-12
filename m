From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: [ANNOUNCE] ipset 6.32 released
Date: Sun, 12 Mar 2017 18:56:49 +0100 (CET)
Message-ID: <alpine.DEB.2.11.1703121853070.7464@blackhole.kfki.hu>
Mime-Version: 1.0
Return-path: <netfilter-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        blackhole.kfki.hu; h=mime-version:user-agent:message-id:from
        :from:date:date:received:received:received; s=20151130; t=
        1489341410; x=1491155811; bh=xx7813Qf7D04K5BRofVcFuf4kAn9UeNuBC5
        lv8M0cG4=; b=JZYoK4OTo7VHbdewrjyo0bghNba3sANuNL5ncjHU7VWePjBeyVo
        yeLBIjFIsIfvJO3E8GotyPBLYQTcGNX3hYg2xft/RnwViV4+oDdQtocGjcmO5bAM
        EHYQXu784jgfw1xP+I1WnYFwu7sFSOCnrnwXPfpL2JnFw74gPEXnf2+U=
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org, netfilter-devel@vger.kernel.org

Hi,

ipset 6.32 has been released, with just userspace part changes. 
Omri Bahumi and Yoni Lavi discovered that due to the inproper handling of 
the ipset output buffer, the output may be truncated. So for example in an 
"ipset save" output, instead of 192.168.0.0/24, just 192.168.0.0 printed.

If you use "ipset save" and then "ipset restore" to restore the sets, this 
may lead to wrong firewall rules.

Please upgrade your ipset package.

Userspace changes:
  - Fix possible truncated output in ipset output buffer handling
    (Reported by Omri Bahumi and Yoni Lavi).
  - Missing prototype added in ipset_hash_ipmac.c (debugging)

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
