From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Problem with counting
Date: Wed, 9 Oct 2002 22:22:41 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021009212244.KUSR459.mta02-svc.ntlworld.com@there>
References: <Pine.LNX.4.44.0210070023330.17224-100000@balthasar.nuitari.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0210070023330.17224-100000@balthasar.nuitari.net>
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

On Tuesday 08 October 2002 5:44 am, Nuitari wrote:

> On Sun, 6 Oct 2002, Antony Stone wrote:

> > > iptables -P FORWARD ACCEPT
> >
> > Ugh :-(   Horrible.
> >
> > > for HOST in $INTERNAL_HOSTS; do
> > >
> > >         $IPTABLES -A FORWARD -o $EXTERNAL_INTERFACE -d $HOST -j ACCEPT
> > >         $IPTABLES -A OUTPUT -o $EXTERNAL_INTERFACE -d $HOST -j ACCEPT
> >
> > Why would a packet ever leave your external interface, with a destination
> > address of one of your internal machines ?
> >
> > >         $IPTABLES -A FORWARD -i $EXTERNAL_INTERFACE -s $HOST -j ACCEPT
> > >         $IPTABLES -A INPUT -i $EXTERNAL_INTERFACE -s $HOST -j ACCEPT
> >
> > Why would a packet ever come in through your external interface with a
> > source address of one of your internal machines ?
> >
> > What are these rules supposed to do ?
>
> They are some rules I wrote after the exemple provided with bw_acct (see
> below) didn't work well.

I suggest you sort these out and make sure your firewall is doing what it is 
supposed to (ie that the rules you have a processing packets in the way you 
expect) before trying to extend the system further to do traffic counting as 
well.

Antony

-- 

Documentation is like sex:
when it's good, it's very very good;
when it's bad, it's still better than nothing.

