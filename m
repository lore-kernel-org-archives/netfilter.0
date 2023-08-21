From: Tony He <huangya90@gmail.com>
Subject: Fwd: question about using conntrack to change the mark
Date: Mon, 21 Aug 2023 15:44:54 +0800
Message-ID: <CAAUX2SXBVr5pG0vWvhkvrRLJv+ym6i34UrkUpRzS5FQHxh5ivg@mail.gmail.com>
References: <CAAUX2SVTLxtpzsMnKWCpjRZwAKn391rm5T=y=oHPQ_T1w2UpBA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692603905; x=1693208705;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=93j9yqNv9qYTlwsOxjtHeKD1R3vN5/vB9IG/7QKZY64=;
        b=srxK91zttDHYzLXtvwLccLrMhqshaPhnZwcSA7Y+IMWxc738SWlb5kt7PZFbwHo9NT
         QA7QiGPmrmY12zCY+yfu56Knpdan1smzNOX3RUqqDWLxjpu7IJchvNMiwZFwWvNcjZDi
         PJzDtFBVxM+szEQljKHWlVX76nBU6LfaC9FQQdvxykhTH89BI8cvTAP8Klf1yDz6TAfj
         v3YJK4VWv39YOrUpSkIDE/BxQyin1cK1gqk0EeSyrx+sHCHSbDL63dycyMnGQ/NF5fRG
         HMVL1ZxROuXEAsbogVBcN4VDGRusAuxeBHsIcUCW453jUccYIJcJ+gx+eW6CX8R8WAdj
         KCRg==
In-Reply-To: <CAAUX2SVTLxtpzsMnKWCpjRZwAKn391rm5T=y=oHPQ_T1w2UpBA@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

I am using Openwrt. The version is:
root@OpenWrt:/# cat /etc/openwrt_release
DISTRIB_ID='OpenWrt'
DISTRIB_RELEASE='23.05.0-rc2'
DISTRIB_REVISION='r23228-cd17d8df2a'
DISTRIB_TARGET='ipq806x/generic'
DISTRIB_ARCH='arm_cortex-a15_neon-vfpv4'
DISTRIB_DESCRIPTION='OpenWrt 23.05.0-rc2 r23228-cd17d8df2a'
DISTRIB_TAINTS=''

And kernel is:
root@OpenWrt:/# uname -a
Linux OpenWrt 5.15.118 #0 SMP Mon Jun 26 11:20:39 2023 armv7l GNU/Linux


Seems that I can not use command " conntrack -U -p tcp -m 1" to change the mark.
root@OpenWrt:/# conntrack  -L  -p tcp |grep mark=0 |wc -l
conntrack v1.4.7 (conntrack-tools): 302 flow entries have been shown.
302
root@OpenWrt:/# conntrack -U -p tcp -m 1
Operation failed: Not supported
conntrack v1.4.7 (conntrack-tools): Operation failed: Not supported

I need to add option "-f ipv4", but not all entries can be updated
successfully. "Protocol error" is
reported.
root@OpenWrt:/# conntrack -U -p tcp -f ipv4 -m 1
tcp      6 46 TIME_WAIT src=192.168.1.30 dst=10.40.9.83 sport=47592
dport=80 packets=6 bytes=398 src=10.40.9.83 dst=10.40.9.165 sport=80
dport=47592 packets=6 bytes=11265 [ASSURED] mark=1 use=2
tcp      6 46 TIME_WAIT src=192.168.1.30 dst=10.40.9.83 sport=46262
dport=80 packets=11 bytes=702 src=10.40.9.83 dst=10.40.9.165 sport=80
dport=46262 packets=11 bytes=18126 [ASSURED] mark=1 use=2
tcp      6 46 TIME_WAIT src=192.168.1.30 dst=10.40.9.83 sport=46820
dport=80 packets=9 bytes=578 src=10.40.9.83 dst=10.40.9.165 sport=80
dport=46820 packets=10 bytes=14369 [ASSURED] mark=1 use=2
tcp      6 46 TIME_WAIT src=192.168.1.30 dst=10.40.9.83 sport=46888
dport=80 packets=6 bytes=398 src=10.40.9.83 dst=10.40.9.165 sport=80
dport=46888 packets=6 bytes=11265 [ASSURED] mark=1 use=2
tcp      6 46 TIME_WAIT src=192.168.1.30 dst=10.40.9.83 sport=46304
dport=80 packets=13 bytes=882 src=10.40.9.83 dst=10.40.9.165 sport=80
dport=46304 packets=11 bytes=14421 [ASSURED] mark=1 use=2
tcp      6 47 TIME_WAIT src=192.168.1.30 dst=10.40.9.83 sport=46638
dport=80 packets=10 bytes=666 src=10.40.9.83 dst=10.40.9.165 sport=80
dport=46638 packets=8 bytes=12817 [ASSURED] mark=1 use=2
tcp      6 46 TIME_WAIT src=192.168.1.30 dst=10.40.9.83 sport=47416
dport=80 packets=7 bytes=450 src=10.40.9.83 dst=10.40.9.165 sport=80
dport=47416 packets=6 bytes=11265 [ASSURED] mark=1 use=2
tcp      6 46 TIME_WAIT src=192.168.1.30 dst=10.40.9.83 sport=48636
dport=80 packets=8 bytes=502 src=10.40.9.83 dst=10.40.9.165 sport=80
dport=48636 packets=6 bytes=11265 [ASSURED] mark=1 use=2
tcp      6 46 TIME_WAIT src=192.168.1.30 dst=10.40.9.83 sport=47124
dport=80 packets=8 bytes=502 src=10.40.9.83 dst=10.40.9.165 sport=80
dport=47124 packets=6 bytes=11265 [ASSURED] mark=1 use=2
tcp      6 46 TIME_WAIT src=192.168.1.30 dst=10.40.9.83 sport=46400
dport=80 packets=11 bytes=738 src=10.40.9.83 dst=10.40.9.165 sport=80
dport=46400 packets=12 bytes=17369 [ASSURED] mark=1 use=2
tcp      6 46 TIME_WAIT src=192.168.1.30 dst=10.40.9.83 sport=45832
dport=80 packets=11 bytes=754 src=10.40.9.83 dst=10.40.9.165 sport=80
dport=45832 packets=12 bytes=21713 [ASSURED] mark=1 use=2
tcp      6 46 TIME_WAIT src=192.168.1.30 dst=10.40.9.83 sport=47132
dport=80 packets=7 bytes=450 src=10.40.9.83 dst=10.40.9.165 sport=80
dport=47132 packets=7 bytes=11317 [ASSURED] mark=1 use=2
tcp      6 46 TIME_WAIT src=192.168.1.30 dst=10.40.9.83 sport=46816
dport=80 packets=10 bytes=642 src=10.40.9.83 dst=10.40.9.165 sport=80
dport=46816 packets=11 bytes=17487 [ASSURED] mark=1 use=2
tcp      6 46 TIME_WAIT src=192.168.1.30 dst=10.40.9.83 sport=47764
dport=80 packets=8 bytes=502 src=10.40.9.83 dst=10.40.9.165 sport=80
dport=47764 packets=7 bytes=11317 [ASSURED] mark=1 use=2
tcp      6 46 TIME_WAIT src=192.168.1.30 dst=10.40.9.83 sport=47418
dport=80 packets=8 bytes=502 src=10.40.9.83 dst=10.40.9.165 sport=80
dport=47418 packets=7 bytes=11317 [ASSURED] mark=1 use=2
tcp      6 46 TIME_WAIT src=192.168.1.30 dst=10.40.9.83 sport=48214
dport=80 packets=10 bytes=662 src=10.40.9.83 dst=10.40.9.165 sport=80
dport=48214 packets=11 bytes=18765 [ASSURED] mark=1 use=2
tcp      6 46 TIME_WAIT src=192.168.1.30 dst=10.40.9.83 sport=46834
dport=80 packets=8 bytes=502 src=10.40.9.83 dst=10.40.9.165 sport=80
dport=46834 packets=8 bytes=11369 [ASSURED] mark=1 use=2
tcp      6 46 TIME_WAIT src=192.168.1.30 dst=10.40.9.83 sport=48376
dport=80 packets=6 bytes=398 src=10.40.9.83 dst=10.40.9.165 sport=80
dport=48376 packets=6 bytes=11265 [ASSURED] mark=1 use=2
tcp      6 46 TIME_WAIT src=192.168.1.30 dst=10.40.9.83 sport=47514
dport=80 packets=7 bytes=450 src=10.40.9.83 dst=10.40.9.165 sport=80
dport=47514 packets=6 bytes=11265 [ASSURED] mark=1 use=2
tcp      6 46 TIME_WAIT src=192.168.1.30 dst=10.40.9.83 sport=46348
dport=80 packets=10 bytes=630 src=10.40.9.83 dst=10.40.9.165 sport=80
dport=46348 packets=11 bytes=13782 [ASSURED] mark=1 use=2
tcp      6 46 TIME_WAIT src=192.168.1.30 dst=10.40.9.83 sport=47422
dport=80 packets=6 bytes=398 src=10.40.9.83 dst=10.40.9.165 sport=80
dport=47422 packets=6 bytes=11265 [ASSURED] mark=1 use=2
tcp      6 46 TIME_WAIT src=192.168.1.30 dst=10.40.9.83 sport=47264
dport=80 packets=8 bytes=502 src=10.40.9.83 dst=10.40.9.165 sport=80
dport=47264 packets=6 bytes=11265 [ASSURED] mark=1 use=2
tcp      6 46 TIME_WAIT src=192.168.1.30 dst=10.40.9.83 sport=48428
dport=80 packets=12 bytes=806 src=10.40.9.83 dst=10.40.9.165 sport=80
dport=48428 packets=10 bytes=18713 [ASSURED] mark=1 use=2
tcp      6 46 TIME_WAIT src=192.168.1.30 dst=10.40.9.83 sport=48692
dport=80 packets=6 bytes=398 src=10.40.9.83 dst=10.40.9.165 sport=80
dport=48692 packets=6 bytes=11265 [ASSURED] mark=1 use=2
tcp      6 46 TIME_WAIT src=192.168.1.30 dst=10.40.9.83 sport=48666
dport=80 packets=6 bytes=398 src=10.40.9.83 dst=10.40.9.165 sport=80
dport=48666 packets=7 bytes=11317 [ASSURED] mark=1 use=2
tcp      6 46 TIME_WAIT src=192.168.1.30 dst=10.40.9.83 sport=48218
dport=80 packets=10 bytes=670 src=10.40.9.83 dst=10.40.9.165 sport=80
dport=48218 packets=9 bytes=17213 [ASSURED] mark=1 use=2
tcp      6 46 TIME_WAIT src=192.168.1.30 dst=10.40.9.83 sport=46210
dport=80 packets=11 bytes=726 src=10.40.9.83 dst=10.40.9.165 sport=80
dport=46210 packets=9 bytes=14317 [ASSURED] mark=1 use=2
tcp      6 47 TIME_WAIT src=192.168.1.30 dst=10.40.9.83 sport=46292
dport=80 packets=10 bytes=670 src=10.40.9.83 dst=10.40.9.165 sport=80
dport=46292 packets=12 bytes=18178 [ASSURED] mark=1 use=2
tcp      6 46 TIME_WAIT src=192.168.1.30 dst=10.40.9.83 sport=48074
dport=80 packets=12 bytes=814 src=10.40.9.83 dst=10.40.9.165 sport=80
dport=48074 packets=11 bytes=18126 [ASSURED] mark=1 use=2
tcp      6 46 TIME_WAIT src=192.168.1.30 dst=10.40.9.83 sport=46798
dport=80 packets=11 bytes=738 src=10.40.9.83 dst=10.40.9.165 sport=80
dport=46798 packets=10 bytes=20970 [ASSURED] mark=1 use=2
tcp      6 46 TIME_WAIT src=192.168.1.30 dst=10.40.9.83 sport=46294
dport=80 packets=11 bytes=658 src=10.40.9.83 dst=10.40.9.165 sport=80
dport=46294 packets=13 bytes=14525 [ASSURED] mark=1 use=2
tcp      6 46 TIME_WAIT src=192.168.1.30 dst=10.40.9.83 sport=46034
dport=80 packets=13 bytes=910 src=10.40.9.83 dst=10.40.9.165 sport=80
dport=46034 packets=13 bytes=20317 [ASSURED] mark=1 use=2
tcp      6 46 TIME_WAIT src=192.168.1.30 dst=10.40.9.83 sport=48330
dport=80 packets=9 bytes=590 src=10.40.9.83 dst=10.40.9.165 sport=80
dport=48330 packets=10 bytes=17435 [ASSURED] mark=1 use=2
tcp      6 46 TIME_WAIT src=192.168.1.30 dst=10.40.9.83 sport=46228
dport=80 packets=10 bytes=630 src=10.40.9.83 dst=10.40.9.165 sport=80
dport=46228 packets=10 bytes=15178 [ASSURED] mark=1 use=2
tcp      6 46 TIME_WAIT src=192.168.1.30 dst=10.40.9.83 sport=48210
dport=80 packets=9 bytes=566 src=10.40.9.83 dst=10.40.9.165 sport=80
dport=48210 packets=8 bytes=12987 [ASSURED] mark=1 use=2
tcp      6 46 TIME_WAIT src=192.168.1.30 dst=10.40.9.83 sport=45862
dport=80 packets=9 bytes=602 src=10.40.9.83 dst=10.40.9.165 sport=80
dport=45862 packets=10 bytes=15817 [ASSURED] mark=1 use=2
tcp      6 46 TIME_WAIT src=192.168.1.30 dst=10.40.9.83 sport=45872
dport=80 packets=10 bytes=666 src=10.40.9.83 dst=10.40.9.165 sport=80
dport=45872 packets=12 bytes=18817 [ASSURED] mark=1 use=2
tcp      6 46 TIME_WAIT src=192.168.1.30 dst=10.40.9.83 sport=47248
dport=80 packets=11 bytes=706 src=10.40.9.83 dst=10.40.9.165 sport=80
dport=47248 packets=10 bytes=17265 [ASSURED] mark=1 use=2
tcp      6 46 TIME_WAIT src=192.168.1.30 dst=10.40.9.83 sport=48614
dport=80 packets=8 bytes=502 src=10.40.9.83 dst=10.40.9.165 sport=80
dport=48614 packets=6 bytes=11265 [ASSURED] mark=1 use=2
tcp      6 46 TIME_WAIT src=192.168.1.30 dst=10.40.9.83 sport=48702
dport=80 packets=4 bytes=216 src=10.40.9.83 dst=10.40.9.165 sport=80
dport=48702 packets=2 bytes=112 [ASSURED] mark=1 use=2
tcp      6 46 TIME_WAIT src=192.168.1.30 dst=10.40.9.83 sport=48622
dport=80 packets=10 bytes=670 src=10.40.9.83 dst=10.40.9.165 sport=80
dport=48622 packets=10 bytes=18713 [ASSURED] mark=1 use=2
tcp      6 46 TIME_WAIT src=192.168.1.30 dst=10.40.9.83 sport=46846
dport=80 packets=7 bytes=450 src=10.40.9.83 dst=10.40.9.165 sport=80
dport=46846 packets=6 bytes=11265 [ASSURED] mark=1 use=2
tcp      6 46 TIME_WAIT src=192.168.1.30 dst=10.40.9.83 sport=46376
dport=80 packets=11 bytes=750 src=10.40.9.83 dst=10.40.9.165 sport=80
dport=46376 packets=12 bytes=17369 [ASSURED] mark=1 use=2
tcp      6 46 TIME_WAIT src=192.168.1.30 dst=10.40.9.83 sport=47154
dport=80 packets=8 bytes=502 src=10.40.9.83 dst=10.40.9.165 sport=80
dport=47154 packets=6 bytes=11265 [ASSURED] mark=1 use=2
tcp      6 46 TIME_WAIT src=192.168.1.30 dst=10.40.9.83 sport=47846
dport=80 packets=7 bytes=450 src=10.40.9.83 dst=10.40.9.165 sport=80
dport=47846 packets=7 bytes=11317 [ASSURED] mark=1 use=2
tcp      6 46 TIME_WAIT src=192.168.1.30 dst=10.40.9.83 sport=46952
dport=80 packets=7 bytes=450 src=10.40.9.83 dst=10.40.9.165 sport=80
dport=46952 packets=7 bytes=11317 [ASSURED] mark=1 use=2
tcp      6 46 TIME_WAIT src=192.168.1.30 dst=10.40.9.83 sport=47336
dport=80 packets=7 bytes=450 src=10.40.9.83 dst=10.40.9.165 sport=80
dport=47336 packets=6 bytes=11265 [ASSURED] mark=1 use=2
tcp      6 46 TIME_WAIT src=192.168.1.30 dst=10.40.9.83 sport=46900
dport=80 packets=6 bytes=398 src=10.40.9.83 dst=10.40.9.165 sport=80
dport=46900 packets=7 bytes=11317 [ASSURED] mark=1 use=2
tcp      6 46 TIME_WAIT src=192.168.1.30 dst=10.40.9.83 sport=46964
dport=80 packets=7 bytes=450 src=10.40.9.83 dst=10.40.9.165 sport=80
dport=46964 packets=6 bytes=11265 [ASSURED] mark=1 use=2
tcp      6 46 TIME_WAIT src=192.168.1.30 dst=10.40.9.83 sport=47852
dport=80 packets=7 bytes=450 src=10.40.9.83 dst=10.40.9.165 sport=80
dport=47852 packets=6 bytes=11265 [ASSURED] mark=1 use=2
tcp      6 46 TIME_WAIT src=192.168.1.30 dst=10.40.9.83 sport=48552
dport=80 packets=10 bytes=650 src=10.40.9.83 dst=10.40.9.165 sport=80
dport=48552 packets=8 bytes=13626 [ASSURED] mark=1 use=2
tcp      6 46 TIME_WAIT src=192.168.1.30 dst=10.40.9.83 sport=48142
dport=80 packets=6 bytes=398 src=10.40.9.83 dst=10.40.9.165 sport=80
dport=48142 packets=7 bytes=11317 [ASSURED] mark=1 use=2
tcp      6 46 TIME_WAIT src=192.168.1.30 dst=10.40.9.83 sport=46604
dport=80 packets=10 bytes=674 src=10.40.9.83 dst=10.40.9.165 sport=80
dport=46604 packets=9 bytes=14317 [ASSURED] mark=1 use=2
tcp      6 46 TIME_WAIT src=192.168.1.30 dst=10.40.9.83 sport=46182
dport=80 packets=9 bytes=554 src=10.40.9.83 dst=10.40.9.165 sport=80
dport=46182 packets=8 bytes=11369 [ASSURED] mark=1 use=2
tcp      6 46 TIME_WAIT src=192.168.1.30 dst=10.40.9.83 sport=46620
dport=80 packets=11 bytes=730 src=10.40.9.83 dst=10.40.9.165 sport=80
dport=46620 packets=10 bytes=17265 [ASSURED] mark=1 use=2
tcp      6 46 TIME_WAIT src=192.168.1.30 dst=10.40.9.83 sport=48086
dport=80 packets=9 bytes=590 src=10.40.9.83 dst=10.40.9.165 sport=80
dport=48086 packets=10 bytes=22418 [ASSURED] mark=1 use=2
tcp      6 46 TIME_WAIT src=192.168.1.30 dst=10.40.9.83 sport=48684
dport=80 packets=8 bytes=502 src=10.40.9.83 dst=10.40.9.165 sport=80
dport=48684 packets=6 bytes=11265 [ASSURED] mark=1 use=2
tcp      6 46 TIME_WAIT src=192.168.1.30 dst=10.40.9.83 sport=48564
dport=80 packets=6 bytes=398 src=10.40.9.83 dst=10.40.9.165 sport=80
dport=48564 packets=6 bytes=11265 [ASSURED] mark=1 use=2
tcp      6 46 TIME_WAIT src=192.168.1.30 dst=10.40.9.83 sport=46722
dport=80 packets=10 bytes=630 src=10.40.9.83 dst=10.40.9.165 sport=80
dport=46722 packets=12 bytes=21074 [ASSURED] mark=1 use=2
tcp      6 46 TIME_WAIT src=192.168.1.30 dst=10.40.9.83 sport=47290
dport=80 packets=6 bytes=398 src=10.40.9.83 dst=10.40.9.165 sport=80
dport=47290 packets=7 bytes=11317 [ASSURED] mark=1 use=2
tcp      6 46 TIME_WAIT src=192.168.1.30 dst=10.40.9.83 sport=47098
dport=80 packets=8 bytes=502 src=10.40.9.83 dst=10.40.9.165 sport=80
dport=47098 packets=6 bytes=11265 [ASSURED] mark=1 use=2
tcp      6 46 TIME_WAIT src=192.168.1.30 dst=10.40.9.83 sport=46042
dport=80 packets=12 bytes=786 src=10.40.9.83 dst=10.40.9.165 sport=80
dport=46042 packets=14 bytes=22626 [ASSURED] mark=1 use=2
tcp      6 46 TIME_WAIT src=192.168.1.30 dst=10.40.9.83 sport=46336
dport=80 packets=11 bytes=730 src=10.40.9.83 dst=10.40.9.165 sport=80
dport=46336 packets=10 bytes=12921 [ASSURED] mark=1 use=2
tcp      6 46 TIME_WAIT src=192.168.1.30 dst=10.40.9.83 sport=47332
dport=80 packets=8 bytes=502 src=10.40.9.83 dst=10.40.9.165 sport=80
dport=47332 packets=7 bytes=11317 [ASSURED] mark=1 use=2
Operation failed: Protocol error
conntrack v1.4.7 (conntrack-tools): Operation failed: Protocol error
root@OpenWrt:/# conntrack  -L  -p tcp |grep mark=1 |wc -l
conntrack v1.4.7 (conntrack-tools): 302 flow entries have been shown.
191


This issue can NOT be reproduced in another openwrt version. Both the
kernel and conntrack
version (v1.4.7 vs v1.4.6) are differnet.
root@OpenWrt:/# cat /etc/openwrt_release
DISTRIB_ID='OpenWrt'
DISTRIB_RELEASE='22.03.5'
DISTRIB_REVISION='r20134-5f15225c1e'
DISTRIB_TARGET='ipq806x/generic'
DISTRIB_ARCH='arm_cortex-a15_neon-vfpv4'
DISTRIB_DESCRIPTION='OpenWrt 22.03.5 r20134-5f15225c1e'
DISTRIB_TAINTS=''.

And kernel version is:
root@OpenWrt:/# uname -a
Linux OpenWrt 5.10.176 #0 SMP Thu Apr 27 20:28:15 2023 armv7l GNU/Linux

I can use command "conntrack -U -p tcp -m 1"  without option "-f ipv4"
to update all entries successfully. Anything
change in kernel or user space conntrack tool to cause this different
behavior? Thanks!

root@OpenWrt:/# conntrack -U -p tcp -m 1
tcp      6 91 TIME_WAIT src=192.168.1.30 dst=10.40.9.83 sport=48476
dport=80 packets=9 bytes=578 src=10.40.9.83 dst=10.40.9.165 sport=80
dport=48476 packets=8 bytes=15074 [ASSURED] mark=1 use=2
tcp      6 91 TIME_WAIT src=192.168.1.30 dst=10.40.9.83 sport=46914
dport=80 packets=10 bytes=654 src=10.40.9.83 dst=10.40.9.165 sport=80
dport=46914 packets=9 bytes=12869 [ASSURED] mark=1 use=2
tcp      6 91 TIME_WAIT src=192.168.1.30 dst=10.40.9.83 sport=49240
dport=80 packets=9 bytes=578 src=10.40.9.83 dst=10.40.9.165 sport=80
dport=49240 packets=8 bytes=13626 [ASSURED] mark=1 use=2
tcp      6 91 TIME_WAIT src=192.168.1.30 dst=10.40.9.83 sport=49398
dport=80 packets=8 bytes=502 src=10.40.9.83 dst=10.40.9.165 sport=80
dport=49398 packets=6 bytes=11265 [ASSURED] mark=1 use=2
tcp      6 91 TIME_WAIT src=192.168.1.30 dst=10.40.9.83 sport=49152
dport=80 packets=7 bytes=450 src=10.40.9.83 dst=10.40.9.165 sport=80
dport=49152 packets=6 bytes=11265 [ASSURED] mark=1 use=2
tcp      6 91 TIME_WAIT src=192.168.1.30 dst=10.40.9.83 sport=49402
dport=80 packets=10 bytes=670 src=10.40.9.83 dst=10.40.9.165 sport=80
dport=49402 packets=10 bytes=15817 [ASSURED] mark=1 use=2
tcp      6 91 TIME_WAIT src=192.168.1.30 dst=10.40.9.83 sport=48646
dport=80 packets=6 bytes=398 src=10.40.9.83 dst=10.40.9.165 sport=80
dport=48646 packets=7 bytes=11317 [ASSURED] mark=1 use=2
tcp      6 91 TIME_WAIT src=192.168.1.30 dst=10.40.9.83 sport=48990
dport=80 packets=8 bytes=502 src=10.40.9.83 dst=10.40.9.165 sport=80
dport=48990 packets=6 bytes=11265 [ASSURED] mark=1 use=2
tcp      6 91 TIME_WAIT src=192.168.1.30 dst=10.40.9.83 sport=48834
dport=80 packets=6 bytes=398 src=10.40.9.83 dst=10.40.9.165 sport=80
dport=48834 packets=7 bytes=11317 [ASSURED] mark=1 use=2
tcp      6 101 TIME_WAIT src=192.168.1.30 dst=10.40.9.83 sport=47706
dport=80 packets=11 bytes=730 src=10.40.9.83 dst=10.40.9.165 sport=80
dport=47706 packets=9 bytes=14317 [ASSURED] mark=1 use=2
.......................
.......................
conntrack v1.4.6 (conntrack-tools): 319 flow entries have been updated.

Tony
