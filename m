From: Jason Opperisano <opie@817west.com>
Subject: Re: filtering in which rules?
Date: Sat, 21 May 2005 15:24:02 -0400
Message-ID: <20050521192402.GA1658@bender.817west.com>
References: <42889941.5060507@griffous.net>
	<4288E7F6.3030700@riverviewtech.net>
	<Pine.LNX.4.60.0505161523100.15128@darkstar.sysinfo.com>
	<Pine.LNX.4.60.0505161548000.15128@darkstar.sysinfo.com>
	<42890B63.2000603@riverviewtech.net>
	<Pine.LNX.4.60.0505202018220.12153@darkstar.sysinfo.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.60.0505202018220.12153@darkstar.sysinfo.com>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Fri, May 20, 2005 at 08:28:43PM -0400, R. DuFresne wrote:
> I wacthed the discusion today on leaving filtering to the filter chain and 
> leave nat to nat and routing to the pre/post chains.  But, when one reads 
> other documentation and it has paramaters to iptables like this;

my problem is that the reasoning behind why people do this stuff never
adds up to a logical argument, IMHO.

> iptables -P INPUT DROP
> iptables -P FORWARD DROP
> iptables -P OUTPUT ACCEPT

so we're going for super-tight, NSA-levels of security; yet we leave the
policy of OUTPUT to ACCEPT.  i don't buy it.

> iptables -t nat -P PREROUTING DROP

i'll buy the argument that there are packets so nasty that we want to
drop them as soon as possible.  fine--"as soon as possible" translates
to mangle:PREROUTING, not nat:PREROUTING.  also, applying a filter rule
or a DROP policy in nat assumes that these naughty, naughty packets will
always be the first packet in a new connection.  this is simply just
silly.

i *do* filter in mangle:PREROUTING...all the wacked-out tcp flag combos
that shouldn't appear in the wild get dropped in my mangle:PREROUTING
chain.  reasons:

  - we want to drop these as soon as possible.
  - we gain economies of scale in that whether the packet is ultimately
    destined for INPUT or FORWARD it gets dropped by just one rule here
  - we make no assumption that these packets are NEW, so we don't want
    them to get ACCEPTed by our ESTABLISHED rule that starts both
    filter:INPUT and filter:FORWARD

> iptables -t nat -P POSTROUTING DROP

so we've had no less than 3 opportunities to drop this packet, but we
need to wait until nat:POSTROUTING to catch it?  not buying it.  i would
argue the only real-world situation someone would set nat:POSTROUTING to
DROP, is when they have *no* filter rules at all, and they basically
are saying--i want to SNAT/MASQ packets from my internal network
subnet and then drop anything else.  kinda like a 1-line firewall
for non-firewall-types.  that's fine, but i'm going to be a big meanie
and say these people are not relevant to conversation at hand--which i
believe to be "best practices for netfilter firewall rule design."

firewalls should exhibit 3 characteristics in my opinion:

  - speed
  - security
  - stability

contrary to grant's crown vic / cisco 2501 analogy; i have actually
arrived at my opinions by building firewalls with very high throughput
requirements, very high security requirements, in very complicated network
environments.  let's take an extreme case where we set all policies of
all chains to DROP.  if i want to allow a communication flow through
this gateway, i would need to add 6 rules:

  mangle:PREROUTING
  nat:PREROUTING
  mangle:FORWARD
  filter:FORWARD
  nat:POSTROUTING
  mangle:POSTROUTING

now does checking packet 6 times create a more secure gateway than if i
only created one rule in filter:FORWARD?  i would argue that the minuscule
security gain (i'm giving the benefit of the doubt that there is one)
is vastly out-weighed by the significant performance hit and the insane
increase in maintainability/troubleshooting effort created.  anyone here
ever make typos?  i sure do.  you give me 6 chances at making a simple
mistake or overlooking one detail, i bet i will more than zero percent of
the time.  now how much productivity do we want to lose because of this.
i guess this all comes down to something we hear a lot in the security
field these days:

  Keep It Simple Stupid

Bruce Schneier harps constantly on the fact that the complexity and
security of a system are inversely proportional.  i happen to agree with
him 1000%.

i s'pose i've prattled on long enough at this point.  again--these are
all just my opinions, i'm not suggesting that this is the one true way
to do things, or that other ways are wrong or inferior.  just what i've
come to think over the past decade building firewalls for a living.

-j

--
"Meg: I made flag girl!
 Stewie: Oh, you made flag girl. Great.
 Stewie: Now you can be somewhere else when the boys don't call."
        --Family Guy

