From: Nick Drage <nickd@metastasis.org.uk>
Subject: Re: Ip Forwarding
Date: Sat, 30 Oct 2004 11:55:14 +0100
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20041030105514.GK20919@metastasis.org.uk>
References: <20041028172521.3B3CB672@mail.817west.com>
	<20041028182603.GA5067@bender.817west.com>
Reply-To: Netfilter Mailing List <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20041028182603.GA5067@bender.817west.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Thu, Oct 28, 2004 at 02:26:03PM -0400, Jason Opperisano wrote:
> On Thu, Oct 28, 2004 at 12:23:50PM -0500, Joe Wright wrote:
> > Hi, I'm new to iptables and am trying to set up a firewall for my hosting
> > company. We have a block of 128 public ips starting at 207.145.24.128 with a
> > mask of 255.255.255.192. I have a redhat 9 box set up with 2 nics. My goal
> > is to have it between the router and my network.

If you've got 128 public IPS doesn't that mean you want a netmask of
255.255.255.128?  Alternatively 255.255.255.192 is a /26, giving you
207.145.24.129 to 207.145.24.190?

http://jodies.de/ipcalc

is your friend :)

<snip>

> > It should allow connections
> > to port 80 for all ips behind it
> 
>   iptables -A FORWARD -i $outsideIF -o $insideIF -p tcp --syn \
>     --dport 80 -j ACCEPT
> 
>   (assumes you are using connection tracking)

I think the original poster meant connections outbound... at least I
hope so, inbound port 80 connections to all hosts is probably a bad
idea.

> > and I would also like to specify certain
> > ports for certain ips for dns, ftp, remote desktop, etc.

Then again - OP, any chance for some clarification?

<snip>

> if my description of your scenario above was correct, you have a couple
> of options:
> 
> (a) get an additional /30 public IP space to use between the outside of
> the firewall and the inside of your router
> 
> (b) subnet your existing /26 and steal a /30 out of it from the beginning
> or end of the range for the network between the firewall and router
> 
> (c) use an RFC 1918 network for the network between the firewall and
> router

Is there any chance of

d) use something like PPPoE on the external interface of the firewall,
which would mean you could use the existing IP ranges without
modification?

Not that I really know if/how this would work, asking the question to
learn rather than to advise....

> the "best" solution is A, but will cost some extra $$$.

How come?  Do ISPs tend to charge for IP space these days?

> C can cause problems if certain situations.  B is a nice compromise,
> basically it would involve:
> 
>   router:
> 	inside interface:  207.145.24.129/30
> 	static route:      207.145.24.128/26 via 207.145.24.130

Will the router support this?  You're telling it that 207.145.24.130 is
on the local network on the other side of its inside interface, and on
the other side of 207.145.24.130... in a way.  I'm not sure, this just
looks, well, icky.

>   firewall:
> 	outside interface:  207.145.24.130/30
> 	inside interface:   207.145.24.190/26
> 	default gateway:    207.145.24.129

Yes, but where's 207.145.24.129?  It falls within the network on both
interfaces.  I expect the firewall will route traffic the correct way
because its the most specific route, but I don't like the idea of doing
this with directly connected networks.

> default gateway of hosts on the 207.145.24.128/26 network:
> 207.145.24.190

This will work... except no internal hosts will be able to talk to the
router directly... which might be OK, but for management and monitoring
everything will have to come from the firewall.  As all the hosts think
that everything from 207.145.24.129-190 is on the local network they
will arp for 207.145.24.129 - the router - rather than sending the
traffic to the firewall.

-- 
Recedite, plebes! Gero rem imperialem!


