From: Bob Miller <bob@computerisms.ca>
Subject: ACCOUNT and REDIRECT - chain and table placement
Date: Wed, 26 Jan 2011 13:54:53 -0800
Message-ID: <1296078893.2064.4658.camel@laplaplian>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "'netfilter@vger.kernel.org'" <netfilter@vger.kernel.org>

Greetings gurus;
Recently, I have put together a linux firewall with a squid server on
it.  I have used the REDIRECT target to transparently move port 80
requests to port 3128.
I also installed xtables-addons so as to use the ACCOUNT target.  The
goal here is to verify the external count provided by the ISP, and to
identify top users on the LAN.  Hence I have tname arguments wan for the
0/0 subnet and lan for the local class c subnet.
I have implemented both of these things separately before, but this is
my first time trying to use them together.
As per documentation, I have set the redirect to work on the PREROUTING
chain of the nat table.  I have put my wan counter into the PREROUTING
chain of the mangle table.
So, I have two questions:

Where should I put the ACCOUNT target for counting the lan?  I would
like to count only traffic to/from the internet, but I would like it to
include traffic that is being proxied (ie I want it to count as if the
proxy wasn't there).  Consulting the netfilter packet flow diagram, it
looks like the ideal place to put the counter is in PREROUTING/nat, but
I am pretty sure that wont' give me an accurate count.  If I put the
ACCOUNT rule in PREROUTING/mangle, I expect it will count wan-lan and
lan-lan traffic, but I don't want lan-lan.  If I put the rule in
FORWARD/filter, I expect it wont' count proxy traffic because the proxy
is a local process.  
One thing I discovered is that I can put the same tname argument into
multiple rules, so I figured I could try counting an ACCOUNT target in
PREROUTING/mangle (with src lan and dst port 80) and an ACCOUNT target
in FORWARD/filter (for everything else) and then adding them together,
but numbers appear to be coming up short.  Maybe because only the very
beginning of a data stream gets matched?  Plus that doesn't count return
traffic, but if the theory worked out I could add another rule to count
that and add it in.

My second question is with regards to the ACCOUNT target in
PREROUTING/mangle for the purposes of counting external traffic.
Documentation says to use 0/0 subnet to count all traffic to the ISP.
That particular chain does not seem to accept an -i filter, so I cannot
confine that counting to just the external interface.  but would the 0/0
subnet include lan as well as wan, since the filter would be based on IP
rather than interface?  The reason I ask this is because my external
count has been considerably higher than the ISP, but it is not as much
as the wan and lan added together, so I am trying to figure out if I am
doing something wrong or if the ISP is really counting low...

Thank you for any thoughts on this...

Bob Miller
334-7117/660-5315
http://computerisms.ca
bob@computerisms.ca
Network, Internet, Server,
and Open Source Solutions

