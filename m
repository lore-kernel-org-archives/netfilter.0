From: nils toedtmann <netfilter@nils.toedtmann.net>
Subject: promiscuous mode
Date: Fri, 3 Oct 2003 01:12:39 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031002231239.GH29243@gandalf.intern.marcant.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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

Hi,

i want to do passive accounting using the ULOG target. As i 
understood, netfilter can only see packets passing the kernel
routing code. That explains why i cannot see packets (except 
those for the box itself) passing the NIC in mangle/PREROUTING
(NIC in promiscuous mode).

The only solution google digged was 

  <http://www.fokus.gmd.de/research/cc/glone/employees/sebastian.zander/private/netfilter.html>

but thats against iptables 1.2.3 (2001-11-06). Is there any
other way doing passive accounting with iptables?

I know that this is not the first time this question shows up.
The last message on this topic i found is 11 months old, i am 
just hoping things changed since then ;-) Our needs are simple,
so i try to avoid using one of those listening userland deamons 
like net-acctd.

/nils.


-- 
sig.

