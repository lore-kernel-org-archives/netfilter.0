From: "Joe Clark" <joeclark@iastate.edu>
Subject: Problems Compiling userspace NF_QUEUE handler
Date: Sun, 12 Sep 2004 20:48:52 -0500 (CDT)
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <52482012810402551@webmail.iastate.edu>
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi there.  I'm trying to compile a userspace app that will receive and later
reinject packets from a kernel space module (NF_QUEUE).  The kernel module seems
to compile okay, but when I try to compile and link the userspace app, I get
implicit declarations and undefined references.  The kernel source tree (and the
kernel I'm running) *should* have the netfilter stuff configured
(CONFIG_NETFILTER=y in .config).

Here are the errors from make:
gcc -Wall  -I/root/linux-2.4.22-jec/include delay.c -o jdelay
delay.c: In function `process_packet':
delay.c:185: warning: implicit declaration of function `nf_reinject'
delay.c: In function `main':
delay.c:250: warning: implicit declaration of function `nf_register_queue_handler'
/root/tmp/cc2fwl5V.o(.text+0x21f): In function `process_packet':
: undefined reference to `nf_reinject'
/root/tmp/cc2fwl5V.o(.text+0x25d): In function `process_packet':
: undefined reference to `nf_reinject'
/root/tmp/cc2fwl5V.o(.text+0x3e5): In function `main':
: undefined reference to `nf_register_queue_handler'
collect2: ld returned 1 exit status
make: *** [jdelay] Error 1

I think I need to define __KERNEL__ to get this to work (even though it's not
really in the kernel...) but then I get a ton of parse errors and identifiers
redefined between my kernel source and /usr/include/  files.  Is there a "smart"
way to do this or is it all kinda hacky?

Any ideas on what I'm doing wrong?  Thanks.
-- Joe Clark




