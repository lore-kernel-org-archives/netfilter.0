From: "Robert P. J. Day" <rpjday@mindspring.com>
Subject: efficient source address filtering and logging?
Date: Tue, 28 Oct 2003 09:59:16 -0500 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0310280949080.22878-100000@localhost.localdomain>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: iptables mailing list <netfilter@lists.netfilter.org>


  i'd like to find a short, efficient way to filter incoming packets with
bogus source addresses, but i don't see an elegant way of doing it.

  as we all know, there are a number of clearly bogus source addresses on
incoming packets:

  - broadcast
  - your own IP address
  - any of the private class A, B or C addresses
  - class D addresses

and on and on.  so it's natural to want to discard them and, just for fun,
log them as well.

  for elegance, i can create a user-defined chain called, say,
"reject_bad_source_addresses" to which i jump with every incoming packet.  
this user-defined chain will test for all of the bad source addresses, one
at a time, and DROP/REJECT each one.  however, if i want to log all of 
these rejections, i'd have to double the number of rules in this chain,
so that each test would first LOG that packet, then be followed by a 
second rule to DROP it.  kind of a pain.

  if i could rewrite the rules all backwards, i could have the 
user-defined chain full of ACCEPT rules, and only terminate the chain with 
a rule for LOG, followed by one for DROP.  but i don't see how that's 
possible.

  so, is there a solution i'm missing that's clean, elegant and short?

rday


