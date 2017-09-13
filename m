From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: [ANNOUNCE] ipset 6.33 released
Date: Wed, 13 Sep 2017 21:00:07 +0200 (CEST)
Message-ID: <alpine.DEB.2.11.1709132056190.18601@blackhole.kfki.hu>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        blackhole.kfki.hu; h=mime-version:user-agent:message-id:from
        :from:date:date:received:received:received; s=20151130; t=
        1505329208; x=1507143609; bh=w3kto4ARwmtWS664d4K/h7/F7+GKjK5Qp8j
        IekgYXOw=; b=B60XB/08O73Q51FwLbQjI0poNIYQSx0q4ffj40E8MEufisOgRKi
        3VU7NeavTujXMldMh4C16Qv4oIH13Bd+n0M4abY3glT8bAnAfqav8swETjJoQq9G
        7R7XDbJht+pidynibXIN1suODoNl/yCN9vsD42hM0qE0m9olQwYPpxgc=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org, netfilter-devel@vger.kernel.or

Hi,

I'm happy to announce ipset 6.33, which comes with a couple of backporting 
and compatibility fixes for the most recent kernel trees, some cleanups 
and minor fixes.

Userspace changes:
  - Report if the option is supported by a newer kernel release
  - ipset: Fix ipset command replacement in runtest.sh (Neutron Soutmun)
  - Correct a test: number of entries may be outdated

Kernel part changes:
  - Backport patch: sctp: remove the typedef sctp_sctphdr_t
  - Backport patch: netfilter: nfnetlink: extended ACK reporting
  - ipset: remove unused function __ip_set_get_netlink (Aaron Conole)
  - Backport patch: netlink: pass extended ACK struct to parsing functions
  - Backport patch netlink: extended ACK reporting
  - netfilter: Remove exceptional & on function name (Arushi Singhal)
  - Backport missing part of patch: netfilter: Remove unnecessary cast on
    void pointer
  - Backport nfnl_msg_type()
  - netfilter: ipset: ipset list may return wrong member count for set 
    with timeout (Vishwanath Pai)
  - netfilter: ipset: deduplicate prefixlen maps (Aaron Conole)
  - Fix sparse warnings
  - netfilter: ipset: Compress return logic (simran singhal)
  - netfilter: ipset: Remove unnecessary cast on void pointer (simran
    singhal)
  - Compatibility: handle changes in 4.10 kernel tree

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
