From: /dev/rob0 <rob0@gmx.co.uk>
Subject: FORWARD rules or not? (was: Re: Hi!)
Date: Sun, 12 Jun 2005 20:27:24 -0500
Message-ID: <200506122027.24511.rob0@gmx.co.uk>
References: <2e51be410506111000557ddca1@mail.gmail.com>
	<1118620090l.11527l.0l@server.moose.blogdns.org>
	<Pine.LNX.4.53.0506121914140.9775@altaica>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.53.0506121914140.9775@altaica>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Sunday 12 June 2005 19:26, Tib wrote:
> > > Caveat to what I just said - if you are doing masquerading behind
> > > a single IP, then you don't need to worry about the FORWARD
> > > ruleset. Only packets associated with connections  that are being
> > > masqueraded will get sent on to internal networks - unless you
> > > have specific ports that are translated to internal services.
> >
> > Actually that isn't quite correct.  With ip_forward on, network
> > bridging is enabled. Running NAT does not disable the bridging
> > function.  If a box on the outside port sends a packet addressed to
> > a box on the inside port, using the firewall as its gateway, the
> > packet will get through NAT.  NAT runs on top of the bridging
> > function, so bridging still works, though only in one direction
> > since in the other direction packets will get NATed.
>
> Actually, it is 100% correct.

And you went on to show exceptions? I am confused. Perhaps so for 
differing values of 100%? :)

> Masquerading is a broad spectrum SNAT 
> that will redirect return traffic associated with whatever it sends
> out back to the originating internal host. So if some new connection
> comes in to the external IP that isn't associated with any outbound
> connection, it hits the firewall and falls flat - this is why modules

If there are no FORWARD rules and a policy of ACCEPT, and packets hit 
the external *interface* (not IP) with a destination IP in the internal 
network, please explain which rule in INPUT will cause those packets to 
fall flat. Source, somewhere else; destination, somewhere else: these 
will not hit the INPUT chain at all.

> Also - normal traffic from the outside world isn't going to be
> getting sent directly to an inside private IP.

Normal traffic, no. Attack traffic, maybe.

> If ANY sort of nat is
> going on, how on earth are they going to know which private IP to

Most home and small office LAN's can be found on 192.168.0.0/24 or 
192.168.1.0/24. And a real motivated attacker might have inside 
information. If none of the above, there's always nmap -sP ... .

> send to? Such traffic is only going to be used as a disruptive tactic
> on the firewall connection itself. That's the whole point of private
> network blocks - NON-ROUTABLE. To even get sent to the firewall from

Non-routable by RFC, but I wouldn't expect that to stop an attacker. :)

> the outside interface you'd have to have one of two situations:
>
> 1. A legitimate host on the same physical network as the firewall's
> outside interface, using said outside interface as a gateway, and
> sending traffic to those private ip's.

That would do it. On a home cable subnet this is not difficult to 
imagine ... a bored teenager with time and curiosity ...

In a business setting it could be a motivated competitor, or someone 
with malicious intent and access to the ISP. Could be a spammer!

> 2. A mangled packet attack of some sort where the external interface
> is bombarded with traffic that should be impossible considering that
> private network addresses are non-routable.
>
> For broadband homeusers, option 1 is going to not exist since
> customers are either directly on the net with a real IP thanks to a
> dsl/cable modem that bridges the connection and doesn't have its own

We hope. I prefer to put limits in FORWARD. Is there any good reason 
*not* to?
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

