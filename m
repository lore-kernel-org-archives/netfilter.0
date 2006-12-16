From: wlagmay@yanbulink.net
Subject: Help on Iptables
Date: Sat, 16 Dec 2006 20:04:15 +0300
Message-ID: <1166288655.4584270fe0f14@webmail.yanbulink.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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



Hi all,

I just want to know How am I going to do a blocking of multiple ports on a
single line let say port 700 to 800.

Im trying this command but it is not working

iptables -A OUTPUT -p tcp -m state --state NEW -m tcp --dport 700-800 -j DROP
iptables -A OUTPUT -p tcp -m state --state NEW -m tcp --dport 700 --to 800 -j
DROP

I'm trying the above commands and its not working. Can you help me please?

Thanks,

 Wennie


