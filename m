From: =?UTF-8?Q?Kadlecsik_J=C3=B3zsef?= <kadlec@blackhole.kfki.hu>
Subject: [ANNOUNCE] ipset 7.4 released
Date: Fri, 1 Nov 2019 16:44:22 +0100 (CET)
Message-ID: <alpine.DEB.2.20.1911011627280.9207@blackhole.kfki.hu>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        blackhole.kfki.hu; h=mime-version:user-agent:message-id:from
        :from:date:date:received:received:received; s=20151130; t=
        1572623063; x=1574437464; bh=FciZkGk3B24yfqxRiLmfx4wAFoAMhCkIKhH
        HvZo+DaA=; b=env889Da/QmwgNotkK3Wmzz6r2QazTiOEUZUVTzVJ+DsRREaT6X
        +Pts4fw6T7vgV8hj5vL3jgEMdjgUsX/GYlXn4y2gp7Emj3Dn8ckn1BEVc/gGRAW8
        FTJLOo9PqH1KznVQedUTI4e4/GryG4jyWuCAGlyNjJrrKctHdsXGz6pI=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org, netfilter-devel@vger.kernel.org

Hi,

I'm happy to announce ipset 7.4 which brings a few corrections and fixes.
As a new feature, Kristian Evensen added wildcard support to the type
hash:net,iface.

Please note, if you want to use ipset with kernel 5.2 and above, you need 
ipset 7.4 otherwise some commands do not work: from 5.2 NL_VALIDATE_STRICT 
is enabled and three netlink nla policies in ipset was not complete.

The sorting is changed: instead of textual sorting it now follows the 
natural ordering of IP addresses (i.e. 2.2.2.2 comes before 11.11.11.11) 
and in the case of the same prefix, more specific netblocks come before 
the least specific ones.

Userspace changes:
  - Fix compatibility support for netlink extended ACK and add
    synchronize_rcu_bh() checking
  - treewide: Replace GPLv2 boilerplate/reference with SPDX - rule 500
    (Thomas Gleixner)
  - ipset: Add wildcard support to net,iface (Kristian Evensen)
  - Sort naturally instead of textual sort (bugzilla #1369)
  - Do not return with error at 'make modules_install' when modules
    are not loaded (reported by Oskar Berggren)
Kernel part changes:
  - Fix nla_policies to fully support NL_VALIDATE_STRICT
  - treewide: Replace GPLv2 boilerplate/reference with SPDX - rule 500
    (Thomas Gleixner)
  - netfilter: remove unnecessary spaces (yangxingwu)
  - ipset: Add wildcard support to net,iface (Kristian Evensen)
  - ipset: Copy the right MAC address in hash:ip,mac IPv6 sets
    (Stefano Brivio)
  - netfilter: ipset: move ip_set_get_ip_port() to ip_set_bitmap_port.c.
    (Jeremy Sowden)
  - netfilter: ipset: move function to ip_set_bitmap_ip.c. (Jeremy Sowden) 
  - netfilter: ipset: make ip_set_put_flags extern. (Jeremy Sowden)
  - netfilter: ipset: move functions to ip_set_core.c. (Jeremy Sowden)
  - netfilter: ipset: move ip_set_comment functions from ip_set.h
    to ip_set_core.c. (Jeremy Sowden)
  - netfilter: ipset: remove inline from static functions in .c files.
    (Jeremy Sowden)
  - netfilter: ipset: add a coding-style fix to ip_set_ext_destroy.
    (Jeremy Sowden)
  - netfilter: added missing includes to a number of header-files.
    (Jeremy Sowden)
  - netfilter: inlined four headers files into another one. (Jeremy 
    Sowden)
  - netfilter: ipset: Fix an error code in ip_set_sockfn_get()
    (Dan Carpenter)

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
