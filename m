From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: using iptables to route between public networks
Date: Tue, 23 Dec 2003 09:09:07 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200312230909.07828.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
To: netfilter <netfilter@lists.netfilter.org>

On Tuesday 23 December 2003 4:30 am, Matthew Simpson wrote:

> I have a "router" linux box with a very simple ruleset, I'm accepting
> INPUT, OUTPUT, and FORWARD chains.

Firstly, please make sure you understand what each of these three chains is
for:

INPUT is *only* for packets addressed to the firewall - *not* for packets
going through it to somewhere else.

FORWARD is *only* for packets being routed through the firewall - nothing to
do with packets addressed to or from the firewall itself.

OUTPUT is *only* for packets being sent from the firewall itself - *not* for
packets being routed through it from somewhere else.

Sorry if you realise this already - I don't mean to teach you something you
already know - but it is a common mistake for people to make and I think it's
worth repeating, for other newbies on the list, if nothing else.

> I have two ethernet cards in this box.  One card has a public IP going to
> my internet provider [255.255.255.252 subnet].  The other card also has a
> public IP that is routed to me by my Internet provider [255.255.255.240
> subnet].
>
> Right now with my simple ruleset, packets forward properly.  If I ping a
> box that is connected behind the "router", it works.  If I change the
> FORWARD accept policy to deny the packets, then it quits working.

Sounds good so far.

> My first question, however... if I do a traceroute to a box connected
> behind the router, the "router" interface IP address does not show up in
> the traceroute.  It skips directly from my internet provider's gateway
> address to the final destination address.  Why?  How can I make my router
> IP show up in the traceroute?

This sounds like something strange happening to the TTL field, but I cannot
imagine why.   When you say it skips straight from the ISP gateway address to
the final destination, dio you mean those are on consecutive lines of output
from traceroute, or is there a line of " * * * " in between them?

> Second question, it's not a good idea to blindly forward all packets is it?

No :)   That's what netfilter is for - otherwise we'd all just iuse plain
routers with no firewalling rules to block stuff.

> I tried to set up an append rule to the FORWARD chain to drop all packets
> that did not have a destination of $myiprange/28, but iptables seems to
> ignore the rule [it doesn't work and it doesn't show up in an iptables -L]
> Unless forwarding all packets is okay, what should I do to fix this?

Tell us what rule you tried to put in (post the command you used to try and
enter it), and tell us any response which came back after you typed it.   It
might also be helpful to tell us what distro you're using, what version,
which kernel, and which version of netfilter.

Regards,

Antony.

--
How I want a drink, alcoholic of course, after the heavy chapters involving
quantum mechanics.

 - 3.14159265358979
                                                     Please reply to the list;
                                                           please don't CC me.


