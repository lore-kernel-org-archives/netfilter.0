From: "Alexander Hachmann" <public@thesofa.de>
Subject: Problem With reading data through JNetFilter
Date: Fri, 20 Oct 2006 19:28:57 +0200
Message-ID: <19964.8426649675$1161365460@news.gmane.org>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hello there,
I am trying to modify my Firewall over Linux and am using JNetFilter with
libiptc.so Version 1.3.5

When I try to run a small programm to simply print out the chains that
exist, i reveive the error below.
I have no clue that this could mean. I can create chains without any
problem, but when i run the following method,
I reveive this error. Even the test.sh that is included in JNetFilter does
not work.

public static void main(String[] args){
	try{
		Table tabel = new Table("filter");
		Iterator it = table.iterator();
		Chain c;
		while (it.hasNext()){
			c = (Chain)it.next();
			System.out.println(c.getName());
		}
	}catch (Exception e){}
}


Has anyone a Idea what the problem is an how i can fix this?

Thanks,
     Alexander 

#
# An unexpected error has been detected by HotSpot Virtual Machine:
#
#  SIGSEGV (0xb) at pc=0x45bf3a20, pid=2854, tid=16384 # # Java VM: Java
HotSpot(TM) Client VM (1.5.0_08-b03 mixed mode, sharing) # Problematic
frame:
# C  [libiptc.so+0x1a20]
#

---------------  T H R E A D  ---------------

Current thread (0x0805bf38):  JavaThread "main" [_thread_in_native, id=2854]

siginfo:si_signo=11, si_errno=0, si_code=1, si_addr=0x00b5042a

Registers:
EAX=0x00b5042a, EBX=0x45bf9ec8, ECX=0x00000000, EDX=0x080ca5a8
ESP=0xbfffd884, EBP=0xbfffd884, ESI=0x00b5042a, EDI=0x0805bf38
EIP=0x45bf3a20, CR2=0x00b5042a, EFLAGS=0x00010206

Top of Stack: (sp=0xbfffd884)
0xbfffd884:   bfffd894 45bf3a6e 45bf15e0 69a0b600
0xbfffd894:   bfffd8c4 45bef051 bfffd8b8 00000000
0xbfffd8a4:   00000000 45bef038 4397fe88 bfffd928
0xbfffd8b4:   69a0b600 080ca5a8 0805bf38 69a0b600
0xbfffd8c4:   bfffd8f4 4397a4db 0805bff8 bfffd8fc
0xbfffd8d4:   080ca5a8 bfffd8d8 69a0b600 bfffd904
0xbfffd8e4:   69a0e8d0 00000000 69a0b600 bfffd904
0xbfffd8f4:   bfffd928 43974a64 69a0d2e0 43978653 

Instructions: (pc=0x45bf3a20)
0x45bf3a10:   89 81 78 00 00 00 5d c3 55 89 e5 89 c2 8b 40 0c
0x45bf3a20:   8b 08 8d 42 04 39 c1 74 05 89 4a 0c 5d c3 c7 42 

Stack: [0xbfe01000,0xc0000000),  sp=0xbfffd884,  free space=2034k Native
frames: (J=compiled Java code, j=interpreted, Vv=VM code, C=native code) C
[libiptc.so+0x1a20] C  [libiptc.so+0x1a6e]  iptc_first_chain+0x37 C
[libIPTables.so+0x2051]  Java_jnetfilter_IPTableControl_firstChain+0x25
j  jnetfilter.IPTableControl.firstChain(I)Ljava/lang/String;+0
j  jnetfilter.ChainIterator.hasNext()Z+32
j  jnetfilter.Test.main([Ljava/lang/String;)V+28
v  ~StubRoutines::call_stub
V  [libjvm.so+0x17a75c]
V  [libjvm.so+0x28afd8]
V  [libjvm.so+0x17a58f]
V  [libjvm.so+0x1a4e32]
V  [libjvm.so+0x196042]
C  [java+0x1873]
C  [libc.so.6+0x15e36]  __libc_start_main+0xc6

Java frames: (J=compiled Java code, j=interpreted, Vv=VM code) j
jnetfilter.IPTableControl.firstChain(I)Ljava/lang/String;+0
j  jnetfilter.ChainIterator.hasNext()Z+32
j  jnetfilter.Test.main([Ljava/lang/String;)V+28
v  ~StubRoutines::call_stub

---------------  P R O C E S S  ---------------

Java Threads: ( => current thread )
  0x080a6fc8 JavaThread "Low Memory Detector" daemon [_thread_blocked,
id=2861]
  0x080a5a98 JavaThread "CompilerThread0" daemon [_thread_blocked, id=2860]
  0x080a4bb0 JavaThread "Signal Dispatcher" daemon [_thread_blocked,
id=2859]
  0x0809dfa0 JavaThread "Finalizer" daemon [_thread_blocked, id=2858]
  0x0809d308 JavaThread "Reference Handler" daemon [_thread_blocked,
id=2857]
=>0x0805bf38 JavaThread "main" [_thread_in_native, id=2854]

Other Threads:
  0x080987f8 VMThread [id=2856]
  0x080a8470 WatcherThread [id=2862]

VM state:not at safepoint (normal execution)

VM Mutex/Monitor currently owned by a thread: None

Heap
 def new generation   total 576K, used 221K [0x65a00000, 0x65aa0000,
0x65ee0000)
  eden space 512K,  43% used [0x65a00000, 0x65a37700, 0x65a80000)
  from space 64K,   0% used [0x65a80000, 0x65a80000, 0x65a90000)
  to   space 64K,   0% used [0x65a90000, 0x65a90000, 0x65aa0000)
 tenured generation   total 1408K, used 0K [0x65ee0000, 0x66040000,
0x69a00000)
   the space 1408K,   0% used [0x65ee0000, 0x65ee0000, 0x65ee0200,
0x66040000)
 compacting perm gen  total 8192K, used 61K [0x69a00000, 0x6a200000,
0x6da00000)
   the space 8192K,   0% used [0x69a00000, 0x69a0f4b8, 0x69a0f600,
0x6a200000)
    ro space 8192K,  68% used [0x6da00000, 0x6df7eaf8, 0x6df7ec00,
0x6e200000)
    rw space 12288K,  48% used [0x6e200000, 0x6e7c9d78, 0x6e7c9e00,
0x6ee00000)

Dynamic libraries:
08048000-08057000 r-xp 00000000 08:01 792612
/www/htdocs/jdk1.5.0_08/bin/java
08057000-08059000 rw-p 0000e000 08:01 792612
/www/htdocs/jdk1.5.0_08/bin/java
08059000-081a7000 rwxp 00000000 00:00 0 
40000000-40016000 r-xp 00000000 08:01 711067     /lib/ld-2.3.2.so
40016000-40017000 rw-p 00015000 08:01 711067     /lib/ld-2.3.2.so
40017000-40018000 rw-p 00000000 00:00 0 40018000-40019000 r--p 00000000
00:00 0 40019000-4001a000 rw-p 00000000 00:00 0 
4001a000-4001c000 r--s 00000000 08:01 775791
/www/htdocs/jdk1.5.0_08/jre/lib/ext/dnsns.jar
4001c000-40029000 r-xp 00000000 08:01 711087     /lib/libpthread-0.10.so
40029000-4002b000 rw-p 0000c000 08:01 711087     /lib/libpthread-0.10.so
4002b000-4006d000 rw-p 00000000 00:00 0 
4006d000-4006f000 r-xp 00000000 08:01 711076     /lib/libdl-2.3.2.so
4006f000-40070000 rw-p 00002000 08:01 711076     /lib/libdl-2.3.2.so
40070000-40071000 rw-p 00000000 00:00 0 
40071000-40199000 r-xp 00000000 08:01 711074     /lib/libc-2.3.2.so
40199000-401a1000 rw-p 00127000 08:01 711074     /lib/libc-2.3.2.so
401a1000-401a4000 rw-p 00000000 00:00 0 
401a4000-40510000 r-xp 00000000 08:01 744175
/www/htdocs/jdk1.5.0_08/jre/lib/i386/client/libjvm.so
40510000-4052f000 rw-p 0036b000 08:01 744175
/www/htdocs/jdk1.5.0_08/jre/lib/i386/client/libjvm.so
4052f000-40945000 rw-p 00000000 00:00 0 
40945000-40966000 r-xp 00000000 08:01 711077     /lib/libm-2.3.2.so
40966000-40967000 rw-p 00020000 08:01 711077     /lib/libm-2.3.2.so
40967000-4096d000 r-xp 00000000 08:01 744169
/www/htdocs/jdk1.5.0_08/jre/lib/i386/native_threads/libhpi.so
4096d000-4096e000 rw-p 00006000 08:01 744169
/www/htdocs/jdk1.5.0_08/jre/lib/i386/native_threads/libhpi.so
40972000-40984000 r-xp 00000000 08:01 711079     /lib/libnsl-2.3.2.so
40984000-40985000 rw-p 00011000 08:01 711079     /lib/libnsl-2.3.2.so
40985000-40987000 rw-p 00000000 00:00 0 
40987000-4098e000 r-xp 00000000 08:01 711080     /lib/libnss_compat-2.3.2.so
4098e000-4098f000 rw-p 00006000 08:01 711080     /lib/libnss_compat-2.3.2.so
4098f000-40997000 r-xp 00000000 08:01 711084     /lib/libnss_nis-2.3.2.so
40997000-40998000 rw-p 00007000 08:01 711084     /lib/libnss_nis-2.3.2.so
40998000-409a0000 r-xp 00000000 08:01 711082     /lib/libnss_files-2.3.2.so
409a0000-409a1000 rw-p 00008000 08:01 711082     /lib/libnss_files-2.3.2.so
409a1000-409a9000 rw-s 00000000 08:01 113909     /tmp/hsperfdata_root/2854
409a9000-409b4000 r-xp 00000000 08:01 744181
/www/htdocs/jdk1.5.0_08/jre/lib/i386/libverify.so
409b4000-409b5000 rw-p 0000b000 08:01 744181
/www/htdocs/jdk1.5.0_08/jre/lib/i386/libverify.so
409b5000-409d6000 r-xp 00000000 08:01 744182
/www/htdocs/jdk1.5.0_08/jre/lib/i386/libjava.so
409d6000-409d8000 rw-p 00020000 08:01 744182
/www/htdocs/jdk1.5.0_08/jre/lib/i386/libjava.so
409d8000-409e7000 r-xp 00000000 08:01 744184
/www/htdocs/jdk1.5.0_08/jre/lib/i386/libzip.so
409e7000-409e9000 rw-p 0000e000 08:01 744184
/www/htdocs/jdk1.5.0_08/jre/lib/i386/libzip.so
409e9000-42fff000 r--s 00000000 08:01 744286
/www/htdocs/jdk1.5.0_08/jre/lib/rt.jar
42fff000-43068000 rw-p 00000000 00:00 0 
43068000-430ed000 r--s 00000000 08:01 744267
/www/htdocs/jdk1.5.0_08/jre/lib/jsse.jar
430ed000-43102000 r--s 00000000 08:01 744220
/www/htdocs/jdk1.5.0_08/jre/lib/jce.jar
43102000-43972000 r--s 00000000 08:01 744270
/www/htdocs/jdk1.5.0_08/jre/lib/charsets.jar
43972000-45a88000 rwxp 00028000 00:00 0 
45a88000-45ad7000 r--p 00000000 08:01 339571
/usr/lib/locale/locale-archive
45ad7000-45afe000 r--s 00000000 08:01 775768
/www/htdocs/jdk1.5.0_08/jre/lib/ext/sunjce_provider.jar
45afe000-45b29000 r--s 00000000 08:01 775790
/www/htdocs/jdk1.5.0_08/jre/lib/ext/sunpkcs11.jar
45b29000-45bed000 r--s 00000000 08:01 776457
/www/htdocs/jdk1.5.0_08/jre/lib/ext/localedata.jar
45bed000-45bf1000 r-xp 00000000 08:01 130082
/root/JavaTest/JNetFilter/c/lib/libIPTables.so
45bf1000-45bf2000 rw-p 00003000 08:01 130082
/root/JavaTest/JNetFilter/c/lib/libIPTables.so
45bf2000-45bf9000 r-xp 00000000 08:01 712041     /lib/libiptc.so.0.0
45bf9000-45bfa000 rw-p 00006000 08:01 712041     /lib/libiptc.so.0.0
65a00000-6da00000 rwxp 22156000 00:00 0 
6da00000-6df7f000 r--s 00001000 08:01 744269
/www/htdocs/jdk1.5.0_08/jre/lib/i386/client/classes.jsa
6df7f000-6e200000 rwxp 2a6d5000 00:00 0 
6e200000-6e7ca000 rw-p 00580000 08:01 744269
/www/htdocs/jdk1.5.0_08/jre/lib/i386/client/classes.jsa
6e7ca000-6ee00000 rwxp 2af20000 00:00 0 
6ee00000-6eed0000 rw-p 00b4a000 08:01 744269
/www/htdocs/jdk1.5.0_08/jre/lib/i386/client/classes.jsa
6eed0000-6f200000 rwxp 2b626000 00:00 0 
6f200000-6f204000 r-xs 00c1a000 08:01 744269
/www/htdocs/jdk1.5.0_08/jre/lib/i386/client/classes.jsa
6f204000-6f600000 rwxp 2b95a000 00:00 0 bea00000-bea01000 ---p 00000000
00:00 0 bea01000-bec00000 rwxp 00001000 00:00 0 bec01000-bec04000 ---p
00003000 00:00 0 bec04000-bee00000 rwxp 00006000 00:00 0 bee00000-bee04000
---p 00000000 00:00 0 bee04000-bf000000 rwxp 00004000 00:00 0
bf001000-bf004000 ---p 00003000 00:00 0 bf004000-bf200000 rwxp 00006000
00:00 0 bf201000-bf204000 ---p 00003000 00:00 0 bf204000-bf400000 rwxp
00006000 00:00 0 bf401000-bf404000 ---p 00003000 00:00 0 bf404000-bf600000
rwxp 00006000 00:00 0 bf600000-bf601000 ---p 00000000 00:00 0
bf601000-bf800000 rwxp 00001000 00:00 0 bfe01000-bfe04000 ---p 00000000
00:00 0 bfe04000-c0000000 rwxp ffe05000 00:00 0 

VM Arguments:
java_command: jnetfilter.Test
Launcher Type: SUN_STANDARD

Environment Variables:
JAVA_HOME=/www/htdocs/jdk1.5.0_08/
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/bin/X
11
LD_LIBRARY_PATH=/www/htdocs/jdk1.5.0_08/jre/lib/i386/client:/www/htdocs/jdk1
.5.0_08/jre/lib/i386:/www/htdocs/jdk1.5.0_08/jre/../lib/i386:../../c/lib:/us
r/local/lib:
SHELL=/bin/bash

Signal Handlers:
SIGSEGV: [libjvm.so+0x325bd0], sa_mask[0]=0xfffbfeff, sa_flags=0x14000004
SIGBUS: [libjvm.so+0x325bd0], sa_mask[0]=0xfffbfeff, sa_flags=0x14000004
SIGFPE: [libjvm.so+0x28a010], sa_mask[0]=0xfffbfeff, sa_flags=0x14000004
SIGPIPE: [libjvm.so+0x28a010], sa_mask[0]=0xfffbfeff, sa_flags=0x14000004
SIGILL: [libjvm.so+0x28a010], sa_mask[0]=0xfffbfeff, sa_flags=0x14000004
SIGUSR1: SIG_DFL, sa_mask[0]=0x00000000, sa_flags=0x00000000
SIGUSR2: [libjvm.so+0x28c460], sa_mask[0]=0x80000000, sa_flags=0x14000004
SIGHUP: [libjvm.so+0x28be90], sa_mask[0]=0xfffbfeff, sa_flags=0x14000004
SIGINT: [libjvm.so+0x28be90], sa_mask[0]=0xfffbfeff, sa_flags=0x14000004
SIGQUIT: [libjvm.so+0x28be90], sa_mask[0]=0xfffbfeff, sa_flags=0x14000004
SIGTERM: [libjvm.so+0x28be90], sa_mask[0]=0xfffbfeff, sa_flags=0x14000004


---------------  S Y S T E M  ---------------

OS:3.1

uname:Linux 2.4.27-2-386 #1 Wed Aug 17 09:33:35 UTC 2005 i686 libc:glibc
2.3.2 linuxthreads-0.10 (fixed stack)
rlimit: STACK 2044k, CORE 0k, NPROC infinity, NOFILE 1024, AS infinity load
average:0.01 0.02 0.00

CPU:total 1 (cores per cpu 2, threads per core 1) family 15 model 72
stepping 2, cmov, cx8, fxsr, mmx, sse, sse2, sse3, mmxext, 3dnowext, 3dnow

Memory: 4k page, physical 200316k(13088k free), swap 377488k(377488k free)

vm_info: Java HotSpot(TM) Client VM (1.5.0_08-b03) for linux-x86, built on
Jun 28 2006 01:40:21 by java_re with gcc 3.2.1-7a (J2SE release)



