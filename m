From: Chris Brenton <cbrenton@chrisbrenton.org>
Subject: Re: using iptables to route between public networks
Date: Tue, 23 Dec 2003 05:53:41 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1072176819.2184.245.camel@grendel>
References: <00ca01c3c90d$8aafa2f0$6600a8c0@KARI>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <00ca01c3c90d$8aafa2f0$6600a8c0@KARI>
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
To: Matthew Simpson <matthew@txlink.net>
Cc: netfilter@lists.netfilter.org

On Mon, 2003-12-22 at 23:30, Matthew Simpson wrote:
>
> I have two ethernet cards in this box.  One card has a public IP going to my
> internet provider [255.255.255.252 subnet].  The other card also has a
> public IP that is routed to me by my Internet provider [255.255.255.240
> subnet].

<snip>

> My first question, however... if I do a traceroute to a box connected behind
> the router, the "router" interface IP address does not show up in the
> traceroute.  It skips directly from my internet provider's gateway address
> to the final destination address.  Why?

If everything is configured correctly it should, although most people
would consider this a "feature" as they deny inbound trace attempts. 

If it does actually skip from your provider to the internal address,
there are a couple of possibilities:
1) The Linux box is in bridging mode
2) Your subnet address space overlaps

If in between your provider's IP and the internal system is a line that
shows three *'s or three characters preceded by a exclamation point, the
Linux box is filtering this traffic. Possibilities:
1) An OUTBOUND iptables filter rule
2) A sysctl setting has been changed

> Second question, it's not a good idea to blindly forward all packets is it?

Absolutely not. The whole purpose of a firewall is to let through only
what you understand and expect to receive.

> I tried to set up an append rule to the FORWARD chain to drop all packets
> that did not have a destination of $myiprange/28, but iptables seems to
> ignore the rule 

Can we see the exact syntax of the rule that you entered?

> [it doesn't work and it doesn't show up in an iptables -L]
> Unless forwarding all packets is okay, what should I do to fix this?

You probably already know this, so maybe its just a language thing, but
there is a whole lot more you want to block besides packets not headed
to you internal IP address space. Think about what services you actually
have a need for letting people access from the Internet (mail server,
Web server, etc.) and block access to everything else. There is a whole
lot more you can do, but this will get you started in the right
direction.

HTH,
C



