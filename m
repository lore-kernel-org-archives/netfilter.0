From: Peter Kraus <juleswinnfieldpf@googlemail.com>
Subject: Newby problem with conntrack-tools installation
Date: Mon, 3 Jan 2011 13:33:49 +0100
Message-ID: <AANLkTi=u+wD3C3U3DDa2L5b23_jH_kpF_t1WDwdwyM+0@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:date:message-id
         :subject:from:to:content-type;
        bh=9tubKI8nbilT5PlMRpl5Uiv+s97J+XsAG7WPlSJGFf0=;
        b=QykVx2JGRd0Uf1xyD4fAmqen3ygHiS5fMX+d3D4+yQfME1U/hqf3uaOp7A2yxcL4ha
         Y7mgBB3a29DbDcG/A/YsGz5zghi8LTvUP691jLcRbS31L6Mkl4dUG/oN2wl0VYUe8UNF
         6e4DJHZp0H6JGPCYCDWGVtOps+MCCwzAL0h7k=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

I have ubuntu, kernel 2.6.35, "apt-get install conntrack" and lsmod shows:

cedrix@tussi:~/test_1$ lsmod  |grep net
nfnetlink               3691  0
cedrix@tussi:~/test_1$ lsmod  |grep conn
nf_conntrack_ipv4      10783  3 iptable_nat,nf_nat
nf_conntrack           63258  4
ipt_MASQUERADE,iptable_nat,nf_nat,nf_conntrack_ipv4
nf_defrag_ipv4          1117  1 nf_conntrack_ipv4

When I run: "sudo conntrack -E" and I do a "telnet <myserver> 80" (to
generate traffic) it should show the generated events, but it does
not.

Question: Is there any netfilter-lib missing or what do I wrong?

Thanks for any help!

Jules
