From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: FORWARD rules or not? (was: Re: Hi!)
Date: Mon, 13 Jun 2005 13:05:23 -0500
Message-ID: <200506131305.23893.rob0@gmx.co.uk>
References: <2e51be410506111000557ddca1@mail.gmail.com>
	<200506122027.24511.rob0@gmx.co.uk>
	<Pine.LNX.4.53.0506122030280.9775@altaica>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.53.0506122030280.9775@altaica>
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

On Sunday 12 June 2005 20:47, Tib wrote:
> On Sun, 12 Jun 2005, /dev/rob0 wrote:
> > > Actually, it is 100% correct.
> >
> > And you went on to show exceptions? I am confused. Perhaps so for
> > differing values of 100%? :)
>
> I don't recall showing any exceptions. I said that snat/dnat of real

Forget about NAT. NAT is a distraction. You're not understanding. Here 
is one of the exceptions you mentioned:

[flashback] On Sunday 12 June 2005 19:26, Tib wrote:
> To even get sent to the firewall from the outside interface you'd
> have to have one of two situations:
>
> 1. A legitimate host on the same physical network as the firewall's
> outside interface, using said outside interface as a gateway, and
> sending traffic to those private ip's.
[/flashback]

I don't know what you mean, "legitimate", but yes, hosts inside your 
ISP's router can use you as a gateway.

> > > connection comes in to the external IP that isn't associated with
> > > any outbound connection, it hits the firewall and falls flat -
> >
> > If there are no FORWARD rules and a policy of ACCEPT, and packets
> > hit the external *interface* (not IP) with a destination IP in the
> > internal network, please explain which rule in INPUT will cause
> > those packets to fall flat. Source, somewhere else; destination,
> > somewhere else: these will not hit the INPUT chain at all.

Once again: these packets bypass your INPUT rules.

> To hit the external interface at all, they have to be routed on a
> path through that IP, correct?

Or arp. Doesn't matter. They can find your IP easily enough, or 
depending on the kind of bridging, your MAC address. Even if it was 
routed using your external IP address, it is not going to hit your 
INPUT chain!

> So how do you propose to put in an ip 
> address of 192.168.1.X on your end, and have it magically communicate
> to a private network behind 207.105.189.2? It won't.

We weren't talking about me; we were talking about someone on your 
physical segment, or an attacker who has control of your upstream 
router.

> The only way to 
> get traffic to the internal network on a *masquerading* host is going
> to be for that traffic to be in response to an original outgoing
> connection.

Yes, *if* you have limits in FORWARD. Otherwise no.

> In which case the firewall host has to accept the 
> traffic, then translate it. This is why forward rules are unecessary
> for masquerading ip's but are needed for snat/dnat pairs. One is the
> firewall thinking/processing - the other is it just redirecting.

Try setting a DROP policy in FORWARD:
    iptables -P FORWARD DROP
and see if your MASQUERADE hosts can get out. Then do
    iptables -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
and watch it work again.

> > > Also - normal traffic from the outside world isn't going to be
> > > getting sent directly to an inside private IP.
> >
> > Normal traffic, no. Attack traffic, maybe.
>
> And as I already said was true - you have to just tell iptables that
> any traffic with a destination of a private network address on the
> external interface is bogus and to drop it.

Have you yet understood that you *must* have rules in FORWARD if you 
wish to control forwarded traffic? You seem to have the "ipchains 
syndrome": thinking that anything coming in hits INPUT. Not so.

> > imagine ... a bored teenager with time and curiosity ...
> > In a business setting it could be a motivated competitor, or
> > someone with malicious intent and access to the ISP. Could be a
> > spammer!
>
> Again though you'd have to have someone be aware of what IP block
> you're using for your internal network - not feasible for a bored kid
> with time/curiosity. If that same kid is running on a real ip and
> hits 'network neighborhood' and discovers everyone else who is setup
> the same on his cable-modem area... ... sorry - people who do that
> deserve their virii and spam.

BTW those are the very machines which are used by spammers to send out 
their spew. Their insecurity == our spam.

> > We hope. I prefer to put limits in FORWARD. Is there any good
> > reason *not* to?
>
> Depending on the situation of your network setup, they may
> simply be unnecessary.

Unnecessary in terms of "will they foil any actual attacks?" perhaps. 
Logging turned off here so I wouldn't know if there are any attackers 
in my segment. Quite necessary in terms of providing peace of mind.

I trust my ISP to do their best. I don't think their best is very good, 
however! I wouldn't be at all surprised if their entire network was 
running on insecure equipment. If they get cracked, I won't.

> A bunch of computers masquerading behind a single IP 
> used by the firewall host will simply not need forward rules as
> defense.

Unless you want to protect against the attacks I described.

> I choose not to put anything up that is not in use, others may choose
> differently. It's their choice, I was simply trying to put forward

My philosophy of firewalling is to deny by default and make exceptions 
for the traffic I want.

iptables -N State
iptables -N AllowIn # hosts and services allowed access to this host
iptables -N AllowFwd # hosts and services allowed to forward
iptables -A State -m state --state INVALID -j DROP
iptables -A State -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A INPUT -j State
iptables -A INPUT -j AllowIn
iptables -A FORWARD -j State
iptables -A FORWARD -j AllowFwd
# add stuff to AllowIn and AllowFwd as needed
iptables -P INPUT DROP
iptables -P FORWARD DROP

> the most basic and effective method for the original question here.
> How to make good use of three real world IP's for a firewall host and
> boxes behind it.

I'd put them on a DMZ interface and route to them. I would not do 
SNAT/DNAT in such a case. And yes, rules in FORWARD to protect them.
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

