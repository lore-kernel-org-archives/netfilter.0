From: "Robert P. J. Day" <rpjday@mindspring.com>
Subject: what do the contents of /proc/net/ip_tables_names mean?
Date: Thu, 24 Oct 2002 14:44:22 -0400 (EDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0210241437140.1620-100000@localhost.localdomain>
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


  in looking through the system script for iptables under red hat 8.0,
i notice the occasional reference to the file 
/proc/net/ip_tables_names, which contains, one per line, the names
of one of more of the possible netfilter tables (filter, nat
and/or mangle).

  what does it mean for a table to have its name in this file?
first, i notice that, if i have the modules loaded for filter and
nat, then the file contents will have the lines "filter" and "nat",
even though i have not added any rules to the nat table.  just
the existence of the loaded module seems to be enough to have
a table name in that file.  (it's pretty clear that, if i'm
using loadable modules and add a rule to a particular table,
it's module will be loaded and its name will be added to that
file.)

  so then what happens if i recompile the kernel and build in
support for all three tables directly?  will all three table
names show up in that file, even if i have no ruleset entries
for a given table?  just curious since this leads into my next
question that's based on the answer to this one. :-)

rday


