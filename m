From: Worik <worik@noggon.co.nz>
Subject: Compiling problem with libipq
Date: 03 Dec 2002 13:58:24 +1300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1038877105.16909.21.camel@stolberg>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Friends.

I hope this is the correct list

This is very frustrating and I am sure there is a simple solution...

The code...
#include <linux/netfilter.h>
#include <libipq/libipq.h>
struct  ipq_handle * ph_ipq = 0;
int
main(int argc, char * argv[]){
  ph_ipq = ipq_create_handle(0, PF_INET);
  return 0;
}

Compiling....

make -k 
gcc -g -O0   -DIPT_LIB_DIR=/usr/lib    -c  ip_q_test.c -o ip_q.o 
gcc -g -O0   -DIPT_LIB_DIR=/usr/lib    -lipq  ip_q.o -o ip_q
ip_q.o: In function `main':
/home/worik/Projects/project12/ip_q_test.c:6: undefined reference to
`ipq_create_handle'

Oh dear!  Use the -shared flag (?)

gcc -g -O0   -DIPT_LIB_DIR=/usr/lib   -fpic -shared -c  ip_q_test.c -o
ip_q.o 
gcc -g -O0   -DIPT_LIB_DIR=/usr/lib   -fpic -shared -lipq  ip_q.o -o
ip_q

Running....
This GDB was configured as "i386-linux"...
(gdb) b main
Breakpoint 1 at 0x773: file ip_q_test.c, line 6.
(gdb) r
Starting program: /home/worik/Projects/project12/ip_q 
Breakpoint 1 at 0x80000773: file ip_q_test.c, line 6.

Program received signal SIGSEGV, Segmentation fault.
0x00000001 in ?? ()
(gdb)

What have I done wrong?   Clearly there is a problem with libraries,
probably libipq.

So check for it...

nm /usr/lib/libipq.a|grep ipq_create_handle
00000218 T ipq_create_handle

I do not know enough about nm to be sure, but I think this is OK.

I am using debian woody with the packages  iptables and iptables-dev 
installed.  Version 1.2.6a-5 


Worik

