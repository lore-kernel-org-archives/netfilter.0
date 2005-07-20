From: "Ming-Ching Tiew" <mingching.tiew@redtone.com>
Subject: Re: ipt_random
Date: Wed, 20 Jul 2005 16:15:54 +0800
Message-ID: <061001c58d03$3fdeee00$1280a8c0@newlife>
References: <02ed01c58c43$cd9c7ed0$1280a8c0@newlife><Pine.LNX.4.61.0507191217100.31028@yvahk01.tjqt.qr><034901c58cc8$d0828650$1280a8c0@newlife>
	<Pine.LNX.4.61.0507200711010.9066@yvahk01.tjqt.qr>
	<058a01c58cf9$dd3d88f0$1280a8c0@newlife>
	<Pine.LNX.4.61.0507200953080.10223@yvahk01.tjqt.qr>
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
> >Too bad that's not how the patch-o-matic scripts are written. It will not
> >patch the kernel source, if it did not follow certain directory structure.
> >
> >That's how the patch-o-matic 'runme --batch' behaves, if what I have
> >tried is correct.
> 
> I usually dont use runme, because I'm almost sure it creates rejectfiles 
> nonetheless given the kernel I use. So I copy the files and merge the *.ladd 
> files by hand. Voil`a. Note that I do use ipt_random actively, so it 
> definitely works on 2.6.x.
> 

If you have small work  you could copy here and there. As soon as
you have a few patches to apply, it will become very laborious and
error proned. That's the whole purpose of 'runme'.

Any the contrary, I use 'runme' as it guarantees me certain minimum
repeatable quality.

Anyway, thanks for letting me know about the quality of the ipt_random.c
on 2.6 kernel. I actually found another patch, 

https://lists.netfilter.org/pipermail/ netfilter-devel/2004-November/017491.html 

Cheers.




