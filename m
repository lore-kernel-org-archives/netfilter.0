From: "T. Horsnell (tsh)" <tsh@mrc-lmb.cam.ac.uk>
Subject: p.o.m-ng+linux-2.6.2+ctnetlink
Date: Thu, 19 Feb 2004 15:41:14 +0000 (GMT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <E1AtqId-000LDX-0I@alf1.lmb.internal>
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

Problem using patch-o-matic-ng-20040217 to patch kernel 2.6.2 
and iptables-1.2.9, to include the nfnetlink-ctnetlink-0.13 patch.

When I use .runme to test this patch, it reports:
'Patch nfnetlink-ctnetlink-0.13 applies cleanly'
When I actually install the patch, it reports errors,
but installs it anyway.

Re-make of the kernel then fails:

[root@dev1 linux-2.6.2]# make bzImage
  HOSTCC  scripts/modpost.o
  HOSTLD  scripts/modpost
make[2]: `scripts/fixdep' is up to date.
scripts/kconfig/conf -s arch/i386/Kconfig
net/ipv4/netfilter/Kconfig:593: syntax error, unexpected T_WORD
net/ipv4/netfilter/Kconfig:595: invalid menu option
make[2]: *** [silentoldconfig] Error 1
make[1]: *** [silentoldconfig] Error 2
make: *** [include/linux/autoconf.h] Error 2

Any advice?

Cheers,
Terry.





=========================================================================
Welcome to Patch-o-matic (1.11)!

Kernel:         /usr/src/linux-2.6.2
Iptables:       /usr/src/iptables

Each patch is a new feature: many have minimal impact, some do not.
Almost every one has bugs, so don't apply what you don't need!
-------------------------------------------------------
Already applied: 

Testing nfnetlink-ctnetlink-0.13... not applied
The nfnetlink-ctnetlink-0.13 patch:
   Author: Harald Welte <laforge@gnumonks.org>, Jay Schulist <jschlst@samba.org>,
   Status: Under development, but stabilizing now.

        Patrick McHardy <kaber@trash.net>
   
   Add recent work by patrick (notifiers, event messages to userspace.
   
-----------------------------------------------------------------
Do you want to apply this patch [N/y/t/f/a/r/b/w/q/?] t
Patch nfnetlink-ctnetlink-0.13 applies cleanly
-----------------------------------------------------------------
Do you want to apply this patch [N/y/t/f/a/r/b/w/q/?] y
ERROR (7 rejects out of 52 hunks)

Excellent! Source trees are ready for compilation.
=========================================================================

Checking whether the patch was actually installed:


=========================================================================
Welcome to Patch-o-matic (1.11)!

Kernel:         /usr/src/linux-2.6.2
Iptables:       /usr/src/iptables

Each patch is a new feature: many have minimal impact, some do not.
Almost every one has bugs, so don't apply what you don't need!
-------------------------------------------------------
Already applied: 

Testing nfnetlink-ctnetlink-0.13... applied

Excellent! Source trees are ready for compilation.
=========================================================================


