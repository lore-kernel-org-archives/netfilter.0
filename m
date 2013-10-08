From: Husnu Demir <hdemir@metu.edu.tr>
Subject: ipset compile error
Date: Tue, 08 Oct 2013 09:28:07 +0300
Message-ID: <5253A5F7.1090403@metu.edu.tr>
Reply-To: hdemir@metu.edu.tr
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi,


It is a working environment. I get the following error messages. Can
anybody help me?


Thanks.



 uname -a
Linux neml 3.8.7 #2 SMP Mon Apr 15 14:09:02 EEST 2013 x86_64 GNU/Linux



git clone  git://git.netfilter.org/ipset.git
./autogen.sh

make

configure: creating ./config.status

ipset userspace tool configuration:
    Dynamic module loading: disabled
    Static modules:
        ipset_bitmap_ip
        ipset_bitmap_ipmac
        ipset_bitmap_port
        ipset_hash_ip
        ipset_hash_ipport
        ipset_hash_ipportip
        ipset_hash_ipportnet
        ipset_hash_net
        ipset_hash_netiface
        ipset_hash_netnet
        ipset_hash_netport
        ipset_hash_netportnet
        ipset_list_set
    Dynamic modules:
 /bin/bash ./config.status
config.status: creating Makefile
config.status: creating include/libipset/Makefile
config.status: creating lib/Makefile
config.status: creating lib/libipset.pc
config.status: creating src/Makefile
config.status: creating
kernel/include/linux/netfilter/ipset/ip_set_compat.h
config.status: creating config.h
config.status: config.h is unchanged
config.status: executing depfiles commands
config.status: executing libtool commands
make  all-recursive
make[1]: Entering directory `/usr/src/ipset'
Making all in include/libipset
make[2]: Entering directory `/usr/src/ipset/include/libipset'
make[2]: Nothing to be done for `all'.
make[2]: Leaving directory `/usr/src/ipset/include/libipset'
Making all in lib
make[2]: Entering directory `/usr/src/ipset/lib'
  CC     ipset_bitmap_ip.lo
  CC     ipset_bitmap_ipmac.lo
  CC     ipset_bitmap_port.lo
  CC     ipset_hash_ip.lo
  CC     ipset_hash_ipport.lo
  CC     ipset_hash_ipportip.lo
  CC     ipset_hash_ipportnet.lo
  CC     ipset_hash_net.lo
  CC     ipset_hash_netnet.lo
  CC     ipset_hash_netportnet.lo
  CC     ipset_hash_netport.lo
  CC     ipset_hash_netiface.lo
  CC     ipset_list_set.lo
  GEN    types_init.c
  CC     data.lo
  CC     errcode.lo
  CC     icmp.lo
  CC     icmpv6.lo
  CC     mnl.lo
  CC     parse.lo
  CC     print.lo
  CC     session.lo
  CC     types.lo
  CC     ui.lo
  CC     types_init.lo
  CCLD   libipset.la
make  all-am
make[3]: Entering directory `/usr/src/ipset/lib'
make[3]: Nothing to be done for `all-am'.
make[3]: Leaving directory `/usr/src/ipset/lib'
make[2]: Leaving directory `/usr/src/ipset/lib'
Making all in src
make[2]: Entering directory `/usr/src/ipset/src'
  CC     ipset.o
  CC     ui.o
  CCLD   ipset
make[2]: Leaving directory `/usr/src/ipset/src'
make[2]: Entering directory `/usr/src/ipset'
make[2]: Leaving directory `/usr/src/ipset'
make[1]: Leaving directory `/usr/src/ipset'



make modules
..
..
/usr/src/ipset/kernel/net/netfilter/ipset/ip_set_hash_netnet.c: In
function ?hash_netnet4_kadt?:
/usr/src/ipset/kernel/net/netfilter/ipset/ip_set_hash_netnet.c:141:
error: unknown field ?cidr? specified in initializer
/usr/src/ipset/kernel/net/netfilter/ipset/ip_set_hash_netnet.c:141:
warning: missing braces around initializer
/usr/src/ipset/kernel/net/netfilter/ipset/ip_set_hash_netnet.c:141:
warning: (near initialization for ?e.<anonymous>?)
/usr/src/ipset/kernel/net/netfilter/ipset/ip_set_hash_netnet.c:142:
error: unknown field ?cidr? specified in initializer
/usr/src/ipset/kernel/net/netfilter/ipset/ip_set_hash_netnet.c: In
function ?hash_netnet4_uadt?:
/usr/src/ipset/kernel/net/netfilter/ipset/ip_set_hash_netnet.c:163:
error: unknown field ?cidr? specified in initializer
/usr/src/ipset/kernel/net/netfilter/ipset/ip_set_hash_netnet.c:163:
warning: missing braces around initializer
/usr/src/ipset/kernel/net/netfilter/ipset/ip_set_hash_netnet.c:163:
warning: (near initialization for ?e.<anonymous>?)
/usr/src/ipset/kernel/net/netfilter/ipset/ip_set_hash_netnet.c:164:
error: unknown field ?cidr? specified in initializer
/usr/src/ipset/kernel/net/netfilter/ipset/ip_set_hash_netnet.c: In
function ?hash_netnet6_kadt?:
/usr/src/ipset/kernel/net/netfilter/ipset/ip_set_hash_netnet.c:368:
error: unknown field ?cidr? specified in initializer
/usr/src/ipset/kernel/net/netfilter/ipset/ip_set_hash_netnet.c:368:
warning: missing braces around initializer
/usr/src/ipset/kernel/net/netfilter/ipset/ip_set_hash_netnet.c:368:
warning: (near initialization for ?e.ip?)
/usr/src/ipset/kernel/net/netfilter/ipset/ip_set_hash_netnet.c:369:
error: unknown field ?cidr? specified in initializer
/usr/src/ipset/kernel/net/netfilter/ipset/ip_set_hash_netnet.c: In
function ?hash_netnet6_uadt?:
/usr/src/ipset/kernel/net/netfilter/ipset/ip_set_hash_netnet.c:389:
error: unknown field ?cidr? specified in initializer
/usr/src/ipset/kernel/net/netfilter/ipset/ip_set_hash_netnet.c:389:
warning: missing braces around initializer
/usr/src/ipset/kernel/net/netfilter/ipset/ip_set_hash_netnet.c:389:
warning: (near initialization for ?e.ip?)
/usr/src/ipset/kernel/net/netfilter/ipset/ip_set_hash_netnet.c:390:
error: unknown field ?cidr? specified in initializer
make[4]: ***
[/usr/src/ipset/kernel/net/netfilter/ipset/ip_set_hash_netnet.o] Error 1
make[3]: *** [/usr/src/ipset/kernel/net/netfilter/ipset] Error 2
make[2]: *** [/usr/src/ipset/kernel/net/netfilter] Error 2
make[1]: *** [_module_/usr/src/ipset/kernel/net] Error 2
make[1]: Leaving directory `/usr/src/linux-3.8.7'
make: *** [modules] Error 2



-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBAgAGBQJSU6X2AAoJEISpBAM51qlEbDcH/A76vNgIWdbVM4JJQjWrAB7w
vqFUcIiKtf4Zf3LXL86gam6255dfrVA63YwzwGgeBjFc8QLilrHKdoo9/TvG7rGx
MYam29Scz2MNMZDDYlSpBkjDmlHZuGijSmoQ0RnrHiXQlfElh2Hy7c/opTXHkWnP
ctx0Qt5/bupn/t1YcFq/Io0iQqNDk7lBDebgkY1MkWqSuP0X8keQ0bgX0TTnGBqN
AMZwl7JKvlOejAXJI+pJEGxR0rCXcluOQPoL15JIuXnjPAhl7Y0F2Mb06h9SDAj7
mKdp1FZV/bOID4roeNFr+QHhIS+6C9C+SXan+zr84f7vgOJE/mNonNzhVtqIcb8=
=8Ykz
-----END PGP SIGNATURE-----
