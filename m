From: Jeff Wiegley <jeffw@csun.edu>
Subject: marking/mangling of local packets for altering routes?
Date: Wed, 22 May 2013 12:30:23 -0700
Message-ID: <519D1CCF.2030707@csun.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

I'm trying to do to some service based routing using the "ip rule" and 
"ip route"
by marking packets.

I'm confused by: http://www.iptables.info/en/structure-of-iptables.html

For forwarded packets (those generated on another machine, passing through
my router) it is obvious that I can mark all my traffic for routing in 
the mangle
table's PREROUTING chain just like I want to.

But Table 6-2 Source Local host (our own machine) indicates that traffic
generated on the routing machine itself (say you are logged in and want to
SSH to another box) can't be marked for special routing. According to the
table the routing decision for these packets happens before ANY iptables 
table
or chain is consulted.

This is problematic. I have two interfaces
eth0 and eth1 and each has a default route associated with it. I want 
certain
traffic to go out eth0's gateway as the default and the rest of the 
traffic I want
to go out eth1.  But according to Table 6-2 I cannot make such routing 
decisions
for locally generated packets. Only those forwarded from another machine.

That lack of ability to traffic shape local traffic seems unreasonable. 
Is Table 6-2
only taking about 127.0.0.1 (and the IPv6 equivalent) when they are talking
about "Source Local Host"? Or can you really not traffic shape all 
locally generated
outbound traffic?

Thank you.
