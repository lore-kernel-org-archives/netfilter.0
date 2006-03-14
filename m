From: thierry itty <thierry.itty@besancon.org>
Subject: iptables and patch-o-matic compilation errors with fedora core 4
Date: Tue, 14 Mar 2006 10:56:24 +0100
Message-ID: <44169348.7070408@besancon.org>
Mime-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hello
I've an "out-of-the-box" fedora core 4 (standard i686 on either amd or 
pentium)
I want to apply gre and pptp patches to netfilter

I install the kernel sources and rebuild the binaries :

rpm -Uvh kernel-2.6.11-1.1369_FC4.src.rpm
rpmbuild -bp --target=i686 /usr/src/redhat/SPECS/kernel-2.6.spec
cd /usr/src/redhat/BUILD/kernel-2.6.11-1/linux-2.6.11-1
cp configs/kernel-2.6.11-1.i686.config ./.config
make menuconfig (just to check)
make

the kernel build ok (with some warnings here and there but nothing 
unusual...)
I make it visible :
ln -s /usr/src/redhat/BUILD/kernel-2.6.11-1/linux-2.6.11-1 /usr/src/linux

I install the iptables sources
rpm -Uvh iptables-1.3.0-2.src.rpm
rpmbuild -bp --target=i686 /usr/src/redhat/SPECS/iptables.spec

when i compile
cd /usr/src/redhat/BUILD/iptables-1.3.0
make

I get the following error several times
/usr/src/linuc/include/linux/config.h:6:2 error : #error including 
kernel header in userspace; use the glibc headers instead!

After googling a while, I see that some people have solved this by just 
removing the test that triggers the error in 
/usr/src/linux/include/linx/config.h (file which is brought by the 
kernel source package installation + prep by the symlink made just 
before, which should thus be "the right one"), this test reads
#if !defined (__KERNEL__) && !defined(__KERNGLUE__)
#error including kernel header in userspace; use the glibc headers instead!
#endif

I really don't see where's my error, and I wonder wether this is the 
right way for recompiling FC4 packages...

Actually, I do need to do this because we have to handle several pptp 
vpns going throught this machine, and i have to apply pptp and h323 
helpers patches from patch-o-matic

If I do as I saw (modify the config.h source to remove the test), 
iptables compiles but we are unable to handle pptp vpns (we were used to 
do that with 2.4 kernels and it works fine), modprobe and rmmod go in 
endless loops, and so on...

With a little more googling, I saw that userspace applications (iptables 
in this case) should not use kernel headers, but glibc ones instead, 
hence the error, and since the 2.6 kernel releases, this looks more like 
a mus than a should. So, another solution I found was to remove the 
"-I$(KERNEL_DIR)/include" from iptables' Makefile...

Doing so, iptables begins to compile, but stops quickly after a 
"linux/netfilter_ipv4/ipt_CLUSTERIP.h" missing file error
I see that the include files iptables uses this way are provided by 
glibc-kernheaders-2.4.-9.1.94, standard version for FC4, but those files 
look three years old and obviously recent netfilter stuff isn't present 
within (to say nothing about the remainder), and making compile to abort

Some more googling, until I find a post which says that to compile 
iptables without using the kernel headers I have to install 
"linux-libc-headers" that are a brand of userspace kernel headers. Ok, 
let's give it a try : I restore iptables' original makefile (with 
-I$(KERNEL_DIR)/include) and export a KERNEL_DIR environment variable 
set to the directory where I untared linux-libc-headers, and I (after a 
make clean) I start a new make.
Fine, iptables compiles successfully

But now comes the big question : when I'll apply pptp and h323 patches 
from p-o-m, I can direct KERNEL_DIR to either the true kernel source 
directory or to this new "headers only" directory, but obviously not 
both. So I'll get either the kernel sources patched, which is necessary 
to build a patched kernel, or I'll get the headers patched, which is 
necessary to build iptables, but how will I be able to build both ???

So to conclude and make it short, is there anybody out there who has 
successfully applied pptp and h323 patches on an out-of-the-box fedora 
core 4, and how did he do that ?
Should I upgrade to a 2.6.15 kernel ? vanilla or fc4 flavour ?

many thanks in advance


