From: Rio Martin <rio@martin.mu>
Subject: Re: IMQ Replacement
Date: Tue, 20 Jan 2004 08:26:59 +0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200401200826.59437.rio@martin.mu>
References: <1068652569.27810.450.camel@cumulus> <1074352525.4761.1389.camel@peterlaptop> <400BDCB6.2000208@pobox.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <400BDCB6.2000208@pobox.com>
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
To: netfilter@lists.netfilter.org

As the network getting bigger, i think IMQ is the good solution to manage 
traffic from all internal and outside network.
Could someone point me direction to get IMQ patch for 2.4.24 ?

Thank you.

Regards,
Rio Martin.


On Monday 19 January 2004 20:33, Andre Correa wrote:
> I've being using IMQ with 2.4.23 here with no probs too. I've already
> tried to discuss this topic here and in other lists but got no answer.
> Writting to the last maintainner didn't helped much...
> Some time ago there was a posting, maybe in LARTC, about a guy that
> started a parallell IMQ project, but I've never heard about hin anymore...
> I would like to contribute/coordinate in an effort to put IMQ back on
> its track. It is an important feature that is being left behind.
> Peter, maybe we should join, put a new site up with documentation
> updates, maintain 2.4.x patchs and later think what to do with 2.6. We
> may find other people interrested in coding and helping...
> Anybody else care about it?
> let us know...
> cheers
> Andre
>
> Peter Frischknecht wrote:
> > I have been using IMQ with great success for the last few months.  The
> > particular network where this is used has 400+ nodes, and IMQ performs
> > flawlessly.
> >
> > As anyone who uses IMQ will tell you, the only alternatives are:
> > 1 - Install another router, just to perform NAT
> > 2 - Install 2 additional NICs in the Linux gateway with a Xover cable
> > between them
> >
> > Is there another piece of software that performs the job of IMQ?
> > It is great being able to shape traffic AND masquerade packets in one
> > box.  How else can it be done?
> >
> > We shape traffic individually for each client.  Generic traffic shapping
> > rules that regulate the entire pipe would not work for us.
> >
> > The fact that IMQ is unmaintained is nerve wrecking.  It is difficult
> > enough to install the thing with the sources and documentation
> > available.  It will only become more difficult as the kernel evolves and
> > we move to 2.6.x.
> >
> > I don't think I have the knowledge to mainatin the source code.  But I
> > believe in the concept so much that I might just take up the code
> > maintenance.  Hoepefully some other folks will join in.  Maybe we can
> > convince enough folks to incorporate it into 2.6.x.
> >
> > Any help, comments or even flames will be appreciated.  It is time for a
> > solution to this problem.
> >
> > Peter


