From: "Matthew Hellman" <mhellman@raccoon.com>
Subject: Re: Trying to get a Subnet NATted
Date: Mon, 9 Dec 2002 21:45:30 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <003a01c2a003$774d83f0$020aa8c0@winxp>
References: <000801c29f36$62cbd0d0$6401a8c0@athlon>
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
To: "Kevin L. Collins" <kcollins@qx.net>, netfilter@lists.samba.org

> You're right, This isn't typical.  I have my WAN lines terminating at my
> ISP. They in turn forward these packets to me via the aDSL line.  That's
> the whole problem.  Because the Linux box "sees" them as being bound for
> another destination (the Internet in this case), The machine just
> forwards them along without modifing them (i.e. leaving the source
> address is unmodified) and my ISP's routers then kill these packets for
> being like this.

> The funny thing about this is:  I've got a MS Proxy Server 2.0, that's
> doing the natting for me now.  So it is possible - somehow.  I think I
> need to somehow tell my Linux machine that the packets with the
> 10.200.9.x and 10.200.10.x source addresses should be NATted as they
> leave the routing process, but I can't get this done.  I grant you my
> knowledge of Linux and IPTABLES is weak, which is why (after a week of
> pulling teeth) I've posed the problem the list.

I'm not familiar with MS Proxy server, but I believe a proxy server is a
potentially different situation.  It makes connections on behalf of clients,
it doesn't "route" the packets. In fact, in a typical proxy configuration,
packets will have a destination address of the proxy itself. Of course, you
specifically mention the MS Proxy server doing source NAT so maybe I'm
crazy;-)

Are you positive the linux box is actually "routing" this traffic (a couple
rules in the forward chain should tell you this)? It seems a little
counter-intuitive to call it routing if the traffic enters and leaves on the
same interface;-) I believe it is more normal for a router to tell the
client to "go-away" with an ICMP redirect in these situations. Let's suppose
it is though, I'm not sure why it would need anything different than the
current POSTROUTING rule? This is all wild speculation on my part of course,
but if the packets were truly being processed by the router I can't imagine
why they would be treated differently.  I wish I could be of more help.
Goodluck,

Matt

> I've got this command in my script:
> iptables -t nat -A POSTROUTING -o EXTIF -j SNAT --to-source EXTIP
>
> Which (the way I read it) should NAT ALL packets going OUT across the
> external interface.  But I think what's happening is ONLY the packets
> coming from the Linux box ir it's internal interface is getting natted
> (which would be typical).  But I need to "tell" Linux that the other
> subnets NEED the NATting as well.  Is that possible?
>
> I've also tried this:
> iptables -t nat -A POSTROUTING -o EXTIF -j SNAT --to-source EXTIP
> iptables -t nat -A POSTROUTING -s 10.200.9.0/24 -o EXTIF -j SNAT
> --to-source EXTIP
> iptables -t nat -A POSTROUTING -s 10.200.10.0/24 -o EXTIF -j SNAT
> --to-source EXTIP
>
> And that didn't work either.
>
> Kevin
>
> >
> > ----- Original Message -----
> > From: "Kevin L. Collins" <kcollins@qx.net>
> > To: <netfilter@lists.samba.org>
> > Sent: Sunday, December 08, 2002 7:57 PM
> > Subject: FW: Trying to get a Subnet NATted
> >
> >
> > > First I want to appologize if this makes it to the list more than
> > > once, I've been having trouble joinging the list.
> > >
> > > I've got a strange situation where I receive data from my WAN links
> > > across the same Interface as my External Interface.
> > >
> > > Let me try to explain it with ACSII art....
> > > +--------------+
> > > |     WAN      |
> > > |10.200.9.x/24 |
> > > |10.200.10.x/24|
> > > +------+-------+
> > >        |
> > >       aDSL
> > >        |
> > > +------+------+
> > > |Real Internet|
> > > |   Subnet    |
> > > |   eth0 of   |
> > > |  Linux Box  |
> > > +-------------+
> > >
> > > I need to be able to bring the packets from the WAN subnet and then
> > > "SNAT" them to allow them to go back out on to their final Internet
> > > Destination.  As it stands right now, the Linux machine is simply
> > > routing them through to the Default Gateway and my ISP's router is
> > > killing the packets because they are "improper" as they have a
> > > destination address in the Private LAN subnets.
> > >
> > > What I would to do is have IPTABLES apply the SNAT
> > arrangement that I
> > > have configured for my Internal LAN.  Is this even
> > possible?  And if
> > > so, how would I go about doing it?  I've tried several
> > things over the
> > > past week tro make it happen, but nothing is working.  I
> > think I have
> > > to do something BEFORE the routing takes place, but I'm not
> > sure what.
> > > ANY help would be GREATLY appreciated.
> > >
> > > Kevin L. Collins, MCSE
> > > Systems Manager
> > > Nesbitt Engineering, Inc.
> > >
> > >
> > >
> >
> >
> >
>
>
>



