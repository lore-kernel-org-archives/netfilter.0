From: "Venkatesh. K" <venkatesh@cbayscribe.com>
Subject: Re: iptables1.2.7 + pptp + rh9
Date: Wed, 22 Oct 2003 06:30:13 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <009501c39837$e1883850$2800a8c0@karu>
References: <7C9884991ADAE0479C14F10C858BCDF52E375B@alderaan.smgtec.com> <6.0.0.22.0.20031021210350.01b66818@pop3.uol.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: Daniel Chemko <dchemko@smgtec.com>, netfilter@lists.netfilter.org, Fernando Barrocal <fbarrocal@uol.com.br>

----- Original Message ----- 
From: "Fernando Barrocal" <fbarrocal@uol.com.br>
To: "Daniel Chemko" <dchemko@smgtec.com>; <netfilter@lists.netfilter.org>
Sent: Wednesday, October 22, 2003 4:35 AM
Subject: RE: iptables1.2.7 + pptp + rh9


>
> Let me ask another question ... a newbie one ...
>
> Is that order correct ?
>
> - apply pptp patch
> - compile iptables
> - compile kernel (config, dep, clean, image, modules)
>

Apply patch
Compile Kernel
Compile IPtables

Venkatesh K
>
>
> At 20:06 21/10/2003, Daniel Chemko wrote:
> >Um, yeah. You need to compile the userspace tools against the kernel
> >that you are installing.
> >
> >-----Original Message-----
> >From: Fernando Barrocal [mailto:fbarrocal@uol.com.br]
> >Sent: Tuesday, October 21, 2003 3:00 PM
> >To: Daniel Chemko; netfilter@lists.netfilter.org
> >Subject: RE: iptables1.2.7 + pptp + rh9
> >
> >
> >Still after installing 1.2.8 it does not work. Do I need to compile ipt
> >?
> >and the kernel ?
> >
> >At 19:15 21/10/2003, Daniel Chemko wrote:
> > >Download ipt 1.2.8 or 1.2.9 if it is out.
> > >Or, use the CVS userspace
> > >
> > ># KERNEL_DIR=<yourkerneldir> make
> > ># make install
> > >
> > >You might want to change the destination directories in the Makefile to
> > >conform to the Redhat deployment layout
> > >LIBDIR=/lib/
> > >MANDIR=/usr/man
> > >etc..
> > >
> > >-----Original Message-----
> > >From: Fernando Barrocal [mailto:fbarrocal@uol.com.br]
> > >Sent: Tuesday, October 21, 2003 2:04 PM
> > >To: netfilter@lists.netfilter.org
> > >Subject: iptables1.2.7 + pptp + rh9
> > >
> > >
> > >Hi,
> > >
> > >I am applying the pptp patch with patch-o-matic in my redhat 9.0.
> > >Somebody
> > >have somer step by step to patch the kernel, compile the iptable
> > >userspace
> > >and compile the kernel to accept DNAT ?
> > >
> > >Thanks in advance
> > >
> > >Fernando Barrocal
>
>
>
>


