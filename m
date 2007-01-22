From: =?ISO-8859-2?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Subject: What is wrong ???
Date: Mon, 22 Jan 2007 11:52:43 +0100
Message-ID: <45B4977B.8060906@freemail.hu>
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
To: Netfilter IPtableMailinglist <netfilter@lists.netfilter.org>

Hi list,

Why do I get these errors when I compile my new kernel ???

net/ipv4/netfilter/ipt_ipv4options.c:161: warning: initialization from 
incompatible pointer type

net/ipv4/netfilter/ipt_IPV4OPTSSTRIP.c: In function `target':
net/ipv4/netfilter/ipt_IPV4OPTSSTRIP.c:33: warning: implicit declaration 
of function `skb_ip_make_writable'
net/ipv4/netfilter/ipt_IPV4OPTSSTRIP.c: At top level:
net/ipv4/netfilter/ipt_IPV4OPTSSTRIP.c:72: warning: initialization from 
incompatible pointer type
net/ipv4/netfilter/ipt_IPV4OPTSSTRIP.c:73: warning: initialization from 
incompatible pointer type

WARNING: "skb_ip_make_writable" 
[net/ipv4/netfilter/ipt_IPV4OPTSSTRIP.ko] undefined!
make[2]: *** [__modpost] Error 1
make[1]: *** [modules] Error 2
make[1]: Leaving directory `/usr/src/linux-2.6.19.2'
make: *** [debian/stamp-build-kernel] Error 2


kernel: 2.6.19.2
iptables: 1.3.7
POM-ng: 20070121

Swifty

