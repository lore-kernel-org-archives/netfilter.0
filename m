From: =?UTF-8?Q?Kadlecsik_J=C3=B3zsef?= <kadlec@blackhole.kfki.hu>
Subject: [ANNOUNCE] ipset 7.5 released
Date: Thu, 9 Jan 2020 20:42:56 +0100 (CET)
Message-ID: <alpine.DEB.2.20.2001092035200.7220@blackhole.kfki.hu>
Mime-Version: 1.0
Return-path: <netfilter-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        blackhole.kfki.hu; h=mime-version:user-agent:message-id:from
        :from:date:date:received:received:received; s=20151130; t=
        1578598987; x=1580413388; bh=cnOQm+WldV8DinQLXnj14UUkpULVSlFkFkD
        bmaAY+vA=; b=R0BYB/6Hr4GoNJqYF9bpyfG24cSlPhXsL7dzI47yzg+71jX+rAi
        SmlRjw8GK1giCCRJXY+vCje6fYpGV3wYz5Vt/fML1f6Qyb6dY4GyFvWPjct2KzoD
        JTBL4qsm22XzOgp3vwt4CTD6WJFispK8wOYs6gK0vKzL8OQjelQUBF/s=
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org, netfilter-devel@vger.kernel.org

Hi,

ipset 7.5 is just released - please upgrade to this version! The syzkaller 
fuzzer discovered a NULL dereference bug in ipset, which was fixed by 
Florian Westphal. The CAP_NET_ADMIN capability is required to exploit the 
vulnerability. Other than that, the release brings a lot of backward 
compatibility improvements, thanks to Serhey Popovych.

Userspace changes:
  - configure.ac: Support building with old autoconf 2.63
    (Serhey Popovych)
  - configure.ac: Build on kernels without skb->vlan_proto correctly
    (Serhey Popovych)
  - configure.ac: Add cond_resched_rcu() checks (Serhey Popovych)
  - configure.ac: Better match for ipv6_skip_exthdr() frag_offp
    arg presence (Serhey Popovych)
  - Document explicitly that protocol is not stored in bitmap:port
Kernel part changes:
  - netfilter: ipset: avoid null deref when IPSET_ATTR_LINENO is present
    (Florian Westphal)
  - ip_set: Pass init_net when @net is missing in match check params
    data structure (Serhey Popovych)
  - netfilter: xt_set: Do not restrict --map-set to the mangle table
    (Serhey Popovych)
  - compat: em_ipset: Build on old kernels (Serhey Popovych)
  - compat: Use skb_vlan_tag_present() instead of vlan_tx_tag_present()
    (Serhey Popovych)

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
