From: Nuitari <nuitari@balthasar.nuitari.net>
Subject: Re: Problem with counting
Date: Sat, 12 Oct 2002 20:31:56 -0400 (EDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0210122020570.10431-100000@balthasar.nuitari.net>
References: <20021009212244.KUSR459.mta02-svc.ntlworld.com@there>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20021009212244.KUSR459.mta02-svc.ntlworld.com@there>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Wed, 9 Oct 2002, Antony Stone wrote:

> On Tuesday 08 October 2002 5:44 am, Nuitari wrote:
> 
> > On Sun, 6 Oct 2002, Antony Stone wrote:
> 
> > > > iptables -P FORWARD ACCEPT
> > >
> > > Ugh :-(   Horrible.
> > >
> > > > for HOST in $INTERNAL_HOSTS; do
> > > >
> > > >         $IPTABLES -A FORWARD -o $EXTERNAL_INTERFACE -d $HOST -j ACCEPT
> > > >         $IPTABLES -A OUTPUT -o $EXTERNAL_INTERFACE -d $HOST -j ACCEPT
> > >
> > > Why would a packet ever leave your external interface, with a destination
> > > address of one of your internal machines ?
> > >
> > > >         $IPTABLES -A FORWARD -i $EXTERNAL_INTERFACE -s $HOST -j ACCEPT
> > > >         $IPTABLES -A INPUT -i $EXTERNAL_INTERFACE -s $HOST -j ACCEPT
> > >
> > > Why would a packet ever come in through your external interface with a
> > > source address of one of your internal machines ?
> > >
> > > What are these rules supposed to do ?
> >
> > They are some rules I wrote after the exemple provided with bw_acct (see
> > below) didn't work well.
> 
> I suggest you sort these out and make sure your firewall is doing what it is 
> supposed to (ie that the rules you have a processing packets in the way you 
> expect) before trying to extend the system further to do traffic counting as 
> well.

Ok I finally got to fixing the firewall.

I also fixed the counting problems.
The exemple was misleading, the internal_interface should have been used 
instead of external one...


