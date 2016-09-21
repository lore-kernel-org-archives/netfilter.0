From: Sudheendra Murthy <sudhi.vm@gmail.com>
Subject: ipset on older kernels
Date: Wed, 21 Sep 2016 11:06:17 -0700
Message-ID: <1490B20F-D566-4E59-8186-FE241AC4C231@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:content-transfer-encoding:subject:message-id:date:to
         :mime-version;
        bh=PTbU67opV/WBbYopGuBhbs+16fv2FM/WLADNJ/SF3NI=;
        b=TZTU7uX2MDL9YuYjLkzmnzsZbICz7D2YYj+EJ+yT3zoPmIeEJW4O0twKH3BzYDltA2
         OSAlKqSosyqIqv+5mmSEeL5CtM6uSIpiZAqensntnoTIii/kTEZ2PYd24ewvRByX98Zo
         xOsKqberXpNA7be48ZCafVaRQNw+c7+igW6uz325sqSoRxGmPpKxpOb/Jit2LX2aPxWw
         ELgCAhRpQvRdGXdbbQOLCT7Fwsu1Erg/WLMtIETgXvHSd5WodOptcNqiwrTRYttcy6//
         RtKK3ClWllDDYsGdLK0c66csi13xIUly9VtfPTBsVkKi45HyK+JPENEse2EOwfsvxoX8
         f2sQ==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,

I'm trying to install iptables and ipset on an older kernel version =
2.6.35-22-server. I was able to build iptables from source and iptables =
v1.6.0 is working fine.=20

For ipset, I patched the kernel sources based on netlink.patch and ipset =
compiled correctly. However, when I try to execute any ipset command, it =
gives the following error.=20

# ipset -L
ipset v6.29: Kernel error received: Invalid argument

# dmesg
[69432.285219] ip_set: cannot register with nfnetlink.

=46rom the code, it looks like it is failing when executing =
nfnetlink_subsys_register(...) =
(http://lxr.free-electrons.com/source/net/netfilter/ipset/ip_set_core.c#L2=
069).

Are there any other changes necessary?

Thanks,
Sudhi.=
