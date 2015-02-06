From: Jason Sipula <alupis1@gmail.com>
Subject: Re: iptables build error when using musl-libc and kernel 3.18.x
 targeting ARM
Date: Fri, 6 Feb 2015 12:03:21 -0800
Message-ID: <CAJCcFsiHFE8+u3PGjTgTTmai3BO691BP9cWUcX=Q4s8D2p26RQ@mail.gmail.com>
References: <CAJCcFsiwEBFv5EvjB6L4W6PV=yc2HwZGmp3OHjK8fk=qAXNDxw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :content-type;
        bh=he9aX5+vIvu5P3DMYZdFQgrZu3K5FRqmtGdOMLbmc7c=;
        b=CIVpCibYoUrKXClcDD9i1EGHABdT8RYc5Rz8H8rD875nkvl7N0PKcQ/HYFOqa9Tpll
         uUagxXC+rbubFTINwCoK2ekEiWkFkX3A40AtNHHdo16NBE543+KaYEgBm2mAF0MB/qNk
         W6idgAL+Sptqn+KnzuKfHJ06pGIQpNdmqeKVCreqVEi1DVAigY2OfBumZE6MwOg9WFde
         3TQGS8twGLSqN9X9lrXAwLXTkJ0/uJSAh1laQdhJA+rYvxL4AXUQMmwK/iZcnDLxaDP4
         G+HaPVA9A+ZayySGSKHeQ+OcrGLsCGouMTIYf/Mp7XQx5ZsfHUefgpZu4mSmqyKLqq28
         1hdQ==
In-Reply-To: <CAJCcFsiwEBFv5EvjB6L4W6PV=yc2HwZGmp3OHjK8fk=qAXNDxw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Just an update...

I was able to get iptables building successfully when using musl-libc
when using this patch from Sabotage-Linux:

https://github.com/sabotage-linux/sabotage/blob/master/KEEP/iptables-1.4.14-musl-fixes.patch

Here's the patch in text in-case they break the link in the future:

--- iptables-1.4.12.1.o/extensions/libip6t_ipv6header.c
+++ iptables-1.4.12.1/extensions/libip6t_ipv6header.c
@@ -10,6 +10,9 @@
 #include <netdb.h>
 #include <xtables.h>
 #include <linux/netfilter_ipv6/ip6t_ipv6header.h>
+#ifndef IPPROTO_HOPOPTS
+# define IPPROTO_HOPOPTS 0
+#endif

 enum {
  O_HEADER = 0,
--- iptables-1.4.12.1.o/extensions/libxt_TCPOPTSTRIP.c
+++ iptables-1.4.12.1/extensions/libxt_TCPOPTSTRIP.c
@@ -12,6 +12,21 @@
 #ifndef TCPOPT_MD5SIG
 # define TCPOPT_MD5SIG 19
 #endif
+#ifndef TCPOPT_MAXSEG
+# define TCPOPT_MAXSEG 2
+#endif
+#ifndef TCPOPT_WINDOW
+# define TCPOPT_WINDOW 3
+#endif
+#ifndef TCPOPT_SACK_PERMITTED
+# define TCPOPT_SACK_PERMITTED 4
+#endif
+#ifndef TCPOPT_SACK
+# define TCPOPT_SACK 5
+#endif
+#ifndef TCPOPT_TIMESTAMP
+# define TCPOPT_TIMESTAMP 8
+#endif

 enum {
  O_STRIP_OPTION = 0,
--- iptables-1.4.12.1.o/include/libiptc/ipt_kernel_headers.h
+++ iptables-1.4.12.1/include/libiptc/ipt_kernel_headers.h
@@ -5,7 +5,6 @@

 #include <limits.h>

-#if defined(__GLIBC__) && __GLIBC__ == 2
 #include <netinet/ip.h>
 #include <netinet/in.h>
 #include <netinet/ip_icmp.h>
@@ -13,15 +12,4 @@
 #include <netinet/udp.h>
 #include <net/if.h>
 #include <sys/types.h>
-#else /* libc5 */
-#include <sys/socket.h>
-#include <linux/ip.h>
-#include <linux/in.h>
-#include <linux/if.h>
-#include <linux/icmp.h>
-#include <linux/tcp.h>
-#include <linux/udp.h>
-#include <linux/types.h>
-#include <linux/in6.h>
-#endif
 #endif
--- iptables-1.4.12.1.o/include/linux/netfilter_ipv4/ip_tables.h
+++ iptables-1.4.12.1/include/linux/netfilter_ipv4/ip_tables.h
@@ -16,6 +16,7 @@
 #define _IPTABLES_H

 #include <linux/types.h>
+#include <sys/types.h>

 #include <linux/netfilter_ipv4.h>

--- iptables-1.4.12.1.o/iptables/ip6tables-restore.c
+++ iptables-1.4.12.1/iptables/ip6tables-restore.c
@@ -9,7 +9,7 @@
  */

 #include <getopt.h>
-#include <sys/errno.h>
+#include <errno.h>
 #include <stdbool.h>
 #include <string.h>
 #include <stdio.h>
--- iptables-1.4.12.1.o/iptables/ip6tables-save.c
+++ iptables-1.4.12.1/iptables/ip6tables-save.c
@@ -6,7 +6,7 @@
  * This code is distributed under the terms of GNU GPL v2
  */
 #include <getopt.h>
-#include <sys/errno.h>
+#include <errno.h>
 #include <stdio.h>
 #include <fcntl.h>
 #include <stdlib.h>
--- iptables-1.4.12.1.o/iptables/iptables-restore.c
+++ iptables-1.4.12.1/iptables/iptables-restore.c
@@ -6,7 +6,7 @@
  */

 #include <getopt.h>
-#include <sys/errno.h>
+#include <errno.h>
 #include <stdbool.h>
 #include <string.h>
 #include <stdio.h>
--- iptables-1.4.12.1.o/iptables/iptables-save.c
+++ iptables-1.4.12.1/iptables/iptables-save.c
@@ -6,7 +6,7 @@
  *
  */
 #include <getopt.h>
-#include <sys/errno.h>
+#include <errno.h>
 #include <stdio.h>
 #include <fcntl.h>
 #include <stdlib.h>
--- iptables-1.4.12.1.o/iptables/iptables-xml.c
+++ iptables-1.4.12.1/iptables/iptables-xml.c
@@ -7,7 +7,7 @@
  */

 #include <getopt.h>
-#include <sys/errno.h>
+#include <errno.h>
 #include <string.h>
 #include <stdio.h>
 #include <stdlib.h>


On Mon, Feb 2, 2015 at 12:50 AM, Jason Sipula <alupis1@gmail.com> wrote:
> I'm trying to compile iptables targeting an ARM, but running into
> quite a bit of compilation trouble.
>
> I'm using linux kernel 3.18.x, which perhaps is some of my problems (too new).
>
> I've downloaded a new config.guess and config.sub so that iptables
> recognizes musl-libc.
>
> ./configure completes normally
>
> My configure opts are:
>
> --build="x86_64-cross-linux-gnu"
> --host="arm-linux-musleabihf"
> --prefix=/usr
> --sbin=/sbin
> --with-xtlibdir=/lib/xtables
> --enable-libipq
> --with-ksource="${TOOLS}/arm-linux-musleabihf"
>
> Issues come up when running make pretty much right away. I was trying
> with the latest official release of iptables version 1.4.21, but I get
> the same compilation problem using the latest nightly build
> iptables-20150202 as well.
>
> I might be able to work around some of the unknown type errors (shown
> below) by just patching in a custom include to typedef map them (ex:
> typedef u_int16_t uint16_t;), but there's a lot of other issues and
> I'm not sure that path would be the correct one to head down.
>
> ~~~
>
> Since my config.log is very long, here is a link:
> http://pastebin.com/raw.php?i=qMfqvbux
>
> Below is the start of 'make' and it's errors.
>
> Both are from the nightly build 20150202, however things look the same
> to me when using the official 1.4.21 release.
>
> ~~~
>
> Iptables Configuration:
>   IPv4 support: yes
>   IPv6 support: yes
>   Devel support: yes
>   IPQ support: yes
>   Large file support: yes
>   BPF utils support: no
>   nfsynproxy util support: no
>   nftables support: yes
>
> Build parameters:
>   Put plugins into executable (static): no
>   Support plugins via dlopen (shared): yes
>   Installation prefix (--prefix): /usr
>   Xtables extension directory: /lib/xtables
>   Pkg-config directory: /usr/lib/pkgconfig
>   Kernel source directory: /root/LiLi/target/cross-tools/arm-linux-musleabihf
>   Host: arm-unknown-linux-musleabihf
>   GCC binary: /root/LiLi/target/cross-tools/bin/arm-linux-musleabihf-gcc
>
> Iptables modules that will not be built:  connlabel
> make[1]: Entering directory '/root/LiLi/target/sources/iptables-20150202'
> make  all-recursive
> make[2]: Entering directory '/root/LiLi/target/sources/iptables-20150202'
> Making all in libiptc
> make[3]: Entering directory
> '/root/LiLi/target/sources/iptables-20150202/libiptc'
> /bin/sh ../libtool --tag=CC   --mode=compile
> /root/LiLi/target/cross-tools/bin/arm-linux-musleabihf-gcc
> -DHAVE_CONFIG_H -I. -I..  -D_LARGEFILE_SOURCE=1 -D_LARGE_FILES
> -D_FILE_OFFSET_BITS=64 -D_REENTRANT  -DXTABLES_LIBDIR=\"/lib/xtables\"
> -DXTABLES_INTERNAL -I../include -I../include
> -I/root/LiLi/target/cross-tools/arm-linux-musleabihf/include/uapi
> -I/root/LiLi/target/cross-tools/arm-linux-musleabihf/include  -Wall
> -Waggregate-return -Wmissing-declarations  -Wmissing-prototypes
> -Wredundant-decls -Wshadow -Wstrict-prototypes  -Winline -pipe -g -O2
> -MT libip4tc.lo -MD -MP -MF .deps/libip4tc.Tpo -c -o libip4tc.lo
> libip4tc.c
> libtool: compile:
> /root/LiLi/target/cross-tools/bin/arm-linux-musleabihf-gcc
> -DHAVE_CONFIG_H -I. -I.. -D_LARGEFILE_SOURCE=1 -D_LARGE_FILES
> -D_FILE_OFFSET_BITS=64 -D_REENTRANT -DXTABLES_LIBDIR=\"/lib/xtables\"
> -DXTABLES_INTERNAL -I../include -I../include
> -I/root/LiLi/target/cross-tools/arm-linux-musleabihf/include/uapi
> -I/root/LiLi/target/cross-tools/arm-linux-musleabihf/include -Wall
> -Waggregate-return -Wmissing-declarations -Wmissing-prototypes
> -Wredundant-decls -Wshadow -Wstrict-prototypes -Winline -pipe -g -O2
> -MT libip4tc.lo -MD -MP -MF .deps/libip4tc.Tpo -c libip4tc.c  -fPIC
> -DPIC -o .libs/libip4tc.o
> In file included from ../include/libiptc/libiptc.h:12:0,
>                  from libip4tc.c:29:
> ../include/linux/netfilter_ipv4/ip_tables.h:76:2: error: unknown type
> name 'u_int16_t'
>   u_int16_t proto;
>   ^
> ../include/linux/netfilter_ipv4/ip_tables.h:79:2: error: unknown type
> name 'u_int8_t'
>   u_int8_t flags;
>   ^
> ../include/linux/netfilter_ipv4/ip_tables.h:81:2: error: unknown type
> name 'u_int8_t'
>   u_int8_t invflags;
>   ^
> ../include/linux/netfilter_ipv4/ip_tables.h:109:2: error: unknown type
> name 'u_int16_t'
>   u_int16_t target_offset;
>   ^
> ../include/linux/netfilter_ipv4/ip_tables.h:111:2: error: unknown type
> name 'u_int16_t'
>   u_int16_t next_offset;
>   ^
> ../include/linux/netfilter_ipv4/ip_tables.h:144:2: error: unknown type
> name 'u_int8_t'
>   u_int8_t type;    /* type to match */
>   ^
> ../include/linux/netfilter_ipv4/ip_tables.h:145:2: error: unknown type
> name 'u_int8_t'
>   u_int8_t code[2];   /* range of code */
>   ^
> ../include/linux/netfilter_ipv4/ip_tables.h:146:2: error: unknown type
> name 'u_int8_t'
>   u_int8_t invflags;   /* Inverse flags */
>   ^
> In file included from ../include/xtables.h:15:0,
>                  from libiptc.c:37,
>                  from libip4tc.c:113:
> /root/LiLi/target/cross-tools/arm-linux-musleabihf/include/netinet/in.h:14:8:
> error: redefinition of 'struct in_addr'
>  struct in_addr { in_addr_t s_addr; };
>         ^
> In file included from ../include/libiptc/ipt_kernel_headers.h:19:0,
>                  from ../include/libiptc/libiptc.h:6,
>                  from libip4tc.c:29:
> /root/LiLi/target/cross-tools/arm-linux-musleabihf/include/linux/in.h:79:8:
> note: originally defined here
>  struct in_addr {
>         ^
> In file included from ../include/xtables.h:15:0,
>                  from libiptc.c:37,
>                  from libip4tc.c:113:
> /root/LiLi/target/cross-tools/arm-linux-musleabihf/include/netinet/in.h:16:8:
> error: redefinition of 'struct sockaddr_in'
>  struct sockaddr_in
>         ^
> In file included from ../include/libiptc/ipt_kernel_headers.h:19:0,
>                  from ../include/libiptc/libiptc.h:6,
>                  from libip4tc.c:29:
> /root/LiLi/target/cross-tools/arm-linux-musleabihf/include/linux/in.h:217:8:
> note: originally defined here
>  struct sockaddr_in {
>         ^
> In file included from ../include/xtables.h:15:0,
>                  from libiptc.c:37,
>                  from libip4tc.c:113:
> /root/LiLi/target/cross-tools/arm-linux-musleabihf/include/netinet/in.h:24:8:
> error: redefinition of 'struct in6_addr'
>  struct in6_addr
>         ^
> In file included from ../include/libiptc/ipt_kernel_headers.h:25:0,
>                  from ../include/libiptc/libiptc.h:6,
>                  from libip4tc.c:29:
> /root/LiLi/target/cross-tools/arm-linux-musleabihf/include/linux/in6.h:32:8:
> note: originally defined here
>  struct in6_addr {
>         ^
> In file included from ../include/xtables.h:15:0,
>                  from libiptc.c:37,
>                  from libip4tc.c:113:
> /root/LiLi/target/cross-tools/arm-linux-musleabihf/include/netinet/in.h:36:8:
> error: redefinition of 'struct sockaddr_in6'
>  struct sockaddr_in6
>         ^
> In file included from ../include/libiptc/ipt_kernel_headers.h:25:0,
>                  from ../include/libiptc/libiptc.h:6,
>                  from libip4tc.c:29:
> /root/LiLi/target/cross-tools/arm-linux-musleabihf/include/linux/in6.h:49:8:
> note: originally defined here
>  struct sockaddr_in6 {
>         ^
> In file included from ../include/xtables.h:15:0,
>                  from libiptc.c:37,
>                  from libip4tc.c:113:
> /root/LiLi/target/cross-tools/arm-linux-musleabihf/include/netinet/in.h:45:8:
> error: redefinition of 'struct ipv6_mreq'
>  struct ipv6_mreq
>         ^
> In file included from ../include/libiptc/ipt_kernel_headers.h:25:0,
>                  from ../include/libiptc/libiptc.h:6,
>                  from libip4tc.c:29:
> /root/LiLi/target/cross-tools/arm-linux-musleabihf/include/linux/in6.h:59:8:
> note: originally defined here
>  struct ipv6_mreq {
>         ^
> In file included from ../include/xtables.h:15:0,
>                  from libiptc.c:37,
>                  from libip4tc.c:113:
> /root/LiLi/target/cross-tools/arm-linux-musleabihf/include/netinet/in.h:247:8:
> error: redefinition of 'struct ip_mreq'
>  struct ip_mreq
>         ^
> In file included from ../include/libiptc/ipt_kernel_headers.h:19:0,
>                  from ../include/libiptc/libiptc.h:6,
>                  from libip4tc.c:29:
> /root/LiLi/target/cross-tools/arm-linux-musleabihf/include/linux/in.h:157:8:
> note: originally defined here
>  struct ip_mreq  {
>         ^
> In file included from ../include/xtables.h:15:0,
>                  from libiptc.c:37,
>                  from libip4tc.c:113:
> /root/LiLi/target/cross-tools/arm-linux-musleabihf/include/netinet/in.h:253:8:
> error: redefinition of 'struct ip_mreqn'
>  struct ip_mreqn
>         ^
> In file included from ../include/libiptc/ipt_kernel_headers.h:19:0,
>                  from ../include/libiptc/libiptc.h:6,
>                  from libip4tc.c:29:
> /root/LiLi/target/cross-tools/arm-linux-musleabihf/include/linux/in.h:162:8:
> note: originally defined here
>  struct ip_mreqn {
>         ^
> In file included from ../include/xtables.h:15:0,
>                  from libiptc.c:37,
>                  from libip4tc.c:113:
> /root/LiLi/target/cross-tools/arm-linux-musleabihf/include/netinet/in.h:260:8:
> error: redefinition of 'struct ip_mreq_source'
>  struct ip_mreq_source {
>         ^
> In file included from ../include/libiptc/ipt_kernel_headers.h:19:0,
>                  from ../include/libiptc/libiptc.h:6,
>                  from libip4tc.c:29:
> /root/LiLi/target/cross-tools/arm-linux-musleabihf/include/linux/in.h:168:8:
> note: originally defined here
>  struct ip_mreq_source {
>         ^
> In file included from ../include/xtables.h:15:0,
>                  from libiptc.c:37,
>                  from libip4tc.c:113:
> /root/LiLi/target/cross-tools/arm-linux-musleabihf/include/netinet/in.h:266:8:
> error: redefinition of 'struct ip_msfilter'
>  struct ip_msfilter {
>         ^
> In file included from ../include/libiptc/ipt_kernel_headers.h:19:0,
>                  from ../include/libiptc/libiptc.h:6,
>                  from libip4tc.c:29:
> /root/LiLi/target/cross-tools/arm-linux-musleabihf/include/linux/in.h:174:8:
> note: originally defined here
>  struct ip_msfilter {
>         ^
> In file included from ../include/xtables.h:15:0,
>                  from libiptc.c:37,
>                  from libip4tc.c:113:
> /root/LiLi/target/cross-tools/arm-linux-musleabihf/include/netinet/in.h:277:8:
> error: redefinition of 'struct group_req'
>  struct group_req {
>         ^
> In file included from ../include/libiptc/ipt_kernel_headers.h:19:0,
>                  from ../include/libiptc/libiptc.h:6,
>                  from libip4tc.c:29:
> /root/LiLi/target/cross-tools/arm-linux-musleabihf/include/linux/in.h:186:8:
> note: originally defined here
>  struct group_req {
>         ^
> In file included from ../include/xtables.h:15:0,
>                  from libiptc.c:37,
>                  from libip4tc.c:113:
> /root/LiLi/target/cross-tools/arm-linux-musleabihf/include/netinet/in.h:282:8:
> error: redefinition of 'struct group_source_req'
>  struct group_source_req {
>         ^
> In file included from ../include/libiptc/ipt_kernel_headers.h:19:0,
>                  from ../include/libiptc/libiptc.h:6,
>                  from libip4tc.c:29:
> /root/LiLi/target/cross-tools/arm-linux-musleabihf/include/linux/in.h:191:8:
> note: originally defined here
>  struct group_source_req {
>         ^
> In file included from ../include/xtables.h:15:0,
>                  from libiptc.c:37,
>                  from libip4tc.c:113:
> /root/LiLi/target/cross-tools/arm-linux-musleabihf/include/netinet/in.h:288:8:
> error: redefinition of 'struct group_filter'
>  struct group_filter {
>         ^
> In file included from ../include/libiptc/ipt_kernel_headers.h:19:0,
>                  from ../include/libiptc/libiptc.h:6,
>                  from libip4tc.c:29:
> /root/LiLi/target/cross-tools/arm-linux-musleabihf/include/linux/in.h:197:8:
> note: originally defined here
>  struct group_filter {
>         ^
> In file included from ../include/xtables.h:15:0,
>                  from libiptc.c:37,
>                  from libip4tc.c:113:
> /root/LiLi/target/cross-tools/arm-linux-musleabihf/include/netinet/in.h:299:8:
> error: redefinition of 'struct in_pktinfo'
>  struct in_pktinfo
>         ^
> In file included from ../include/libiptc/ipt_kernel_headers.h:19:0,
>                  from ../include/libiptc/libiptc.h:6,
>                  from libip4tc.c:29:
> /root/LiLi/target/cross-tools/arm-linux-musleabihf/include/linux/in.h:209:8:
> note: originally defined here
>  struct in_pktinfo {
>         ^
> In file included from ../include/xtables.h:16:0,
>                  from libiptc.c:37,
>                  from libip4tc.c:113:
> /root/LiLi/target/cross-tools/arm-linux-musleabihf/include/net/if.h:65:8:
> error: redefinition of 'struct ifmap'
>  struct ifmap {
>         ^
> In file included from ../include/libiptc/ipt_kernel_headers.h:20:0,
>                  from ../include/libiptc/libiptc.h:6,
>                  from libip4tc.c:29:
> /root/LiLi/target/cross-tools/arm-linux-musleabihf/include/linux/if.h:169:8:
> note: originally defined here
>  struct ifmap {
>         ^
> In file included from ../include/xtables.h:16:0,
>                  from libiptc.c:37,
>                  from libip4tc.c:113:
> /root/LiLi/target/cross-tools/arm-linux-musleabihf/include/net/if.h:77:8:
> error: redefinition of 'struct ifreq'
>  struct ifreq {
>         ^
> In file included from ../include/libiptc/ipt_kernel_headers.h:20:0,
>                  from ../include/libiptc/libiptc.h:6,
>                  from libip4tc.c:29:
> /root/LiLi/target/cross-tools/arm-linux-musleabihf/include/linux/if.h:203:8:
> note: originally defined here
>  struct ifreq {
>         ^
> In file included from ../include/xtables.h:16:0,
>                  from libiptc.c:37,
>                  from libip4tc.c:113:
> /root/LiLi/target/cross-tools/arm-linux-musleabihf/include/net/if.h:117:8:
> error: redefinition of 'struct ifconf'
>  struct ifconf {
>         ^
> In file included from ../include/libiptc/ipt_kernel_headers.h:20:0,
>                  from ../include/libiptc/libiptc.h:6,
>                  from libip4tc.c:29:
> /root/LiLi/target/cross-tools/arm-linux-musleabihf/include/linux/if.h:252:8:
> note: originally defined here
>  struct ifconf  {
>         ^
> Makefile:401: recipe for target 'libip4tc.lo' failed
> make[3]: *** [libip4tc.lo] Error 1
> make[3]: Leaving directory '/root/LiLi/target/sources/iptables-20150202/libiptc'
> Makefile:365: recipe for target 'all-recursive' failed
> make[2]: *** [all-recursive] Error 1
> make[2]: Leaving directory '/root/LiLi/target/sources/iptables-20150202'
> Makefile:292: recipe for target 'all' failed
> make[1]: *** [all] Error 2
> make[1]: Leaving directory '/root/LiLi/target/sources/iptables-20150202'
> Makefile:9: recipe for target 'system' failed
> make: *** [system] Error 2
