From: iv <iv@fnet.pl>
Subject: problem with connlimit
Date: Mon, 31 Jan 2005 15:21:39 +0100
Message-ID: <41FE3EF3.7020909@fnet.pl>
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

I have the problem with compilling the 2.6.10 with applied connlimit 
from patch-o-matic-ng-20040302.
it looks like this:

  CC      net/ipv4/netfilter/ipt_connlimit.o
net/ipv4/netfilter/ipt_connlimit.c: In function `count_them':
net/ipv4/netfilter/ipt_connlimit.c:100: structure has no member named 
`infos'
net/ipv4/netfilter/ipt_connlimit.c:107: structure has no member named 
`infos'
make[3]: *** [net/ipv4/netfilter/ipt_connlimit.o] Error 1
make[2]: *** [net/ipv4/netfilter] Error 2
make[1]: *** [net/ipv4] Error 2
make: *** [net] Error 2

 all i have done was follow: just run .*/runme base*, then *make 
menuconfig* and "yes" for *Connections/IP limit match support* in 
*Netfilter Configuration*, then *make* for kernel sources.

so my question is: did i do anything wrong, or maybe i forgot to do 
anything, or it is a bug?
thanks in advance,
 iv

