From: "Federico Cruciani" <f.cruciani@oxys.it>
Subject: How to apply pom20030107 to RH 2.4.18-x kernels
Date: Tue, 4 Mar 2003 19:04:42 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001a01c2e278$8dcde8b0$0a7fa8c0@oxys.lan>
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

If you try to apply the pom patches to a Red Hat Linux Kernel 2.4.18-x, you
get an error applying the first cumulative patch "submitted/02_2.4.20".

I found that this happens because of a mistake in the
submitted/02_2.4.20.patch file of the pom archive. This patch file includes
the differences from each original kernel source file and the patched one.
It's all correct but at line #4548, when patching the
net/ipv4/netfilter/ipchains_core.c file there's a mistake; the patch about
the MODULE_LICENSE string seems to be already applied. 
So to apply the submitted/02_2.4.20 patch cleanly to a RH kernel source
tree,  the 6 lines starting at line #4548 in the patch-o-matic
submitted/02_2.4.20.patch file must be deleted.

Iok



