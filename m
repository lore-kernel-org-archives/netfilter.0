From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: detect original chain after jump?
Date: Sat, 27 Mar 2004 14:28:36 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403271428.36961.Antony@Soft-Solutions.co.uk>
References: <20040327133801.GA5251@fake> <200403271351.32300.Antony@Soft-Solutions.co.uk> <20040327142013.GA6033@fake>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040327142013.GA6033@fake>
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

On Saturday 27 March 2004 2:20 pm, Richard Hector wrote:

> On Sat, Mar 27, 2004 at 01:51:32PM +0000, Antony Stone wrote:
> > On Saturday 27 March 2004 1:38 pm, Richard Hector wrote:
> > > This means that early on, I have something like:
> > >
> > > iptables -A INPUT -j protocol
> > > iptables -A FORWARD -j protocol
> > >
> > > iptables -A protocol -p tcp --dport 22 -j ssh
> > >
> > > But then I get a bit stuck. I need to then do different things
> > > depending on the source and destination - which includes whether this
> > > packet is arriving locally or being forwarded. Therefore it would be
> > > useful to know whether this packet started out in the INPUT or FORWARD
> > > chain - but that info seems to have been lost with the jump.
> > >
> > > Is there any way to regain that?
> >
> > Surely the destination address is all you need for this?
>
> I suppose so. It's just that the INPUT chain is a handy way to group all
> the local interfaces and addresses. Without it, I multiply the number of
> rules by the number of possible local addresses that could be used.

Well, okay then - how about using the MARK target to mark packets with one 
value in INPUT and a different value in FORWARD, and then check the marked 
value in your user-defined chain to see how the packet got there?

Look up the MARK target and the -m mark match for more info.

Regards,

Antony.

-- 
Christmas was just an opportunity to upgrade to kernel 2.6 while no-one was 
around to notice the downtime.

                                                     Please reply to the list;
                                                           please don't CC me.


