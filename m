From: "Marc Fargas" <telenieko@telenieko.com>
Subject: Problem loading pptp_conntrack
Date: Thu, 11 Mar 2004 13:42:33 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <E1B1PWV-0006ap-O6@vishnu.netfilter.org>
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

I just updated my patch-o-matic from the CVS, also iptables and patched
kernel 2.4.25
I compiled everything as always, includind PPTP conntrack as a module but
when I try to load de module I get that:

modprobe ip_nat_pptp
/lib/modules/2.4.25/kernel/net/ipv4/netfilter/ip_nat_pptp.o:
/lib/modules/2.4.25/kernel/net/ipv4/netfilter/ip_nat_pptp.o: unresolved
symbol ip_ct_gre_keymap_change
/lib/modules/2.4.25/kernel/net/ipv4/netfilter/ip_nat_pptp.o: insmod
/lib/modules/2.4.25/kernel/net/ipv4/netfilter/ip_nat_pptp.o failed
/lib/modules/2.4.25/kernel/net/ipv4/netfilter/ip_nat_pptp.o: insmod
ip_nat_pptp failed

modprobe ip_conntrack_pptp
/lib/modules/2.4.25/kernel/net/ipv4/netfilter/ip_conntrack_pptp.o:
/lib/modules/2.4.25/kernel/net/ipv4/netfilter/ip_conntrack_pptp.o:
unresolved symbol ip_ct_gre_keymap_add
/lib/modules/2.4.25/kernel/net/ipv4/netfilter/ip_conntrack_pptp.o:
/lib/modules/2.4.25/kernel/net/ipv4/netfilter/ip_conntrack_pptp.o:
unresolved symbol ip_ct_gre_keymap_destroy
/lib/modules/2.4.25/kernel/net/ipv4/netfilter/ip_conntrack_pptp.o: insmod
/lib/modules/2.4.25/kernel/net/ipv4/netfilter/ip_conntrack_pptp.o failed
/lib/modules/2.4.25/kernel/net/ipv4/netfilter/ip_conntrack_pptp.o: insmod
ip_conntrack_pptp failed

What could be wrong there?

POM applied patches correctly with no probs!

Thanks for all.




