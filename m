From: "Bryan Althouse" <bryan.althouse@3phoenix.com>
Subject: segmentation fault on ARM PXA-255
Date: Mon, 2 May 2005 17:04:17 -0400
Message-ID: <37247.1981602304$1115121455@news.gmane.org>
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

Hi,

I have cross-compiled iptables ver. 1.3.0 for an ARM PXA-255 processor with
a 2.6.7 kernel.  The following patch needed to be applied to the kernel
before iptables would compile:
http://www.ussg.iu.edu/hypermail/linux/kernel/0406.2/0754.html.  The
resulting binaries seemed to be working fine until we tried the following
command:
"iptables -t mangle -A OUTPUT -p tcp --dport 3901 -j MARK --set-mark 1".
This results in a segmentation fault.  I've seen similar behavior when
kernel support for a needed iptables feature was missing.  But, in this case
we have compiled into the kernel practically the entire Netfilter feature
set.

Any ideas are greatly appreciated!

Bryan      



