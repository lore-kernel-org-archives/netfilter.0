From: "Lloyd Standish" <lloyd@crnatural.net>
Subject: Routing for multiple uplinks/providers
Date: Thu, 29 Dec 2011 11:21:52 -0600
Message-ID: <op.v69g6qvbx1lyi3@debiandesk2.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed	delsp=yes"
To: netfilter@vger.kernel.org

Hello Friends,

I have have coded a load-balancing netfilters router, which seems to work fine, but I have a question about sending a router's response to queries out over the right interface.

Suppose a router has 2 outward-facing interfaces (uplinks) and a LAN (3 interfaces).  The LAN addresses are SNAT'd over the 2 outward interface addresses (WANs).

Suppose the router also runs a few services (for example a web server), and might get incoming requests from either of its 2 uplinks.  (I realize that running services on more than one IP might be uncommon.)

How to ensure that answers to incoming requests are routed out over the correct interface?

This lartc page (http://lartc.org/howto/lartc.rpdb.multiple-links.html) appears to indicate that all that is necessary are rules like these (there is a diagram in that page):

ip rule add from $IP1 table T1
ip rule add from $IP2 table T2

where $IP1 and $IP2 are the WAN addresses of each of 2 outward-facing interfaces.  The page says, "It will work for all processes running on the router itself, and for the local network, if it is masqueraded."

I don't understand this.  In the first place, how does SNAT know about what interface the packet we are replying to came from? That was a *previous* packet.

Furthermore, I don't see how the policy routing rules above will work to for processes running on the router itself.

It appears to me that the only way to choose the right outgoing interface for a reply packet in this situation is to use state information, as follows:

1) mark the incoming packets with a number associated with each interface
2) do a "... -m state --state ESTABLISHED,RELATED -j CONNMARK --restore-mark" on packets sent as replies (ESTABLISHED,RELATED), and
3) choose the correct interface with a rule like "ip rule add fwmark <n> table <table>"

I must be missing something important.  Please explain.

-- 
Lloyd
