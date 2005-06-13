From: Tib <tib@tigerknight.org>
Subject: Re: FORWARD rules or not? (was: Re: Hi!)
Date: Sun, 12 Jun 2005 20:47:05 -0500 (CDT)
Message-ID: <Pine.LNX.4.53.0506122030280.9775@altaica>
References: <2e51be410506111000557ddca1@mail.gmail.com>
	<1118620090l.11527l.0l@server.moose.blogdns.org>
	<Pine.LNX.4.53.0506121914140.9775@altaica>
	<200506122027.24511.rob0@gmx.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200506122027.24511.rob0@gmx.co.uk>
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

On Sun, 12 Jun 2005, /dev/rob0 wrote:
> > Actually, it is 100% correct.
>
> And you went on to show exceptions? I am confused. Perhaps so for
> differing values of 100%? :)

I don't recall showing any exceptions. I said that snat/dnat of real ip's
to internal ip's would respond the same as bridging and require a set of
forward rules to protect it.

> > Masquerading is a broad spectrum SNAT
> > that will redirect return traffic associated with whatever it sends
> > out back to the originating internal host. So if some new connection
> > comes in to the external IP that isn't associated with any outbound
> > connection, it hits the firewall and falls flat - this is why modules
>
> If there are no FORWARD rules and a policy of ACCEPT, and packets hit
> the external *interface* (not IP) with a destination IP in the internal
> network, please explain which rule in INPUT will cause those packets to
> fall flat. Source, somewhere else; destination, somewhere else: these
> will not hit the INPUT chain at all.

To hit the external interface at all, they have to be routed on a path
through that IP, correct? So how do you propose to put in an ip address of
192.168.1.X on your end, and have it magically communicate to a private
network behind 207.105.189.2? It won't. The only way to get traffic to the
internal network on a *masquerading* host is going to be for that traffic
to be in response to an original outgoing connection. In which case the
firewall host has to accept the traffic, then translate it. This is why
forward rules are unecessary for masquerading ip's but are needed for
snat/dnat pairs. One is the firewall thinking/processing - the other is it
just redirecting.

> > Also - normal traffic from the outside world isn't going to be
> > getting sent directly to an inside private IP.
>
> Normal traffic, no. Attack traffic, maybe.

And as I already said was true - you have to just tell iptables that any
traffic with a destination of a private network address on the external
interface is bogus and to drop it.

> > If ANY sort of nat is going on, how on earth are they going to know
> > which private IP to
>
> Most home and small office LAN's can be found on 192.168.0.0/24 or
> 192.168.1.0/24. And a real motivated attacker might have inside
> information. If none of the above, there's always nmap -sP ... .

And again - how is this going to help you? For masquerading you are going
to have to have an outbound connection to be initiated for you to respond
to so that any traffic you send back is interpreted as associated and
therefore passed on. Furthermore, you're going to have to determine which
of that outbound traffic is in relation to which internal host you want to
attack. Again I submit that such communication is impossible without the
iptables host being setup to explicitly allow it.

> > send to? Such traffic is only going to be used as a disruptive tactic
> > on the firewall connection itself. That's the whole point of private
> > network blocks - NON-ROUTABLE. To even get sent to the firewall from
>
> Non-routable by RFC, but I wouldn't expect that to stop an attacker. :)

It doesn't stop them from sending mangled packets, no, which is why the
above referenced rule is useful *in the event of such an attack*. I'm
curious how many people here have been? It took me six years to have it
happen.

> > the outside interface you'd have to have one of two situations:
> >
> > 1. A legitimate host on the same physical network as the firewall's
> > outside interface, using said outside interface as a gateway, and
> > sending traffic to those private ip's.
>
> That would do it. On a home cable subnet this is not difficult to
> imagine ... a bored teenager with time and curiosity ...
> In a business setting it could be a motivated competitor, or someone
> with malicious intent and access to the ISP. Could be a spammer!

Again though you'd have to have someone be aware of what IP block you're
using for your internal network - not feasible for a bored kid with
time/curiosity. If that same kid is running on a real ip and hits 'network
neighborhood' and discovers everyone else who is setup the same on his
cable-modem area... ... sorry - people who do that deserve their virii and
spam.

For the purposes of masquerading - not going to happen. And with snat/dnat
and some forward rules - also not going to happen.

> We hope. I prefer to put limits in FORWARD. Is there any good reason
> *not* to?

Depending on the situation of your network setup, they may simply be
unnecessary. A bunch of computers masquerading behind a single IP used by
the firewall host will simply not need forward rules as defense. If you
have any specific hosts or services setup under iptables to have dnat
configured for it - by all means use some well planned forward rules to
keep things safe.

I choose not to put anything up that is not in use, others may choose
differently. It's their choice, I was simply trying to put forward the
most basic and effective method for the original question here. How to
make good use of three real world IP's for a firewall host and boxes
behind it.

<EOL>
Tib

