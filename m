From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: chaostables-0.2 & 2.6.19.1
Date: Mon, 1 Jan 2007 15:44:18 +0100 (MET)
Message-ID: <Pine.LNX.4.61.0701011541130.21491@yvahk01.tjqt.qr>
References: <20070101143812.GA7816@vanheusden.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1755217AbXAAOp1@vger.kernel.org>
In-Reply-To: <20070101143812.GA7816@vanheusden.com>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Folkert van Heusden <folkert@vanheusden.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Netfilter Mailing List <netfilter@lists.netfilter.org>


On Jan 1 2007 15:38, Folkert van Heusden wrote:
>Hi,
>
>I'm trying to compile chaostables v0.2 on a system with kernel 2.6.19.1
>and c-compiler 3.4.6:
>
>root@muur:/usr/src/chaostables-0.2/kernel# make all
>make -C /lib/modules/2.6.19.1/build M=$PWD modules;
>make[1]: Entering directory `/usr/src/linux-2.6.19.1'
>  CC [M]  /usr/src/chaostables-0.2/kernel/xt_CHAOS.o
>/usr/src/chaostables-0.2/kernel/xt_CHAOS.c: In function `xt_chaos_target':
>/usr/src/chaostables-0.2/kernel/xt_CHAOS.c:53: error: too many arguments to function

Yes I found this one this morning. The issue is simple: function 
signatures have changed in 2.6.19 and 2.6.20 which I did not all catch 
yet. chaostables compiles fine with 2.6.18 however. I shall have it 
workarounded in the next release. Thanks for noticing! (cc to 
linuxkernel and netfilter before more people run into the same problem)


Jan
-- 
