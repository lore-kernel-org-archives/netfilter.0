From: Juan Pablo Feria Gomez <feria@tpitic.com.mx>
Subject: Help with patch - o - matic
Date: 31 Oct 2003 12:59:15 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1067630355.12928.6008.camel@helpdesk>
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

I can apply the patches to my 2.4.18-14 Kernel Source, any hints =(

I want to add the -m string functionality to my iptables (is still
supported?)...


iptables -t mangle -A PREROUTING -p tcp -m string "pepee" -j DROP
iptables v1.2.6a: Couldn't load match
`string':/lib/iptables/libipt_string.so: cannot open shared object file:
No such file or directory


"/lib/iptables/libipt_string.so" is installed by the kernel or by the
the iptables package (if i can install it =S  )...



Thanx in advance


Here are the error when i try to patch (fails in all attempts to
patch)...



[root@lalap root]# cd patch-o-matic


[root@lalap patch-o-matic]# KERNEL_DIR=/usr/src/linux-2.4.18-14  ./runme
pending

Welcome to Rusty's Patch-o-matic!


Kernel:    /usr/src/linux-2.4.18-14
Userspace: /root

Each patch is a new feature: many have minimal impact, some do not.
Almost every one has bugs, so I don't recommend applying them all!
-------------------------------------------------------
Already applied: submitted/01_2.4.19

Testing... 02_2.4.20.patch NOT APPLIED (17 missing files)
The submitted/02_2.4.20 patch:
   Authors: Various (see below)
   Status: Included in stock 2.4.20 kernel

   This big patch contains all netfilter/iptables changes between stock
kernel
   versions 2.4.19 and 2.4.20.

   submitted/DSCP.patch
   + New DSCP target to mangle table (Harald Welte + Matthew G. Marsh)
   submitted/ECN.patch
   + New ECN target to mangle table (Harald Welte)
   submitted/REJECT_mark.patch
   + Don't copy nfmark value of old packet (Henrik Nordstrom)
   submitted/ahesp-static.patch
   + Fix static build of ahesp match (Paul P Komkoff Jr)
   submitted/conntrack+nat-helper-unregister.patch
   + Fix helper unregister in case of clashing ports (Harald Welte)
   submitted/conntrack.patch
   + Add new 'conntrack' match (Marc Boucher)
   submitted/dscp.patch
   + New 'dscp' match (Harald Welte)
   submitted/ecn.patch
   + New 'ecn' match (Harald Welte)
   submitted/helper.patch
   + New 'helper' match (Martin Josefsson, Harald Welte)
   submitted/ip6tables-exthdr-bug.patch.ipv6
   + Fix broken ipv6 extensionheader parser (Andras Kis-Szabo)
   submitted/ipv6-agr.patch.ipv6
   + New ip6tables 'eui64' match (Andras Kis-Szabo)
   submitted/length.patch.ipv6
   + New ip6tables 'length' match (Imran Patel, James Morris)
   submitted/log-tunnel-fix.patch.ipv6
   + Fix ip6tables 'LOG' target MAC address in case of tunnels
   (Peter Bieringer, Andras Kis-Szabo)
   submitted/nat-memoryleak-fix.patch
   + Fix memoryleak at iptable_nat unload time (zhongyu)
   submitted/ownercmd.patch
   + Extend 'owner' match to match cmdline (Marc Boucher)
   submitted/pkttype.patch
   + New 'pkttype' match (Michal Ludvig)
   submitted/ulog-nlgroup-shift-fix.patch
   + Fix error with shifting nlgroup in ULOG target (Harald Welte)
   submitted/ulog-sparc-bitops-fix.patch
   + Include linux/bitops.h instead of asm/bitops.h
   submitted/z-newnat16.patch
   + Redesign of conntrack and nat helper framework, for more info see
http://cvs.netfilter.org/cgi-bin/cvsweb/netfilter/documentation/newnat-summary.txt
   (Harald Welte, Jozsef Kadlecsik, and others)
   submitted/z-newnat_assertfix.patch
   + Fix erroneously printed ASSERT messages when debugging of newnat
   enabled (Martin Josefsson)
   submitted/z-newnat_changeexpect-lockfix.patch
   + Fix locking bug in ip_conntrack_change_expect() (Martin Josefsson)
   Further changes, not previuosly in patch-o-matic:
   + ip6tables usage counter fix (Harald Welte)
   + ip_queue cleanup (James Morris)
   + minor spelling fixes
   + __constant_htons() macro changes
   + ipt_unclean: srcport _can_ be zero
   + yet another ipchains GFP_ATOMIC fix
-----------------------------------------------------------------
Do you want to apply this patch [N/y/t/f/a/r/b/w/q/?] y
Testing patch submitted/02_2.4.20.patch...
Failed to patch copy of /usr/src/linux-2.4.18-14
TEST FAILED: patch NOT applied.

[Press enter to continue]











I used up all my sick days, so I'm calling in dead.


