From: Richard Dicaire <rdicaire1@comcast.net>
Subject: unresolved symbols]
Date: Thu, 30 May 2002 16:55:06 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <3CF691AA.2090709@comcast.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.samba.org

Hi, I'm getting unresolved symbols from the following under kernel
2.4.18, using iptables v. 1.2.5.

I ran the iptables installation per the INSTALL file, remade the kernel
and modules.

modprobe ip_tables

/lib/modules/2.4.18/kernel/net/ipv4/netfilter/ip_tables.o: unresolved
symbol nf_unregister_sockopt
/lib/modules/2.4.18/kernel/net/ipv4/netfilter/ip_tables.o: unresolved
symbol nf_register_sockopt
/lib/modules/2.4.18/kernel/net/ipv4/netfilter/ip_tables.o: insmod
/lib/modules/2.4.18/kernel/net/ipv4/netfilter/ip_tables.o failed
/lib/modules/2.4.18/kernel/net/ipv4/netfilter/ip_tables.o: insmod
ip_tables failed

I chose modules for all netfilter options, enabled netfilter itself as well.

depmod -a

depmod: *** Unresolved symbols in
/lib/modules/2.4.18/kernel/net/ipv4/netfilter/ip_conntrack.o
depmod: *** Unresolved symbols in
/lib/modules/2.4.18/kernel/net/ipv4/netfilter/ip_queue.o
depmod: *** Unresolved symbols in
/lib/modules/2.4.18/kernel/net/ipv4/netfilter/ip_tables.o
depmod: *** Unresolved symbols in
/lib/modules/2.4.18/kernel/net/ipv4/netfilter/ipt_REJECT.o
depmod: *** Unresolved symbols in
/lib/modules/2.4.18/kernel/net/ipv4/netfilter/iptable_filter.o
depmod: *** Unresolved symbols in
/lib/modules/2.4.18/kernel/net/ipv4/netfilter/iptable_mangle.o
depmod: *** Unresolved symbols in
/lib/modules/2.4.18/kernel/net/ipv4/netfilter/iptable_nat.o

Have I missed anything? I have no problems with 2.4.17.

Please respond to me personally, as I'm not on the list, thanks.



