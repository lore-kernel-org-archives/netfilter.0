From: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Subject: Re: DNAT/SNAT & existing connections
Date: Tue, 15 Jul 2003 22:50:41 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030716025041.GE25639@cannon.eng.us.uu.net>
References: <20030715140425.GB24604@cannon.eng.us.uu.net> <20030716021258.95036.qmail@web13103.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20030716021258.95036.qmail@web13103.mail.yahoo.com>
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
To: Stephen Bylo <stephenbylo@yahoo.com.sg>
Cc: netfilter@lists.netfilter.org

Hi Stephen,

You lost me here. M is a remote host with two interfaces. There are
two networks (AS) between your router R and M. I take that R is a
linux box (??).  Interface 1 is always up and interface 2 is sometimes
up. Now you want to send the packets (mostly UDP) from your server S to M
and you want the router R to do some kind of magic and know when 2 is up
and nat to 2 and use 1 otherwise. While this might work for UDP (if I only
knew how) there is no way you can switch between dst IP's of a TCP session.

What you could do is:
1) Have a loopback(dummy) interface D on M
2) Use some kind of routing protocol on M to propagate this D through
   1 and 2 to the networks..
3) Receive this route from those networks on R

Then you could assign a higher cost to the network connected to 1. When 2 is
up your preference would be through the lower network. When 2 is down, the
only path would be through 1. At any rate the server S should only talk to
D. This solution works for both UDP and TCP...

But I'm certain that M (being mobile) cannot send out any routing information.
And besides your ISP's are not willing to receive the route from M and also
are not willing to pass that route to R.

So, no, sorry I don't have any solution for you.

Ramin


On Wed, Jul 16, 2003 at 10:12:58AM +0800, Stephen Bylo wrote:

> Dear Ramin & List,
> 
> Thanx for your mail.  The world is getting more
> mobile, so here is some detail to my problem:
> 
> A mobile host M has two interfaces 1 & 2.
> M is reading an open udp stream from host S (server)
> on interface 1.  Interface 1 is always on-line. 
> Interface 2 is only sometimes online and the route to
> 2 provides much more bandwidth than the route to 1.  I
> want to route the stream through the higher bandwidth
> without S having to know about it.  S should always
> think its communicating with the IP on interface 1.
> 
>                       ____some network___(1) slow
>    S -------- NAT ---R___________________ M
>                           some network   (2) fast
> 
> R = our router to two different external networks
> 
> Tcp connections should also be "kept alive" and
> diverted to interface 2 on M.
> 
> After reading
> "netfilter-hacking-HOWTO.linuxdoc-4.html" and
> "iptables-tutorial.html" I find that existing
> connections will not be "diverted" in this way, only
> new connections are looked up in the NAT table.
> Would it be possible to change the dst values in the
> "conntrack" table as well as changing the NAT entry
> when interface (2) comes on-line ?
> 
> Any other ideas ?
> 
> Thanx for any help,
> Steve
> 
>  --- Ramin Dousti <ramin@cannon.eng.us.uu.net> wrote:
> > On Tue, Jul 15, 2003 at 06:01:15PM +0800, Stephen
> > Bylo wrote:
> > 
> > > Dear list,
> > > 
> > > I am looking into the use of a NAT "router" to
> > change
> > > the destination (or source) IP addresses of
> > packets in
> > > existing connections.  Maybe it sounds weird why I
> > > might want to do this, but I need to divert
> > streams to
> > > other destinations!
> > > 
> > > I understand from the iptables docs that only the
> > > first packet of a connection is examined for NAT
> > > entries, subsequent packets do not need to be
> > > processed again.
> > 
> > They do get processed. There is a short circuit to
> > identify these
> > packets and avoid traversing the whole nat table.
> > 
> > It's not clear to me what you precisely want to do.
> > 
> > Ramin
> > 
> > > I would like all packets to be
> > > examined OR I would like to be able to "reset" the
> > > particular entry in the table so that the existing
> > > connection will be "re-considered" again using the
> > > NAT.
> > > 
> > > Is this possible in some way with iptables?  If
> > not,
> > > can you point me in the right direction to a
> > solution,
> > > please?
> > > 
> > > Thanx,
> > > Steve
> > > 
> > > __________________________________________________
> > > Do You Yahoo!?
> > > Send free SMS from your PC!
> > > http://sg.sms.yahoo.com 
> 
> __________________________________________________
> Do You Yahoo!?
> Send free SMS from your PC!
> http://sg.sms.yahoo.com

