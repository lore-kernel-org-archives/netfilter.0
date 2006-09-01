From: Mikhail <misha@mhsystems.com>
Subject: DNAT for two external NIC
Date: Thu, 31 Aug 2006 21:01:34 -0400
Message-ID: <001001c6cd62$2b697b20$4764a8c0@mhsystems.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
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

Pascal Hambourg wrote:
>Maybe you need to disable rp_filter (reverse path filtering) on the 
>interface that has not the default route.

>sysctl -w net/ipv4/conf/eth2/rp_filter=0

You're absolutely right; it requires that non- default interface had it set
to 0 if I want to do source-based routing. It is working like a charm now,
thank you.

Mikhail.




