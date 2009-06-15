From: David Madore <david+ml@madore.org>
Subject: workaround for no DROP in table nat ?
Date: Mon, 15 Jun 2009 18:59:04 +0200
Message-ID: <20090615165904.GA29477@regulus.madore.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi list,

Recent versions of iptables have forbidden the use of DROP in the nat
table.  I can't understand, however, how one is supposed to work
around this limitation: is there a howto or some kind of documentation
somewhere which explains how to deal with this change?

Suppose my current rules look something like this:

-t nat -A OUTPUT -p tcp -d somenetwork -m tcp --syn --dport 80 -j CONTROLLED
-t nat -A CONTROLLED -m limit --limit 10/hour -j RETURN
-t nat -A CONTROLLED -p tcp -m statistic --mode random --probability 0.1 -j REDIRECT --to-ports 80
-t nat -A CONTROLLED -j DROP

In other words, the point is that connections which are outbound to
somenetwork should be dropped beyond a certain rate, except for a
small portion of them which should be redirected to a local port for
capturing.

I'm confused about what I should do to achieve the same effect under
the modified rules.  I can't put the whole thing in the filter table
because of the REDIRECT: but now I also can't put the whole thing in
the nat table because of the DROP.  I also fail to see how I can split
the rules across tables (if I replace -j DROP by -j RETURN in nat and
then replicate the limit check in the filter table, I'm afraid the
latter might not stay synchronized with the one in the nat table).

If the nat table is not allowed to just drop a packet, would it be
possible to have a -j MUSTBEDROPPEDINFILTERTABLE or something of the
sort, which ensures that the filter table will necessarily drop that
packet?  This would be a convenient workaround for the new limitation
(cleaner than, say, redirecting the packet to some absurd port and
then dropping on that port).

Any suggestions?

Happy hacking,

-- 
     David A. Madore
   ( http://www.madore.org/~david/ )
