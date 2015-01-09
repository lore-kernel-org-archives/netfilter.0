From: =?UTF-8?B?6YKT5bCn?= <torshie@gmail.com>
Subject: NFQUEUE and TCP retransmission
Date: Fri, 9 Jan 2015 10:28:30 +0800
Message-ID: <CAOb3iuj5sx3iaQDezPp7BLZk=-48mDGR0o_3Bab8qz9fOA_ppA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=VD/BZ1XXnTP3CWlujRvmraqIj3nvaiLQDx3Z0abhE1Q=;
        b=egaXgpGIOcqFa9OVLhdBkIkH5nWRh8I3zlMWRzSqc1jt1r+N7mrS8vRFAMIHqXdkpg
         GIUjv+0dhxiZrEdyEYT+BeMM2mdZjKgwhJZ+ezsGiafCX88sgkFdNuNKtNHqoSLaJaP6
         lrgA1Qw0l+iPlwZXYE65bBH3My2MJbGLcM6NGF/fvowV60gtbTpRCGSYP2ZfsLBx481z
         okF3Iw5Zn7necshXD1rlKb8ItX6ZyYPXUSg1gH+tHu4CfvPzZuPtm3sS1sur6JEL1pdT
         nwyJg8+E9vLZGelq8yDfCSUYY4VTiafN1njSPq/jnPY5jCdRlBK57skaSbY4mqhmsijM
         GanQ==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,
When the following iptables rule is used:
iptables -A INPUT -p tcp --dport 1234 -j NFQUEUE --queue-num 0

If a TCP packet is retransmitted, will the userspace program receive
the retransmitted packet ? or it just receive one packet, and the
retransmitted one is dropped in kernel space ?

Thanks
Deng Yao
