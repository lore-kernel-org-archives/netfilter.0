From: Stephen Satchell <list@fluent2.pyramid.net>
Subject: A drop-in firewall
Date: Sat, 30 Aug 2003 20:25:59 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <5.2.1.1.0.20030830201439.01072380@fluent2.pyramid.net>
Mime-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org


Background:  I used to be an audio engineer, and got used to the idea that 
a properly-designed and -maintained sound chain meant that each block was 
designed to "drop in" such that a failure of any component could be 
bypassed simply by patching around it.

Situation:  I have a series of Windows boxes that were infected with MS 
Blaster and SoBig.  The net result was that my network of 200 computers was 
completely brought to its knees when these Windows boxes started doing 
their thing.  I don't control the Windows boxes (co-lo situation).

Desired solution:  "Drop" a Linux box between the Windows boxes and the 
rest of the internal network.  Use IPTABLES to ensure that the Windows 
boxes can't do anything nasty to the rest of the systems in the room, 
without impairing access to the rest of the Internet.

SOLUTION 1:  Use the experimental ROUTE target:
      Public-network interface has the addresses of all Windows boxes on 
the protected network.  Design rules that take packets destined for those 
boxes and route them instead to the protected-network port.  Bypass the 
routing table completely.
     Protected-network interface has the address of the site 
gateway.  Design a rule that takes packets destined for the gateway and 
route them instead to the public network interface.  Bypass the routing 
table completely.
     Use regular FILTER FORWARD rules to impose access rules on the local /24s.

SOLUTION 2:  Use MARK target
     How does this work?  Google doesn't bring up any usable 
discussion.  Pointers?

What makes solution 1 not very usable is that Red Hat doesn't include the 
ROUTE target in its distributions.  Attempts to use Patch-o-Matic haven't 
worked with Red Hat kernel source.  I'm going to try vanilla 2.4.22 from 
linux.org to see if I have better results with that.

Is there any other way to do a drop-in firewall?

OK, you ask, why a "drop-in"?  Because the usual methods require the 
customer boxes to be renumbered, and I don't have access to the guts of the 
customer boxes.  The other standard method requires our Cisco 7500 be 
updated with a route, and the network manager is scared to make the 
change.  "Why can't you just do it all in the Linux box?" he asks?

The other issue is that some of our support technicians don't know how to 
do anything with the routers, so if the firewall fails the ass-wipes can't 
just patch around it and have the customer box "just work".

Hints?  Pointers?  Is there a FAQ in the house?

Satch


