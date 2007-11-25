From: filipescu@berkeley.edu
Subject: Policy Routing with fwmark and iptables -j MARK
Date: Sun, 25 Nov 2007 01:26:19 -0800 (PST)
Message-ID: <62183.64.81.58.143.1195982779.squirrel@calmail.berkeley.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello. I am trying to do some simple policy routing in Fedora Core. I have
read this link as initial guidance and the LARTC howto:
http://linux-ip.net/html/adv-multi-internet.html

I have three outgoing lines, IF1,IF2,IF3.
What I want: all outgoing connections that don't have a certain
destination port to be routed out on IF3, while everything else I want to
be load balanced between IF1,IF2 - and I want to do this load balancing on
each individual new connection using the "statistic" match (so not with a
multipath ip route). Here's the rules (similar ones for UDP):

$IPTABLES -t mangle -A PREROUTING -p tcp -m multiport \
--dport $PORT_LIST -m statistic --mode random --probability .5 \
-j MARK --set-mark 0x60000000

$IPTABLES -t mangle -A PREROUTING -p tcp -m multiport \
--dport $PORT_LIST -j MARK --set-mark 0x50000000

After that, I have 3 routing tables - 5,6, main who default to routing out
on IF1,IF2,IF3 respectively. Finally, I wish to do NAT, so I have:

$IPTABLES -t nat -A POSTROUTING -o $IF3_IF -j SNAT --to-source $IF3_IP
$IPTABLES -t nat -A POSTROUTING -o $IF1_IF -j SNAT --to-source $IF1_IP
$IPTABLES -t nat -A POSTROUTING -o $IF2_IF -j SNAT --to-source $IF2_IP

However, I also wish to use L7-filter which itself edits the mask, and I
load it like this so that it sees both sides of a connection:

$IPTABLES -A FORWARD -j NFQUEUE

l7-filter runs with the -m 0x00ff0000 bitmask switch, so its own edits of
the mask don't klobber the -j MARK that was set. However, fwmark in ip
route DOES NOT seem to have a similar bitmask option. So, by the time the
packet gets to fwmark its mark might be different than what was originally
set in the PREROUTING chain?

So, how can I tell fwmark to look at just the first pair in the mask? I.e.
at 0xff000000 as opposed to the whole mask. If I can't do this, then don't
I have to add multiple fwmark rules to anticipate each edit l7-filter
might make during the FORWARD chain? So in effect this would multiply the
number of

"ip rule add fwmark x table x"

type rules by however many possible changes l7-filter could make. This
kind of stuff is really making me wish the ROUTE target still worked...

