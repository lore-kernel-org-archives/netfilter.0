From: "Robert P. J. Day" <rpjday@mindspring.com>
Subject: how many chains are part of the mangle table?
Date: Wed, 9 Oct 2002 05:49:18 -0400 (EDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0210090542060.13259-100000@localhost.localdomain>
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
To: netfilter mailing list <netfilter@lists.netfilter.org>


  for my own benefit, i'm trying to document the architecture of
iptables, and i'm reading oskar andreasson's ubiquitous tutorial.

  early in that tutorial, he presents some tables showing the
possible combinations of tables and chains, as well as a graphic
portrayal of how packets traverse iptables.  in all of that, 
the mangle table is shown as being part of only two chains:
PREROUTING and OUTPUT.

  however, "iptables -L -t mangle" shows that the mangle table
can incorporate rules in all five chains: INPUT, OUTPUT, FORWARD,
PREROUTING and POSTROUTING, but that's not at all obvious from
that tutorial.

  is it meaningful to ask where the mangle step would go in the
diagram of packet processing in the INPUT, FORWARD and POSTROUTING
chains?  that is, depending on where those rules are processed,
would the order make a difference in the other processing?

  is this making any sense?  the diagram of packet processing
in andreasson's tutorial makes perfect sense, except it just seems
to omit those three "mangle" steps in the other chains which,
AFAICT, clearly can exist.

rday


