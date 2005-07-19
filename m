From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: ipt_random
Date: Tue, 19 Jul 2005 12:17:45 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0507191217100.31028@yvahk01.tjqt.qr>
References: <02ed01c58c43$cd9c7ed0$1280a8c0@newlife>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <02ed01c58c43$cd9c7ed0$1280a8c0@newlife>
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


>It seems that the random patch for patch-o-matic for 2.6 kernel
>existed long time ago but it is still not inside the latest patch-o-matic
>snapshot. May I know why ?

12:16 linux01:~ > tar -xvjf patch-o-matic-ng-20050718.tar.bz2 | grep random
patch-o-matic-ng-20050718/patchlets/random/
patch-o-matic-ng-20050718/patchlets/random/linux/include/linux/netfilter_ipv4/ip
t_random.h
(output reduced)


It's there...



Jan Engelhardt
-- 
| Alphagate Systems, http://alphagate.hopto.org/

