From: Rayed Alrashed <rayed@saudi.net.sa>
Subject: Improve queue handler performance
Date: Fri, 15 Jun 2007 01:04:23 +0300
Message-ID: <4671BB67.7020209@saudi.net.sa>
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

Hello everyone,

I am playing with nf_netlink_queue handler and built an empty handler 
based on "nfqnl_test.c" from the distribution, it just accept all packet 
without any checks at all.

To test its performance I installed Lighttpd on the same machine, and 
used http_load to benchmark the performance.

Without any thing queued to the user space I achieved ~20000K fetches 
per second, but when I enabled user space filtering the performance 
dropped to ~2600 fetches per second.

I used this rule to queue all HTTP traffic to the queue handler:
# iptables -A myhttp -p tcp --dport 80 -j QUEUE

Is this drop in performance normal, and is there any way to improve the 
performance.

Thanks,
Rayed

