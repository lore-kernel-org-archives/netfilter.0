From: "Matthew Simpson" <matthew@txlink.net>
Subject: using iptables to route between public networks
Date: Mon, 22 Dec 2003 22:30:48 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <00ca01c3c90d$8aafa2f0$6600a8c0@KARI>
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
To: netfilter@lists.netfilter.org

I'm having trouble adjusting to using iptables instead of Cisco IOS.

I have a "router" linux box with a very simple ruleset, I'm accepting INPUT,
OUTPUT, and FORWARD chains.

I have two ethernet cards in this box.  One card has a public IP going to my
internet provider [255.255.255.252 subnet].  The other card also has a
public IP that is routed to me by my Internet provider [255.255.255.240
subnet].

Right now with my simple ruleset, packets forward properly.  If I ping a box
that is connected behind the "router", it works.  If I change the FORWARD
accept policy to deny the packets, then it quits working.

My first question, however... if I do a traceroute to a box connected behind
the router, the "router" interface IP address does not show up in the
traceroute.  It skips directly from my internet provider's gateway address
to the final destination address.  Why?  How can I make my router IP show up
in the traceroute?

Second question, it's not a good idea to blindly forward all packets is it?
I tried to set up an append rule to the FORWARD chain to drop all packets
that did not have a destination of $myiprange/28, but iptables seems to
ignore the rule [it doesn't work and it doesn't show up in an iptables -L]
Unless forwarding all packets is okay, what should I do to fix this?

Thanks,
Matthew


