From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: why can't use connlimit ??
Date: Sat, 29 Oct 2005 18:57:45 +0200 (CEST)
Message-ID: <Pine.LNX.4.58.0510291854100.5550@blackhole.kfki.hu>
References: <200510281133.14216.rob0@gmx.co.uk>
	<20051028172106.ABA796A8D7@smtp.sterenborg.info>
	<43a0cdcb0510282106j54c6a94fx@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <43a0cdcb0510282106j54c6a94fx@mail.gmail.com>
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
To: Buddy wu <ejournal4me@gmail.com>
Cc: Rob Sterenborg <rob@sterenborg.info>, netfilter@lists.netfilter.org

On Sat, 29 Oct 2005, Buddy wu wrote:

> > I just think it's strange that compiling iptables would produce a .so
> > file when compiling the kernel does not produce an accompanying .ko file
> > (except maybe when ipt_connlimit is not compiled as module, but that is
> > something we don't know ;-))
> >
>    I want to tell you that the .so file is not produced when I combile
> the iptables, but it born with the installation with the linux system.
> And I try to complie the kernel with the latest POM, but I failed, it
> tell me he can't find proto member in found object when he compile the
> ipt_connlimit.c file. Is it want corresponding header(.h) file, but it
> can't find in my source files?

It seems that connlimit is unmaintained then.

You can try to find a kernel release which works with the patch in
pom-ng, i.e. uses the same structures. If that's done, then you should
definitely compile an iptables binary from source with the given patched
kernel.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary

