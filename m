From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: traceroute
Date: Wed, 30 Jun 2004 17:47:52 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200406301747.52236.Antony@Soft-Solutions.co.uk>
References: <2E314DE03538984BA5634F12115B3A4E62E810@email1.mitretek.org>
Reply-To: "netfilter" <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <2E314DE03538984BA5634F12115B3A4E62E810@email1.mitretek.org>
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

On Wednesday 30 June 2004 5:28 pm, Piszcz, Justin Michael wrote:

> I was not aware he had a DMZ.

I am not aware whether he has a DMZ either.

As I understood the problem, he's trying to traceroute from a machine inside 
his network to a machine outside his network.

That means the packets will be going through his FORWARD chain, and it doesn't 
make a difference either way whether he has a DMZ or not (nor does it make a 
difference whether either of the endpoints of the traceroute is *within* the 
DMZ...)

Regards,

Antony.

PS: Is there any chance you could stop top-posting on the list please?   It 
gets awfully confusing when people do that...

> -----Original Message-----
> From: netfilter-admin@lists.netfilter.org
> [mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Antony Stone
> Sent: Wednesday, June 30, 2004 12:22 PM
> To: netfilter
> Subject: Re: traceroute
>
> On Wednesday 30 June 2004 5:10 pm, Piszcz, Justin Michael wrote:
> > Yes, that is why I recommended to him to set the INPUT to
> > ESTABLISHED,RELATED, which may help to solve his problem, as well as
> > setting the policy (FORWARD) to ACCEPT until he can find out what
> > exactly is causing his problem(s).
>
> What's the purpose of making any changes to the INPUT chain when the
> packets
> are being routed through the firewall to somewhere else?
>
> I could just about understand if you were ensuring that his OUTPUT chain
>
> allowed the ICMP TTL Exceeded packets to leave the firewall for that
> particular hop, but I don't see where INPUT comes into it at all?
>
> Regards,
>
> Antony.
>
> > -----Original Message-----
> > From: netfilter-admin@lists.netfilter.org
> > [mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Antony Stone
> > Sent: Wednesday, June 30, 2004 11:33 AM
> > To: netfilter
> > Subject: Re: traceroute
> >
> > On Wednesday 30 June 2004 4:10 pm, Piszcz, Justin Michael wrote:
> > > ICMP is "allowed" when you -I INPUT ESTABLISHED,RELATED.
> > >
> > > You do not have to allow it explicitly (ie: allow icmp so other
> >
> > machines
> >
> > > can ping your machine).
> >
> > Please look at the rules which are being used:
> >
> > $IPT -A FORWARD -p TCP -m state --state ESTABLISHED,RELATED -j ACCEPT
> > $IPT -A FORWARD -p UDP -m state --state ESTABLISHED,RELATED -j ACCEPT
> >
> > They are explicitly accepting TCP and UDP only.   ICMP will not be
> > matched by
> > the above rules.
> >
> > Regards,
> >
> > Antony.
> >
> > > -----Original Message-----
> > > From: netfilter-admin@lists.netfilter.org
> > > [mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Antony
>
> Stone
>
> > > Sent: Wednesday, June 30, 2004 10:58 AM
> > > To: netfilter
> > > Subject: Re: traceroute
> > >
> > > On Wednesday 30 June 2004 3:34 pm, Piszcz, Justin Michael wrote:
> > > > -----Original Message-----
> > > > From: Peter Marshall [mailto:peter.marshall@caris.com]
> > > > Sent: Wednesday, June 30, 2004 10:25 AM
> > > > To: Piszcz, Justin Michael; netfilter
> > > > Subject: Re: traceroute
> > > >
> > > > I don't get anything (except the name lookup) from traceroute.
> > > >
> > > > Below are the relavant rules .... tracert is the ip of the box I
>
> am
>
> > > > trying to traceroute form.
> > > > The Ip of that box is an internet routable ip addess.
> > > >
> > > > $IPT -A FORWARD -p TCP -m state --state ESTABLISHED,RELATED -j
> >
> > ACCEPT
> >
> > > > $IPT -A FORWARD -p UDP -m state --state ESTABLISHED,RELATED -j
> >
> > ACCEPT
> >
> > > > $IPT -A FORWARD -s <tracert box> -o eth1 -j rh-net
> > > > $IPT -A FORWARD -d <tracert box -i eth1 -j net-rh
> > > >
> > > > $IPT -A rh-net -s <tracert box> -j ACCEPT
> > > > $IPT -A net-rh -p UDP -m state --state ESTABLISHED,RELATED -j
>
> ACCEPT
>
> > > You should allow ICMP packets through your system.
> > >
> > > You should certainly allow ICMP through if you want traceroute to
> >
> > work,
> >
> > > and
> > > you should generally allow ICMP if you want many other things to
>
> work.
>
> > > If
> > > you want to block certain types of ICMP, that's fine (many people
>
> do),
>
> > > but
> > > don't block all ICMP.
> > >
> > > Traceroute works by sending either ICMP "ping" (echo request)
>
> packets,
>
> > > or UDP
> > > packets to high port numbers (which are assumed not to be
>
> listening),
>
> > > depending on the Operating System of the client doing the
>
> traceroute.
>
> > > In
> > > both cases the important response is an ICMP TTL exceeded packet,
> >
> > which
> >
> > > contains the IP address of the router where TTL became == 0.
> > >
> > > Remember that firewalling can be a dangerous topic - if you block
> >
> > things
> >
> > > you
> > > don't understand, and therefore don't know that you should allow,
>
> some
>
> > > things
> > > will break.
> > >
> > > Regards,
> > >
> > > Antony.

-- 
If you can't find an Open Source solution for it, then it isn't a real 
problem.

                                                     Please reply to the list;
                                                           please don't CC me.


