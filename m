From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: [ANNOUNCE] ipset 6.35 released
Date: Sat, 6 Jan 2018 17:16:27 +0100 (CET)
Message-ID: <alpine.DEB.2.11.1801061711590.26273@blackhole.kfki.hu>
Mime-Version: 1.0
Return-path: <netfilter-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        blackhole.kfki.hu; h=mime-version:user-agent:message-id:from
        :from:date:date:received:received:received; s=20151130; t=
        1515255387; x=1517069788; bh=EArP38XCvOwBuNGoeEaw3KfDgsDNaxAccMA
        nMX/BXNI=; b=azoIbsDc8+gK4jGeg3tHq0KGNkcmIIDEcBuY0KsLR3mgos1FH/2
        SvLdeBBNmBjpKujTRNzxFYWbHybLtqvC37wJqiQpHypHMMuQp5jru6LTrCpzXqj5
        KeMmT92pxDP8lONL54ahXrY5qEUc1+VavW9kTGddCr8BD7p41ARooMxw=
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org, netfilter-devel@vger.kernel.org

Hi,

I'm happy to announce ipset 6.35. The internal revision handling in 
userspace has been reworked to make easier and simpler to add new
revisions/features. The kernel part changes bring a few fixes, backports
and small corrections:

Userspace changes:
  - Userspace revision handling is reworked
  - Replace the last reference to u_int8_t with uint8_t.
Kernel part changes:
  - netfilter: mark expected switch fall-throughs (Gustavo A. R. Silva)
  - License cleanup: add SPDX GPL-2.0 license identifier to files with no
    license (Greg Kroah-Hartman)
  - Backport patch: netfilter: ipset: use nfnl_mutex_is_locked
  - Missing nfnl_lock()/nfnl_unlock() is added to ip_set_net_exit()
  - netfilter: ipset: use nfnl_mutex_is_locked (Florian Westphal)
  - netfilter: ipset: add resched points during set listing
    (Florian Westphal)
  - Fix "don't update counters" mode when counters used at the matching
  - Backport patch: netfilter: ipset: Convert timers to use timer_setup()
  - netfilter: ipset: use swap macro instead of _manually_ swapping values
    (Gustavo A. R. Silva)
  - netfilter: ipset: Fix race between dump and swap (Ross Lagerwall)
  - netfilter: ipset: pernet ops must be unregistered last (Florian
    Westphal)

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
