From: David Leangen <dleangen@canada.com>
Subject: NAT: Slow connection on Mac OSX
Date: Mon, 05 Sep 2005 14:13:50 +0900
Message-ID: <431BD40E.7020001@canada.com>
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


Hello!

I have set up NAT/masquerading on my router box.

Everything seems to be working fine on my Linux client host. However, my 
Mac is having a lot of trouble: the connection is very slow and I can't 
even finish loading, for example, the google home page.


Is there something else I need to do to get this going right?


Mac: 192.168.2.4
Client Linux: 192.168.2.2
Linux firewall (eth1): 192.168.2.1
Linux firewall (eth0): 192.168.1.2

ip_forward is set to "1".

In my iptables "nat" table, I have:

-A POSTROUTING -o ppp0 -j MASQUERADE


Thanks for any advice you can give me!



