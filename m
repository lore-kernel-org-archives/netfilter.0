From: cookie <cookie@iacookie.net>
Subject: Odd Behavior patch-o-matic-ng-20060403  and 2.6.17-rc1
Date: Tue, 4 Apr 2006 13:50:52 -0400
Message-ID: <E502F5D7-E291-45DA-801F-C2C0E9DF916A@iacookie.net>
Mime-Version: 1.0 (Apple Message framework v746.3)
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
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; delsp="yes"; format="flowed"
To: netfilter@lists.netfilter.org

Hello-
   After trying out 2.6.17-rc1 patched with patch-o-matic-ng-20060403
ipp2p TARPIT u32 ipv4options fuzzy
   I find that when I try and use any of the above I get an error:
iptables: Unknown error 4294967295
   The kernel log offers me this as additional info:
Apr  4 13:47:51 localhost kernel: ip_tables: fuzzy match: invalid  
size 0 != 32
Apr  4 13:47:51 localhost kernel: ip_tables: ipv4options match:  
invalid size 0 != 4
Apr  4 13:47:52 localhost kernel: ip_tables: u32 match: invalid size  
0 != 2028
Apr  4 13:47:52 localhost kernel: ip_tables: ipp2p match: invalid  
size 0 != 8
Tarpit seems to work fine though.

Below is a copy of the compile if it helps.

Thanks
Brian

   gcc -m32 -Wp,-MD,net/ipv4/netfilter/.ipt_ipp2p.o.d  -nostdinc - 
isystem /usr/lib/gcc/i386-redhat-linux/4.0.2/include -D__KERNEL__ - 
Iinclude  -include include/linux/autoconf.h -Wall -Wundef -Wstrict- 
prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -O2 -fomit- 
frame-pointer -pipe -msoft-float -mpreferred-stack-boundary=2  - 
march=i686 -mtune=pentium3 -ffreestanding -Iinclude/asm-i386/mach- 
default -Wdeclaration-after-statement -Wno-pointer-sign   -DMODULE - 
D"KBUILD_STR(s)=#s" -D"KBUILD_BASENAME=KBUILD_STR(ipt_ipp2p)"  - 
D"KBUILD_MODNAME=KBUILD_STR(ipt_ipp2p)" -c -o net/ipv4/netfilter/ 
ipt_ipp2p.o net/ipv4/netfilter/ipt_ipp2p.c
net/ipv4/netfilter/ipt_ipp2p.c:841: warning: initialization from  
incompatible pointer type
net/ipv4/netfilter/ipt_ipp2p.c:842: warning: initialization from  
incompatible pointer type
   gcc -m32 -Wp,-MD,net/ipv4/netfilter/.ipt_fuzzy.o.d  -nostdinc - 
isystem /usr/lib/gcc/i386-redhat-linux/4.0.2/include -D__KERNEL__ - 
Iinclude  -include include/linux/autoconf.h -Wall -Wundef -Wstrict- 
prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -O2 -fomit- 
frame-pointer -pipe -msoft-float -mpreferred-stack-boundary=2  - 
march=i686 -mtune=pentium3 -ffreestanding -Iinclude/asm-i386/mach- 
default -Wdeclaration-after-statement -Wno-pointer-sign   -DMODULE - 
D"KBUILD_STR(s)=#s" -D"KBUILD_BASENAME=KBUILD_STR(ipt_fuzzy)"  - 
D"KBUILD_MODNAME=KBUILD_STR(ipt_fuzzy)" -c -o net/ipv4/netfilter/ 
ipt_fuzzy.o net/ipv4/netfilter/ipt_fuzzy.c
net/ipv4/netfilter/ipt_fuzzy.c:169: warning: initialization from  
incompatible pointer type
net/ipv4/netfilter/ipt_fuzzy.c:170: warning: initialization from  
incompatible pointer type
   gcc -m32 -Wp,-MD,net/ipv4/netfilter/.ipt_u32.o.d  -nostdinc - 
isystem /usr/lib/gcc/i386-redhat-linux/4.0.2/include -D__KERNEL__ - 
Iinclude  -include include/linux/autoconf.h -Wall -Wundef -Wstrict- 
prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -O2 -fomit- 
frame-pointer -pipe -msoft-float -mpreferred-stack-boundary=2  - 
march=i686 -mtune=pentium3 -ffreestanding -Iinclude/asm-i386/mach- 
default -Wdeclaration-after-statement -Wno-pointer-sign   -DMODULE - 
D"KBUILD_STR(s)=#s" -D"KBUILD_BASENAME=KBUILD_STR(ipt_u32)"  - 
D"KBUILD_MODNAME=KBUILD_STR(ipt_u32)" -c -o net/ipv4/netfilter/ 
ipt_u32.o net/ipv4/netfilter/ipt_u32.c
net/ipv4/netfilter/ipt_u32.c:217: warning: initialization from  
incompatible pointer type
net/ipv4/netfilter/ipt_u32.c:218: warning: initialization from  
incompatible pointer type
   gcc -m32 -Wp,-MD,net/ipv4/netfilter/.ipt_ipv4options.o.d  - 
nostdinc -isystem /usr/lib/gcc/i386-redhat-linux/4.0.2/include - 
D__KERNEL__ -Iinclude  -include include/linux/autoconf.h -Wall - 
Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno- 
common -O2 -fomit-frame-pointer -pipe -msoft-float -mpreferred-stack- 
boundary=2  -march=i686 -mtune=pentium3 -ffreestanding -Iinclude/asm- 
i386/mach-default -Wdeclaration-after-statement -Wno-pointer-sign   - 
DMODULE -D"KBUILD_STR(s)=#s" -D"KBUILD_BASENAME=KBUILD_STR 
(ipt_ipv4options)"  -D"KBUILD_MODNAME=KBUILD_STR(ipt_ipv4options)" -c  
-o net/ipv4/netfilter/ipt_ipv4options.o net/ipv4/netfilter/ 
ipt_ipv4options.c
net/ipv4/netfilter/ipt_ipv4options.c:157: warning: initialization  
from incompatible pointer type

   gcc -m32 -Wp,-MD,net/ipv4/netfilter/.ipt_TARPIT.mod.o.d  -nostdinc  
-isystem /usr/lib/gcc/i386-redhat-linux/4.0.2/include -D__KERNEL__ - 
Iinclude  -include include/linux/autoconf.h -Wall -Wundef -Wstrict- 
prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -O2 -fomit- 
frame-pointer -pipe -msoft-float -mpreferred-stack-boundary=2  - 
march=i686 -mtune=pentium3 -ffreestanding -Iinclude/asm-i386/mach- 
default -Wdeclaration-after-statement -Wno-pointer-sign    - 
D"KBUILD_STR(s)=#s" -D"KBUILD_BASENAME=KBUILD_STR(ipt_TARPIT)"  - 
D"KBUILD_MODNAME=KBUILD_STR(ipt_TARPIT)" -DMODULE -c -o net/ipv4/ 
netfilter/ipt_TARPIT.mod.o net/ipv4/netfilter/ipt_TARPIT.mod.c
   ld -m elf_i386 -m elf_i386 -r -o net/ipv4/netfilter/ipt_TARPIT.ko  
net/ipv4/netfilter/ipt_TARPIT.o net/ipv4/netfilter/ipt_TARPIT.mod.o
   gcc -m32 -Wp,-MD,net/ipv4/netfilter/.ipt_fuzzy.mod.o.d  -nostdinc - 
isystem /usr/lib/gcc/i386-redhat-linux/4.0.2/include -D__KERNEL__ - 
Iinclude  -include include/linux/autoconf.h -Wall -Wundef -Wstrict- 
prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -O2 -fomit- 
frame-pointer -pipe -msoft-float -mpreferred-stack-boundary=2  - 
march=i686 -mtune=pentium3 -ffreestanding -Iinclude/asm-i386/mach- 
default -Wdeclaration-after-statement -Wno-pointer-sign    - 
D"KBUILD_STR(s)=#s" -D"KBUILD_BASENAME=KBUILD_STR(ipt_fuzzy)"  - 
D"KBUILD_MODNAME=KBUILD_STR(ipt_fuzzy)" -DMODULE -c -o net/ipv4/ 
netfilter/ipt_fuzzy.mod.o net/ipv4/netfilter/ipt_fuzzy.mod.c
   ld -m elf_i386 -m elf_i386 -r -o net/ipv4/netfilter/ipt_fuzzy.ko  
net/ipv4/netfilter/ipt_fuzzy.o net/ipv4/netfilter/ipt_fuzzy.mod.o
   gcc -m32 -Wp,-MD,net/ipv4/netfilter/.ipt_ipp2p.mod.o.d  -nostdinc - 
isystem /usr/lib/gcc/i386-redhat-linux/4.0.2/include -D__KERNEL__ - 
Iinclude  -include include/linux/autoconf.h -Wall -Wundef -Wstrict- 
prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -O2 -fomit- 
frame-pointer -pipe -msoft-float -mpreferred-stack-boundary=2  - 
march=i686 -mtune=pentium3 -ffreestanding -Iinclude/asm-i386/mach- 
default -Wdeclaration-after-statement -Wno-pointer-sign    - 
D"KBUILD_STR(s)=#s" -D"KBUILD_BASENAME=KBUILD_STR(ipt_ipp2p)"  - 
D"KBUILD_MODNAME=KBUILD_STR(ipt_ipp2p)" -DMODULE -c -o net/ipv4/ 
netfilter/ipt_ipp2p.mod.o net/ipv4/netfilter/ipt_ipp2p.mod.c
   ld -m elf_i386 -m elf_i386 -r -o net/ipv4/netfilter/ipt_ipp2p.ko  
net/ipv4/netfilter/ipt_ipp2p.o net/ipv4/netfilter/ipt_ipp2p.mod.o
   gcc -m32 -Wp,-MD,net/ipv4/netfilter/.ipt_ipv4options.mod.o.d  - 
nostdinc -isystem /usr/lib/gcc/i386-redhat-linux/4.0.2/include - 
D__KERNEL__ -Iinclude  -include include/linux/autoconf.h -Wall - 
Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno- 
common -O2 -fomit-frame-pointer -pipe -msoft-float -mpreferred-stack- 
boundary=2  -march=i686 -mtune=pentium3 -ffreestanding -Iinclude/asm- 
i386/mach-default -Wdeclaration-after-statement -Wno-pointer-sign    - 
D"KBUILD_STR(s)=#s" -D"KBUILD_BASENAME=KBUILD_STR(ipt_ipv4options)"  - 
D"KBUILD_MODNAME=KBUILD_STR(ipt_ipv4options)" -DMODULE -c -o net/ipv4/ 
netfilter/ipt_ipv4options.mod.o net/ipv4/netfilter/ipt_ipv4options.mod.c
   ld -m elf_i386 -m elf_i386 -r -o net/ipv4/netfilter/ 
ipt_ipv4options.ko net/ipv4/netfilter/ipt_ipv4options.o net/ipv4/ 
netfilter/ipt_ipv4options.mod.o
   gcc -m32 -Wp,-MD,net/ipv4/netfilter/.ipt_u32.mod.o.d  -nostdinc - 
isystem /usr/lib/gcc/i386-redhat-linux/4.0.2/include -D__KERNEL__ - 
Iinclude  -include include/linux/autoconf.h -Wall -Wundef -Wstrict- 
prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -O2 -fomit- 
frame-pointer -pipe -msoft-float -mpreferred-stack-boundary=2  - 
march=i686 -mtune=pentium3 -ffreestanding -Iinclude/asm-i386/mach- 
default -Wdeclaration-after-statement -Wno-pointer-sign    - 
D"KBUILD_STR(s)=#s" -D"KBUILD_BASENAME=KBUILD_STR(ipt_u32)"  - 
D"KBUILD_MODNAME=KBUILD_STR(ipt_u32)" -DMODULE -c -o net/ipv4/ 
netfilter/ipt_u32.mod.o net/ipv4/netfilter/ipt_u32.mod.c
   ld -m elf_i386 -m elf_i386 -r -o net/ipv4/netfilter/ipt_u32.ko net/ 
ipv4/netfilter/ipt_u32.o net/ipv4/netfilter/ipt_u32.mod.o

