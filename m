From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: how to block p2p
Date: Thu, 11 Mar 2004 11:45:35 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403111145.35177.Antony@Soft-Solutions.co.uk>
References: <000501c4075b$ef029a00$2f00a8c0@deamon>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000501c4075b$ef029a00$2f00a8c0@deamon>
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

On Thursday 11 March 2004 11:27 am, Babar Kazmi wrote:

> Dear
>
> You can use squid or netfilter to block the same.
> I think squid is more manageable and don't effect other stuff.

But is port 80 (http) filtering sufficient to block p2p?

I thought (I have little experience of trying to do this) that p2p networks 
were sufficiently clever (read: adaptive) that if you blocked them 
communicating by one means, then they would find an alternative (port 22, 25, 
110, 443, 3128, 8080....etc)?

Regards,

Antony.

> >On Thu, Mar 11, 2004 at 09:26:26AM +0000, Antony Stone wrote:
> > > On Thursday 11 March 2004 9:17 am, Tomasz Macioszek wrote:
> > > > > > iptables -P FORWARD DROP
> > > > >
> > > > > iptables -F FORWARD
> > > >
> > > > I know but I would like to block only p2p traffic??
> > > > Is patch which blocks only p2p??
> > >
> > > I do not know of a way to block p2p without blocking other protocols.
> > >
> > >
> > > However, does not mean there isn't one, just that I don't know about
> > > it.
> > >
> > > Regards,
> > >
> > > Antony.
> > >
> > > --
> > > There's no such thing as bad weather - only the wrong clothes.
> > >
> > >  - Billy Connolly
> > >
> > >                                                      Please reply to
> > > the
>
> list;
>
> > >                                                            please don't
>
> CC me.
>
> ><< signature.asc >>

-- 
There are only 10 types of people in the world:
those who understand binary notation,
and those who don't.

                                                     Please reply to the list;
                                                           please don't CC me.


