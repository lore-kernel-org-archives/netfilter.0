From: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Subject: Re: DNAT/SNAT & existing connections
Date: Wed, 16 Jul 2003 10:06:11 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030716140611.GA27608@cannon.eng.us.uu.net>
References: <20030716025041.GE25639@cannon.eng.us.uu.net> <20030716052538.55184.qmail@web13115.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20030716052538.55184.qmail@web13115.mail.yahoo.com>
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
Cc: Ramin Dousti <ramin@cannon.eng.us.uu.net>, netfilter@lists.netfilter.org

I don't see any solution to your problem. First of all you cannot
switch between 1 and 2 in the middle of a stateful session like TCP.
Secondly when 2 is down, that IP is unreachable, so the option that
you would always send packets to 2 (even through A) is out of question.

As I said before you need to have a nailed-up IP on M which can be
reachable through both A and B. When R knows that IP is reachable through
B (ie when 2 is up) it sends the packets out through B, otherwise it
keeps sending the packets through A.

Ramin

On Wed, Jul 16, 2003 at 01:25:38PM +0800, Stephen Bylo wrote:

>  --- Ramin Dousti <ramin@cannon.eng.us.uu.net> wrote:
> > 
> 
> Hi Ramin,
> (sorry, an amended version)
>  
>                        _______A_(slow)____(1)
>     S ----------------R___________________ M
>                               B (faster)  (2)
> 
> + Yes, R is Linux
> + (1) and (2) will get their IPs through
>   DHCP whenever they connect.
> + We have full influence on S, R and M but only
>   *partial* influence on A & B networks.
> + M can inform R which IP to use (1 or 2).
> + S can only know 1's IP.
> + A UDP stream can exist through S->R->A->(1) and
>   should be diverted by R (through A to 2) when (2)
>   comes on-line.
> + The UDP stream can be diverted back agin to (1)
>   when (2) goes off-line again.
> 
> Does this help?
> 
> Thanx
> Steve
> 
> 
> Hi Stephen,
> > 
> > You lost me here. M is a remote host with two
> > interfaces. There are
> > two networks (AS) between your router R and M. I
> > take that R is a
> > linux box (??).  Interface 1 is always up and
> > interface 2 is sometimes
> > up. Now you want to send the packets (mostly UDP)
> > from your server S to M
> > and you want the router R to do some kind of magic
> > and know when 2 is up
> > and nat to 2 and use 1 otherwise. While this might
> > work for UDP (if I only
> > knew how) there is no way you can switch between dst
> > IP's of a TCP session.
> > 
> > What you could do is:
> > 1) Have a loopback(dummy) interface D on M
> > 2) Use some kind of routing protocol on M to
> > propagate this D through
> >    1 and 2 to the networks..
> > 3) Receive this route from those networks on R
> > 
> > Then you could assign a higher cost to the network
> > connected to 1. When 2 is
> > up your preference would be through the lower
> > network. When 2 is down, the
> > only path would be through 1. At any rate the server
> > S should only talk to
> > D. This solution works for both UDP and TCP...
> > 
> > But I'm certain that M (being mobile) cannot send
> > out any routing information.
> > And besides your ISP's are not willing to receive
> > the route from M and also
> > are not willing to pass that route to R.
> > 
> > So, no, sorry I don't have any solution for you.
> > 
> > Ramin
> > 
> > 
> > On Wed, Jul 16, 2003 at 10:12:58AM +0800, Stephen
> > Bylo wrote:
> > 
> > > Dear Ramin & List,
> > > 
> > > Thanx for your mail.  The world is getting more
> > > mobile, so here is some detail to my problem:
> > > 
> > > A mobile host M has two interfaces 1 & 2.
> > > M is reading an open udp stream from host S
> > (server)
> > > on interface 1.  Interface 1 is always on-line. 
> > > Interface 2 is only sometimes online and the route
> > to
> > > 2 provides much more bandwidth than the route to
> > 1.  I
> > > want to route the stream through the higher
> > bandwidth
> > > without S having to know about it.  S should
> > always
> > > think its communicating with the IP on interface
> > 1.
> > > 
> > >                       ____some network___(1) slow
> > >    S -------- NAT ---R___________________ M
> > >                           some network   (2) fast
> > > 
> > > R = our router to two different external networks
> > > 
> > > Tcp connections should also be "kept alive" and
> > > diverted to interface 2 on M.
> > > 
> > > After reading
> > > "netfilter-hacking-HOWTO.linuxdoc-4.html" and
> > > "iptables-tutorial.html" I find that existing
> > > connections will not be "diverted" in this way,
> > only
> > > new connections are looked up in the NAT table.
> > > Would it be possible to change the dst values in
> > the
> > > "conntrack" table as well as changing the NAT
> > entry
> > > when interface (2) comes on-line ?
> > > 
> > > Any other ideas ?
> > > 
> > > Thanx for any help,
> > > Steve
> > > 
> > >  --- Ramin Dousti <ramin@cannon.eng.us.uu.net>
> > wrote:
> > > > On Tue, Jul 15, 2003 at 06:01:15PM +0800,
> > Stephen
> > > > Bylo wrote:
> > > > 
> > > > > Dear list,
> > > > > 
> > > > > I am looking into the use of a NAT "router" to
> > > > change
> > > > > the destination (or source) IP addresses of
> > > > packets in
> > > > > existing connections.  Maybe it sounds weird
> > why I
> > > > > might want to do this, but I need to divert
> > > > streams to
> > > > > other destinations!
> > > > > 
> > > > > I understand from the iptables docs that only
> > the
> > > > > first packet of a connection is examined for
> > NAT
> > > > > entries, subsequent packets do not need to be
> > > > > processed again.
> > > > 
> > > > They do get processed. There is a short circuit
> > to
> > > > identify these
> > > > packets and avoid traversing the whole nat
> > table.
> > > > 
> > > > It's not clear to me what you precisely want to
> > do.
> > > > 
> > > > Ramin
> > > > 
> > > > > I would like all packets to be
> > > > > examined OR I would like to be able to "reset"
> > the
> > > > > particular entry in the table so that the
> > existing
> > > > > connection will be "re-considered" again using
> > the
> > > > > NAT.
> > > > > 
> > > > > Is this possible in some way with iptables? 
> > If
> > > > not,
> > > > > can you point me in the right direction to a
> > > > solution,
> > > > > please?
> > > > > 
> > > > > Thanx,
> > > > > Steve
> > > > > 
> > > > >
> > __________________________________________________
> > > > > Do You Yahoo!?
> > > > > Send free SMS from your PC!
> > > > > http://sg.sms.yahoo.com 
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

