From: Jean-Christian Imbeault <jc@mega-bucks.co.jp>
Subject: iptables -L *very* slow
Date: Mon, 17 Feb 2003 14:36:15 +0900
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E5074CF.90904@mega-bucks.co.jp>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

When I try and print out my iptable rules using iptables -L, it takes 
about three minutes for the rules to print out (and there are only 9 of 
them).

Why is does this take so long? Is this a bug?

I am using the newest version of iptables with a custom 2.4.20 kernel.

Thanks!

jc


