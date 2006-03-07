From: "Bjo Breiskoll" <bjo@nefkom.net>
Subject: Compiling a netfilter shared library
Date: Tue, 7 Mar 2006 17:25:29 +0100
Message-ID: <000a01c64203$bfabcbc0$03b2a8c0@bjoserver>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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

Hello.

Im currently developing a new netfilter-target for the current
netfilter-framework under kernel 2.6.x. I had only a few problems with the
kernel-modul registering a new target. After the decision of implementing a
few user-mode commands via iptables i need to compile a shared-library for
my module.
And here is the problem: Is there a "special" way for compiling
iptables-shared-libs? For testing purpose i've tried the TCPLAG-Target: The
Kernelmodul compiled well but with "gcc -fPIC -c libipt_TCPLAG.c" for the
library only compile-errors occour.
 
Maybe i need special compilation arguments?

Regards
BJO


