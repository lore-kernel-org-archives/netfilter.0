From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Forwarding traffic destined to local machine
Date: Sat, 8 Nov 2003 20:37:52 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200311082037.hA8Kbsj15742@agate.rockstone.co.uk>
References: <Pine.SOL.4.20.0311081517280.3735-100000@csa.bu.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.SOL.4.20.0311081517280.3735-100000@csa.bu.edu>
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
To: netfilter@lists.netfilter.org

On Saturday 08 November 2003 8:25 pm, Leonid Veytser wrote:

>   I have a kernel module that registers to listen on netfilter
> hooks. I also have a user level program that uses libipq to
> receive packets that were received by the module.
>    Now, the user application registers to listen to all packets coming in
> on NF_IP_PRE_ROUTING hook. If, the packet is destined to the local
> machine, I change the destination at iph->daddr to another destination and
> I recalculate the checksum.
>
>   By this, the packet should show up at the NF_IP_FORWARD hook, but it
> doesn't. It just gets dropped somewere beforehand.
>
> What am I doing wrong?

Oh.   From yur initial posting I assumed you were using DNAT and having some 
problem.

What you're attempting is beyond my expertise - can anyone else suggest what 
to investigate?

Antony.

> On Sat, 8 Nov 2003, Antony Stone wrote:
> > On Saturday 08 November 2003 5:08 pm, Leonid Veytser wrote:
> > > How can I forward traffic(to some different machine) that is destined
> > > to the local machine using netfilter?
> > >
> > > Changing destination address at the prerouting hook doesn't seem to
> > > work.
> >
> > Tell us what you did and how you know it didn't work and we may be able
> > to help.
> >
> > Antony
> >
> > --
> >
> > G- GIT/E d- s+:--(-) a+ C++++$ UL++++$ P+(---)>++ L+++(++++)$ !E W(-)
> > N(-) o? w-- O !M V+++(--) !PS !PE Y+ PGP+> t- tv@ b+++ DI++ D--- e++>+++
> > h++ r@? 5? !X- !R K--?
> >                                                      Please reply to the
> > list; please don't CC me.

-- 

Agnostics do not believe in God.
Atheists believe there is no God.

Does that make me an agnostic atheist if I do not believe there is no God?
                                                     Please reply to the list;
                                                           please don't CC me.

