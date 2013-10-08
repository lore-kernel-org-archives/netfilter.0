From: Husnu Demir <hdemir@metu.edu.tr>
Subject: Re: ipset compile error
Date: Tue, 08 Oct 2013 14:11:25 +0300
Message-ID: <5253E85D.3060202@metu.edu.tr>
References: <5253A5F7.1090403@metu.edu.tr> <alpine.DEB.2.00.1310081008350.22464@blackhole.kfki.hu> <alpine.DEB.2.00.1310081029390.22464@blackhole.kfki.hu>
Reply-To: hdemir@metu.edu.tr
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.00.1310081029390.22464@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi,

All process is listed below;

I have ipset-20130422 version and I can compile it very  well.


Thanks.
hdemir.



$ git clone  git://git.netfilter.org/ipset.git
Cloning into ipset...
remote: Counting objects: 5572, done.
remote: Compressing objects: 100% (1927/1927), done.
remote: Total 5572 (delta 3914), reused 4674 (delta 3335)
Receiving objects: 100% (5572/5572), 1.23 MiB | 455 KiB/s, done.
Resolving deltas: 100% (3914/3914), done.

$  cd ipset
$  ./autogen.sh
libtoolize: putting auxiliary files in AC_CONFIG_AUX_DIR, `build-aux'.
libtoolize: copying file `build-aux/ltmain.sh'
libtoolize: putting macros in AC_CONFIG_MACRO_DIR, `m4'.
libtoolize: copying file `m4/argz.m4'
libtoolize: copying file `m4/libtool.m4'
libtoolize: copying file `m4/ltdl.m4'
libtoolize: copying file `m4/ltoptions.m4'
libtoolize: copying file `m4/ltsugar.m4'
libtoolize: copying file `m4/ltversion.m4'
libtoolize: copying file `m4/lt~obsolete.m4'
libtoolize: putting libltdl files in LT_CONFIG_LTDL_DIR, `libltdl'.
libtoolize: copying file `libltdl/COPYING.LIB'
libtoolize: copying file `libltdl/README'
libtoolize: copying file `libltdl/argz_.h'
libtoolize: copying file `libltdl/argz.c'
libtoolize: copying file `libltdl/loaders/dld_link.c'
libtoolize: copying file `libltdl/loaders/dlopen.c'
libtoolize: copying file `libltdl/loaders/dyld.c'
libtoolize: copying file `libltdl/loaders/load_add_on.c'
libtoolize: copying file `libltdl/loaders/loadlibrary.c'
libtoolize: copying file `libltdl/loaders/shl_load.c'
libtoolize: copying file `libltdl/lt__dirent.c'
libtoolize: copying file `libltdl/lt__strl.c'
libtoolize: copying file `libltdl/libltdl/lt__alloc.h'
libtoolize: copying file `libltdl/libltdl/lt__dirent.h'
libtoolize: copying file `libltdl/libltdl/lt__glibc.h'
libtoolize: copying file `libltdl/libltdl/lt__private.h'
libtoolize: copying file `libltdl/libltdl/lt__strl.h'
libtoolize: copying file `libltdl/libltdl/lt_dlloader.h'
libtoolize: copying file `libltdl/libltdl/lt_error.h'
libtoolize: copying file `libltdl/libltdl/lt_system.h'
libtoolize: copying file `libltdl/libltdl/slist.h'
libtoolize: copying file `libltdl/loaders/preopen.c'
libtoolize: copying file `libltdl/lt__alloc.c'
libtoolize: copying file `libltdl/lt_dlloader.c'
libtoolize: copying file `libltdl/lt_error.c'
libtoolize: copying file `libltdl/ltdl.c'
libtoolize: copying file `libltdl/ltdl.h'
libtoolize: copying file `libltdl/slist.c'
libtoolize: creating file `libltdl/Makefile.inc'
configure.ac:146: installing `build-aux/compile'
configure.ac:4: installing `build-aux/config.guess'
configure.ac:4: installing `build-aux/config.sub'
configure.ac:7: installing `build-aux/install-sh'
configure.ac:7: installing `build-aux/missing'
lib/Makefile.am: installing `build-aux/depcomp'

$ ./configure
checking build system type... x86_64-unknown-linux-gnu
checking host system type... x86_64-unknown-linux-gnu
checking for a BSD-compatible install... /usr/bin/install -c
checking whether build environment is sane... yes
checking for a thread-safe mkdir -p... /bin/mkdir -p
checking for gawk... no
checking for mawk... mawk
checking whether make sets $(MAKE)... yes
checking how to create a pax tar archive... gnutar
checking for style of include used by make... GNU
checking for gcc... gcc
checking whether the C compiler works... yes
checking for C compiler default output file name... a.out
checking for suffix of executables...
checking whether we are cross compiling... no
checking for suffix of object files... o
checking whether we are using the GNU C compiler... yes
checking whether gcc accepts -g... yes
checking for gcc option to accept ISO C89... none needed
checking dependency style of gcc... gcc3
checking for a sed that does not truncate output... /bin/sed
checking for grep that handles long lines and -e... /bin/grep
checking for egrep... /bin/grep -E
checking for fgrep... /bin/grep -F
checking for ld used by gcc... /usr/bin/ld
checking if the linker (/usr/bin/ld) is GNU ld... yes
checking for BSD- or MS-compatible name lister (nm)... /usr/bin/nm -B
checking the name lister (/usr/bin/nm -B) interface... BSD nm
checking whether ln -s works... yes
checking the maximum length of command line arguments... 1572864
checking whether the shell understands some XSI constructs... yes
checking whether the shell understands "+=3D"... yes
checking for /usr/bin/ld option to reload object files... -r
checking for objdump... objdump
checking how to recognize dependent libraries... pass_all
checking for ar... ar
checking for strip... strip
checking for ranlib... ranlib
checking command to parse /usr/bin/nm -B output from gcc object... ok
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
checking for dlfcn.h... yes
checking for objdir... .libs
checking if gcc supports -fno-rtti -fno-exceptions... no
checking for gcc option to produce PIC... -fPIC -DPIC
checking if gcc PIC flag -fPIC -DPIC works... yes
checking if gcc static flag -static works... yes
checking if gcc supports -c -o file.o... yes
checking if gcc supports -c -o file.o... (cached) yes
checking whether the gcc linker (/usr/bin/ld -m elf_x86_64) supports
shared libraries... yes
checking whether -lc should be explicitly linked in... no
checking dynamic linker characteristics... GNU/Linux ld.so
checking how to hardcode library paths into programs... immediate
checking for shl_load... no
checking for shl_load in -ldld... no
checking for dlopen... no
checking for dlopen in -ldl... yes
checking whether a program can dlopen itself... yes
checking whether a statically linked program can dlopen itself... no
checking whether stripping libraries is possible... yes
checking if libtool supports shared libraries... yes
checking whether to build shared libraries... yes
checking whether to build static libraries... yes
checking which extension is used for runtime loadable modules... .so
checking which variable specifies run-time module search path...
LD_LIBRARY_PATH
checking for the default library search path... /lib /usr/lib
/usr/local/lib /lib/x86_64-linux-gnu /usr/lib/x86_64-linux-gnu
/usr/lib /usr/local/lib
checking for library containing dlopen... -ldl
checking for dlerror... yes
checking for shl_load... (cached) no
checking for shl_load in -ldld... (cached) no
checking for dld_link in -ldld... no
checking for _ prefix in compiled symbols... no
checking whether deplibs are loaded by dlopen... yes
checking for argz.h... yes
checking for error_t... yes
checking for argz_add... yes
checking for argz_append... yes
checking for argz_count... yes
checking for argz_create_sep... yes
checking for argz_insert... yes
checking for argz_next... yes
checking for argz_stringify... yes
checking if argz actually works... yes
checking whether libtool supports -dlopen/-dlpreopen... yes
checking for ltdl.h... yes
checking whether lt_dlinterface_register is declared... yes
checking for lt_dladvise_preload in -lltdl... yes
checking where to find libltdl headers...
checking where to find libltdl library... -lltdl
checking for unistd.h... (cached) yes
checking for dl.h... no
checking for sys/dl.h... no
checking for dld.h... no
checking for mach-o/dyld.h... no
checking for dirent.h... yes
checking for closedir... yes
checking for opendir... yes
checking for readdir... yes
checking for strlcat... no
checking for strlcpy... no
checking for grep that handles long lines and -e... (cached) /bin/grep
checking for gawk... (cached) mawk
checking for gcc... (cached) gcc
checking whether we are using the GNU C compiler... (cached) yes
checking whether gcc accepts -g... (cached) yes
checking for gcc option to accept ISO C89... (cached) none needed
checking dependency style of gcc... (cached) gcc3
checking whether gcc and cc understand -c and -o together... yes
checking whether ln -s works... yes
checking for pkg-config... /usr/bin/pkg-config
checking pkg-config is at least version 0.9.0... yes
checking for libmnl... yes
checking whether NLA_F_NESTED is declared... yes
checking whether NLA_F_NET_BYTEORDER is declared... yes
checking whether NLA_TYPE_MASK is declared... yes
checking for union nf_inet_addr... yes
checking for gethostbyname2... yes
checking kernel source for struct xt_action_param... yes
checking kernel source for vzalloc... yes
checking kernel source for ether_addr_equal... yes
checking kernel source for nla_put_be64... yes
checking kernel source for portid in nl_info... yes
checking kernel source for netlink_dump_start args... 4 args
checking kernel source for ns_capable... yes
checking kernel source for nfnl_lock per subsys... no
checking kernel source for export.h... yes
checking kernel source for ipv6_skip_exthdr args... 4 args
checking kernel source for bool checkentry function prototype... no
checking kernel source for old struct xt_target_param... no
checking kernel source for id in struct pernet_operations... yes
checking kernel source for struct net_generic... yes
configure: creating ./config.status
config.status: creating Makefile
config.status: creating include/libipset/Makefile
config.status: creating lib/Makefile
config.status: creating lib/libipset.pc
config.status: creating src/Makefile
config.status: creating
kernel/include/linux/netfilter/ipset/ip_set_compat.h
config.status: creating config.h
config.status: executing depfiles commands
config.status: executing libtool commands

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

$ make
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
make[2]: Nothing to be done for `all-am'.
make[2]: Leaving directory `/usr/src/ipset'
make[1]: Leaving directory `/usr/src/ipset'

$ make modules
make -C /lib/modules/`uname -r`/build M=3D$PWD/kernel/net V=3D \
			KCFLAGS=3D"-DPACKAGE_VERSION=3D6.20" \
			IP_SET_MAX=3D256 KDIR=3D$PWD/kernel modules
make[1]: Entering directory `/usr/src/linux-3.8.7'
  CC [M]  /usr/src/ipset/kernel/net/netfilter/xt_set.o
In file included from /usr/src/linux-3.8.7/include/linux/kconfig.h:4,
                 from <command-line>:0:
include/generated/autoconf.h:1103:1: warning: "CONFIG_IP_SET_MAX"
redefined
<command-line>: warning: this is the location of the previous definitio=
n
  CC [M]  /usr/src/ipset/kernel/net/netfilter/ipset/ip_set_core.o
In file included from /usr/src/linux-3.8.7/include/linux/kconfig.h:4,
                 from <command-line>:0:
include/generated/autoconf.h:1103:1: warning: "CONFIG_IP_SET_MAX"
redefined
<command-line>: warning: this is the location of the previous definitio=
n
In file included from /usr/src/linux-3.8.7/include/linux/kconfig.h:4,
                 from <command-line>:0:
include/generated/autoconf.h:1103:1: warning: "CONFIG_IP_SET_MAX"
redefined
<command-line>: warning: this is the location of the previous definitio=
n
  CC [M]  /usr/src/ipset/kernel/net/netfilter/ipset/ip_set_getport.o
In file included from /usr/src/linux-3.8.7/include/linux/kconfig.h:4,
                 from <command-line>:0:
include/generated/autoconf.h:1103:1: warning: "CONFIG_IP_SET_MAX"
redefined
<command-line>: warning: this is the location of the previous definitio=
n
In file included from /usr/src/linux-3.8.7/include/linux/kconfig.h:4,
                 from <command-line>:0:
include/generated/autoconf.h:1103:1: warning: "CONFIG_IP_SET_MAX"
redefined
<command-line>: warning: this is the location of the previous definitio=
n
  CC [M]  /usr/src/ipset/kernel/net/netfilter/ipset/pfxlen.o
In file included from /usr/src/linux-3.8.7/include/linux/kconfig.h:4,
                 from <command-line>:0:
include/generated/autoconf.h:1103:1: warning: "CONFIG_IP_SET_MAX"
redefined
<command-line>: warning: this is the location of the previous definitio=
n
In file included from /usr/src/linux-3.8.7/include/linux/kconfig.h:4,
                 from <command-line>:0:
include/generated/autoconf.h:1103:1: warning: "CONFIG_IP_SET_MAX"
redefined
<command-line>: warning: this is the location of the previous definitio=
n
  LD [M]  /usr/src/ipset/kernel/net/netfilter/ipset/ip_set.o
  CC [M]  /usr/src/ipset/kernel/net/netfilter/ipset/ip_set_bitmap_ip.o
In file included from /usr/src/linux-3.8.7/include/linux/kconfig.h:4,
                 from <command-line>:0:
include/generated/autoconf.h:1103:1: warning: "CONFIG_IP_SET_MAX"
redefined
<command-line>: warning: this is the location of the previous definitio=
n
  CC [M]  /usr/src/ipset/kernel/net/netfilter/ipset/ip_set_bitmap_ipmac=
=2Eo
In file included from /usr/src/linux-3.8.7/include/linux/kconfig.h:4,
                 from <command-line>:0:
include/generated/autoconf.h:1103:1: warning: "CONFIG_IP_SET_MAX"
redefined
<command-line>: warning: this is the location of the previous definitio=
n
  CC [M]  /usr/src/ipset/kernel/net/netfilter/ipset/ip_set_bitmap_port.=
o
In file included from /usr/src/linux-3.8.7/include/linux/kconfig.h:4,
                 from <command-line>:0:
include/generated/autoconf.h:1103:1: warning: "CONFIG_IP_SET_MAX"
redefined
<command-line>: warning: this is the location of the previous definitio=
n
  CC [M]  /usr/src/ipset/kernel/net/netfilter/ipset/ip_set_hash_ip.o
In file included from /usr/src/linux-3.8.7/include/linux/kconfig.h:4,
                 from <command-line>:0:
include/generated/autoconf.h:1103:1: warning: "CONFIG_IP_SET_MAX"
redefined
<command-line>: warning: this is the location of the previous definitio=
n
  CC [M]  /usr/src/ipset/kernel/net/netfilter/ipset/ip_set_hash_ipport.=
o
In file included from /usr/src/linux-3.8.7/include/linux/kconfig.h:4,
                 from <command-line>:0:
include/generated/autoconf.h:1103:1: warning: "CONFIG_IP_SET_MAX"
redefined
<command-line>: warning: this is the location of the previous definitio=
n
  CC [M]  /usr/src/ipset/kernel/net/netfilter/ipset/ip_set_hash_ipporti=
p.o
In file included from /usr/src/linux-3.8.7/include/linux/kconfig.h:4,
                 from <command-line>:0:
include/generated/autoconf.h:1103:1: warning: "CONFIG_IP_SET_MAX"
redefined
<command-line>: warning: this is the location of the previous definitio=
n
  CC [M]
/usr/src/ipset/kernel/net/netfilter/ipset/ip_set_hash_ipportnet.o
In file included from /usr/src/linux-3.8.7/include/linux/kconfig.h:4,
                 from <command-line>:0:
include/generated/autoconf.h:1103:1: warning: "CONFIG_IP_SET_MAX"
redefined
<command-line>: warning: this is the location of the previous definitio=
n
  CC [M]  /usr/src/ipset/kernel/net/netfilter/ipset/ip_set_hash_net.o
In file included from /usr/src/linux-3.8.7/include/linux/kconfig.h:4,
                 from <command-line>:0:
include/generated/autoconf.h:1103:1: warning: "CONFIG_IP_SET_MAX"
redefined
<command-line>: warning: this is the location of the previous definitio=
n
  CC [M]  /usr/src/ipset/kernel/net/netfilter/ipset/ip_set_hash_netport=
=2Eo
In file included from /usr/src/linux-3.8.7/include/linux/kconfig.h:4,
                 from <command-line>:0:
include/generated/autoconf.h:1103:1: warning: "CONFIG_IP_SET_MAX"
redefined
<command-line>: warning: this is the location of the previous definitio=
n
  CC [M]  /usr/src/ipset/kernel/net/netfilter/ipset/ip_set_hash_netifac=
e.o
In file included from /usr/src/linux-3.8.7/include/linux/kconfig.h:4,
                 from <command-line>:0:
include/generated/autoconf.h:1103:1: warning: "CONFIG_IP_SET_MAX"
redefined
<command-line>: warning: this is the location of the previous definitio=
n
  CC [M]  /usr/src/ipset/kernel/net/netfilter/ipset/ip_set_hash_netnet.=
o
In file included from /usr/src/linux-3.8.7/include/linux/kconfig.h:4,
                 from <command-line>:0:
include/generated/autoconf.h:1103:1: warning: "CONFIG_IP_SET_MAX"
redefined
<command-line>: warning: this is the location of the previous definitio=
n
/usr/src/ipset/kernel/net/netfilter/ipset/ip_set_hash_netnet.c: In
function =91hash_netnet4_kadt=92:
/usr/src/ipset/kernel/net/netfilter/ipset/ip_set_hash_netnet.c:141:
error: unknown field =91cidr=92 specified in initializer
/usr/src/ipset/kernel/net/netfilter/ipset/ip_set_hash_netnet.c:141:
warning: missing braces around initializer
/usr/src/ipset/kernel/net/netfilter/ipset/ip_set_hash_netnet.c:141:
warning: (near initialization for =91e.<anonymous>=92)
/usr/src/ipset/kernel/net/netfilter/ipset/ip_set_hash_netnet.c:142:
error: unknown field =91cidr=92 specified in initializer
/usr/src/ipset/kernel/net/netfilter/ipset/ip_set_hash_netnet.c: In
function =91hash_netnet4_uadt=92:
/usr/src/ipset/kernel/net/netfilter/ipset/ip_set_hash_netnet.c:163:
error: unknown field =91cidr=92 specified in initializer
/usr/src/ipset/kernel/net/netfilter/ipset/ip_set_hash_netnet.c:163:
warning: missing braces around initializer
/usr/src/ipset/kernel/net/netfilter/ipset/ip_set_hash_netnet.c:163:
warning: (near initialization for =91e.<anonymous>=92)
/usr/src/ipset/kernel/net/netfilter/ipset/ip_set_hash_netnet.c:164:
error: unknown field =91cidr=92 specified in initializer
/usr/src/ipset/kernel/net/netfilter/ipset/ip_set_hash_netnet.c: In
function =91hash_netnet6_kadt=92:
/usr/src/ipset/kernel/net/netfilter/ipset/ip_set_hash_netnet.c:368:
error: unknown field =91cidr=92 specified in initializer
/usr/src/ipset/kernel/net/netfilter/ipset/ip_set_hash_netnet.c:368:
warning: missing braces around initializer
/usr/src/ipset/kernel/net/netfilter/ipset/ip_set_hash_netnet.c:368:
warning: (near initialization for =91e.ip=92)
/usr/src/ipset/kernel/net/netfilter/ipset/ip_set_hash_netnet.c:369:
error: unknown field =91cidr=92 specified in initializer
/usr/src/ipset/kernel/net/netfilter/ipset/ip_set_hash_netnet.c: In
function =91hash_netnet6_uadt=92:
/usr/src/ipset/kernel/net/netfilter/ipset/ip_set_hash_netnet.c:389:
error: unknown field =91cidr=92 specified in initializer
/usr/src/ipset/kernel/net/netfilter/ipset/ip_set_hash_netnet.c:389:
warning: missing braces around initializer
/usr/src/ipset/kernel/net/netfilter/ipset/ip_set_hash_netnet.c:389:
warning: (near initialization for =91e.ip=92)
/usr/src/ipset/kernel/net/netfilter/ipset/ip_set_hash_netnet.c:390:
error: unknown field =91cidr=92 specified in initializer
make[4]: ***
[/usr/src/ipset/kernel/net/netfilter/ipset/ip_set_hash_netnet.o] Error =
1
make[3]: *** [/usr/src/ipset/kernel/net/netfilter/ipset] Error 2
make[2]: *** [/usr/src/ipset/kernel/net/netfilter] Error 2
make[1]: *** [_module_/usr/src/ipset/kernel/net] Error 2
make[1]: Leaving directory `/usr/src/linux-3.8.7'
make: *** [modules] Error 2



On 08-10-2013 11:33, Jozsef Kadlecsik wrote:
> On Tue, 8 Oct 2013, Jozsef Kadlecsik wrote:
>=20
>> On Tue, 8 Oct 2013, Husnu Demir wrote:
>>=20
>>> /usr/src/ipset/kernel/net/netfilter/ipset/ip_set_hash_netnet.c:
>>> In function ?hash_netnet4_kadt?:=20
>>> /usr/src/ipset/kernel/net/netfilter/ipset/ip_set_hash_netnet.c:141:
>>>
>>>=20
error: unknown field ?cidr? specified in initializer
>>=20
>> However this looks like a broken git tree at our side. Are you
>> sure it's a fully syncronized/cloned git tree?
>=20
> I meant "at your side" - I checked both with recent kernel trees
> and 2.6.32.60. I haven't checked 3.8.7, but the part above is
> independent of kernel versions.
>=20
> Best regards, Jozsef - E-mail  : kadlec@blackhole.kfki.hu,
> kadlecsik.jozsef@wigner.mta.hu PGP key :
> http://www.kfki.hu/~kadlec/pgp_public_key.txt Address : Wigner
> Research Centre for Physics, Hungarian Academy of Sciences H-1525
> Budapest 114, POB. 49, Hungary -- To unsubscribe from this list:
> send the line "unsubscribe netfilter" in the body of a message to
> majordomo@vger.kernel.org More majordomo info at
> http://vger.kernel.org/majordomo-info.html
>=20
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBAgAGBQJSU+hdAAoJEISpBAM51qlEEeEIAKJ/AXSru5efd394FL3DAJ5l
rHskZICsVCNjznLVahT03ZPIbJp5H3R75gw9gwic2JBZxVXvmGghhnfbReLtlIPO
e+Qxx+jI7Kk/vVEp6q28mzIY0aulvy5ghEYyTMuGVYphRzM8K8pdxJpJafz286Lt
Sm79yS3y5SdRR1LdyqtHuQCWpS9RXTVftIJuB0h/VUXH6Rh7pCLwYxGAPgaCUjlL
011o/DTdE+kHL+7s5+h0GvZbB+9v/hGb+AOidjMLC8jzEIOwPL+z/1/rtZ3kVxV+
0MB2Mil3Ii40RfReOFo4cXq1q0hwfTXVmaWAdvgf1O240C8eIEKxtU+PP87xeoo=3D
=3DFnAR
-----END PGP SIGNATURE-----
