From: "Rob Sterenborg (lists)" <lists@sterenborg.info>
Subject: Compiling conntrack-tools
Date: Wed, 18 Jan 2012 17:04:25 +0100
Message-ID: <1326902665.2646.20.camel@ns014530.dcyb.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Netfilter <netfilter@vger.kernel.org>

Hello,

I'm trying to compile conntrack-tools-1.0.1 on CentOS 6.

I confirmed that the kernel is sufficient new (2.6.32-71.el6.x86_64),
and that the kernel build parameters are set as per README.

I installed libnfnetlink and libnetfilter_conntrack in /usr/local. I
made sure /etc/ld.conf contains /usr/local/lib and ran ldconfig
(multiple times).

When running configure for conntrack-tools, it doesn't complain about
not finding either libnfnetlink or libnetfilter_conntrack:

checking for LIBNFNETLINK... yes
checking for LIBNETFILTER_CONNTRACK... yes

I'm using the following to configure conntrack-tools:

# export PKG_CONFIG_PATH="/usr/local/lib/pkgconfig"
# LIBNFNETLINK_CFLAGS="-I/usr/local/include" \
LIBNFNETLINK_LIBS="-L/usr/local/lib" \
LIBNETFILTER_CONNTRACK_CFLAGS="-I/usr/local/include" \
LIBNETFILTER_CONNTRACK_LIBS="-L/usr/local/lib" \
./configure --prefix=/usr/local

When running make, it gives an error when compiling conntrack.c:

[...]
Making all in src
make[1]: Entering directory
`/usr/local/src/netfilter/conntrack-tools-1.0.1/src'
  CC     conntrack.o
  CCLD   conntrack
conntrack.o: In function `alloc_tmpl_objects':
conntrack.c:(.text+0x71): undefined reference to `nfct_new'
conntrack.c:(.text+0x7d): undefined reference to `nfct_new'
conntrack.c:(.text+0x89): undefined reference to `nfct_new'
conntrack.c:(.text+0x95): undefined reference to `nfexp_new'
conntrack.o: In function `free_tmpl_objects':
conntrack.c:(.text+0x10d): undefined reference to `nfct_destroy'
conntrack.c:(.text+0x128): undefined reference to `nfct_destroy'
conntrack.c:(.text+0x143): undefined reference to `nfct_destroy'
conntrack.c:(.text+0x15e): undefined reference to `nfexp_destroy'
conntrack.o: In function `mark_cmp':
conntrack.c:(.text+0x932): undefined reference to `nfct_attr_is_set'
conntrack.c:(.text+0x947): undefined reference to `nfct_get_attr_u32'

[etc etc]

I checked the header files to be included; if they are installed and on
the place the include lines expect them: the files are where they are
expected.

I don't know what to check or what to do further. Can someone please
give me a hint?

Thanks in advance!


--
Rob


