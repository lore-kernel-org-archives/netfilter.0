From: "Nicholas Basker" <nbasker@india.tejasnetworks.com>
Subject: Performance effect on using multiple (500) MARK target rules
Date: Tue, 13 Dec 2005 23:09:07 +0530
Message-ID: <GHEPLFGLHNDOFLBPNPOBAEBDECAA.nbasker@india.tejasnetworks.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Received: from localhost (unknown [127.0.0.1])
	by anche.india.tejasnetworks.com (*****) with ESMTP id 4B55073930
	for <netfilter@lists.netfilter.org>;
	Tue, 13 Dec 2005 17:29:44 +0000 (UTC)
Received: from nicholas (unknown [192.168.0.10])
	by anche.india.tejasnetworks.com (*****) with ESMTP id A83127392B
	for <netfilter@lists.netfilter.org>;
	Tue, 13 Dec 2005 22:59:41 +0530 (IST)
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

Hello:

I am planning to use the following MARK rule.

iptables -t mangle -A POSTROUTING -d <ipaddr>/<netmask> -j MARK --set-mark
<mark-id>

In my application, there may be around 500 mark rules like above. They can
change dynamically which means that some mark rule may be removed and new
ones can be added. So at a given time there may be around 500 such rules in
the system.

I have the following questions on the MARK rule. It would be helpful if you
could point me to the code to understand better.

01. With around 500 rules, there shall be 500 ipaddr/netmask that need to be
matched for every packet. Will this be significant performance degradation?.

02. How does the matching for destination ipaddr/netmask happen? Is there an
efficient hash scheme used. It would be helpful if you can point me to the
code where this happens.

03. Is the skbuff->nfmark field used to store the mark value. This is
available with the skbuff even at the L2 driver layer. For example
ethernet-driver or anyother layer2 driver. Is my assumption correct.

I very much appreciate your response. Thanks for your time,
Nicholas.



