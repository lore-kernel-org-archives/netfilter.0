From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: ipt_random
Date: Wed, 20 Jul 2005 08:25:16 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0507200711010.9066@yvahk01.tjqt.qr>
References: <02ed01c58c43$cd9c7ed0$1280a8c0@newlife>
	<Pine.LNX.4.61.0507191217100.31028@yvahk01.tjqt.qr>
	<034901c58cc8$d0828650$1280a8c0@newlife>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <034901c58cc8$d0828650$1280a8c0@newlife>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ming-Ching Tiew <mingching.tiew@redtone.com>
Cc: netfilter@lists.netfilter.org

>> >It seems that the random patch for patch-o-matic for 2.6 kernel
>> >existed long time ago but it is still not inside the latest patch-o-matic
>> >snapshot. May I know why ?
>> 
>> 12:16 linux01:~ > tar -xvjf patch-o-matic-ng-20050718.tar.bz2 | grep random
>> patch-o-matic-ng-20050718/patchlets/random/
>> patch-o-matic-ng-20050718/patchlets/random/linux/include/linux/netfilter_ipv4/ip
>> t_random.h
>
>That's a 2.4 kernel patch. I am referring to 2.6 kernel. 

07:11 linux01:../random/linux > l net/ipv4/netfilter/
total 24
drwxr-xr-x    2 jengelh  users        4096 2005-07-19 23:55 .
drwxr-xr-x    3 jengelh  users        4096 2005-07-19 23:55 ..
-rw-r--r--    1 jengelh  users         172 2003-12-18 19:28 Config.in.ladd
-rw-r--r--    1 jengelh  users        2236 2003-12-18 19:28 ipt_random.c
-rw-r--r--    1 jengelh  users         326 2004-05-06 15:27 Kconfig.ladd
-rw-r--r--    1 jengelh  users          93 2003-12-18 19:28 Makefile.ladd
07:11 linux01:../random/linux > pwd
/home/jengelh/patch-o-matic-ng-20050719/patchlets/random/linux

Given that there is Kconfig, this patch _is_ also for 2.6.


Jan Engelhardt
-- 

