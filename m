From: Matteo Croce <technoboy85@gmail.com>
Subject: nft error
Date: Wed, 26 Feb 2014 11:12:29 +0100
Message-ID: <CAFnufp3Wzw9fLk2SU16kR1vfAbwaFQfhAo9dwNqk_80LVUfx4g@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:from:date:message-id:subject:to:content-type;
        bh=+zOLSE7FFTdVgbmQLTaWMUEoRSHHe3ZfnbM1NDsPT9E=;
        b=xWtQNbWminQ2a+EaFQIDCXo1Ddm0eiGfD80w/dRS94gcgyWFjZNdTNUPLO90RnP55S
         oCXATrQRxRUxS4i/AyBJcPziH2/gojdjuwdSluLLJfJk4kiNdwFxgiDU0zjmPkTP5Q6Y
         S4zrv53aoEJGCdV9a2EPz2PPW8go4p4a0qbikxGjXHUQxrFMgeu3UYxJAnioBVdjb2Im
         MLCokXhe1qfQ0ucdVj2WFv8N+YZrjgklsQE5novsj1jKXeGerL2YldW6v1KRYDIVguYk
         Z7rRzyVfFn+NjWaD/ftH0DjucNeyRaVyvZPiRhAXFCeqdSTbpsVbIOZ4YaNNE6mAUMkM
         ITMQ==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

I'm trying to run nftables on Debian with a vanilla 3.13 kernel.
I've compiled libnftnl and nftables from git, but when I try to start
ntf I get this error:

# nft list table filter
<cmdline>:1:1-17: Error: Could not receive sets from kernel: Address
family not supported by protocol
list table filter
^^^^^^^^^^^^^^^^^

I think I have all modules loaded:

lsmod |grep nf
nfnetlink_log          12935  0
nft_ct                 12486  0
nft_compat             12844  0
nft_nat                12459  0
nf_tables              36626  3 nft_nat,nft_ct,nft_compat
nfnetlink              12818  3 nf_tables,nfnetlink_log,nft_compat
nf_conntrack_ipv4      13078  1
nf_defrag_ipv4         12443  1 nf_conntrack_ipv4
nf_nat_ipv4            12757  1 iptable_nat

What can it be?

Cheers,
-- 
Matteo Croce
OpenWrt Developer
