From: Pradeep Aswani <pradeepg_aswani@yahoo.com>
Subject: iptables-1.3.1 problem --> libnet doesnt work
Date: Mon, 9 May 2005 00:47:45 -0700 (PDT)
Message-ID: <20050509074745.60111.qmail@web51004.mail.yahoo.com>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Dear Friends,

I am having some trouble getting snort inline running.

I have a FC 3 Linuxbox (kernel 2.6.9-1.667). I did a
'yum -y update' on this box now the kernel build is
2.6.11-1-14.FC3

I downloaded iptables-1.3.1.tar.bz2,
libnet-1.1.2.1.tar, snort_inline-1.9.1.tgz

IPTABLES:
---------
#bunzip1 iptables-1.3.1.tar.bz2
#tar -xvf iptables-1.3.1.tar
#cd iptables-1.3.1

At this point I do:

---------------------------------------------------------------------------
[root@secure iptables-1.3.1]# make
KERNEL_DIR=/lib/modules/2.6.11-1.14_FC3/build
Extensions found: IPv4:recent
cc -O2 -Wall -Wunused
-I/lib/modules/2.6.11-1.14_FC3/build/include
-Iinclude/ -DIPTABLES_VERSION=\"1.3.1\"  -fPIC -o
extensions/libipt_recent_sh.o -c
extensions/libipt_recent.c
In file included from
/lib/modules/2.6.11-1.14_FC3/build/include/linux/netfilter_ipv4.h:8,
                 from
/lib/modules/2.6.11-1.14_FC3/build/include/linux/netfilter_ipv4/ip_tables.h:26,
                 from include/libiptc/libiptc.h:6,
                 from include/iptables.h:5,
                 from extensions/libipt_recent.c:8:
/lib/modules/2.6.11-1.14_FC3/build/include/linux/config.h:6:2:
#error including kernel header in userspace; use the
glibc headers instead!
make: *** [extensions/libipt_recent_sh.o] Error 1
-------------------------------------------------------------------------------
As such the make is not taking the <Path_to_kernel>,
what should be the exact path that I should specify,
so that make works ?

Again 'make install KERNEL_DIR=....' works:

-------------------------------------------------
[root@secure iptables-1.3.1]# make install
KERNEL_DIR=/usr/src
[root@secure iptables-1.3.1]#
-------------------------------------------------

Also, when I give 'make install-devel; it works (as
shown below):

-------------------------------------------------
[root@secure iptables-1.3.1]# make install-devel
`libipq/ipq_create_handle.3' ->
`/usr/local/man/man3/ipq_create_handle.3'
`libipq/ipq_destroy_handle.3' ->
`/usr/local/man/man3/ipq_destroy_handle.3'
`libipq/ipq_errstr.3' ->
`/usr/local/man/man3/ipq_errstr.3'
`libipq/ipq_get_msgerr.3' ->
`/usr/local/man/man3/ipq_get_msgerr.3'
`libipq/ipq_get_packet.3' ->
`/usr/local/man/man3/ipq_get_packet.3'
`libipq/ipq_message_type.3' ->
`/usr/local/man/man3/ipq_message_type.3'
`libipq/ipq_perror.3' ->
`/usr/local/man/man3/ipq_perror.3'
`libipq/ipq_read.3' ->
`/usr/local/man/man3/ipq_read.3'
`libipq/ipq_set_mode.3' ->
`/usr/local/man/man3/ipq_set_mode.3'
`libipq/ipq_set_verdict.3' ->
`/usr/local/man/man3/ipq_set_verdict.3'
`libipq/libipq.3' -> `/usr/local/man/man3/libipq.3'
`include/libipq/libipq.h' ->
`/usr/local/include/libipq.h'
`libipq/libipq.a' -> `/usr/local/lib/libipq.a'
`libiptc/libiptc.a' -> `/usr/local/lib/libiptc.a'
[root@secure iptables-1.3.1]#
----------------------------------------------------

What should I put in <path-to-kernel> so that the
previous 'make KERNEL_DIR=<path-to-kernel>' works ? 

(Note: I tried other options like /usr/src,
/usr/src/local, /lib/modules/2.6.11-1.14_FC3/.. ,
/lib/modules/2.6.9-1.667/.. etc. ; bit in vain;
sometimes with the following message):
---------------------------------------------------------
[root@secure iptables-1.3.1]# make
KERNEL_DIR=/usr/src/
Extensions found:
[root@secure iptables-1.3.1]#
---------------------------------------------------------


LIBNET:
-------

Can somebody advice on the procedure as to how to
build & install LIBNET, after doing './configure'

-------------------------------------------
[root@secure libnet]# ./configure
beginning autoconfiguration process for
libnet-1.1.2.1...
checking build system type... i686-pc-linux-gnu
checking host system type... i686-pc-linux-gnu
checking target system type... i686-pc-linux-gnu
checking for a BSD-compatible install...
/usr/bin/install -c
checking whether build environment is sane... yes
checking for gawk... gawk
checking whether make sets $(MAKE)... yes
checking whether to enable maintainer-specific
portions of Makefiles... no
checking for gcc... gcc
checking for C compiler default output... a.out
checking whether the C compiler works... yes
checking whether we are cross compiling... no
checking for suffix of executables...
checking for suffix of object files... o
checking whether we are using the GNU C compiler...
yes
checking whether gcc accepts -g... yes
checking for gcc option to accept ANSI C... none
needed
checking for style of include used by make... GNU
checking dependency style of gcc... none
checking for a BSD-compatible install...
/usr/bin/install -c
checking for ranlib... ranlib
checking how to run the C preprocessor... gcc -E
checking for egrep... grep -E
checking for ANSI C header files... yes
checking for sys/types.h... yes
checking for sys/stat.h... yes
checking for stdlib.h... yes
checking for string.h... yes
checking for memory.h... yes
checking for strings.h... yes
checking for inttypes.h... yes
checking for stdint.h... yes
checking for unistd.h... yes
checking sys/sockio.h usability... no
checking sys/sockio.h presence... no
checking for sys/sockio.h... no
checking machine endianess... lil
checking if unaligned accesses fail... no
checking whether gcc needs -traditional... no
checking for strerror... yes
checking link-layer packet interface type... found
linux primitives
checking for packet socket (PF_SOCKET)... yes
checking for Linux proc filesystem... yes
scanning available packet construction modules: 802.1q
802.1x 802.2 802.3 arp bgp cdp data dhcp dns ethernet
fddi gre icmp igmp ip ipsec isl link mpls ntp ospf rip
rpc sebek snmp stp tcp token_ring udp vrrp
checking net/ethernet.h usability... yes
checking net/ethernet.h presence... yes
checking for net/ethernet.h... yes
configure: creating ./config.status
config.status: creating Makefile
config.status: creating src/Makefile
config.status: creating include/Makefile
config.status: creating include/libnet/Makefile
config.status: creating sample/Makefile
config.status: creating version.h
config.status: creating include/libnet.h
config.status: creating libnet-config
config.status: creating include/config.h
config.status: include/config.h is unchanged
config.status: executing depfiles commands
config.status: executing default commands

[root@secure libnet]# ls
acconfig.h      config.sub    libnet-config        man
           version.h
acinclude.m4    configure     libnet-config.in    
missing        version.h.in
aclocal.m4      configure.in  libnet.doxygen.conf 
mkinstalldirs  win32
autom4te.cache  CVS           Makefile            
README
config.guess    doc           Makefile.am         
sample
config.log      include       Makefile.am.common   src
config.status   install-sh    Makefile.in         
VERSION
[root@secure libnet]#
-------------------------------------------------------


SNORT_INLINE:
-------------

[root@secure snort_inline-1.9.1]# ./configure
--enable-inline
checking for a BSD-compatible install...
/usr/bin/install -c
checking whether build environment is sane... yes
checking for gawk... gawk
checking whether make sets ${MAKE}... yes
checking for style of include used by make... GNU
checking for gcc... gcc
checking for C compiler default output... a.out
checking whether the C compiler works... yes
checking whether we are cross compiling... no
checking for suffix of executables...
checking for suffix of object files... o
checking whether we are using the GNU C compiler...
yes
checking whether gcc accepts -g... yes
checking dependency style of gcc... none
checking for gcc option to accept ANSI C... none
needed
checking for ranlib... ranlib
checking for gcc... (cached) gcc
checking whether we are using the GNU C compiler...
(cached) yes
checking whether gcc accepts -g... (cached) yes
checking dependency style of gcc... (cached) none
checking build system type... i686-pc-linux-gnu
checking host system type... i686-pc-linux-gnu
checking whether byte ordering is bigendian... no
checking for sparc alignment... no
checking how to run the C preprocessor... gcc -E
checking for ANSI C header files... yes
checking for sys/types.h... yes
checking for sys/stat.h... yes
checking for stdlib.h... yes
checking for string.h... yes
checking for memory.h... yes
checking for strings.h... yes
checking for inttypes.h... yes
checking for stdint.h... yes
checking for unistd.h... yes
checking for strings.h... (cached) yes
checking for string.h... (cached) yes
checking for stdlib.h... (cached) yes
checking for unistd.h... (cached) yes
checking sys/sockio.h usability... no
checking sys/sockio.h presence... no
checking for sys/sockio.h... no
checking paths.h usability... yes
checking paths.h presence... yes
checking for paths.h... yes
checking for inet_ntoa in -lnsl... yes
checking for socket in -lsocket... no
checking whether printf must be declared... no
checking whether fprintf must be declared... no
checking whether syslog must be declared... no
checking whether puts must be declared... no
checking whether fputs must be declared... no
checking whether fputc must be declared... no
checking whether fopen must be declared... no
checking whether fclose must be declared... no
checking whether fwrite must be declared... no
checking whether fflush must be declared... no
checking whether getopt must be declared... no
checking whether bzero must be declared... no
checking whether bcopy must be declared... no
checking whether memset must be declared... no
checking whether strtol must be declared... no
checking whether strcasecmp must be declared... no
checking whether strncasecmp must be declared... no
checking whether strerror must be declared... no
checking whether perror must be declared... no
checking whether socket must be declared... no
checking whether sendto must be declared... no
checking whether vsnprintf must be declared... no
checking whether snprintf must be declared... no
checking whether strtoul must be declared... no
checking for snprintf... yes
checking for strlcpy... no
checking for strlcat... no
checking for strerror... yes
checking for floor in -lm... yes
checking for pcap_datalink in -lpcap... yes
checking for ipq_set_mode in -lipq... yes
checking "for libipq.h"... /usr/local/include
checking "for libnet.h version 1.0.x"...

**********************************************
  ERROR: unable to find libnet 1.0.x (libnet.h)
  checked in the following places
**********************************************

[root@secure snort_inline-1.9.1]#

Here I can't proceed for 'make', 'make install' since
snort could not find libnet 1.0.x (libnet.h)


Any guidance will be greatly appreciated.


Thanks & Regards,

Pradeep


		
Discover Yahoo! 
Get on-the-go sports scores, stock quotes, news and more. Check it out! 
http://discover.yahoo.com/mobile.html

