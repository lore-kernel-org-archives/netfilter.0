From: Diederick van Dijk <diedvdyk@van-dijk.net>
Subject: Re: SNAT hangs system in SMP mode (kernel 2.4.21)
Date: Tue, 22 Jul 2003 21:09:15 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200307222109.15092.diedvdyk@van-dijk.net>
References: <IIEKKHFJALFLMOPAIGGIOEIICAAA.psycoman@pop.com.br> <1058898587.8366.316.camel@tux.rsn.bth.se>
Reply-To: diedvdyk@van-dijk.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1058898587.8366.316.camel@tux.rsn.bth.se>
Content-Disposition: inline
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
To: Martin Josefsson <gandalf@wlug.westbo.se>, Waldecir Loureiro dos Santos Filho <psycoman@pop.com.br>
Cc: Netfilter <netfilter@lists.netfilter.org>

On Tuesday 22 July 2003 20:29, Martin Josefsson wrote:
> On Mon, 2003-07-21 at 14:38, Waldecir Loureiro dos Santos Filho wrote:
> > I get this problem too, with Kernel-2.4.21, now I back to orignal kernel
> > of RH and no more problems
> >
> > Some budy know if 2.4.21 have a problem with iptables ? ? ?
>
> I havn't seen this problem. Can you reproduce it at will?
> If so, could you guys please try the nmi watchdog?
>
> Add nmi_watchdog=1 to the kernel commandline in the bootloader.
>
> Boot with that and wait a few seconds after the hang and see if it
> prints out anything. Write that down (using a serial console is
> recommended) and run it through ksymoops and post the output to the
> netfilter-devel list.

Hi,

Yes, I can reproduce this problem at will. I shall try the nmi watchdog.
But it has to wait until Saturday because I'm very busy right know and need my 
internet connection (The machine is my internet gateway).

Diederick


