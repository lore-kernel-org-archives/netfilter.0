From: Laurent Bercot <ska-devel@skarnet.org>
Subject: nftables: nft fails to add rules to chains
Date: Thu, 19 Mar 2015 21:24:09 +0100
Message-ID: <550B3069.7080209@skarnet.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org


  Hello,

  (Platform: Intel Atom (x86_64), Linux 3.19.1, musl 1.1.7,
latest nftables/libnftnl/libmnl from git. All iptables modules
out of the kernel, all necessary nftables modules in.)

  I can flush tables, create tables and create chains with nft
without trouble; however, every time I try and add a rule to
a chain, no matter what chain, no matter in what table, I get
the following error:

  netlink.c:182: Memory allocation failure

  I dug a bit and found that the error always happens when
alloc_nft_expr() is called for the *first* time (which is also
the last, since nft exits at that point...) and it is always
called with the argument "payload".

  What is happening ? Anything I could do to help fix it ?
  Thanks,

-- 
  Laurent

