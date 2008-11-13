From: Thomas Jacob <jacob@internet24.de>
Subject: Re: INVALID state
Date: Thu, 13 Nov 2008 12:13:57 +0100
Message-ID: <1226574837.19007.19.camel@enterprise.ims-firmen.de>
References: <491b53e3.2a528c0a.1c10.385b@mx.google.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <491b53e3.2a528c0a.1c10.385b@mx.google.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Gilad Benjamini <gilad.benjamini@gmail.com>
Cc: netfilter@vger.kernel.org

I don't really understand your setup description, but asymmetric routing
often leads to problems with stateful inspection firewalls, as both
directions of a conversation need to go through the same firewall for
connection tracking to work. 

For instance, if your ICMP echo request doesn't go through your
firewall, how can the stateful inspection know
about the echo reply to be expected? Also, if the firewall
doesn't see the initial TCP SYN packet, but the SYN-ACK goes
through the firewall, it clearly shouldn't allow that through.

The iptables connection pickup feature is, depending on your point
of view, a bad hack to make up for iptables' (now historic) lack of
a state synching mechanism like OpenBSD's pfsync.

Or a rather nice feature that keeps the scalability of independent
netfilter boxen running in parallel, while allowing some kind of
fail over capability that works in many to most cases while
incurring only small security drawbacks.

It's definitely not a mechanism to deal with asymmetric routing though,
AFAIK a pickup only happens when you see traffic in both directions,
which doesn't happen when one part of your conversation doesn't
go through your filtering box.


On Wed, 2008-11-12 at 14:08 -0800, Gilad Benjamini wrote:
> iptables allows querying for 4 states: NEW, ESTABLISHED, RELATED, INVALID
> The first three are pretty obvious.
> What exactly are the semantics of the INVALID state ?
> 
> My setup involves a firewall on a bridge and a dual-NIC protected machine
> 
> Network A -- Protected machine -- Network B -- Firewall
> 
> The protected machine has asymmetric routing. A ping arriving via network A
> is replied via network B. The reply packet is seen as part of an INVALID
> connection.
> Same thing happens for a SYN packet from network A, which leads to a SYN-ACK
> on network B.
> 
> I read somewhere that an ACK packet belonging to a non-existing connection,
> for example, will be in NEW state. I was assuming that SYN-ACK will behave
> the same.
> 
> So when is a connection considered INVALID ?
> 
> P.S: By now this is a theoretical question, as the asymmetric routing was a
> misconfiguration. Nevertheless, I am trying to understand what happened.
> 
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

