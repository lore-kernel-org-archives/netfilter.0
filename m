From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: [ANNOUNCE] ipset 6.31 released
Date: Sun, 19 Feb 2017 19:29:41 +0100 (CET)
Message-ID: <alpine.DEB.2.10.1702191924300.22013@blackhole.kfki.hu>
Mime-Version: 1.0
Return-path: <netfilter-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        blackhole.kfki.hu; h=mime-version:user-agent:message-id:from
        :from:date:date:received:received:received; s=20151130; t=
        1487528982; x=1489343383; bh=30crH/VPI6T4Pcn1PVuETwsQ3AmqoIHuT0Y
        9eyzKa1I=; b=JWI2KvjpILeyopMdhP4nxJyrKI/RF+ilNAndD3Egj5BwKdNkneM
        80bYeOtytZHqHCjnj+pELPFsAMRgqGBPnLPWMfotMCCPhl8k7BQExwOjd57ZxADH
        Mt8Wd+mv6n20jyDl/OXgbue88UanrLc/eRANX7B5jomAG7Y+GR8t20Lg=
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org, netfilter-devel@vger.kernel.org

Hi,

ipset 6.31 has just been released with two important bugfixes. So please 
upgrade your ipset package.

Userspace changes:
  - Update manpage about the size parameter of list:set types.
  - New test to verify that only the intended entries are deleted at hash
    types.
Kernel part changes:
  - netfilter: ipset: Null pointer exception in ipset list:set
    (Vishwanath Pai)
    When someone wants to add an entry to an empty list type of set and 
    specifies and add before/after option, null pointer exception is 
    triggered.
  - Fix bug: sometimes valid entries in hash:* types of sets were evicted
    (reported by Eric Ewanco)
    The wrong evictions happen when entries are deleted from the set and 
    the hash bucket is shrinked.
  - Correct copyright owner
  - Revert patch "Correct rcu_dereference_bh_nfnl() usage"

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
