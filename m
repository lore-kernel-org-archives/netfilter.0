From: Richard Strand <richard@telabria.com>
Subject: Owner match doesn't work when statically compiling iptables
Date: Thu, 18 Nov 2004 17:39:28 +0000
Message-ID: <419CDE50.9080400@telabria.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi,

If I statically compile iptables when I try to use the -m owner match I 
get a segmentation fault. There seem to be no problems if I use a 
dynamically linked version.

for example:
iptables -A OUTPUT -m owner --uid-owner 4 -j ACCEPT

Causes this problem. (Oddly iptables -m owner -h works)

Is this a bug, or am I doing something wrong.

Regards,

Richard Strand


