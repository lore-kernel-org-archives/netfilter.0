From: Marcus Mikolaiczyk <marcus.mikolaiczyk@carmedialab.de>
Subject: 'Cross' Compiling iptables
Date: Tue, 15 Mar 2005 09:31:39 +0100
Message-ID: <42369D6B.7060502@carmedialab.de>
Reply-To: marcus.mikolaiczyk@carmedialab.de
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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

Greetings list users,

I got a problem compiling iptables for an embedded system (kernel 
2.4.19, ported gcc version 2.95.3 ). I use the folowing make command 
which stops in compiling extensions/libipt_TCPMSS.o

bash# make NO_SHARED_LIBS=1 KERNEL_DIR=/opt/embedded/kernel
Extensions found:
tricore-gcc -O2 -mtc13 -mall-errata -Wa,-mdmi12 -s -static  -Wall 
-Wunused -I/opt/embedded/kernel/include -Iinclude/ 
-DIPTABLES_VERSION=\"1.3.1\"  -DNO_SHARED_LIBS=1 
-DIPT_LIB_DIR=\"/usr/local/lib/iptables\" -c -o iptables.o iptables.c
...
...
tricore-gcc -O2 -mtc13 -mall-errata -Wa,-mdmi12 -s -static  -Wall 
-Wunused -I/opt/embedded/kernel/include -Iinclude/ 
-DIPTABLES_VERSION=\"1.3.1\"  -DNO_SHARED_LIBS=1 -D_INIT=ipt_TCPMSS_init 
-c -o extensions/libipt_TCPMSS.o extensions/libipt_TCPMSS.c
extensions/libipt_TCPMSS.c:16: field `mss' has incomplete type
extensions/libipt_TCPMSS.c: In function `parse':
extensions/libipt_TCPMSS.c:62: dereferencing pointer to incomplete type
extensions/libipt_TCPMSS.c:70: dereferencing pointer to incomplete type
extensions/libipt_TCPMSS.c:70: `IPT_TCPMSS_CLAMP_PMTU' undeclared (first 
use in this function)
extensions/libipt_TCPMSS.c:70: (Each undeclared identifier is reported 
only once
extensions/libipt_TCPMSS.c:70: for each function it appears in.)
extensions/libipt_TCPMSS.c: In function `print':
extensions/libipt_TCPMSS.c:97: dereferencing pointer to incomplete type
extensions/libipt_TCPMSS.c:97: `IPT_TCPMSS_CLAMP_PMTU' undeclared (first 
use in this function)
extensions/libipt_TCPMSS.c:100: dereferencing pointer to incomplete type
extensions/libipt_TCPMSS.c: In function `save':
extensions/libipt_TCPMSS.c:110: dereferencing pointer to incomplete type
extensions/libipt_TCPMSS.c:110: `IPT_TCPMSS_CLAMP_PMTU' undeclared 
(first use in this function)
extensions/libipt_TCPMSS.c:113: dereferencing pointer to incomplete type
extensions/libipt_TCPMSS.c: At top level:
extensions/libipt_TCPMSS.c:120: sizeof applied to an incomplete type
extensions/libipt_TCPMSS.c:121: sizeof applied to an incomplete type
make: *** [extensions/libipt_TCPMSS.o] Error 1

When I use
make NO_SHARED_LIBS=1
I can compile libipt_TCPMSS.o but get an error with the next:
extensions/libipt_TOS.o
cause it cannot find
linux/netfilter_ipv4/ipt_TOS.h
which does not exist in my kerneltree.

Anybody an idea. I'm clueless in the moment.

Regards Marcus

