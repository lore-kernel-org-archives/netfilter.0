From: "Lloyd Standish" <lloyd@crnatural.net>
Subject: Re: Routing for multiple uplinks/providers
Date: Sun, 01 Jan 2012 10:30:18 -0600
Message-ID: <op.v7eyssd3x1lyi3@debiandesk2.net>
References: <op.v69g6qvbx1lyi3@debiandesk2.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <op.v69g6qvbx1lyi3@debiandesk2.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed	delsp=yes"
To: netfilter@vger.kernel.org, Lloyd Standish <lloyd@crnatural.net>

On Thu, 29 Dec 2011 11:21:52 -0600, Lloyd Standish <lloyd@crnatural.net> wrote:

> Suppose a router has 2 outward-facing interfaces (uplinks) and a LAN (3 interfaces).  The LAN addresses are SNAT'd over the 2 outward interface addresses (WANs).
>

<snip>
> How to ensure that answers to incoming requests are routed out over the correct interface?
> This lartc page (http://lartc.org/howto/lartc.rpdb.multiple-links.html) appears to indicate that all that is necessary are rules like these (there is a diagram in that page):
> ip rule add from $IP1 table T1
> ip rule add from $IP2 table T2
> where $IP1 and $IP2 are the WAN addresses of each of 2 outward-facing interfaces.  The page says, "It will work for all processes running on the router itself, and for the local network, if it is masqueraded."
> I don't understand this.  In the first place, how does SNAT know about what interface the packet we are replying to came from? That was a *previous* packet.

I think I can answer my own question, "for the record."

It turns out that SNAT *is* stateful, according to the following tutorial (http://bec.at/support/iptables-tutorial/x4679.html):

"Only the first packet in a connection is mangled by SNAT, and after that all future packets using the same connection will also be SNATted. Furthermore, the initial rules in the POSTROUTING chain will be applied to all the packets in the same stream."

So SNAT keeps connection-level state information, allowing it to write in the correct source address for all ESTABLISHED,RELATED packets belonging to a connection.  That explains why a rule like

ip rule add from $IP1 table T1  (where $IP1 is our interface address)

would be routed via the right table, in a situation where there are multiple uplinks (multiple routing tables).

-- 
Lloyd
