From: Andre Ramoni <ramoni@databras.com.br>
Subject: Re: can't -j TARPIT
Date: Mon, 20 Feb 2006 16:38:40 -0300
Message-ID: <200602201638.40582.ramoni@databras.com.br>
References: <20060220192525.20720.qmail@web36809.mail.mud.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20060220192525.20720.qmail@web36809.mail.mud.yahoo.com>
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
To: netfilter@lists.netfilter.org

I use gentoo too.
Seems that you use the "extensions" use flag,  right ?
Seems like iptables have build the lib ok, and is loading it ok (since it 
recognizes the -j TARPIT help)
I made a test here, that was to disable the TARPIT in the kernel, and so, I 
got the same error of you.

Your TARPIT is in your kernel as a module ? Try to modprobe it to see if any 
problem occurs.
Once I compiled the kernel with TARPIT build in again, things get back to 
normal.





On Monday 20 February 2006 16:25, angico wrote:
> actually i use gentoo. all the flags necessary for compilation are
> given automaticaly by a program called "emerge". and in fact it
> compiles tarpit target by default. the question is: once the
> installation is ok and includes the lib for tarpit, why doesn't a rule
> can jump for it?
> regards,
> angico.
>
> --- Andre Ramoni <ramoni@databras.com.br> wrote:
> > This rule in my firewall works.
> > You have compiled iptables with what flags ? LIBDIR,BINDIR ?
> > Here, the iptables libs are in /usr/lib/iptables.
> > And, important, have you compiled iptables AFTER you patched the
> > kernel ?
> >
> > On Friday 17 February 2006 19:18, angico wrote:
> > > ok, andre. i tried it, but the answer is still the same. also, i
> >
> > tried
> >
> > > the example given in the man page:
> > > # iptables -A INPUT -p tcp -m tcp --dport 80 -j TARPIT
> > > and the answer is the same.
> > > surprisingly, if i issue the command
> > > # iptables -p tcp -j TARPIT --help
> > > besides the help for the "-p tcp" option it says "TARPIT takes no
> > > options".
> > > any other hints?
> > > btw, iptables --version  ==> 1.3.4
> > > tia,
> > > angico.
>
> __________________________________________________
> Do You Yahoo!?
> Tired of spam?  Yahoo! Mail has the best spam protection around
> http://mail.yahoo.com

-- 
Andre Guimaraes
Databras Informatica
Redes / Servidores Linux

