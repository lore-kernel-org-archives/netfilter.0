From: Mr Dash Four <mr.dash.four@googlemail.com>
Subject: Re: ipset question
Date: Sun, 18 Sep 2011 11:47:01 +0100
Message-ID: <4E75CC25.10609@googlemail.com>
References: <wolfgang-1110918101052.A045344@amadeus3.local>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------040908050306010404040809"
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=message-id:disposition-notification-to:date:from:user-agent
         :mime-version:to:cc:subject:references:in-reply-to:content-type;
        bh=lxFHgnQc4qLtAlKs0X4ETztbaUzR6IObtzV+j2I3vfM=;
        b=UnUIyF4G2JuwXF1sHEqIEw6Num7qo2mLrvuBPtHSXsH+BUMtEcqaDlUcvMCJi0GF7M
         /zNV+IZOk6mG3y6NI7jOrp8dH4RBKQX7AtLsGhldRdofgx6xzZltp1JoyEa3AyfVbHwa
         aFpes5wP3xyiOvRu4fHPWFDSqPp0ChmJRsXrE=
In-Reply-To: <wolfgang-1110918101052.A045344@amadeus3.local>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: hamann.w@t-online.de
Cc: netfilter@vger.kernel.org

This is a multi-part message in MIME format.
--------------040908050306010404040809
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


> I am trying to add ipset to an old system (kernel 2.6.16)
> So I downloaded the old ipset and built it in a separate directory.
> There was a little changes necessary, indicating that the distro had some stuff
> backported into the kernel, but eventually it succeeded. I can create ipset,
> add addresses to it and list them.
>
> Now, when I try to add iptables rule, I get error about missing libipt_set.so
> I have tried to recompile iptables on the machine (version 1.3.5 like the installed one),
> but that does not build the missing file.
> It seems that include/linux in iptables does not contain files from include/linux in ipset.
> Would it make sense to just copy over these files? Are there any other changes necessary?
>   
I had *exactly* the same problem over a year ago - trying to build ipset 
4.4 (the newest version in those days) on an old kernel (2.6.16.60, if 
memory serves).

If you look at the archives of this mailing list for a thread called 
"ipset-4.4 on 2.6.16.60 kernel" from 06/07 Nov 2010 you will find all 
the answers you need. From what I remember I had to fix both the ipset 
source code (the instructions for building and incorporating ipset 4.x 
into the older kernel versions as shown on ipset.netfilter.org are 
*incomplete*) by applying a patch to the ipset source. I had to rebuild 
iptables - also from source.

...

I've just looked at my past activities and found instructions how to 
incorporate ipset 4.4 into the 2.6.16.60 kernel - incorporating ipset 
4.5 with your version of the kernel and iptables would, I guess, be very 
similar. I enclose a patch which I applied at the time to the kernel 
source and a set of instructions I followed, which got me out and 
allowed me to rebuild iptables and ipset. The crucial part is to modify 
slightly the kernel source, rebuild iptables, patch ipset and then 
rebuild it against both the (modified) kernel source tree and the newly 
compiled-and-installed iptables. This is what I did at the time:

=======================
I. Prerequisites:

1. kernel & iptables sources
2. ipset source - I initially did this with v4.4, but 4.5 is also fine 
and the process of applying the patch/building the kernel and iptables 
is identical.

II. Installation instructions:

1. Source code preparations:

I am assuming that the kernel source tree is at /usr/src/kernel/ and 
ipset-4.4.tar.bz2 is downloaded in /root and the attached 
ipset-4.4.patch is also in /root. In this case do the following (as root!):

cd /root
tar -jxf ipset-4.4.tar.bz2
cp ~/ipset-4.4/kernel/include/linux/netfilter_ipv4/ip_set.h 
/usr/src/kernel/linux/include/linux/netfilter_ipv4
cp ~/ipset-4.4/kernel/include/linux/netfilter_ipv4/ipt_set.h 
/usr/src/kernel/linux/include/linux/netfilter_ipv4

Build and install iptables in the usual way pointing out the source 
kernel tree as above (/usr/src/kernel/). At the end of the process, 
check that you have (at least) two new files installed: 
/usr/lib/iptables/libipt_SET.so and /usr/lib/iptables/libipt_set.so!

2. Building and installing ipset 4.4 (for 4.5 this is almost identical - 
the attached patch only needs to be tweaked slightly, if at all!)

Before you start doing anything you need to alter the source so that it 
can be compiled without any errors. Fortunately I enclosed a patch which 
makes the job a bit easier. To apply the patch do the following (as root):

patch -p1 --dry-run < ipset-4.4.patch

If there are no 'hunk' or other errors/warnings you can do the following:

patch -p1 < ipset-4.4.patch

The ipset source should now be ready. Do the following:

KERNEL_DIR=/usr/src/kernel/linux make
KERNEL_DIR=/usr/src/kernel/linux make install

During the execution of the first command there should be one or two 
warnings, but no errors. The output of the second command which actually 
installs ipset for good should look similar to this:

cp ipset /usr/sbin/ipset
cp ipset.8 /usr/man/man8/ipset.8
cp libipset_ipmap.so /usr/lib/ipset/libipset_ipmap.so
cp libipset_portmap.so /usr/lib/ipset/libipset_portmap.so
cp libipset_macipmap.so /usr/lib/ipset/libipset_macipmap.so
cp libipset_iptree.so /usr/lib/ipset/libipset_iptree.so
cp libipset_iptreemap.so /usr/lib/ipset/libipset_iptreemap.so
cp libipset_iphash.so /usr/lib/ipset/libipset_iphash.so
cp libipset_nethash.so /usr/lib/ipset/libipset_nethash.so
cp libipset_ipporthash.so /usr/lib/ipset/libipset_ipporthash.so
cp libipset_ipportiphash.so /usr/lib/ipset/libipset_ipportiphash.so
cp libipset_ipportnethash.so /usr/lib/ipset/libipset_ipportnethash.so
cp libipset_setlist.so /usr/lib/ipset/libipset_setlist.so
cd kernel; make -C /usr/src/kernel/linux M=`pwd` V=0 IP_NF_SET_MAX=256 
IP_NF_SET_HASHSIZE=1024 modules
make[1]: Entering directory `/usr/src/kernel/linux-2.6.16.60'
  Building modules, stage 2.
  MODPOST
make[1]: Leaving directory `/usr/src/kernel/linux-2.6.16.60'
cd kernel; make -C /usr/src/kernel/linux M=`pwd` modules_install
make[1]: Entering directory `/usr/src/kernel/linux-2.6.16.60'
  INSTALL /root/ipset-4.4/kernel/ip_set.ko
  INSTALL /root/ipset-4.4/kernel/ip_set_iphash.ko
  INSTALL /root/ipset-4.4/kernel/ip_set_ipmap.ko
  INSTALL /root/ipset-4.4/kernel/ip_set_ipporthash.ko
  INSTALL /root/ipset-4.4/kernel/ip_set_ipportiphash.ko
  INSTALL /root/ipset-4.4/kernel/ip_set_ipportnethash.ko
  INSTALL /root/ipset-4.4/kernel/ip_set_iptree.ko
  INSTALL /root/ipset-4.4/kernel/ip_set_iptreemap.ko
  INSTALL /root/ipset-4.4/kernel/ip_set_macipmap.ko
  INSTALL /root/ipset-4.4/kernel/ip_set_nethash.ko
  INSTALL /root/ipset-4.4/kernel/ip_set_portmap.ko
  INSTALL /root/ipset-4.4/kernel/ip_set_setlist.ko
  INSTALL /root/ipset-4.4/kernel/ipt_SET.ko
  INSTALL /root/ipset-4.4/kernel/ipt_set.ko
make[1]: Leaving directory `/usr/src/kernel/linux-2.6.16.60'


The new kernel modules, for some reason, are copied in 
/lib/modules/2.6.16.60/extra/, so I do not know why are they not loaded 
automatically when the kernel starts and I had to do a modprobe on the 
whole lot in that 'extra' directory to force these modules to be loaded 
to make it working.

I also did two other things, which I am not sure whether it helped, but 
better safe than sorry as they say: I included /usr/lib/ipset/ in 
/etc/ld.so.conf as well as executed:

ldconfig /usr/lib/ipset/

to force the loading of all libraries in that directory. And with that 
the whole installation process is now complete.
=======================

As I pointed out above, the process should be very similar, if not 
identical, for building your version of the kernel/iptables. The 
attached ipset-4.4.patch file needs to be tweaked only slightly for 
version 4.5 (at least to change "ipset-4.4" to "ipset-4.5") and be 
applied before building ipset. Hope this helps!

--------------040908050306010404040809
Content-Type: text/plain;
 name="ipset-4.4.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="ipset-4.4.patch"

--- a/ipset-4.4/Makefile	2010-10-01 20:27:45.000000000 +0100
+++ b/ipset-4.4/Makefile	2010-11-06 20:56:32.000000000 +0000
@@ -22,7 +22,7 @@
 
 IPSET_VERSION:=4.4
 
-PREFIX:=/usr/local
+PREFIX:=/usr
 LIBDIR:=$(PREFIX)/lib
 BINDIR:=$(PREFIX)/sbin
 MANDIR:=$(PREFIX)/man
@@ -35,28 +35,22 @@
 COPT_FLAGS:=-O2
 WARN_FLAGS:=-Wall
 EXTRA_WARN_FLAGS:=\
-	-Wextra \
 	-Waggregate-return \
 	-Wbad-function-cast \
 	-Wcast-align \
 	-Wformat=2 \
 	-Wfloat-equal \
-	-Winit-self \
 	-Winline \
 	-Wmissing-declarations \
 	-Wmissing-prototypes \
 	-Wnested-externs \
-	-Wold-style-definition \
 	-Wpacked \
 	-Wredundant-decls \
-	-Wshadow \
 	-Wsign-compare \
 	-Wstrict-prototypes \
-	-Wswitch-default \
 	-Wswitch-enum \
 	-Wundef \
 	-Wwrite-strings \
-	-Wno-missing-field-initializers \
 	-Werror
 
 ifndef NO_EXTRA_WARN_FLAGS
--- a/ipset-4.4/kernel/ipt_set.c	2010-10-01 15:50:42.000000000 +0100
+++ b/ipset-4.4/kernel/ipt_set.c	2010-11-07 00:39:51.000000000 +0000
@@ -164,7 +164,7 @@
 	ip_set_id_t index;
 
 #if LINUX_VERSION_CODE < KERNEL_VERSION(2,6,17)
-	if (matchsize != IPT_ALIGN(sizeof(struct ipt_set_info_match))) {
+        if (matchsize != XT_ALIGN(sizeof(struct ipt_set_info_match))) {
 		ip_set_printk("invalid matchsize %d", matchsize);
 		return CHECK_FAIL;
 	}
@@ -207,7 +207,7 @@
 
 
 #if LINUX_VERSION_CODE < KERNEL_VERSION(2,6,17)
-	if (matchsize != IPT_ALIGN(sizeof(struct ipt_set_info_match))) {
+        if (matchsize != XT_ALIGN(sizeof(struct ipt_set_info_match))) {
 		ip_set_printk("invalid matchsize %d", matchsize);
 		return;
 	}
@@ -241,12 +241,12 @@
 
 static int __init ipt_ipset_init(void)
 {
-	return xt_register_match(&set_match);
+	return xt_register_match(AF_INET,&set_match);
 }
 
 static void __exit ipt_ipset_fini(void)
 {
-	xt_unregister_match(&set_match);
+	xt_unregister_match(AF_INET,&set_match);
 }
 
 module_init(ipt_ipset_init);
--- a/ipset-4.4/kernel/ipt_SET.c	2010-08-16 19:44:44.000000000 +0100
+++ b/ipset-4.4/kernel/ipt_SET.c	2010-11-07 00:41:36.000000000 +0000
@@ -154,7 +154,7 @@
 	ip_set_id_t index;
 
 #if LINUX_VERSION_CODE < KERNEL_VERSION(2,6,17)
-	if (targinfosize != IPT_ALIGN(sizeof(*info))) {
+        if (targinfosize != XT_ALIGN(sizeof(*info))) {
 		DP("bad target info size %u", targinfosize);
 		return CHECK_FAIL;
 	}
@@ -207,7 +207,7 @@
 #endif
 
 #if LINUX_VERSION_CODE < KERNEL_VERSION(2,6,17)
-	if (targetsize != IPT_ALIGN(sizeof(struct ipt_set_info_target))) {
+        if (targetsize != XT_ALIGN(sizeof(struct ipt_set_info_target))) {
 		ip_set_printk("invalid targetsize %d", targetsize);
 		return;
 	}
@@ -244,12 +244,12 @@
 
 static int __init ipt_SET_init(void)
 {
-	return xt_register_target(&SET_target);
+	return xt_register_target(AF_INET,&SET_target);
 }
 
 static void __exit ipt_SET_fini(void)
 {
-	xt_unregister_target(&SET_target);
+	xt_unregister_target(AF_INET,&SET_target);
 }
 
 module_init(ipt_SET_init);

--------------040908050306010404040809--
