From: Ian Mortimer <ian@physics.uq.edu.au>
Subject: Bridge + netfilter failing with recent Fedora 3 kernels.
Date: Tue, 28 Jun 2005 12:53:18 +1000
Message-ID: <1119927198.5199.71.camel@im.physics.uq.edu.au>
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
To: netfilter <netfilter@lists.netfilter.org>

Has anyone else seen this?  A working bridge running Fedora Core 3 fails
after an upgrade to the one of  the latest Fedora kernels.  What I've
found is:

   kernel-2.6.11-1.14_FC3 and earlier work fine

   kernel-2.6.11-1.27_FC3 and kernel-2.6.11-1.35_FC3 fail!

The problem is with netfilter not with bridging.  With iptables
shutdown the bridge works fine but even with very simple iptables
rules any network connections to/from or through the bridge fail.

(Fedora kernels are patched so it's difficult to say which standard
kernel version they correspond to but it looks like some new kernel
patch has caused or will cause problems with bridge-nf).


-- 
Ian

