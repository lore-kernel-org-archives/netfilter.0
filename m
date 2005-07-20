From: "Ming-Ching Tiew" <mingching.tiew@redtone.com>
Subject: Re: ipt_random
Date: Wed, 20 Jul 2005 09:17:36 +0800
Message-ID: <034901c58cc8$d0828650$1280a8c0@newlife>
References: <02ed01c58c43$cd9c7ed0$1280a8c0@newlife>
	<Pine.LNX.4.61.0507191217100.31028@yvahk01.tjqt.qr>
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
> >It seems that the random patch for patch-o-matic for 2.6 kernel
> >existed long time ago but it is still not inside the latest patch-o-matic
> >snapshot. May I know why ?
> 
> 12:16 linux01:~ > tar -xvjf patch-o-matic-ng-20050718.tar.bz2 | grep random
> patch-o-matic-ng-20050718/patchlets/random/
> patch-o-matic-ng-20050718/patchlets/random/linux/include/linux/netfilter_ipv4/ip
> t_random.h

That's a 2.4 kernel patch. I am referring to 2.6 kernel. 

Cheers.




