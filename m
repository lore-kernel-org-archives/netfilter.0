From: Fran Fabrizio <fran@cis.uab.edu>
Subject: Any advantage of multicore for netfilter/iptables?
Date: Thu, 14 Jun 2007 14:36:59 -0500
Message-ID: <467198DB.7080107@cis.uab.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org


I am configuring a new router/firewall.  I'm making the hardware
purchase and I need to decide what processor(s) I want. 

My thought process went thusly:  netfilter/iptables is part of the
kernel, the kernel is threaded, so does this imply that on a multicore
machine it is in theory possible that iptables might use a different
core to examine each packet, and if so, is there any possibility for
concurrency or is it strictly linear?  I'm -real- fuzzy on how the
kernel does its threading in relation to modules and specifically the
netfilter hooks (as made obvious by me asking this).

The practical question is that if you were setting up a router/firewall
server right now, would you prefer a slower clock speed but more cores,
or the fastest individual core speed, all other things being equal?

A valid related question is, does it even matter or would any modern
processor and server be able to easily inspect traffic on a 1Gbit link
with iptables without breaking a sweat?  This will be a Dell PowerEdge
1950 server with Xeon dual or quad core, I plan to use Intel Pro server
NICs, either 2 or 4 port PCIe cards. 

Would appreciate any feedback you folks might have.

Thanks,
Fran

-- 
Fran Fabrizio
Senior Systems Analyst
Department of Computer and Information Sciences
University of Alabama at Birmingham
http://www.cis.uab.edu/
205.934.0653 


