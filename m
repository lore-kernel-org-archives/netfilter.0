From: Joel <zealous@bonbon.net>
Subject: Error Patho-o-matic modules
Date: Sat, 13 Dec 2003 14:30:29 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3FDAD52D.5090206@bonbon.net>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Dear all,

I want to install time modules from path-o-matic. I did all the things. 
Now time experimental modules is patched in the kernel. I have selected 
it as module (M). but when I am giving the command # make modules then 
it is giving me error.
below is the error:---
has any one solved this type of problem.

any help will be greatly appreciated.
Thanks

root@joel linux-2.4]# make modules
make -r -f tmp_include_depends all
make[1]: Entering directory `/usr/src/linux-2.4.20-8'
make[1]: Circular /usr/src/linux-2.4.20-8/include/asm/smplock.h <- 
/usr/src/linux-2.4.20-8/include/linux/interrupt.h dependency dropped.
make[1]: Circular 
/usr/src/linux-2.4.20-8/include/linux/netfilter_ipv4/ip_conntrack.h <- 
/usr/src/linux-2.4.20-8/include/linux/netfilter_ipv4/ip_conntrack_helper.h 
dependency dropped.
make[1]: Nothing to be done for `all'.
make[1]: Leaving directory `/usr/src/linux-2.4.20-8'
make -C  kernel CFLAGS="-D__KERNEL__ -I/usr/src/linux-2.4.20-8/include 
-Wall -Wstrict-prototypes -Wno-trigraphs -O2 -fno-strict-aliasing 
-fno-common -fomit-frame-pointer -pipe -mpreferred-stack-boundary=2 
-march=i386 -DMODULE -DMODVERSIONS -include 
/usr/src/linux-2.4.20-8/include/linux/modversions.h" MAKING_MODULES=1 
modules
make[1]: Entering directory `/usr/src/linux-2.4.20-8/kernel'
make[1]: Nothing to be done for `modules'.
make[1]: Leaving directory `/usr/src/linux-2.4.20-8/kernel'
make -C  drivers CFLAGS="-D__KERNEL__ -I/usr/src/linux-2.4.20-8/include 
-Wall -Wstrict-prototypes -Wno-trigraphs -O2 -fno-strict-aliasing 
-fno-common -fomit-frame-pointer -pipe -mpreferred-stack-boundary=2 
-march=i386 -DMODULE -DMODVERSIONS -include 
/usr/src/linux-2.4.20-8/include/linux/modversions.h" MAKING_MODULES=1 
modules
make[1]: Entering directory `/usr/src/linux-2.4.20-8/drivers'
make -C addon modules
make[2]: Entering directory `/usr/src/linux-2.4.20-8/drivers/addon'
make[2]: Nothing to be done for `modules'.
make[2]: Leaving directory `/usr/src/linux-2.4.20-8/drivers/addon'
make -C atm modules
make[2]: Entering directory `/usr/src/linux-2.4.20-8/drivers/atm'
make[2]: Nothing to be done for `modules'.
make[2]: Leaving directory `/usr/src/linux-2.4.20-8/drivers/atm'
make -C block modules
make[2]: Entering directory `/usr/src/linux-2.4.20-8/drivers/block'
gcc -D__KERNEL__ -I/usr/src/linux-2.4.20-8/include -Wall 
-Wstrict-prototypes -Wno-trigraphs -O2 -fno-strict-aliasing -fno-common 
-fomit-frame-pointer -pipe -mpreferred-stack-boundary=2 -march=i386 
-DMODULE -DMODVERSIONS -include 
/usr/src/linux-2.4.20-8/include/linux/modversions.h  -nostdinc 
-iwithprefix include -DKBUILD_BASENAME=loop  -DEXPORT_SYMTAB -c loop.c
In file included from /usr/src/linux-2.4.20-8/include/linux/prefetch.h:13,
                 from /usr/src/linux-2.4.20-8/include/linux/list.h:6,
                 from /usr/src/linux-2.4.20-8/include/linux/module.h:12,
                 from loop.c:62:
/usr/src/linux-2.4.20-8/include/asm/processor.h:60: warning: parameter 
names (without types) in function declaration
/usr/src/linux-2.4.20-8/include/asm/processor.h:60: field 
`loops_per_jiffy_R_ver_str' declared as a function
/usr/src/linux-2.4.20-8/include/asm/processor.h:82: invalid suffix on 
integer constant
/usr/src/linux-2.4.20-8/include/asm/processor.h:82: parse error before 
numeric constant
/usr/src/linux-2.4.20-8/include/asm/processor.h:82: warning: function 
declaration isn't a prototype
/usr/src/linux-2.4.20-8/include/asm/processor.h:265: invalid suffix on 
integer constant
/usr/src/linux-2.4.20-8/include/asm/processor.h:265: parse error before 
numeric constant
/usr/src/linux-2.4.20-8/include/asm/processor.h:265: warning: function 
declaration isn't a prototype
/usr/src/linux-2.4.20-8/include/asm/processor.h:269: warning: parameter 
names (without types) in function declaration
In file included from loop.c:62:
/usr/src/linux-2.4.20-8/include/linux/module.h:183: invalid suffix on 
integer constant
/usr/src/linux-2.4.20-8/include/linux/module.h:183: parse error before 
numeric constant
/usr/src/linux-2.4.20-8/include/linux/module.h:183: 
`inter_module_register_R_ver_str' declared as function returning a function
/usr/src/linux-2.4.20-8/include/linux/module.h:183: warning: function 
declaration isn't a prototype
/usr/src/linux-2.4.20-8/include/linux/module.h:184: invalid suffix on 
integer constant
/usr/src/linux-2.4.20-8/include/linux/module.h:184: parse error before 
numeric constant
/usr/src/linux-2.4.20-8/include/linux/module.h:184: 
`inter_module_unregister_R_ver_str' declared as function returning a 
function
/usr/src/linux-2.4.20-8/include/linux/module.h:184: warning: function 
declaration isn't a prototype
/usr/src/linux-2.4.20-8/include/linux/module.h:185: 
`inter_module_get_R_ver_str' declared as function returning a function
/usr/src/linux-2.4.20-8/include/linux/module.h:185: warning: parameter 
names (without types) in function declaration
/usr/src/linux-2.4.20-8/include/linux/module.h:186: 
`inter_module_get_request_R_ver_str' declared as function returning a 
function
/usr/src/linux-2.4.20-8/include/linux/module.h:186: warning: parameter 
names (without types) in function declaration
/usr/src/linux-2.4.20-8/include/linux/module.h:187: invalid suffix on 
integer constant
/usr/src/linux-2.4.20-8/include/linux/module.h:187: parse error before 
numeric constant
/usr/src/linux-2.4.20-8/include/linux/module.h:187: 
`inter_module_put_R_ver_str' declared as function returning a function
/usr/src/linux-2.4.20-8/include/linux/module.h:187: warning: function 
declaration isn't a prototype
/usr/src/linux-2.4.20-8/include/linux/module.h:196: 
`try_inc_mod_count_R_ver_str' declared as function returning a function
/usr/src/linux-2.4.20-8/include/linux/module.h:196: warning: parameter 
names (without types) in function declaration
In file included from /usr/src/linux-2.4.20-8/include/linux/highmem.h:5,
                 from /usr/src/linux-2.4.20-8/include/linux/vmalloc.h:8,
                 from /usr/src/linux-2.4.20-8/include/asm/io.h:47,
                 from /usr/src/linux-2.4.20-8/include/linux/blkdev.h:11,
                 from /usr/src/linux-2.4.20-8/include/linux/blk.h:4,
                 from loop.c:71:
/usr/src/linux-2.4.20-8/include/asm/pgalloc.h: In function `flush_tlb_page':
/usr/src/linux-2.4.20-8/include/asm/pgalloc.h:93: 
`boot_cpu_data_R0657d037' undeclared (first use in this function)
/usr/src/linux-2.4.20-8/include/asm/pgalloc.h:93: (Each undeclared 
identifier is reported only once
/usr/src/linux-2.4.20-8/include/asm/pgalloc.h:93: for each function it 
appears in.)
In file included from /usr/src/linux-2.4.20-8/include/asm/io.h:47,
                 from /usr/src/linux-2.4.20-8/include/linux/blkdev.h:11,
                 from /usr/src/linux-2.4.20-8/include/linux/blk.h:4,
                 from loop.c:71:
/usr/src/linux-2.4.20-8/include/linux/vmalloc.h: In function `vmalloc':
/usr/src/linux-2.4.20-8/include/linux/vmalloc.h:36: 
`boot_cpu_data_R0657d037' undeclared (first use in this function)
/usr/src/linux-2.4.20-8/include/linux/vmalloc.h: In function `vmalloc_dma':
/usr/src/linux-2.4.20-8/include/linux/vmalloc.h:45: 
`boot_cpu_data_R0657d037' undeclared (first use in this function)
/usr/src/linux-2.4.20-8/include/linux/vmalloc.h: In function `vmalloc_32':
/usr/src/linux-2.4.20-8/include/linux/vmalloc.h:54: 
`boot_cpu_data_R0657d037' undeclared (first use in this function)
In file included from loop.c:79:
/usr/src/linux-2.4.20-8/include/asm/uaccess.h: In function `verify_area':
/usr/src/linux-2.4.20-8/include/asm/uaccess.h:64: 
`boot_cpu_data_R0657d037' undeclared (first use in this function)
/usr/src/linux-2.4.20-8/include/asm/uaccess.h: In function 
`__constant_copy_to_user':
/usr/src/linux-2.4.20-8/include/asm/uaccess.h:550: 
`boot_cpu_data_R0657d037' undeclared (first use in this function)
In file included from loop.c:79:
/usr/src/linux-2.4.20-8/include/asm/uaccess.h: In function 
`__constant_copy_from_user':
/usr/src/linux-2.4.20-8/include/asm/uaccess.h:558: 
`boot_cpu_data_R0657d037' undeclared (first use in this function)
loop.c: In function `loop_change_fd':
loop.c:761: warning: label `out_put_all' defined but not used
loop.c: In function `lo_ioctl':
loop.c:953: `boot_cpu_data_R0657d037' undeclared (first use in this 
function)
make[2]: *** [loop.o] Error 1
make[2]: Leaving directory `/usr/src/linux-2.4.20-8/drivers/block'
make[1]: *** [_modsubdir_block] Error 2
make[1]: Leaving directory `/usr/src/linux-2.4.20-8/drivers'
make: *** [_mod_drivers] Error 2




