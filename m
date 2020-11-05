From: Martin Gignac <martin.gignac@gmail.com>
Subject: Re: Trying to provision flowtable returns error
Date: Thu, 5 Nov 2020 10:17:08 -0500
Message-ID: <CANf9dFMFqjp7MJQy5B52sz3PVc5wm5DWRMrKKGKtqL9n6rXWYw@mail.gmail.com>
References: <c382354e-4a18-0863-e006-0db6f9fce1f6@heinlein-support.de>
 <CANf9dFMdBgdn5k9fd5QX15kiAbVhQFqAfOBXUj64=wy6a9buBg@mail.gmail.com> <20201105005345.GA4263@dimstar.local.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=PEdXGRspkLoL6kLgarPxbON/D/DdSGX0WnRTL2ST0N0=;
        b=e2SZico8oZqnD6zXS0a4Q7dqnq5PrhHsfAvl3jJ7w8Ar3UmMtevuVDrEBx0Xb+fpPw
         U83OJk1qwCAUTS2BqjKeTCgzC7eUP96oct5F/pRgpyjYjC4Lsa3SEWAZcNDs9iNFaMay
         vlaI+X43waWg01QMIFLpKykrVry/HxWQHnje/3wCOkRMOqKAYG+KDtr7Ny01vl2FBeIM
         oSoIBqGjond0krWnDikur5c7JE6hCuRRkwju7JiDZlFIaEuT8+ULmR7F+cNDbX0zkhAu
         mGiyOrRGAa2qLBJHHMKHrUGzVyWyt4CoLjbkft1nOZL17Lb7HbfBR0QAOL88i8+tgp3Z
         j+QQ==
In-Reply-To: <20201105005345.GA4263@dimstar.local.net>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi Duncan,


> What may be missing is a required kernel module. Does 'lsmod' show
> 'nf_flow_table' and 'nf_flow_table_inet'?
>
> Also, what is you kernel version?

I actually observed the issue on both a Fedora 30 Server node (kernel
5.6.13-100.fc30.x86_64) and a RHEL8 node (kernel
4.18.0-147.8.1.el8_1.x86_64), but just to be sure I just installed a
brand new Fedora 33 Server VM with the latest DNF updates and tried
again using the example at
https://www.kernel.org/doc/Documentation/networking/nf_flowtable.txt
verbatim:

    [root@localhost ~]# cat toto.nft
    table inet x {
    flowtable f {
        hook ingress priority 0; devices = { eth0, eth1 };
    }
            chain y {
                    type filter hook forward priority 0; policy accept;
                    ip protocol tcp flow offload @f
                    counter packets 0 bytes 0
            }
    }

Still the same error:

    [root@localhost ~]# nft -c -f toto.nft
    toto.nft:2:11-11: Error: Could not process rule: No such file or directory
    flowtable f {
            ^
    toto.nft:7:17-47: Error: Could not process rule: No such file or directory
                    ip protocol tcp flow offload @f
                    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Loaded modules:

    [root@localhost ~]# lsmod | grep nf
    nft_ct                 20480  0
    nft_counter            16384  0
    nft_flow_offload       16384  0
    nf_flow_table_inet     16384  0
    nf_flow_table          40960  2 nft_flow_offload,nf_flow_table_inet
    nf_conntrack          163840  3 nft_flow_offload,nft_ct,nf_flow_table
    nf_defrag_ipv6         24576  1 nf_conntrack
    nf_defrag_ipv4         16384  1 nf_conntrack
    nf_tables             237568  4
nft_flow_offload,nft_ct,nft_counter,nf_flow_table_inet
    nfnetlink              16384  1 nf_tables

Kernel version:

    [root@localhost ~]# uname -a
    Linux localhost.localdomain 5.8.17-300.fc33.x86_64 #1 SMP Thu Oct
29 15:55:40 UTC 2020 x86_64 x86_64 x86_64 GNU/Linux

NFT version:

    [root@localhost ~]# nft -v
    nftables v0.9.3 (Topsy)

I'm sure I'm missing something, but I can't tell what...

Thanks,
-Martin
