From: "Sathish Kumar.R" <geosathish@gmail.com>
Subject: Invalid argument Error : DNAT rule at OUTPUT chain in arm-linux box
Date: Fri, 12 Oct 2007 20:56:19 +0530
Message-ID: <470f9225.1997600a.2d3f.3a27@mx.google.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:from:to:subject:date:mime-version:content-type:content-transfer-encoding:x-mailer:thread-index:x-mimeole:message-id;
        bh=cjtZIUDC/cfLKJBP+3jp0mboZ5mNEkoxcuRgtv26CXA=;
        b=jN8nbOltRz3+IwCMMO160QylgHriawa3cbM6gilnZfISZxb9rSOu5M1upJs4p65BHWQLPIBykGNQFuV8aI5oX8svq3coR0uD3JefVMUvumQu9zSPbse6k/70HI4YFHvR3PbA6hFNHwrzOovTwubXRoDUtjppYXDjlD4bZV9i7HI=
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi Guys,

I have a problem while executing the followng DNAT rule at arm-linux box,

Box = "Linux 2.4.27-uc1 #6 Mon Oct 8 22:12:01 IST 2007 armv5b unknown"
iptables version: "iptables v1.2.7a"

Executed Rule
-------------
iptables -t nat -A OUTPUT -p tcp --dport 80 -j DNAT --to-destination
10.0.1.1
iptables: Invalid argument
..

the above rule executed on intel box without any errors,

even the same rule at PREROUTING chain working successfully on arm-linux box

but in OUTPUT chain, i am getting this trouble, as "iptables: Invalid
argument"  

i did some debugging on that rule 

the strace result of that command..

>>>>>>
execve("/sbin/iptables", ["iptables", "-t", "nat", "-A", "OUTPUT", "-p",
"tcp", "--dport", "80", "-j", "DNAT", "--to-destination", "10.0.1.1"], [/* 7
vars */]) = 0
uname({sys="Linux", node="myhost", ...}) = 0
brk(0)                                  = 0x1a7ec
open("/etc/ld.so.preload", O_RDONLY)    = -1 ENOENT (No such file or
directory)
open("/etc/ld.so.cache", O_RDONLY)      = -1 ENOENT (No such file or
directory)
open("/lib/v5b/fast-mult/half/libdl.so.2", O_RDONLY) = -1 ENOENT (No such
file or directory)
stat64("/lib/v5b/fast-mult/half", 0xbffff4ec) = -1 ENOENT (No such file or
directory)
open("/lib/v5b/fast-mult/libdl.so.2", O_RDONLY) = -1 ENOENT (No such file or
directory)
..
..
...
open("/usr/local/lib/iptables/libipt_DNAT.so", O_RDONLY) = 3
read(3, "\177ELF\1\2\1a\0\0\0\0\0\0\0\0\0\3\0(\0\0\0\1\0\0\6\300"..., 512) =
512
fstat64(3, {st_mode=S_IFREG|0755, st_size=4540, ...}) = 0
mmap2(NULL, 36588, PROT_READ|PROT_EXEC, MAP_PRIVATE, 3, 0) = 0x40164000
mprotect(0x40165000, 32492, PROT_NONE)  = 0
mmap2(0x4016c000, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 3, 0) =
0x4016c000
close(3)                                = 0
socket(PF_INET, SOCK_RAW, IPPROTO_RAW)  = 3
getsockopt(3, SOL_IP, 0x40 /* IP_??? */,
"nat\0\300\25U\20\0\0\0\0\306g\34\374\306g\35\4\304\34\254"..., [84]) = 0
getsockopt(3, SOL_IP, 0x41 /* IP_??? */,
"nat\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., [1880]) = 0
setsockopt(3, SOL_IP, 0x40 /* IP_??? */,
"nat\0@\25\201\220\300\25U\20\0\0\0\0\306g\34\374\306g\35"..., 2148) = -1
EINVAL (Invalid argument)
write(2, "iptables: Invalid argument\n", 27iptables: Invalid argument
) = 27
exit_group(1)                           = ?
Process 955 detached
<<<<<<<

i dont know what kernel options i am missing

please provide some clues to continue..

Sathish Kumar.R

