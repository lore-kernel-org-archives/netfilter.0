From: "Robert P. J. Day" <rpjday@mindspring.com>
Subject: counting packets and bytes
Date: Mon, 28 Oct 2002 08:25:43 -0500 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0210280821560.7961-100000@localhost.localdomain>
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


  i'm sure i saw somewhere a reference to using iptables rules
just for counting packets.  how did that work?  if i recall correctly,
it had to do with the fact that the target part of a rule was optional,
and i could forward the packets i wanted to count through a chain
or rule that did, essentially, nothing, but i could use
"iptables -L" later to get statistics.

  pointer, anyone?  i'm pretty sure this required a user-defined
chain, but i forget the format.

rday


