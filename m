From: Mogens Valentin <monz@danbbs.dk>
Subject: Iptables efficiency, order of execution
Date: Fri, 06 May 2005 17:27:01 +0200
Message-ID: <427B8CC5.6070003@danbbs.dk>
Reply-To: monz@danbbs.dk
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter <netfilter@lists.netfilter.org>

Sometimes questions pop up on various network lists about execution
order of rules.
Such questions are usually dealt with per example, but I sometimes
ponder about general guidelines, or try to logically derive my own.

For my own systems, I really don't have to care that much; it's a
different story for customers. Alas, currently I do not administer a
larger heavily loaded setup, so experiments are a bit tricky to verify.

Likewise, I'm interested in execution order for various types of
firewalling, i.e., do we have a large number of clients but few
lowtraffic servers, or high-volume servers and few clients..



Scheme for a general setup:

   Define variables, including PATH and path to iptables/modprobe..
   Load required modules

   Dectivate ICMP and forwarding
   Setup /proc stuff
   Set default policies to DROP
   Delete and flush chains + nat PRE/POSTROUTING

   Define general logging rules
   Define ICMP  rules
   Define TCP   rules
   Define UDP   rules

   Drop common unwanted (priv.ranges..), spoofed, portscans
   Activate ICMP

   Activate implementation-specifics:
     Prerouting/mangle for TOS etc..
     Prerouting/DNAT from external to DMZ/internal segments
     Input to the box itself
     Forward from external to internal segments
     Forward form internal segments to external
     Postrouting/SNAT from internal segments to external
     Outgoing rules (unless ALLOW any outgoing traffic)

   Log weird packets not caught elsewhere (for investigation)

   Activate forwarding


But where to place things like Taylor's counting rules?
(resent thread "How to stop the flood?")
I don't know enough about the performance penalty of having maybe quite
a number of such counting rules.
Counting should be very few mashineinstructions each, though.

-- 
Kind regards,
Mogens Valentin



