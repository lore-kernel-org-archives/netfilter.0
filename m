From: "Sven Marx" <svenmarx@gmx.de>
Subject: Unresolved symbols in ip_tables_nat after recompiling kernel
Date: Wed, 6 Aug 2003 10:21:45 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000001c35bf3$c6c89300$c801a8c0@T7KX3FKH4F3AGS>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: netfilter@lists.netfilter.org

Hi,

I built linux kernel version 2.4.21 with modules neccessary for
iptables.
Running my fw-setupscript at startup results in errors like this:
-------------
/lib/modules/2.4.21/kernel/net/ip4/netfilter/iptables_nat.o: unresolved
symbol ip_conntrack_lock_R0c1130e0
/lib/modules/2.4.21/kernel/net/ip4/netfilter/iptables_nat.o: unresolved
symbol ip_conntrack_module_Rb0361033
/lib/modules/2.4.21/kernel/net/ip4/netfilter/iptables_nat.o: unresolved
symbol ip_ct_selective_cleanup_R37fa06eb
 and many more
-------------

NAT is working, blocking of unwanted packages etc. is working.

Did i miss a kernel configuration? Any idear what's wrong?

Thanx in advance,

sven


