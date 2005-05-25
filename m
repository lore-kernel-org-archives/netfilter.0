From: Rafael Vallejo <rvallejo@novadevices.com>
Subject: Problem using transparent proxy and iptables 1.3.1
Date: Wed, 25 May 2005 09:42:27 -0500
Message-ID: <42948ED3.7090407@novadevices.com>
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

Hello list

I'm having a problem with iptables, we recently instaled version 1.3.1 
on a Linux Kernel 2.6.10


This rule that used to work on former versions of iptables no longer 
work on 1.3.1

iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j REDIRECT 
--to-ports 3128


Any ideas?



