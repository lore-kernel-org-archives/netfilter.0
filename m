From: "David Ruggles" <david@safedatausa.com>
Subject: Re: Quick Routing question
Date: Wed, 5 Mar 2003 16:02:52 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <004101c2e35a$968733c0$1f0016ac@daviddesktop>
References: <016701c2e28a$239fbab0$1f0016ac@daviddesktop><20030305010744.5828b6d3.arnt@c2i.net><00ae01c2e323$ca9b6fa0$1f0016ac@daviddesktop> <20030305173750.5f93ec8f.arnt@c2i.net> <01cb01c2e343$16cb9570$1f0016ac@daviddesktop>
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
To: netfilter@lists.netfilter.org

That did the trick, it's working now with out a problem.

Thanks,
David Ruggles

CCNA MCSE (NT) CNA A+
Network Engineer, Safe Data, Inc
910-285-7200    david@safedatausa.com
0100011101101111011001000110110001101111011101100110010101110011011110010110
111101110101
----- Original Message -----
From: "David Ruggles" <david@safedatausa.com>
To: "Arnt Karlsen" <arnt@c2i.net>
Cc: <netfilter@lists.netfilter.org>
Sent: Wednesday, March 05, 2003 1:14 PM
Subject: Re: Quick Routing question


> I'm pretty sure my problem was I didn't have ip forwarding turned on. I've
> enabled it but machine A is being used for something else right now so I
> haven't tested it yet. I thought it might be something dumb, and that fits
> the bill, but if I have any other problems I'll be sure to ask. ;)
>
> On a side note, I'm reading the LARTC howto and it's impressive.
>
> Thanks,
> David Ruggles
>
> CCNA MCSE (NT) CNA A+
> Network Engineer, Safe Data, Inc
> 910-285-7200    david@safedatausa.com
>
0100011101101111011001000110110001101111011101100110010101110011011110010110
> 111101110101
> ----- Original Message -----
> From: "Arnt Karlsen" <arnt@c2i.net>
> To: "David Ruggles" <david@safedatausa.com>
> Cc: <netfilter@lists.netfilter.org>
> Sent: Wednesday, March 05, 2003 11:37 AM
> Subject: Re: Quick Routing question
>
>
> > On Wed, 5 Mar 2003 09:30:35 -0500,
> > "David Ruggles" <david@safedatausa.com> wrote in message
> > <00ae01c2e323$ca9b6fa0$1f0016ac@daviddesktop>:
> >
> > > ----- Original Message -----
> > > From: "Arnt Karlsen" <arnt@c2i.net>
> > > Subject: Re: Quick Routing question
> > >
> > > [Snipped Dig commands]
> > >
> > > >
> > > > ..you run a _root_ name server and come here asking us amateur
> > > > newbies with less than 25 yrs internet experience for netfilter
> > > > advice????? ;-)
> > > >
> > >
> > > I hope you're joking. 172.22.x.x is inside the Class B non-routable
> > > addresses set aside by RFC 1918
> >
> > ..got that right, only just _after_ posting.  ;-)
> >
> > ..it's 172.22.0.0/what-netmask?
> >
> > > Thanks,
> > > David Ruggles
> > >
> > > CCNA MCSE (NT) CNA A+
> > > Network Engineer, Safe Data, Inc
> > > 910-285-7200    david@safedatausa.com
> > > 010001110110111101100100011011000110111101110110011001010111001101111
> > > 0010110 111101110101
> > >
> >
> >
> > --
> > ..med vennlig hilsen = with Kind Regards from Arnt... ;-)
> > ...with a number of polar bear hunters in his ancestry...
> >   Scenarios always come in sets of three:
> >   best case, worst case, and just in case.
> >
> >
>
>


