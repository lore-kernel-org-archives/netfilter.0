From: "Angel Tsankov" <fn42551@fmi.uni-sofia.bg>
Subject: Enabling the TTL target in your linux kernel
Date: Fri, 12 May 2006 21:58:23 +0300
Message-ID: <001201c675f6$0b19e990$cf34000a@sven>
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: "ML: netfilter" <netfilter@lists.netfilter.org>

I decompressed patch-o-matic-ng-20060511.tar.bz2 and executed  ./runme TTL with KERNEL_DIR and IPTABLES_DIR set appropriately, but I
could not find TTL target support in "Device drivers" > "Networking support" > "Networking options" > "Network packet filtering" >
"netfilter configuration". I do get "TTL target support" patch-o-matic-ng-20040621.tar.bz2, however. Why do I not have TTL target
support with 20060511?


