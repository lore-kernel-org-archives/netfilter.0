From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: ipt_random
Date: Wed, 20 Jul 2005 10:32:10 +0200 (CEST)
Message-ID: <Pine.LNX.4.58.0507201021010.25054@blackhole.kfki.hu>
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

On Wed, 20 Jul 2005, Ming-Ching Tiew wrote:

> > Given that there is Kconfig, this patch _is_ also for 2.6.
>
> Too bad that's not how the patch-o-matic scripts are written. It will not
> patch the kernel source, if it did not follow certain directory structure.

Actually, it's not the directory structure but the info file which
prevents the patch to show up and offered for 2.6 kernels. I've added the
missing 2.6 port to the svn tree.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary

