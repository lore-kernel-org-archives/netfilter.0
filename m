From: Buddy wu <ejournal4me@gmail.com>
Subject: Re: why can't use connlimit ??
Date: Sat, 29 Oct 2005 12:06:58 +0800
Message-ID: <43a0cdcb0510282106j54c6a94fx@mail.gmail.com>
References: <200510281133.14216.rob0@gmx.co.uk>
	<20051028172106.ABA796A8D7@smtp.sterenborg.info>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20051028172106.ABA796A8D7@smtp.sterenborg.info>
Content-Disposition: inline
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
To: Rob Sterenborg <rob@sterenborg.info>
Cc: netfilter@lists.netfilter.org

> I just think it's strange that compiling iptables would produce a .so
> file when compiling the kernel does not produce an accompanying .ko file
> (except maybe when ipt_connlimit is not compiled as module, but that is
> something we don't know ;-))
>
   I want to tell you that the .so file is not produced when I combile
the iptables, but it born with the installation with the linux system.
And I try to complie the kernel with the latest POM, but I failed, it
tell me he can't find proto member in found object when he compile the
ipt_connlimit.c file. Is it want corresponding header(.h) file, but it
can't find in my source files?

