From: Maurice Volaski <mvolaski@aecom.yu.edu>
Subject: iptables is complaining with bogus unknown error
 18446744073709551615
Date: Tue, 11 Apr 2006 13:14:30 -0400
Message-ID: <a06230909c06193cea962@[129.98.90.227]>
References: <200604111452.k3BEpxdo019103@mailgw.aecom.yu.edu>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200604111452.k3BEpxdo019103@mailgw.aecom.yu.edu>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

I just incorporated kernel 2.6.16.1 into my Gentoo system.

The firewall script no longer functions properly. Standard iptables 
calls return
iptables: unknown error 18446744073709551615

Posted in bugzilla as 
https://bugzilla.netfilter.org/bugzilla/show_bug.cgi?id=467
-- 

Maurice Volaski, mvolaski@aecom.yu.edu
Computing Support, Rose F. Kennedy Center
Albert Einstein College of Medicine of Yeshiva University

