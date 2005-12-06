From: vikrant@saysnetsoft.com
Subject: Problem after applying patch for "nth" module
Date: Tue, 6 Dec 2005 01:34:48 -0600 (CST)
Message-ID: <55531.61.12.43.109.1133854488.squirrel@saysnetsoft.com>
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

Hi,

I have successfully applied patch for "nth" module but when i am trying to
add the following RULE for testing purpose:-

"iptables -A INPUT -p icmp --icmp-type echo-request -m nth --every 2 -j DROP"

It throws a message "iptables: No chain/target/match by that name".

The steps i have followed to apply the patch for "nth" are:-
1 Apply the the patch for "nth" using patch-o-matic.
2 Recompile kernel
3 make and make install the iptables package.

I am trying it with kernel v2.6.14.2 and iptables v1.3.4.

After,the above failure i have tried the another way to use "nth", add nth
as a Module as follows:-
First i wrote a Makefile
----------------------------------------------------------------
obj-m += ipt_nth.o

all:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules

clean:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) clean
-----------------------------------------------------------------------
then execute
#make
#insmod ./ipt_nth.ko

It works.Now,i am able to use nth module.

So,please tell what i missed or did wrong in patch-o-matic procedure.

Thanks
Vikrant

