From: "prince" <prince@resoftcorp.com>
Subject: Re: iptables v1.2.7a: can't initialize iptables table `filter'
Date: Tue, 13 Jan 2004 10:39:04 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040113183904.M50828@resoftcorp.com>
References: <20040113001933.M22372@resoftcorp.com> <002d01c3d9bb$52e42120$16c8a8c0@goiania.empreza.com.br>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <002d01c3d9bb$52e42120$16c8a8c0@goiania.empreza.com.br>
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
Content-Transfer-Encoding: 7bit
To: VJr <vitorjunior@empreza.com.br>, netfilter@lists.netfilter.org

Thanks Vjr.

"Verify the modules iptables are compile to your kernel". How do I do this? I 
am not so good at Linux administration.

Prince.

On Tue, 13 Jan 2004 07:55:06 -0200, VJr wrote
> Hello! ;)
> 
> Try use
> /sbin/insmod /lib/modules/2.4.20/kernel/net/ipv4/netfilter/iptable_filter.o
> 
> iptables -L
> 
> Verify the modules iptables are compile to your kernel (my english 
> is bad  )
> 
> ;0
> 
> VJr
> 
> ----- Original Message -----
> From: prince <prince@resoftcorp.com>
> To: <netfilter@lists.netfilter.org>
> Sent: Monday, January 12, 2004 10:19 PM
> Subject: iptables v1.2.7a: can't initialize iptables table `filter'
> 
> > Dear Group,
> >
> > I am getting the following whenever I tried to do any operation with
> iptables.
> >
> > % iptables -L
> >
> > iptables v1.2.7a: can't initialize iptables table `filter': iptables who?
> (do
> > you need to insmod?)
> > Perhaps iptables or your kernel needs to be upgraded.
> >
> > % rpm -qa | grep kernel
> > kernel-pcmcia-cs-3.1.31-13
> > kernel-2.4.20-28.9
> > kernel-BOOT-2.4.20-28.9
> > kernel-doc-2.4.20-28.9
> > kernel-source-2.4.20-28.9
> >
> > % lsmod
> > Module                  Size  Used by    Not tainted
> > e1000                  54528   1
> > ext3                   61280   2
> > jbd                    46804   2  [ext3]
> > 3w-xxxx                36192   3
> > sd_mod                 11916   6
> > scsi_mod               63416   2  [3w-xxxx sd_mod]
> >
> > How do I get this resolved? It seems the problem is after I upgraded the
> > kernel. I am running RH 9.
> >
> > Thanks,
> > Prince.
> >
> >





