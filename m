From: Real Cucumber <monkcucumber@yahoo.com>
Subject: Re: SSH Connections Lost After 1 minute idle
Date: Tue, 13 Jul 2004 16:32:31 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040713233231.33272.qmail@web40709.mail.yahoo.com>
References: <Pine.GSU.4.58.0407131830460.14186@adore.lightlink.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.GSU.4.58.0407131830460.14186@adore.lightlink.com>
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
To: netfilter@lists.netfilter.org

The other thing I should mention is the WAN interface
is connected to a Linksys Router - so that could also
be the culprit...as I did find this thread (however
I'm not using VPN it sounds similair):

http://www.dslreports.com/forum/remark,10634772~mode=flat




--- Nick Taylor <nickt@lightlink.com> wrote:
> I'm sorry, I haven't followed the entirety of this
> thread, but my thoughts
> are as follows:
> 
> Sometimes (on a nat box), the connection tracking
> can't tell the
> difference between an "orphaned" connection (say the
> server crashed) and
> an idle connection, so after a certian period, it
> drops the connection out
> of its table, and of course, another packet that
> comes in later will get a
> connection reset, because it has forgotten.  It can
> also be that you
> overfill your connection table, and least used
> entries are removed (this
> should be a very large number though, so unless you
> have LOTS going
> through your firewall, this is not a big problem).
> 
> So, I would run the following:
> 
> tcpdump -n -i $client_ether host $client_host and \(
> port ssh  or icmp\)
> 
> just to see where and when a connection is actually
> getting broken, and
> which host it is that's doing it, and wether it's a
> connection reset, or
> an ICMP, or what...
> 
> 
> On Tue, 13 Jul 2004, Real Cucumber wrote:
> 
> > Date: Tue, 13 Jul 2004 15:25:09 -0700 (PDT)
> > From: Real Cucumber <monkcucumber@yahoo.com>
> > To: netfilter@lists.netfilter.org
> > Subject: Re: SSH Connections Lost After 1 minute
> idle
> >
> > Basically I've created a port forwarding firewall
> with
> > two network interfaces, that's sole purpose is to
> > forward incoming SSH packets on one interface
> (WAN)
> > through the other interface (LAN) to a local SSH
> > server.
> >
> > I've done this using IPtables and the mangle
> table.
> >
> > It works great, except for the fact that
> connections
> > are dropped if left idle for 1 minute.
> >
> > I have tried allowing all ICMP for
> > INPUT,OUTPUT,FORWARD as well as creating static
> ARP
> > entries on the firewall, and nothing has helped.
> >
> > If anyone knows what else may cause 1 minute idle
> > connection timeouts , please let me know.
> >
> > This connection timeout issue does not occur for
> LAN
> > clients connecting to the SSH server. They can
> remain
> > idle for an indefinate period of time.
> >
> >
> >
> >
> > --- "Dick St.Peters" <stpeters@NetHeaven.com>
> wrote:
> > > Antony Stone writes:
> > > > On Tuesday 13 July 2004 9:57 pm, Real Cucumber
> > > wrote:
> > > >
> > > > > Why should ICMP not be completely blocked?
> The
> > > machine
> > > > > is used strictly as a port forwarding
> > > firewall/router.
> > > >
> > > > Because blocking all ICMP will break
> networking.
> > > Look up the RFCs explaining
> > > > what ICMP is for if you do not understand
> this.
> > >
> > > I would like to second this vigorously, although
> I
> > > would phrase it
> > > differently: blocking ICMP makes networks
> fragile.
> > > Fragile networks
> > > break easily when anything out of the ordinary
> > > happens.
> > >
> > > --
> > > Dick St.Peters, stpeters@NetHeaven.com
> > >
> > >
> >
> >
> >
> >
> > __________________________________
> > Do you Yahoo!?
> > Yahoo! Mail - 50x more storage than other
> providers!
> > http://promotions.yahoo.com/new_mail
> >
> 



	
		
__________________________________
Do you Yahoo!?
New and Improved Yahoo! Mail - 100MB free storage!
http://promotions.yahoo.com/new_mail 

