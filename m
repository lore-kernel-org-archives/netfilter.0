From: Dean Anderson <dean@av8.net>
Subject: (no subject)
Date: Sun, 6 Feb 2005 22:37:00 -0500 (EST)
Message-ID: <Pine.LNX.4.44.0502062232200.13062-100000@localhost.localdomain>
Mime-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

I'm trying to build openWRT (www.openwrt.org) using a new kernel from 
linksys.  The kernel claims that it is 2.4.20, but it seems to have some 
modifications, preventing netfilter from applying patches.

I want to run iptables 1.2.11, and need (of course) the matching kernel
modules.  Is there is "complete file" (ie non-patch) distribution of the
netfilter kernel modules?  I couldn't find one on the ftp.netfilter.org 
site, nor on the website.

Thanks

		--Dean

#ignore whitespace in patches
/mnt1/openWRT.20050205/buildroot/build_mipsel/staging_dir/bin/sed -i -e 
"s,\-p1,\-l \-p1," 
/mnt1/openWRT.20050205/buildroot/build_mipsel/patch-o-matic-ng-20050206/runme
touch 
/mnt1/openWRT.20050205/buildroot/build_mipsel/patch-o-matic-ng-20050206/.unpacked
/mnt1/openWRT.20050205/buildroot/sources/patch-kernel.sh 
/mnt1/openWRT.20050205/buildroot/build_mipsel/WRT54G_3_01_3_0922/release/src/linux/linux 
/mnt1/openWRT.20050205/buildroot/sources/openwrt/kernel/netfilter/patches

Applying 
/mnt1/openWRT.20050205/buildroot/sources/openwrt/kernel/netfilter/patches/100-revert_netfilter.patch 
using plaintext: 
patching file include/linux/netfilter_ipv4/ip_conntrack.h
Hunk #1 FAILED at 45.
Hunk #2 FAILED at 77.
Hunk #3 succeeded at 261 (offset 3 lines).
2 out of 3 hunks FAILED -- saving rejects to file 
include/linux/netfilter_ipv4/ip_conntrack.h.rej
patching file include/linux/netfilter_ipv4/ip_conntrack_h323.h
patching file include/linux/netfilter_ipv4/ip_conntrack_mms.h
patching file include/linux/netfilter_ipv4/ip_conntrack_pptp.h
patching file include/linux/netfilter_ipv4/ip_conntrack_proto_gre.h
Reversed (or previously applied) patch detected!  Assume -R? [n] 
Apply anyway? [n] 
Skipping patch.
1 out of 1 hunk ignored -- saving rejects to file 
include/linux/netfilter_ipv4/ip_conntrack_proto_gre.h.rej
patching file include/linux/netfilter_ipv4/ip_conntrack_tftp.h
patching file include/linux/netfilter_ipv4/ip_conntrack_tuple.h
patching file include/linux/netfilter_ipv4/ip_nat_pptp.h
patching file include/linux/netfilter_ipv4/ip_pool.h
patching file include/linux/netfilter_ipv4/ipt_pool.h
patching file net/ipv4/netfilter/Config.in
Hunk #1 FAILED at 7.
Hunk #2 succeeded at 18 (offset 1 line).
Hunk #4 FAILED at 56.
Hunk #5 succeeded at 75 (offset 8 lines).
2 out of 6 hunks FAILED -- saving rejects to file 
net/ipv4/netfilter/Config.in.rej
patching file net/ipv4/netfilter/Makefile
Hunk #1 FAILED at 31.
Hunk #2 succeeded at 63 (offset 5 lines).
Hunk #4 succeeded at 94 (offset 5 lines).
1 out of 4 hunks FAILED -- saving rejects to file 
net/ipv4/netfilter/Makefile.rej
patching file net/ipv4/netfilter/ip_conntrack_core.c
patching file net/ipv4/netfilter/ip_conntrack_ftp.c
patching file net/ipv4/netfilter/ip_conntrack_h323.c
patching file net/ipv4/netfilter/ip_conntrack_mms.c
patching file net/ipv4/netfilter/ip_conntrack_pptp.c
Reversed (or previously applied) patch detected!  Assume -R? [n] 
Apply anyway? [n] 
Skipping patch.
1 out of 1 hunk ignored -- saving rejects to file 
net/ipv4/netfilter/ip_conntrack_pptp.c.rej
patching file net/ipv4/netfilter/ip_conntrack_pptp_priv.h
patching file net/ipv4/netfilter/ip_conntrack_proto_gre.c
Reversed (or previously applied) patch detected!  Assume -R? [n] 
Apply anyway? [n] 
Skipping patch.
1 out of 1 hunk ignored -- saving rejects to file 
net/ipv4/netfilter/ip_conntrack_proto_gre.c.rej
patching file net/ipv4/netfilter/ip_conntrack_proto_tcp.c
Hunk #3 FAILED at 186.
Hunk #4 succeeded at 210 (offset 7 lines).
1 out of 4 hunks FAILED -- saving rejects to file 
net/ipv4/netfilter/ip_conntrack_proto_tcp.c.rej
patching file net/ipv4/netfilter/ip_conntrack_proto_udp.c
patching file net/ipv4/netfilter/ip_conntrack_standalone.c
patching file net/ipv4/netfilter/ip_conntrack_tftp.c
patching file net/ipv4/netfilter/ip_nat_core.c
patching file net/ipv4/netfilter/ip_nat_h323.c
patching file net/ipv4/netfilter/ip_nat_helper.c
Hunk #8 FAILED at 208.
1 out of 8 hunks FAILED -- saving rejects to file 
net/ipv4/netfilter/ip_nat_helper.c.rej
patching file net/ipv4/netfilter/ip_nat_mms.c
patching file net/ipv4/netfilter/ip_nat_pptp.c
Reversed (or previously applied) patch detected!  Assume -R? [n] 
Apply anyway? [n] 
Skipping patch.
1 out of 1 hunk ignored -- saving rejects to file 
net/ipv4/netfilter/ip_nat_pptp.c.rej
patching file net/ipv4/netfilter/ip_nat_proto_gre.c
Reversed (or previously applied) patch detected!  Assume -R? [n] 
Apply anyway? [n] 
Skipping patch.
1 out of 1 hunk ignored -- saving rejects to file 
net/ipv4/netfilter/ip_nat_proto_gre.c.rej
patching file net/ipv4/netfilter/ip_nat_standalone.c
patching file net/ipv4/netfilter/ip_nat_tftp.c
patching file net/ipv4/netfilter/ip_pool.c
patching file net/ipv4/netfilter/ip_tables.c
patching file net/ipv4/netfilter/ipchains_core.c
patching file net/ipv4/netfilter/ipfwadm_core.c
patching file net/ipv4/netfilter/ipt_ECN.c
patching file net/ipv4/netfilter/ipt_LOG.c
patching file net/ipv4/netfilter/ipt_REJECT.c
patching file net/ipv4/netfilter/ipt_ULOG.c
patching file net/ipv4/netfilter/ipt_multiport.c
patching file net/ipv4/netfilter/ipt_pool.c
patching file net/ipv6/mcast.c
patching file include/linux/ppp-comp.h
Patch failed!  Please fix 
/mnt1/openWRT.20050205/buildroot/sources/openwrt/kernel/netfilter/patches/100-revert_netfilter.patch!
make: *** 
[/mnt1/openWRT.20050205/buildroot/build_mipsel/WRT54G_3_01_3_0922/release/src/linux/linux/.nf-patched] 
Error 1


-- 
Av8 Internet   Prepared to pay a premium for better service?
www.av8.net         faster, more reliable, better service
617 344 9000   



