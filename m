From: "Kevin D. White" <web_crawlz@yahoo.com>
Subject: RE: magle, filter & FORWARD
Date: Wed, 2 Jun 2004 12:33:13 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040602193313.85458.qmail@web41711.mail.yahoo.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Ok, now that I have made the major mistakes and they
are out of the way, let me try this.

Netfilter is made up of 5 subsystems, Pre-routing,
Input, Forward, Output and Post-routing.  These
subsystems are governed by three tables, nat, magle,
filter.  The elements of these tables have the
following characteristics.  First there is a 'hook' or
subsystem identifier (i.e. PREROUTING, INPUT, FORWARD,
etc), then there is a condition and finally there is
an Action/Target.  All received packets begin in the
Pre-routing subsystem, the Pre-routing subsystem
accesses the nat table and looks for all it's hooks
(all elements with PREROUTING).  Then the same is done
with the mangle table.  A routing decision is made,
and the packet would either move into the Input
subsystem or the Forward subsystem were the tables for
those subsytems would be accessed and so on.  All
packets end up in the Post-routing subsystem before
leaving an interface.

I am intentionally ignoring user created hooks.


	
		
__________________________________
Do you Yahoo!?
Friends.  Fun.  Try the all-new Yahoo! Messenger.
http://messenger.yahoo.com/ 

