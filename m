From: Internet Protocol version Six <inet6@mail.be>
Subject: Re: IPv6 Router and NAT/connection tracking
Date: Thu, 19 Jun 2003 02:09:07 +0200 (GMT+02:00)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1074720319.1055981347734.JavaMail.Administrator@pumbaa>
Reply-To: Internet Protocol version Six <inet6@mail.be>
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
To: netfilter@newkirk.us
Cc: netfilter@lists.netfilter.org

I'm connected via IPv6-in-IPv4 and I have a /48 assigned to this
box, and I want the box to act as a router for my machines which
it's doing nicely, only the conntrack thing is annoying the hell
outta me ;) Will that solve it (ACCEPTING in both directions)?

And so what you are saying is that I should do this?:
iptables -I INPUT -p 41 -j ACCEPT
iptables -I OUTPUT -p 41 -j ACCEPT
iptables -I PREROUTING -p 41 -j ACCEPT -> not sure about this one

or am I wrong/forgetting something? :)

Thanks for your help, greatly appreciated

> ----------------------------------------
> From: Joel Newkirk <netfilter@newkirk.us>
> Sent: Thu Jun 19 00:28:57 GMT+02:00 2003
> To: Internet Protocol version Six <inet6@mail.be>
> Subject: Re: IPv6 Router and NAT/connection tracking
> 
> 
> On Wed, 2003-06-18 at 17:05, Internet Protocol version Six wrote:
> > Hello all, I have a box that's configured as a firewall 
> > and router for IPv6, which is doing it's job fine, well, 
> > fine.., IPv6 connections keep timing out, they work for 
> > a second or 30 and then it timesout -> connections, 
> > ping6, traceroutes, ... from the Internet to the IPv6 
> > address behind the router don't work anymore. Also if I 
> > do a ping6 or make a connection to a remote IPv6 host 
> > on the Internet it doesn't work, however if I ping6 the 
> > router from the network, everything works again...for 
> > about 30 seconds again, and then the problem begins 
> > again...
> > 
> > I was told that this is caused by NAT/connection 
> > tracking. Is there *any* solution to this? This is 
> > really annoying as I *need* NAT, but also want to give 
> > IPv6 connectivity to other machines on the LAN.
> 
> Are you directly connected to an IPv6 router, or are you 
> connecting via an ipv6_over_ipv4 tunnel of some sort?
> 
> If you are direct, then I think all you need to do is work
> with ip6tables.  (not sure, not done this)
> 
> If you are using a tunnel, then that tunnel will either be
> using a specific protocol or port number, which you could
> explicitly ACCEPT in all directions to avoid conntrack
> interference.  For example, tspc (freenet6.net) uses 
> TCP 4343 to talk to the server to create the tunnel, and
> the tunnel itself is protocol 41.
> 
> j
> 
> 
> 
> 

-----------------------------------------------------
Mail.be, WebMail and Virtual Office
http://www.mail.be


