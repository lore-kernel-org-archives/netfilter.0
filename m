From: Fernando Barrocal <fbarrocal@uol.com.br>
Subject: RE: iptables1.2.7 + pptp + rh9
Date: Wed, 22 Oct 2003 11:09:46 -0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <6.0.0.22.0.20031022110933.01bf1518@pop3.uol.com.br>
References: <7C9884991ADAE0479C14F10C858BCDF5122E76@alderaan.smgtec.com>
 <6.0.0.22.0.20031021195845.01b5faa0@pop3.uol.com.br>
 <1066780235.23642.4.camel@proto.voiceplus.com.au>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1066780235.23642.4.camel@proto.voiceplus.com.au>
References: <7C9884991ADAE0479C14F10C858BCDF5122E76@alderaan.smgtec.com>
 <6.0.0.22.0.20031021195845.01b5faa0@pop3.uol.com.br>
 <1066780235.23642.4.camel@proto.voiceplus.com.au>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Evan Davies <evand@voiceplus.com.au>
Cc: Netfilter <netfilter@lists.netfilter.org>


It worked !

Thanks a lot !


At 21:50 21/10/2003, Evan Davies wrote:
>I first applied the patch-o-matic to the kernel.
>Recompile and installed iptables 1.2.8 with the following commands:
> > make BINDIR=/sbin LIBDIR=/lib MANDIR=/usr/share/man
> > make BINDIR=/sbin LIBDIR=/lib MANDIR=/usr/share/man install
>Configure the kernel with new options
>Run make bzImage ; make modules ; make modules_install
>Install new kernel image
>Reboot
>
>
>On Wed, 2003-10-22 at 07:59, Fernando Barrocal wrote:
> > Still after installing 1.2.8 it does not work. Do I need to compile ipt ?
> > and the kernel ?
> >
> > At 19:15 21/10/2003, Daniel Chemko wrote:
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
>--
>Evan Davies <evand@voiceplus.com.au>



