From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: ipt_random
Date: Wed, 20 Jul 2005 09:54:13 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0507200953080.10223@yvahk01.tjqt.qr>
References: <02ed01c58c43$cd9c7ed0$1280a8c0@newlife><Pine.LNX.4.61.0507191217100.31028@yvahk01.tjqt.qr><034901c58cc8$d0828650$1280a8c0@newlife>
	<Pine.LNX.4.61.0507200711010.9066@yvahk01.tjqt.qr>
	<058a01c58cf9$dd3d88f0$1280a8c0@newlife>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <058a01c58cf9$dd3d88f0$1280a8c0@newlife>
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


>Too bad that's not how the patch-o-matic scripts are written. It will not
>patch the kernel source, if it did not follow certain directory structure.
>
>That's how the patch-o-matic 'runme --batch' behaves, if what I have
>tried is correct.

I usually dont use runme, because I'm almost sure it creates rejectfiles 
nonetheless given the kernel I use. So I copy the files and merge the *.ladd 
files by hand. Voil`a. Note that I do use ipt_random actively, so it 
definitely works on 2.6.x.



Jan Engelhardt
-- 

