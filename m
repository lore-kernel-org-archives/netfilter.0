From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: ipt_connlimit.c + kernel 2.6.20 = big problem. HELP
Date: Thu, 19 Apr 2007 09:28:29 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0704190922400.30549@yvahk01.tjqt.qr>
References: <462626F1.6050402@gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <462626F1.6050402@gmail.com>
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
To: dominiaz <dominiaz@gmail.com>
Cc: netfilter@lists.netfilter.org


On Apr 18 2007 16:10, dominiaz wrote:
> I`ve got the newest snapshot of p-o-m from 14.04.2007. When i include
> ipt_connlimit.c to my kernel something isn`t ok. When i try to compile
> it then get an error like:
>
> net/built-in.o: In function `match':
> ipt_connlimit.c:(.text+0x6ae49): undefined reference to
> `nf_conntrack_find_get'
> make: *** [.tmp_vmlinux1] Error 1
>
> Does someone know how to resolve that problem?

http://freshmeat.net/p/ccj_kernel/
pick the 2.6.20 tarball, there's a compile fix in it from me.


Jan
-- 

