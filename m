From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: choosing the output gateway
Date: Thu, 29 Jul 2004 23:57:17 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407292357.17665.Antony@Soft-Solutions.co.uk>
References: <1091140143.23217.29.camel@goku.afreis.com.br> <200407292339.26158.Antony@Soft-Solutions.co.uk> <1091141434.23223.31.camel@goku.afreis.com.br>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1091141434.23223.31.camel@goku.afreis.com.br>
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

On Thursday 29 July 2004 11:50 pm, Joao Alberto M. dos Reis wrote:

> yep

Okay, show us your rules and the routing tables.

Regards,

Antony

> On Thu, 2004-07-29 at 19:39, Antony Stone wrote:
> > On Thursday 29 July 2004 11:29 pm, Joao Alberto M. dos Reis wrote:
> > > Hi,
> > >
> > > I have the following:
> > > 1 linux box with 2 valid IPs with different gateways each.
> > >
> > > I need to port forward different ports inside my network to different
> > > machines.
> > >
> > > I have set a default gateway to the first link and created a routing
> > > table for the second link pointing to the second gateway. but when I
> > > make my portforward to this second link, the packets try to leave by
> > > the first gateway.
> > >
> > > How can I fix that?
> >
> > Did you use iproute2 rules for this?
> >
> > http://lartc.org
> >
> > Regards,
> >
> > Antony.

-- 
I don't know, maybe if we all waited then cosmic rays would write all our 
software for us. Of course it might take a while.

 - Ron Minnich, Los Alamos National Laboratory

                                                     Please reply to the list;
                                                           please don't CC me.


