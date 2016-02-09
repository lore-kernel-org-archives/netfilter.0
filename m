From: Mart Frauenlob <mart.frauenlob@chello.at>
Subject: Failing to compile latest iptables from git
Date: Tue, 9 Feb 2016 22:16:08 +0100
Message-ID: <56BA5718.6040403@chello.at>
Reply-To: mart.frauenlob@chello.at
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hello list,

I'm trying to prepare a patch for iptables, but unfortunately I'm 
failing to build it. I've done it many times before, but this time I 
don't know what's wrong, so I hope for your assistance.

The ./configure step runs just fine. It stops at the make process with 
this error:

   CC       libxt_connlabel.oo
   CCLD     libxt_connlabel.so
libxt_connlabel.oo: In function `connlabel_open':
/home/ellen/git/iptables.git/extensions/libxt_connlabel.c:40: undefined 
reference to `nfct_labelmap_new'
libxt_connlabel.oo: In function `connlabel_mt_parse':
/home/ellen/git/iptables.git/extensions/libxt_connlabel.c:56: undefined 
reference to `nfct_labelmap_get_bit'
libxt_connlabel.oo: In function `connlabel_get_name':
/home/ellen/git/iptables.git/extensions/libxt_connlabel.c:76: undefined 
reference to `nfct_labelmap_get_name'
collect2: ld returned 1 exit status


I have installed latest libs (libmnl, libnetlink, 
libnetfilter_conntrack) from git. The ld.so.conf.d files point to the 
libaries but that seems to be ignored (ldconfig was run), so I put this 
into my environment:

export LDFLAGS="-L/usr/local/lib/ 
-L/opt/k_3.2.35/libnetfilter_conntrack/lib/ 
-L/opt/k_3.2.35/libnfnetlink/lib -L/opt/k_3.2.35/libmnl/lib/"

export LD_LIBRARY_PATH="-L/opt/k_3.2.35/libnfnetlink/lib 
-L/opt/k_3.2.35/libmnl/lib -L/opt/k_3.2.35/libnetfilter_conntrack/lib"

export LD_RUN_PATH="-L/opt/k_3.2.35/libnfnetlink/lib 
-L/opt/k_3.2.35/libmnl/lib -L/opt/k_3.2.35/libnetfilter_conntrack/lib"

export libmnl_LIBS=-L/opt/k_3.2.35/libmnl/lib/

export libnfnetlink_LIBS=-L/opt/k_3.2.35/libnfnetlink/lib/

export 
libnetfilter_conntrack_LIBS=-L/opt/k_3.2.35/libnetfilter_conntrack/lib

export 
PKG_CONFIG_PATH=/opt/k_3.2.35/libnetfilter_conntrack/lib/pkgconfig:/opt/k_3.2.35/libnfnetlink/lib/pkgconfig:/opt/k_3.2.35/libmnl/lib/pkgconfig

At configure it finds the correct conntrack lib (at least it looks like 
to me).
My configure command was:
./configure --with-gnu-ld --prefix=/tmp --disable-nftables 
--with-ksource=/usr/src/linux-3.14-rc1 --enable-devel

I'm running a custom vanilla kernel 3.14.0-rc1.
build directory should be correct:
/lib/modules/3.14.0-rc1.custom-03.02.2014/build -> /usr/src/linux-3.14-rc1

gcc --version
gcc (Debian 4.4.5-8) 4.4.5


What am I missing?
Is more information needed?

Thank you very much for your help
Mart
