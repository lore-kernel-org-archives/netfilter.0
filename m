From: Chris Wilson <chris@netservers.co.uk>
Subject: Re: Interesting problems
Date: Tue, 5 Aug 2003 12:00:37 +0100 (BST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0308051156060.21531-100000@localhost>
References: <200308051034.LAA447988@alf1.lmb.internal>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200308051034.LAA447988@alf1.lmb.internal>
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
To: tsh@mrc-lmb.cam.ac.uk
Cc: netfilter@lists.netfilter.org

Hi Terry,

> Chris, I'm interested in why your 50 users generate 3000 connections.

We have a number of customers' servers hosted here, about 40 boxes. There 
are probably about 30-40 desktop users as well, and one customer with 
maybe 10 servers of his own. Probably the servers are responsible for most 
of the connections, but I don't have an actual breakdown.

> I realise that different iptables activities will present different
> cpu loads (packet rate, number of entries in the tables, number of
> active connections etc) but do you have any feel for which of these
> is the most costly?

I think searching the connections table is the most costly thing. The 
Slammer worm brought some of our firewalls to their knees with IRQ load 
(crappy Realtek network cards) and connection lookups. Reducing the number 
of conntracks from 65,000 to 4096 made the systems usable again. But 
that's just my own experience, I suspect that the real Netfilter 
developers have a much better idea than me where the bottlenecks are.

Cheers, Chris.
-- 
   ___ __     _
 / __// / ,__(_)_  | Chris Wilson -- UNIX Firewall Lead Developer |
/ (_ / ,\/ _/ /_ \ | NetServers.co.uk http://www.netservers.co.uk |
\ _//_/_/_//_/___/ | 21 Signet Court, Cambridge, UK. 01223 576516 |


