From: cc <cc@kdtc.net>
Subject: make iptables
Date: Thu, 21 Oct 2004 10:30:52 +0800
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <41771F5C.3020809@kdtc.net>
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
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: Netfilter Group <netfilter@lists.netfilter.org>

Hi,

I'm attempting to compile iptables 1.2.11, but am
not sure what I'm doing wrong.   I am currently
running iptables 1.2.8 and it's running smoothly
on a 2.4.24 machine.

I just patched it to a 2.4.27 kernel and did a
make KERNEL_DIR=/usr/src/linux

It then throwing Warnings left,right and center:

cc -O2 -Wall -Wunused -I/usr/src/linux/include -Iinclude/
-DIPTABLES_VERSION=\"1.2.11\"  -fPIC -o extensions/libipt_physdev_sh.o
-c extensions/libipt_physdev.c
In file included from include/libiptc/libiptc.h:6,
                 from include/iptables.h:5,
                 from extensions/libipt_physdev.c:7:
/usr/src/linux/include/linux/netfilter_ipv4/ip_tables.h:339: warning:
type defaults to `int' in declaration of `DECLARE_MUTEX'
/usr/src/linux/include/linux/netfilter_ipv4/ip_tables.h:339: warning:
parameter names (without types) in function declaration

and finally choked at:

extensions/libipt_dstlimit.c: In function `save':
extensions/libipt_dstlimit.c:310: structure has no member named `cfg'
extensions/libipt_dstlimit.c:311: structure has no member named `cfg'
extensions/libipt_dstlimit.c:312: structure has no member named `cfg'
extensions/libipt_dstlimit.c:313: structure has no member named `cfg'
extensions/libipt_dstlimit.c:315: warning: unreachable code at beginning
of switch statement
extensions/libipt_dstlimit.c:327: structure has no member named `cfg'
extensions/libipt_dstlimit.c:328: structure has no member named `cfg'
extensions/libipt_dstlimit.c:329: structure has no member named `cfg'
extensions/libipt_dstlimit.c:330: structure has no member named `cfg'
extensions/libipt_dstlimit.c:331: structure has no member named `cfg'
extensions/libipt_dstlimit.c:332: structure has no member named `cfg'
extensions/libipt_dstlimit.c:333: structure has no member named `cfg'
extensions/libipt_dstlimit.c:334: structure has no member named `cfg'
extensions/libipt_dstlimit.c: At top level:
/usr/src/linux/include/linux/netfilter_ipv4/ip_tables.h:339: warning:
`DECLARE_MUTEX' declared `static' but never defined
make: *** [extensions/libipt_dstlimit_sh.o] Error 1

I've scanned the FAQ, the previous threads and the archives and
am quite stumped.

I used the same procedure I did with 1.2.8 against the 2.4.21 kernel.
Did something break?

Correct me if I'm wrong, but :

1)  Uncompress the iptables-1.2.11.tar.bz2 to /usr/src
2)  cd /usr/src/iptables-1.2.11
3)  make KERNEL_DIR=/usr/src/linux

At first, I even applied the POMs, but now to make things easier(?),
I deleted the /usr/src/linux-2.4.27 and uncompressed it again.
Still no go.

Any pointeres appreciated.


