From: "Robert P. J. Day" <rpjday@mindspring.com>
Subject: a little unclear on user-defined chains
Date: Tue, 8 Oct 2002 19:28:05 -0400 (EDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0210081919330.9285-100000@localhost.localdomain>
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


  i wanted to extend my current iptables config to use some user-defined
chains, until i realized that i'm a little confused by them.  here's the
problem (which could very well be trivial).

  while there are three built-in chains (INPUT, OUTPUT, FORWARD), 
you never add a new rule just to a chain, you add it to a table
*within* that chain (the default table being "filter").  so far,
so good.  for better or worse, i've always viewed my collection
of netfilter rules as being in a 2-dimensional array, 
chains versus tables.  so some of my rules will be part of the
(mangle,PREROUTING) entry in the matrix, other rules will be in
the (filter,FORWARD) entry and so on.

  so what happens with a user-defined chain?  i can create a new
chain with

  # iptables -N newchain

but, as above, i don't just add rules to the new chain, i have to 
add them to a combination of the new chain and an existing table,
as in 

  # iptables -A newchain (rest of rule)		# default filter table
  # iptables -A newchain -t nat (rest of rule)  # goes in nat table

is this correct so far?  i ask since, in every example i've *ever*
seen, folks create user-defined chains solely for filtering, and
never for nat or mangle.  aren't you allowed to do this?  

  and based on that, if i create a new chain, and i can add new rules
in any of the three tables (again, i've never seen this used for
anything but filtering), then if i jump to my new user-defined chain,
will it only process the rules that match the table of the rule i
jumped from?

  is this making any sense?  or have i just badly misunderstood
how user-defined chains work?

rday


