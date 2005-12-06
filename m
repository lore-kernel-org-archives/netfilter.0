From: vikrant <vikrant@saysnetsoft.com>
Subject: Re: Problem after applying patch for "nth" module
Date: Tue, 06 Dec 2005 17:24:06 +0530
Message-ID: <43957BDE.9080305@saysnetsoft.com>
References: <55531.61.12.43.109.1133854488.squirrel@saysnetsoft.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <55531.61.12.43.109.1133854488.squirrel@saysnetsoft.com>
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
To: vikrant@saysnetsoft.com
Cc: netfilter@lists.netfilter.org


Sorry,i missed some steps in the following procedure:-

>
>After,the above failure i have tried the another way to use "nth", add nth
>as a Module as follows:-
>  
>
[step missed] first store the " ipt_nth.h"  to the "netfilter_ipv4" 
directory.
then, i wrote a Makefile

>----------------------------------------------------------------
>obj-m += ipt_nth.o
>
>all:
>	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules
>
>clean:
>	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) clean
>-----------------------------------------------------------------------
>then execute
>#make
>#insmod ./ipt_nth.ko
>  
>
[step missed] make clean iptables.
[step missed]  make and make install iptables.

Thanks
Vikrant

