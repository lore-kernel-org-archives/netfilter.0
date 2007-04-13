From: Neubauer Christian <neu@musictrace.de>
Subject: Problem compiling nth match
Date: Fri, 13 Apr 2007 10:56:29 +0200
Message-ID: <35D33283-D6A0-407D-AE3E-F03A3D364B70@musictrace.de>
Mime-Version: 1.0 (Apple Message framework v752.3)
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
Content-Type: text/plain; charset="us-ascii"; delsp="yes"; format="flowed"
To: netfilter@lists.netfilter.org

Dear members,

I am trying to get nth running. I have downloaded a fresh kernel  
2.6.18, iptables-1.3.7 and latest patch-o-matic.

It looks to me that nth is not anymore a patch, but is included in  
the regular iptables distri. Is that correct ?

Here are my problems:
1. When I compile iptables it is running through without errors but  
does not compile the nth sourcefile. So I dont get libipt_nth.so.

2. Moreover my kernel net/ipv4/netfilter/ does not contain ipt_nth.c  
or something alike. How do I get nth into the kernel?

Any help is appreciated.

Regards
Christian



