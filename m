From: "Eric Poulin" <epoulin@onepost.net>
Subject: Problem compiling Iptables 1.2.11 on Kernel 2.6.7
Date: Tue, 6 Jul 2004 15:28:53 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <009001c4638f$7a173170$800101df@lvl.digidyne.ca>
Reply-To: "Eric Poulin" <epoulin@onepost.net>
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

Hello Guys,

Any people succesfully compiled iptables 1.2.11 on 2.6.7?  Oddly, even
without applying any patch-o-matics packages, I'm getting the following
error while doing the make:

# make BINDIR=/sbin KERNEL_DIR=/usr/src/linux
Making dependencies: please wait...
Extensions found: IPv4:ROUTE IPv4:recent IPv6:ROUTE IPv6:ah IPv6:esp
IPv6:frag IPv6:ipv6header IPv6:hbh IPv6:dst IPv6:rt
gcc -O2 -Wall -Wunused -I/usr/src/linux/include -Iinclude/ -DIPTABLES_VERSIO
N=\"1.2.11\"  -fPIC -o extensions/libipt_ah_sh.o -c extensions/libipt_ah.c
In file included from include/libiptc/libiptc.h:6,
                 from include/iptables.h:5,
                 from extensions/libipt_ah.c:8:
/usr/src/linux/include/linux/netfilter_ipv4/ip_tables.h:255: warning: no
semicolon at end of struct or union
/usr/src/linux/include/linux/netfilter_ipv4/ip_tables.h:255: error: syntax
error before '*' token
/usr/src/linux/include/linux/netfilter_ipv4/ip_tables.h:259: error: syntax
error before '}' token
/usr/src/linux/include/linux/netfilter_ipv4/ip_tables.h:339: warning: type
defaults to `int' in declaration of `DECLARE_MUTEX'
/usr/src/linux/include/linux/netfilter_ipv4/ip_tables.h:339: warning:
parameter names (without types) in function declaration
/usr/src/linux/include/linux/netfilter_ipv4/ip_tables.h:339: warning:
`DECLARE_MUTEX' declared `static' but never defined
make: *** [extensions/libipt_ah_sh.o] Error 1


I'm getting this with a vanilla source code of the kernel and iptables. I
was getting those with the patch-o-matic installed, but I wanted to narrow
it down. Kernel can compile easily those modules that are coming from
iptables 1.2.9.

Any idea?

Eric


