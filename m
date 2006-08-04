From: Priscilla Kurtz <pri@softwarelivre.org>
Subject: Change Source IP Without Using SNAT
Date: Fri, 04 Aug 2006 14:50:57 -0300
Message-ID: <20060804145057.62yh7umql7kg8040@secure.softwarelivre.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hey, folks!

I'm building a small communicating process migration tool:  you telnet a server
from A; you checkpoint the process (execution and communication), migrate
theses checkpointed images to from A to B; restore the process in B and
everything stays as the same in A.

The main problem here is that IP has no mobility skills in its pure form.
The idea I had was to configurate an alias for eth0, so my NIC can answer for
two IPs: eth0 and eth0:0. For testing my tool, I'm using a small cluster with 6
nodes + front-end. So, only one node at a time has the eth0:0 up because this
virtual interface is also migrated. For that, the connections wuold be
identified by IP_telnerServer, IP_eth0:0; PORT_telnetServer, PORT_'eth0:0'.

But, as usual, all the traffic is routed through default gw route. All I wanted
to do is build up a rule (by /sbin/route ou by iptables) that forces traffic go
go out through eth0:0. I realised that if I make all the traffic go out by
eth0:0 and migrate eth0:0 in some time later, I'll be screwing all other
process' communication, right? So I thought about iptables. But all source Ip
mangling stuff is done with SNAT. To me, it's not useful because NAT rules only
are checked for new connections. And I'm migrating a connection which, in
theory, remains the same.

So after this bla bla bla, the question is: how can I change source ip without
using SNAT?

Thanks for reading the long-lausy-english email. :)

--
Priscilla
www.inf.ufrgs.br/~pri

... And it's CAPTAIN Jack Sparrow.

-------------------------------------------------------------
Associacao Software Livre.Org - http://www.softwarelivre.org/

