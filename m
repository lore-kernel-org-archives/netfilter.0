From: "Jim Ficarra" <jficarra@crosscurrent.com>
Subject: Problems compiling Kernel after patching and upgrading to iptables 1.27a
Date: Wed, 27 Nov 2002 14:23:39 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <NEBBLFJBHAHCEPLBHMDDEEGOBBAB.jficarra@crosscurrent.com>
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

I'm having a heck of a time recompiling the kernel after applying
patch-o-matic and installing the IPTABLES 1.27a patch.  Here are the steps
I'm performing:

1) I have the fresh kernel-source installed from my Redhat 7.3 distro
(kernel version is 2.4.18-3)

2) I apply patch-o-matic 20020825 per included instructions.  I'm using the
following patches: ahesp-static, arptables.patch, config-cleanup.patch,
conntrack+nat-helper-unregister.patch, conntrack.patch, dscp.patch,
CONFIG_IP_NF_TARGET_DSC, ecn.patch, ECN target, helper.patch,
ip_conntrack_protocol_destroy.patch, ip_conntrack_protocol_unregister.patch,
local-nat.patch, nat-export_symbols.patch, nat-memoryleak-fix.patch,
netfilter-arp.patch, pkttype.patch, REJECT-dont_fragment.patch,
REJECT_mark.patch, ulog-module-unload.patch

3) I then run the make and make install commands in the iptables-1.27a
upgrade.

4) I run make xconfig and select my options, creating the .config file

5) I change the EXTRAVERSION parameter in the Makefile from "3custom" to
"3-ipt-1.27a" (no quotes, of course)

6) I run make dep (per the Kernel-HowTo)

7) I run make clean (per the Kernel-HowTo)

8) I run make bzImage (per the Kernel-HowTo)

The compiler runs for some time, then I get the following error output:


{standard input}: Assembler messages:
{standard input}:1059: Warning: indirect lcall without `*'
{standard input}:1143: Warning: indirect lcall without `*'
{standard input}:1229: Warning: indirect lcall without `*'
{standard input}:1303: Warning: indirect lcall without `*'
{standard input}:1314: Warning: indirect lcall without `*'
{standard input}:1325: Warning: indirect lcall without `*'
{standard input}:1400: Warning: indirect lcall without `*'
{standard input}:1411: Warning: indirect lcall without `*'
{standard input}:1422: Warning: indirect lcall without `*'
{standard input}:1896: Warning: indirect lcall without `*'
{standard input}:1991: Warning: indirect lcall without `*'
cc  -D__KERNEL__ -I/usr/src/linux-2.4.18-3/include -Wall -Wstrict-prototypes
 -Wno-trigraphs -O2 -fomit-frame-pointer -fno-strict-aliasing -fno-common -W
no-unused -pipe -mpreferred-stack-boundary=2 -march=i686   -DKBUILD_BASENAME
=pci_irq  -c -o pci-irq.o pci-irq.c
cc  -D__KERNEL__ -I/usr/src/linux-2.4.18-3/include -Wall -Wstrict-prototypes
 -Wno-trigraphs -O2 -fomit-frame-pointer -fno-strict-aliasing -fno-common -W
no-unused -pipe -mpreferred-stack-boundary=2 -march=i686   -DKBUILD_BASENAME
=mtrr  -DEXPORT_SYMTAB -c mtrr.c
cc  -D__KERNEL__ -I/usr/src/linux-2.4.18-3/include -Wall -Wstrict-prototypes
 -Wno-trigraphs -O2 -fomit-frame-pointer -fno-strict-aliasing -fno-common -W
no-unused -pipe -mpreferred-stack-boundary=2 -march=i686   -DKBUILD_BASENAME
=mpparse  -c -o mpparse.o mpparse.c
mpparse.c: In function `MP_processor_info':
mpparse.c:168: warning: implicit declaration of function `Dprintk'
cc  -D__KERNEL__ -I/usr/src/linux-2.4.18-3/include -Wall -Wstrict-prototypes
 -Wno-trigraphs -O2 -fomit-frame-pointer -fno-strict-aliasing -fno-common -W
no-unused -pipe -mpreferred-stack-boundary=2 -march=i686   -DKBUILD_BASENAME
=apic  -c -o apic.o apic.c
apic.c: In function `get_maxlvt':
apic.c:44: warning: implicit declaration of function `apic_read'
apic.c: In function `clear_local_APIC':
apic.c:64: warning: implicit declaration of function `apic_write_around'
apic.c:94: warning: implicit declaration of function `apic_write'
apic.c: In function `verify_local_APIC':
apic.c:159: warning: implicit declaration of function `Dprintk'
apic.c: In function `sync_Arb_IDs':
apic.c:212: warning: implicit declaration of function `apic_wait_icr_idle'
apic.c: In function `setup_local_APIC':
apic.c:422: `nmi_watchdog' undeclared (first use in this function)
apic.c:422: (Each undeclared identifier is reported only once
apic.c:422: for each function it appears in.)
apic.c:422: `NMI_LOCAL_APIC' undeclared (first use in this function)
apic.c:423: warning: implicit declaration of function
`setup_apic_nmi_watchdog'
apic.c: In function `detect_init_APIC':
apic.c:640: `nmi_watchdog' undeclared (first use in this function)
apic.c:640: `NMI_NONE' undeclared (first use in this function)
apic.c:641: `NMI_LOCAL_APIC' undeclared (first use in this function)
apic.c: In function `init_apic_mappings':
apic.c:669: `FIX_APIC_BASE' undeclared (first use in this function)
apic.c: In function `smp_apic_timer_interrupt':
apic.c:1071: warning: implicit declaration of function `ack_APIC_irq'
apic.c: In function `APIC_init_uniprocessor':
apic.c:1164: `nmi_watchdog' undeclared (first use in this function)
apic.c:1164: `NMI_LOCAL_APIC' undeclared (first use in this function)
apic.c:1165: warning: implicit declaration of function `check_nmi_watchdog'
make[1]: *** [apic.o] Error 1
make[1]: Leaving directory `/usr/src/linux-2.4.18-3/arch/i386/kernel'
make: *** [_dir_arch/i386/kernel] Error


Can anyone help? Am I executing something out of order?  I'm absolutely
puzzled.

Thanks.

-Jim


