From: "Peter Marshall" <peter.marshall@caris.com>
Subject: Re: Established / related
Date: Tue, 29 Jun 2004 16:47:12 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <006a01c45e11$df1692b0$49caa8c0@caris.priv>
References: <004c01c45e07$8fcd1260$49caa8c0@caris.priv> <200406291946.24501.Antony@Soft-Solutions.co.uk> <005501c45e0d$0352f290$49caa8c0@caris.priv> <200406292025.14289.Antony@Soft-Solutions.co.uk>
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
To: netfilter <netfilter@lists.netfilter.org>

Thank you for your help.

Peter


----- Original Message ----- 
From: "Antony Stone" <Antony@Soft-Solutions.co.uk>
To: "netfilter" <netfilter@lists.netfilter.org>
Sent: Tuesday, June 29, 2004 4:25 PM
Subject: Re: Established / related


On Tuesday 29 June 2004 8:12 pm, Peter Marshall wrote:

> shouldn't the reply be taken care of by the established,related rule
below?

No, because the reply will be coming *from* $IPSERVER, and your rule in the
FORWARD chain calling the user-defined chain only matches packets with
$IPSERVER as the destination address.

> (I am probably just missing something blatantly obvious)

Yes, I think so :)

Regards,

Antony.

PS: I've chosen the sig on this response specially for you :)

> ----- Original Message -----
> From: "Antony Stone" <Antony@Soft-Solutions.co.uk>
> To: "netfilter" <netfilter@lists.netfilter.org>
> Sent: Tuesday, June 29, 2004 3:46 PM
> Subject: Re: Established / related
>
> On Tuesday 29 June 2004 7:33 pm, Peter Marshall wrote:
> > I was wondering if there is a way to use established, related on a
>
> subchain
>
> > only.
> >
> > ex.  ftp server behind firewall
> >
> > $IPTABLES -A FORWARD -d $IPSERVER -j ftpchain
> >
> > $IPTABLES -A ftpchain -p TCP -m state --state ESTABLISHED,RELATED -j
>
> ACCEPT
>
> > This does not seem to work .. It only seems to work when I have the
> > established,related line on the Forwared chain.
>
> I really cannot see why this should not do what you want (which presumably
> is
> to match only established or related packets going to $IPSERVER).
>
> The only thing which looks a little odd to me, which I wonder whether
> you've forgotten, is to make sure there is a rule for the reply packets
> coming back again from $IPSERVER?
>
> If that's not the problem, please give some more details on how you're
> testing
> it and why you think it doesn't work.
>
> Regards,
>
> Antony.

-- 
90% of networking problems are routing problems.
9 of the remaining 10% are routing problems in the other direction.
The remaining 1% might be something else, but check the routing anyway.

                                                     Please reply to the
list;
                                                           please don't CC
me.



