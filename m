From: Worik <worik@noggon.co.nz>
Subject: Compiling problem with libipq
Date: 02 Dec 2002 08:22:08 +1300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1038770528.17573.9.camel@stolberg>
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

What have I done wrong?  

Worik

