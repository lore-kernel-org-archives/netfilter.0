From: Martin Josefsson <gandalf@wlug.westbo.se>
Subject: Re: ip_conntrack_lock not readlocked? anyone?
Date: 16 Oct 2002 23:33:05 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1034803985.7595.230.camel@tux>
References: <F2421sZV4CllPF6p0V700001255@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <F2421sZV4CllPF6p0V700001255@hotmail.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: hallian hallian <hallian@hotmail.com>
Cc: Netfilter <netfilter@lists.netfilter.org>

On Wed, 2002-10-16 at 22:18, hallian hallian wrote:
>hello -
> 
>I was wondering if anyone has seen this error/warning message before?
>What does it mean?  Any idea? 
>
>Oct 13 11:50:18 f kernel: ASSERT ip_nat_core.c:739
>&ip_conntrack_lock_Rsmp_4193d6ac readlocked
>Oct 13 11:50:18 f kernel: ASSERT ip_conntrack_core.c:91
>&ip_conntrack_lock_Rsmp_4193d6ac readlocked

This is just a small bug in the debugging :) it's not a code-bug so it's
nothing to worry about. I've fixed this (I hope) and the patch will be
in kernel 2.4.20. You can also get the fix from a patch-o-matic snapshot
or cvs.

The other option is to turn off "Network packet filtering debugging" in
your kernelconfiguration and rebuild your kernel.

-- 
/Martin

Never argue with an idiot. They drag you down to their level, then beat
you with experience.

