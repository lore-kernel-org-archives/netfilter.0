From: "Robert P. J. Day" <rpjday@mindspring.com>
Subject: recently confused about setting a chain policy
Date: Tue, 29 Oct 2002 17:37:39 -0500 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0210291727380.17897-100000@localhost.localdomain>
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


  for the longest time, i always thought that, to set a global,
total DROP policy as a starting point, i just had to:

  # iptables -P INPUT DROP
  # iptables -P OUTPUT DROP
  # iptables -P FORWARD DROP

but i just looked at the "panic" clause in the case statement in
/etc/init.d/iptables and i'm a bit confused.  why all the policy
settings involving the nat and mangle tables, as in:


  panic)
	echo -n $"Changing target policies to DROP: "	
	iftable filter -P INPUT DROP && \
	    iftable filter -P FORWARD DROP && \
	    iftable filter -P OUTPUT DROP && \
	    iftable nat -P PREROUTING DROP && \
	    iftable nat -P POSTROUTING DROP && \
	    iftable nat -P OUTPUT DROP && \
	    iftable mangle -P PREROUTING DROP && \
	    iftable mangle -P OUTPUT DROP && \
	    success $"Changing target policies to DROP" || \
	    failure $"Changing target policies to DROP"
	echo


first, the above suggests that a policy is assigned, not just
to a chain, but to a chain/table combination, which comes as a
surprise to me.

and second, what's with having a DROP policy on the nat and
mangle tables anyway?  i thought those tables were strictly
for packet transformation, not filtering.  certainly, the "nat"
entries i've seen will jump, not to ACCEPT or DROP, but to
SNAT or DNAT.  how would they accept or drop anyway?

can anyone explain the above?  or am i just thoroughly
confused yet again?

rday



