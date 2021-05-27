From: Stefan Hartmann <stefanh@hafenthal.de>
Subject: nftables CONFIG_NFT_OBJREF "ct helper set"
Date: Thu, 27 May 2021 16:09:21 +0200
Message-ID: <b1f8c4c8-408b-3ffd-e679-3f6d244ded17@hafenthal.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hafenthal.de; h=
        content-transfer-encoding:mime-version:date:message-id:subject
        :from:to; s=dkim1; t=1622124562; x=1623938963; bh=iToiBJs08EkYdB
        7csUHK2cNrsbrd9liFLpD+Mvwj4vQ=; b=yCFp/OXvmv3JJ2ZsBr4j5NEL0/ZPSN
        aXKoZU79uxIYdxlae47qbj/FT0TphWMhlNFHkxtEZoiPPtl4iWF2Nku/otN+ivaC
        6x+IcVqPwmxvO4+nVWEdBFwCa0zg4Kkd6EJU5BX2E0SaYLCTxg+26EajLIsb50i+
        4MkTxE2COJygA=
Content-Language: de-DE
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi,

I installed Alpine Linux 3.13 on a _physical_ x86_64 arch.

I have problems with using nftables connection tracking helper.

TEST command sequence with ftp helper:
   lsmod | grep nf_

   sudo nft flush ruleset
   sudo nft list ruleset

   sudo nft add table ip TABLE4

   sudo nft add chain ip TABLE4 CHAIN4 '{ type filter hook input 
priority 0 ; policy accept; }'

   sudo nft add ct helper ip TABLE4 ftp-21 '{ type "ftp" protocol tcp; }'

   sudo nft add rule ip TABLE4 CHAIN4 'tcp dport 21 counter ct helper 
set "ftp-21" accept'

Error: Could not process rule: No such file or directory
add rule ip TABLE4 CHAIN4 tcp dport 21 counter ct helper set "ftp-21" accept
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^


I then recompiled the Kernel with changed config
   # CONFIG_NFT_OBJREF is not set
   to CONFIG_NFT_OBJREF=m

And nftables works as expected on Alpine x86_64.

   ALPINE:~$ sudo nft list ruleset
   table ip TABLE4 {
	ct helper ftp-21 {
		type "ftp" protocol tcp
		l3proto ip
	}

	chain CHAIN4 {
		type filter hook input priority filter; policy accept;
		tcp dport 21 counter packets 0 bytes 0 ct helper set "ftp-21" accept
	}
}
   ALPINE:~$ lsmod | grep nf_
   nf_conntrack_ftp       16384  1
   nf_conntrack          147456  2 nft_ct,nf_conntrack_ftp
   nf_defrag_ipv6         16384  1 nf_conntrack
   nf_defrag_ipv4         16384  1 nf_conntrack
   libcrc32c              16384  1 nf_conntrack
   nf_tables             167936  8 nft_ct,nft_objref,nft_counter
   nfnetlink              16384  3 nf_tables,nfnetlink_log


I am searching for arguments to initiate the Alpine x86_64 Kernel 
maintainer to change the kernel config to CONFIG_NFT_OBJREF=m

Can someone with the proper knowledge assist why this config option 
could be safely enabled als m?
ev Pros VS Cons?




Nb. I posted this already on the alpine mailing list 3 month ago but no 
response.

Nb. there are Alpine rasperry-pi images eg config-rpi4 armv7 where 
CONFIG_NFT_OBJREF=m ist already set.


-- 
Thanks,
Stefan Hartmann


