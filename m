From: Cristian Constantin <const.crist@googlemail.com>
Subject: base chains with same hook, same priority
Date: Wed, 15 Sep 2021 11:38:14 +0200
Message-ID: <CANCV4NPRwaBeu5R4q90PeTwSgj7hD7wVhGVDAPX7rR7JHP-hvQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=lInjFsQiS0hDP2m1OR8efNe0iFCkdWdQbidSMjCUBnE=;
        b=I+3U9eXYz/YMW87b3SUeUSPNtkpEVzHoRyC0BDnuQFJrMBrMfpVSghiohE8YZ2EllE
         f/Gm3cNH8HbDnxFUO6QN++jM1Ma3DJvGCxSaIUhjXNRmgcGq+ca6kpRBkShgHKy37SQC
         ML0RqWkSN62JLFKyhm0Vmvwszfq6Z21W20yPNARlr6UBMFD5UGLpTKs8OB8UetOHuMJo
         sxPQizezd+3Z2FHbhJpaOYnXXoiI8cO8uStQY7vE6a3baDXsrZ4uc3clY2I1qpWSydQB
         BFuRxAVwJgxmO6+0+GPkcBnqPMmPGG1psSaPAi2fZvmS8BArIaV0sE7wf43rTwVQEEP3
         z2kQ==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

hi!

quote from the wiki page:

https://wiki.nftables.org/wiki-nftables/index.php/Configuring_chains

"[...] It's possible to give two base chains the same priority, but
there is no guaranteed evaluation order of base chains with identical
priority that are attached to the same hook location."
I have tested this on my system and it is actually allowed by `nft`, kernel.

root@firiel:/home/cco# uname -a
Linux firiel 5.8.0-63-generic #71-Ubuntu SMP Tue Jul 13 15:59:12 UTC
2021 x86_64 x86_64 x86_64 GNU/Linux
root@firiel:/home/cco# lsb_release
LSB Version: core-11.1.0ubuntu2-noarch:printing-11.1.0ubuntu2-noarch:security-11.1.0ubuntu2-noarch
root@firiel:/home/cco# nft -v
nftables v0.9.6 (Capital Idea #2)
root@firiel:/home/cco# nft -a list table filter
table ip filter { # handle 3
chain INPUT { # handle 1
type filter hook input priority filter; policy accept;
}
...
chain TEST { # handle 579
type filter hook input priority filter; policy accept;
}

could someone please show me a use case for using multiple chains
having the same hook and the same priority? (i.e. taking into account
that _most of the time_ rule priority and thus evaluation order is
important)

and, in a more general sense, why is this configuration allowed (i.e.
base chains with same hook, same priority)?

thanks,
cristian
