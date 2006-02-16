From: Igor Belikov <ivb@is.ua>
Subject: iptables command and parallel processes
Date: Thu, 16 Feb 2006 12:04:06 +0200
Message-ID: <1492762721.20060216120406@is.ua>
Reply-To: Igor Belikov <ivb@is.ua>
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

Hello,

  I want to ask one question about parallel processes and iptables
  command usage.

  What I know about iptables command that it reads tables from kernel
  to userspace, make needed changes and write whole data back to
  kernel.

  I think that following situation is possible: process "aaa" calls
  iptables command, iptables (child of "aaa") get data from kernel, at
  this moment process "bbb" calls iptables, iptables (bbb) get data
  from kernel, iptables (aaa) make changes, iptables (bbb) make
  changes, iptables (aaa) write data back to kernel, iptables (bbb)
  write data to kernel - and we _lost_ result of iptables (aaa).

  If above situation impossible - which method is used to prevent it?

  If above situation possible - which metod I can use to prevent it?

-- 
Best regards,
 Igor                          mailto:ivb@is.ua


