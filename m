From: "Lloyd Standish" <lloyd@crnatural.net>
Subject: problem with multi-level SNAT? (multiple uplinks/providers)
Date: Sun, 01 Jan 2012 11:12:09 -0600
Message-ID: <op.v7e0qja7x1lyi3@debiandesk2.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed	delsp=yes"
To: netfilter@vger.kernel.org

Greetings,

I programmed a load-balancing router for my ISP friend.  It balanced connections from a LAN with about 80 users over 3 to 5 uplinks.

There were problems with breaking download connections after about 5-200 MB.  The connections would simply drop, with no indication of why in the server logs.  I believe (but cannot confirm) the problem was caused by reply packets sent out the wrong interface.

However, there was an interface that never dropped connections.  This interface was different from the others in that it had a public IP assigned to it.  The other interfaces were connected to routers, and used LAN IP interface addresses that were SNATted in the router to a public IP.  In other words, the other interfaces had "upstream NAT."

This failing router used the following load-balancing method:

ip route add default scope global nexthop via $P1 dev $IF1 weight 15 nexthop via $P2 dev $IF2 weight 15...

SNAT was used to "bind" connections to each interface's source address, and a policy routing rule like this was used to choose the correct routing table (each table simply routed to a different interface:

ip rule add from ${!wan} table $table

The problem with dropping connections was finally fixed in router version #2.  It uses fwmark to mark all new connections, and a rule like this to send the packet to the correct routing table:

ip rule add fwmark $((cardnum+1)) table $table

Instead of relying on SNAT to assign the correct source address to subsequent packets in established/related packets, these packets are fwmarked like this:

iptables -t mangle -A PREROUTING -i ${lan_if} -m state --state ESTABLISHED,RELATED -j CONNMARK --restore-mark

Connected to the same uplinks/providers, THIS router does not drop connections.

I would like to know why SNAT without packet marking drops the connections for interfaces that have "upstream NAT," while the fwmark method succeeds.  I'd appreciate any comments.  I can of course supply more information if necessary.

As a related aside, I'd appreciate comments on whether or not the "-p tcp" in the following example rule is advisable (I omitted "-p tcp" from my SNAT rules.):
iptables -t nat -A POSTROUTING -p tcp -o eth0 -j SNAT --to-source 194.236.50.155

Regards,
Lloyd
