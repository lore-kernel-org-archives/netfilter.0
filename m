From: Tony Earnshaw <tonye@billy.demon.nl>
Subject: FWIW
Date: Sun, 23 May 2004 14:40:33 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1085316030.3072.23.camel@localhost>
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

Maybe it could help someone :)

RedHat RHEL3 ES

Kernel was kernel.org 2.6.4 + iptables 1.2.9, pom-ng-20040302

Wanted kernel 2.6.6, have it, it works with Netfilter pom-ng :)

But: pom-ng-20040302 had to be replaced with the CVS pom-ng tarball;
iptables had to be replaced with 1.2.10 (CVS tarball).

Setting make "KERNEL_DIR=" to the 2.6.6 source dir caused iptables (both
1.2.9 and 1.2.10) to abort the make, with all kinds of inconsistencies.
However, cheating by setting "KERNEL_DIR=" to the (obviously pom-ng
patched) 2.6.4 source worked. All the iptables kernel stuff works,
iptables libipt_* libraries all work. So I'm happy.

Unrelated to Netfilter: 'make xconfig' in Gnome 2.2 for the kernel
resulted in no fonts (just small "squares"), so I had to use 'make
menuconfig" for the first time. No skin off my nose, though.

Best, and thanks for a *fine* mailing list.

--Tonni

-- 

We make out of the quarrel with others rhetoric
but out of the quarrel with ourselves, poetry.

mail: tonni@billy.demon.nl
http://www.billy.demon.nl


