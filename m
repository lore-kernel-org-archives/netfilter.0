From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Is this firewall good enough?
Date: Tue, 8 Jun 2004 16:23:15 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200406081623.15400.Antony@Soft-Solutions.co.uk>
References: <20040608091436.84113.qmail@web14712.mail.yahoo.com> <200406081057.40137.Antony@Soft-Solutions.co.uk> <40C5D53A.9060407@linuxmail.org>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40C5D53A.9060407@linuxmail.org>
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

On Tuesday 08 June 2004 4:03 pm, Feizhou wrote:

> Antony Stone wrote:
> > On Tuesday 08 June 2004 10:42 am, Feizhou wrote:
> >>>2.  /sbin/iptables -A INPUT -p tcp -m state --state
> >>>ESTABLISHED,RELATED -j ACCEPT
> >>
> >>Forget about this. It makes things easier yes but it is too slow if you
> >>come under attack...but then you put everything on one box seemly so I
> >>guess you don't get much traffic.
> >
> > How do you recommend dealing with reply packets instead?
>
> I would create multiple chains
>
> iptables -N tcp_packets and so on.
>
> So to avoid loading the connection tracking module, I would put rules to
> handle return packets in the proper chain.
>
> eg: iptables -A tcp_packets -p tcp --sport 1024:65535 --dport 80 -j ACCEPT

That rule allows packets *to* port 80 - I was asking how you deal with *reply* 
packets - the ones *from* port 80 on the remote server.

> Then i put tcp/udp/icmp packets to the proper chain
>
> eg: iptables -A INPUT -p tcp -j tcp_packets
>
> You could make a catch all for return packets like:
>
> iptables -A INPUT -p tcp ! --syn -j ACCEPT

You seem to be advocating not using the ESTABLISHED,RELATED match - which 
would render the firewall stateless (like ipchains) instead of stateful.   
That seems a backwards step to me - or have I misunderstood something?

Regards,

Antony.

-- 
In Heaven, the police are British, the chefs are Italian, the beer is Belgian, 
the mechanics are German, the lovers are French, the entertainment is 
American, and everything is organised by the Swiss.

In Hell, the police are German, the chefs are British, the beer is American, 
the mechanics are French, the lovers are Swiss, the entertainment is Belgian, 
and everything is organised by the Italians.

                                                     Please reply to the list;
                                                           please don't CC me.


