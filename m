From: Venkateshwarlu Vangala <vvenkat@ikanos.com>
Subject: libiptc/.libs/libip4tc.o: file not recognized: Bad value
Date: Tue, 16 Jun 2009 15:04:08 +0530
Message-ID: <9D65D1536A4A5F419DA8876FCAC66FE6789ED7@GALLUS.india.ikanos.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-Class: urn:content-classes:message
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org

Hello,
 
I am trying to compile the latest IPTABLES version 1.4.3.2 with the
LINUX KERNEL version 2.6.28.8.
and I got the following compilation error :
 
/bin/sh ./libtool --tag=CC   --mode=link
/home/vvangala/15thJune_2_6_28_IPv6_IPQoS/linux/buildroot/build_mips_nof
pu/staging_dir/bin/mips-linux-uclibc-gcc -D_LARGEFILE_SOURCE=1
-D_LARGE_FILES -D_FILE_OFFSET_BITS=64        -D_REENTRANT -Wall
-Waggregate-return -Wmissing-declarations    -Wmissing-prototypes
-Wredundant-decls -Wshadow -Wstrict-prototypes  -Winline -pipe
-DXTABLES_LIBDIR=\"/usr/local/libexec/xtables\" -DXTABLES_INTERNAL
-I./include -I./include  -g -O2 -version-info 0:0:0  -o
libiptc/libiptc.la -rpath /usr/local/lib libiptc/libip4tc.lo
libiptc/libip6tc.lo
gcc -shared  libiptc/.libs/libip4tc.o libiptc/.libs/libip6tc.o
-Wl,-soname -Wl,libiptc.so.0 -o libiptc/.libs/libiptc.so.0.0.0
libiptc/.libs/libip4tc.o: file not recognized: Bad value
collect2: ld returned 1 exit status
make[3]: *** [libiptc/libiptc.la] Error 1

I request to somebody help me to further proceed on this.

Regards,
Venkat
