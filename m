From: "K. H. Braun" <kbraun@dgrunt.sneakernet.com>
Subject: TARPIT error - What am I doing wrong?
Date: Tue, 30 Mar 2004 15:12:39 -0500 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.58.0403301500440.1698@dgrunt.sneakernet.com>
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
To: netfilter@lists.netfilter.org


Hi Folks

I am trying to get TARPIT to work. I am using linux kernel 2.4.24 with the
below listed POM patches applied and iptables-1.2.9.

Whenever I try to use TARPIT as a target I get the following error
message (showing a simple test case):

root@dgrunt:/etc/rc.d# iptables -A FORWARD -j TARPIT
iptables: Invalid argument

I get the same error if I change just one target to TARPIT in an otherwise
working script.

This is AFTER re-compiling the kernel AND the user-space tools.

Can someone tell me what sort of bone-headed thing I am doing wrong?


Thanks
-- Ken --



Welcome to Rusty's Patch-o-matic!

Kernel:    /usr/src/linux
Userspace: /usr/local/src/Security/Iptables-POM

Each patch is a new feature: many have minimal impact, some do not.
Almost every one has bugs, so I don't recommend applying them all!
-------------------------------------------------------
Already applied: submitted/01_2.4.19
                 submitted/02_2.4.20
                 submitted/03_2.4.21
                 submitted/04_2.4.22
                 submitted/05_2.4.23
                 submitted/61-remove-memsets
                 submitted/64_masquerade-sameip-noflush
                 submitted/69_amanda-helpers
                 submitted/70_expect-evict-order
                 submitted/72_recent_procfs_fix
                 submitted/74_listhelp
                 submitted/75_selective_cleanup
                 submitted/76_conntrack_bucket_sysctl
                 submitted/88_ip_queue-maxlen
                 submitted/90_fw_compat_local-nullbinding
                 pending/40_nf-log
                 pending/40_nf-log-ipv6
                 pending/59_ip_nat_h-unused-var
                 pending/60_ecn_raw_unclone
                 extra/ipt_TARPIT

-----------------------------------------------------------------
No more patches to apply! Q to Quit or ? for options [Q/a/r/b/?] q


