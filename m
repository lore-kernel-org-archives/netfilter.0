From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Weird TCP flags?
Date: Fri, 12 Dec 2003 13:59:27 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200312121359.27728.Antony@Soft-Solutions.co.uk>
References: <003101c3c065$f61ad790$13fea8c0@melita.com> <003c01c3c0b1$dd2b6960$b2c2a70a@melita.com> <1071235889.1890.47.camel@jasiiitosh.nexusmgmt.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1071235889.1890.47.camel@jasiiitosh.nexusmgmt.com>
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

On Friday 12 December 2003 1:32 pm, John A. Sullivan III wrote:

> > > The SYN packet will be sent to your web server and the web server will
> > > respond with a SYN, ACK packet but it will not be related to anything
> > > in the conntrack table.  The connection may be being allowed by a more
> > > general rule than one to the web services.
> > >
> > > So, I suppose we should ask what your ACCEPT rules look like - John
> >
> > I'm absolutely doing that -- here are the relevant ACCEPTs:
> >
> > iptables -A FORWARD -i ppp0 -o eth1 -p tcp --dport 80 -d 192.168.254.242
> > -j ACCEPT
> > iptables -t nat -A PREROUTING -i ppp0 -d <my.public.ip.here> -p tcp
> > --dport 80 -j DNAT --to-destination 192.168.254.242
> >
> > If I want to forward port 80 to that box, isn't that the way to do it? 
> > How would a connection escape conntrack?

> You never told it to make an entry in conntrack.  Try this:
> iptables -A FORWARD -i ppp0 -o eth1 -p tcp --dport 80 -d 192.168.254.242
> -m state --state NEW -j ACCEPT

I disagree with this.

Making the rule more explicit by matching state NEW is not a bad idea, but it 
has nothing to do with whether a conntrack table entry gets created or not.   
If you have compiled in connection tracking, or loaded the module, then all 
connections which are ACCEPTed will result in a conntrack table entry.   
There's no way to stop that happening on a connection-by-connection basis.

Antony.

-- 
Documentation is like sex.
When it's good, it's very very good.
When it's bad, it's still better than nothing.

                                                     Please reply to the list;
                                                           please don't CC me.


