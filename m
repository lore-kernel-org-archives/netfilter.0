From: Husnu Demir <hdemir@metu.edu.tr>
Subject: ipset version
Date: Wed, 24 Aug 2016 11:53:52 +0300
Message-ID: <57BD60A0.5070407@metu.edu.tr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,

How can I see ipset version? From the kernel modules, I mean,

modinfo ip_set_bitmap_ip
filename:       /lib/modules/4.6.6/extra/netfilter/ipset/ip_set_bitmap_ip.ko
alias:          ip_set_bitmap:ip
description:    bitmap:ip type of IP sets, revisions 0-3
author:         Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
license:        GPL
depends:        ip_set
vermagic:       4.6.6 SMP mod_unload modversions

There is no version field? I have been compiling from the source, build
daily.

Thanks.



-- 

Husnu Demir.
Network.
