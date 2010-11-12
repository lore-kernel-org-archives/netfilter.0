From: =?ISO-8859-2?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Subject: pppd or netfilter error?
Date: Fri, 12 Nov 2010 12:46:53 +0100
Message-ID: <4CDD292D.1000305@freemail.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter list <netfilter@vger.kernel.org>

  Hi all!

The following error is related to the iptables subsystem?

Thanx

Swifty

fw01 kernel: Call Trace:
fw01 kernel: Code: b4 26 00 00 00 00 53 89 c2 9c 59 fa 8b 00 39 c2 74 24 
85 c0 74 1a ff 4a 08 8b 18 8b 50 04 c7 00 00 00 00 00 c7 40 04 00 00 00 
00 <89> 53 04 89 1a 51 9d 5b c3 66 90 31 c0 eb f6 8d b6 00 00 00 00
fw01 kernel: Process pppd (pid: 21943, ti=f6595000 task=f715ebe0 
task.ti=f6595000)
fw01 kernel: EIP: [<c032dc65>]  SS:ESP 0068:f6595e88
fw01 kernel: last sysfs file: /sys/module/ip_tables/initstate
fw01 kernel: CR2: 0000000000000004
fw01 kernel: Oops: 0002 [#2]
fw01 kernel: Stack:

fw01:/fw# cat /proc/cpuinfo
processor    : 0
vendor_id    : AuthenticAMD
cpu family    : 6
model        : 10
model name    : AMD Athlon(tm) XP 3200+
stepping    : 0
cpu MHz        : 2204.965
cache size    : 512 KB
fdiv_bug    : no
hlt_bug        : no
f00f_bug    : no
coma_bug    : no
fpu        : yes
fpu_exception    : yes
cpuid level    : 1
wp        : yes
flags        : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca 
cmov pat pse36 mmx fxsr sse syscall mmxext 3dnowext 3dnow
bogomips    : 4409.93
clflush size    : 32
cache_alignment    : 32
address sizes    : 34 bits physical, 32 bits virtual
power management: ts

fw01:/fw# uname -a
Linux fw01 2.6.36 #1 Wed Oct 27 20:18:18 CEST 2010 i686 GNU/Linux


