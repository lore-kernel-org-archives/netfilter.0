From: "Jeremy C. Reed" <reed@reedmedia.net>
Subject: building iptables with linux-2.4.20 fails due to headers in wrong
 places
Date: Wed, 30 Apr 2003 15:47:03 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.43.0304301533340.1683-100000@pilchuck.reedmedia.net>
Mime-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

I have iptables-1.2.8.

Doing a "make" (with BSD make and with GNU make) returns problems like:

$ time make BINDIR=/usr/bin LIBDIR=/usr/lib  MANDIR=/usr/man
KERNEL_DIR=/tmp/pkgsrc/misc/linux-kernel/work.k3/linux-2.4.20/
Making dependencies: please wait...
Something wrong... deleting dependencies.
make: ***
[/tmp/pkgsrc/misc/linux-kernel/work.k3/linux-2.4.20/include/net/if.h]
Error 1

real    0m9.562s
user    0m7.720s
sys     0m2.360s


So I manually copied include/linux/if.h to include/net/if.h (in my
kernel source) and then:

Making dependencies: please wait...
Something wrong... deleting dependencies.
make: ***
[/tmp/pkgsrc/misc/linux-kernel/work.k3/linux-2.4.20/include/net/ethernet.h]
Error 1
*** Error code 2

I do have that ethernet.h file at include/asm-cris/ethernet.h (my system
is i386).

I pointed the KERNEL_DIR to the linux-2.4.20 directory.

I did this with a fresh unextract of kernel sources and also did with
kernel sources after a build. The INSTALL document and FAQ doesn't have
any hints about this.

Any ideas?

(By the way, iptables-1.2.8 completely built on a different machine when
KERNEL_DIR was /usr/src/linux and that linux was very old 2.2.14. Maybe
it should check to make sure kernel source is new enough.)

   Jeremy C. Reed
   http://bsd.reedmedia.net/



