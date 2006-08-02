From: "Ming-Ching Tiew" <mingching.tiew@redtone.com>
Subject: Re: iptables random support
Date: Wed, 2 Aug 2006 10:39:22 +0800
Message-ID: <015101c6b5dc$dc8eb390$0100a8c0@newlife>
References: <5B0731A8753509478386ED3D6513B2D101AE6CBB@isp-per-exch01.win2k.iinet.net.au>
	<Pine.LNX.4.61.0608011305260.29748@yvahk01.tjqt.qr>
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


I took the patch and apply to a vanilla 2.6.17.7, it failed :-

patching file include/linux/netfilter_ipv4/ipt_random.h
patching file include/linux/netfilter_ipv6/ip6t_random.h
patching file net/ipv4/netfilter/Kconfig
Hunk #1 succeeded at 314 with fuzz 2 (offset -34 lines).
patching file net/ipv4/netfilter/Makefile
Hunk #1 FAILED at 64.
1 out of 1 hunk FAILED -- saving rejects to file net/ipv4/netfilter/Makefile.rej
patching file net/ipv4/netfilter/ipt_random.c
patching file net/ipv6/netfilter/Kconfig
Hunk #1 succeeded at 123 with fuzz 2 (offset -24 lines).
patching file net/ipv6/netfilter/Makefile
Hunk #1 FAILED at 12.
1 out of 1 hunk FAILED -- saving rejects to file net/ipv6/netfilter/Makefile.rej
patching file net/ipv6/netfilter/ip6t_random.c


----- Original Message ----- 
From: "Jan Engelhardt" <jengelh@linux01.gwdg.de>
To: "Daniel Williams" <danielw@staff.iinet.net.au>
Cc: <netfilter@lists.netfilter.org>
Sent: Tuesday, August 01, 2006 7:06 PM
Subject: Re: iptables random support


> >
> >I have been trying to get iptables -m random support working to very
> >little success.
> >
> >Does anyone have a modern 2.6 kernel with iptables -m random working ?
> 
> http://freshmeat.net/p/jen_kernel/
> look for random in the .tar.bz2
> 
> 
> Jan Engelhardt
> -- 
> 




