From: Tib <tib@tigerknight.org>
Subject: Re: Hi!
Date: Sun, 12 Jun 2005 19:26:35 -0500 (CDT)
Message-ID: <Pine.LNX.4.53.0506121914140.9775@altaica>
References: <2e51be410506111000557ddca1@mail.gmail.com>
	<Pine.LNX.4.53.0506111202260.9775@altaica>
	<1118512593.18567.6.camel@debianbox>
	<Pine.LNX.4.53.0506111321350.9775@altaica>
	<1118620090l.11527l.0l@server.moose.blogdns.org>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1118620090l.11527l.0l@server.moose.blogdns.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

> > Caveat to what I just said - if you are doing masquerading behind a single
> > IP, then you don't need to worry about the FORWARD ruleset. Only packets
> > associated with connections  that are being masqueraded will get sent on
> > to internal networks - unless you have specific ports that are translated
> > to internal services.
>
> Actually that isn't quite correct.  With ip_forward on, network bridging is
> enabled. Running NAT does not disable the bridging function.  If a box on the
> outside port sends a packet addressed to a box on the inside port, using the
> firewall as its gateway, the packet will get through NAT.  NAT runs on top
> of the bridging function, so bridging still works, though only in one direction
> since in the other direction packets will get NATed.

Actually, it is 100% correct. Masquerading is a broad spectrum SNAT that
will redirect return traffic associated with whatever it sends out back to
the originating internal host. So if some new connection comes in to the
external IP that isn't associated with any outbound connection, it hits
the firewall and falls flat - this is why modules like ip_conntrack_ftp
and ip_nat_ftp are necessary, and why dcc on irc clients tends to get
borked, the list goes on.

If he's running two real world ip's connected behind a firewall real world
ip - that's not masquerading, and that /would/ require a defensive
forward ruleset as the firewall itself is not accepting packets but
forwarding them to another host. Using snat/dnat the way I specified is
effectively the same, but allows there to be a private network behind the
firewall that can have as many hosts or other things as it wants without
having to deal with the constraints of getting more IP's from an isp.

Also - normal traffic from the outside world isn't going to be getting
sent directly to an inside private IP. If ANY sort of nat is going on, how
on earth are they going to know which private IP to send to? Such traffic
is only going to be used as a disruptive tactic on the firewall connection
itself. That's the whole point of private network blocks - NON-ROUTABLE.
To even get sent to the firewall from the outside interface you'd have to
have one of two situations:

1. A legitimate host on the same physical network as the firewall's
outside interface, using said outside interface as a gateway, and sending
traffic to those private ip's.

2. A mangled packet attack of some sort where the external interface is
bombarded with traffic that should be impossible considering that private
network addresses are non-routable.

For broadband homeusers, option 1 is going to not exist since customers
are either directly on the net with a real IP thanks to a dsl/cable modem
that bridges the connection and doesn't have its own IP, or who have a
dsl/cable router that gets it's own IP, runs a dhcp client to the inside
where the end-user gets an IP and from there gets masqueraded out behind
the IP of the router.

Option 2 however is a reality but a relatively low one because that sort
of traffic does not happen to your every day small network dsl user. I
recently had to deal with such an attack - 22Mb/s of traffic that should
not be possible slammed my external interface. Yup - one simple rule made
it all go away, but the point is that in 6 years of running said style
network, that's the only time I've encountered such traffic.

<EOL>
Tib

