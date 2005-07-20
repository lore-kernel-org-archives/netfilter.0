From: "Ming-Ching Tiew" <mingching.tiew@redtone.com>
Subject: Re: ipt_random
Date: Wed, 20 Jul 2005 15:08:43 +0800
Message-ID: <058a01c58cf9$dd3d88f0$1280a8c0@newlife>
References: <02ed01c58c43$cd9c7ed0$1280a8c0@newlife><Pine.LNX.4.61.0507191217100.31028@yvahk01.tjqt.qr><034901c58cc8$d0828650$1280a8c0@newlife>
	<Pine.LNX.4.61.0507200711010.9066@yvahk01.tjqt.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org


From: "Jan Engelhardt" <jengelh@linux01.gwdg.de>
> 
> 07:11 linux01:../random/linux > l net/ipv4/netfilter/
> total 24
> drwxr-xr-x    2 jengelh  users        4096 2005-07-19 23:55 .
> drwxr-xr-x    3 jengelh  users        4096 2005-07-19 23:55 ..
> -rw-r--r--    1 jengelh  users         172 2003-12-18 19:28 Config.in.ladd
> -rw-r--r--    1 jengelh  users        2236 2003-12-18 19:28 ipt_random.c
> -rw-r--r--    1 jengelh  users         326 2004-05-06 15:27 Kconfig.ladd
> -rw-r--r--    1 jengelh  users          93 2003-12-18 19:28 Makefile.ladd
> 07:11 linux01:../random/linux > pwd
> /home/jengelh/patch-o-matic-ng-20050719/patchlets/random/linux
> 
> Given that there is Kconfig, this patch _is_ also for 2.6.
> 

Too bad that's not how the patch-o-matic scripts are written. It will not
patch the kernel source, if it did not follow certain directory structure.

That's how the patch-o-matic 'runme --batch' behaves, if what I have
tried is correct.






