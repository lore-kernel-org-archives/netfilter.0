From: "Roberto Emanuele" <neuroniclapse@gmail.com>
Subject: Iptables: Invalid argument response when i try to load a rule with the recent match
Date: Wed, 3 Oct 2007 12:51:41 +0200
Message-ID: <93dc1b710710030351s49330085qe44fb51bdb8479e2@mail.gmail.com>
References: <93dc1b710710030321t7f25e6afxf6a80d112f05fe45@mail.gmail.com>
	 <93dc1b710710030341u285da947s40e40b413cc5879c@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        bh=ATmp/IEVUA1/oBkEVtXpFu0NNUxRIGlYH5rdOj7wNzg=;
        b=T5UkMLuWL3W9sxirv0TUfWVxriwlhMiYurnjNf7w8D6y+g6jN0NSrlosg38mpINxca3cPvfPT2F96sxI+4ORGUWZf/eRIH7CY22Qm04YqBOX+e9Yw3o3XZbPAtER/hPz9GQdDPPGcbhHsP+guYAaDYfk6QnCRYOadW6NQ7t0TRc=
In-Reply-To: <93dc1b710710030341u285da947s40e40b413cc5879c@mail.gmail.com>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

I'm using the recent match to implement an rudimental web pages antigrab tool.
 I load the recent module (ipt_recent.ko) forcing a bigger value for
the parameter ip_list_tot (recent list dimension)
 modprobe ipt_recent ip_list_tot=8191
 With this setting the module e and the relative iptables rules are
working fine.
 Loading the ipt_recent module with ip_list_tot = 8192 or higher
produce the following output when i try load a iptables rule with the
recent match: "iptables: Invalid argument"
 Making a strace of the iptables rule i see that the setsockopt
syscall fail. Why? Can someone help me and give me some hint?
 Details follow hoping that someone can help me:
 Kernel: linux 2.6.19.1 with grsec patch
 iptables: iptables-1.3.7

 As a example use /sbin/iptables -A INPUT -m recent --set --name recentlist
 If I use modprobe ipt_recent ip_list_tot=8191 the rule will be loaded
correctly and the strace output are:
 strace /sbin/iptables -A INPUT -m recent --set --name recentlist
 execve("/sbin/iptables", ["/sbin/iptables", "-A", "INPUT", "-m",
"recent", "--set", "--name", "recentlist"], [/* 13 vars */]) = 0
 uname({sys="Linux", node="beta", ...})  = 0
 brk(0)                                  = 0x8055954
 old_mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS,
-1, 0) = 0x516ad000
 access("/etc/ld.so.nohwcap", F_OK)      = -1 ENOENT (No such file or directory)
 open("/etc/ld.so.preload", O_RDONLY)    = -1 ENOENT (No such file or directory)
 open("/etc/ld.so.cache", O_RDONLY)      = 3
 fstat64(3, {st_mode=S_IFREG|0644, st_size=16124, ...}) = 0
 old_mmap(NULL, 16124, PROT_READ, MAP_PRIVATE, 3, 0) = 0x516a9000
 close(3)                                = 0
 access("/etc/ld.so.nohwcap", F_OK)      = -1 ENOENT (No such file or directory)
 open("/lib/tls/libdl.so.2", O_RDONLY)   = 3
 read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0\320\32"..., 512) = 512
 fstat64(3, {st_mode=S_IFREG|0644, st_size=9872, ...}) = 0
 old_mmap(NULL, 8632, PROT_READ|PROT_EXEC, MAP_PRIVATE, 3, 0) = 0x516a6000
 old_mmap(0x516a8000, 4096, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED, 3, 0x2000) = 0x516a8000
 close(3)                                = 0
 access("/etc/ld.so.nohwcap", F_OK)      = -1 ENOENT (No such file or directory)
 open("/lib/tls/libnsl.so.1", O_RDONLY)  = 3
 read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0 <\0\000"...,
512) = 512
 fstat64(3, {st_mode=S_IFREG|0644, st_size=73304, ...}) = 0
 old_mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS,
-1, 0) = 0x516a5000
 old_mmap(NULL, 80544, PROT_READ|PROT_EXEC, MAP_PRIVATE, 3, 0) = 0x51691000
 old_mmap(0x516a2000, 4096, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED, 3, 0x11000) = 0x516a2000
 old_mmap(0x516a3000, 6816, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x516a3000
 close(3)                                = 0
 access("/etc/ld.so.nohwcap", F_OK)      = -1 ENOENT (No such file or directory)
 open("/lib/tls/libc.so.6", O_RDONLY)    = 3
 read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0`Z\1\000"...,
512) = 512
 fstat64(3, {st_mode=S_IFREG|0755, st_size=1254660, ...}) = 0
 old_mmap(NULL, 1264972, PROT_READ|PROT_EXEC, MAP_PRIVATE, 3, 0) = 0x5155c000
 old_mmap(0x51686000, 36864, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED, 3, 0x129000) = 0x51686000
 old_mmap(0x5168f000, 7500, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x5168f000
 close(3)                                = 0
 old_mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS,
-1, 0) = 0x5155b000
 set_thread_area({entry_number:-1 -> 6, base_addr:0x516a5ba0,
limit:1048575, seg_32bit:1, contents:0, read_exec_only:0,
limit_in_pages:1, seg_not_present:0, useable:1}) = 0
 munmap(0x516a9000, 16124)               = 0
 brk(0)                                  = 0x8055954
 brk(0x8076954)                          = 0x8076954
 brk(0)                                  = 0x8076954
 brk(0x8077000)                          = 0x8077000
 open("/lib/iptables/libipt_recent.so", O_RDONLY) = 3
 read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0`\10\0\000"...,
512) = 512
 fstat64(3, {st_mode=S_IFREG|0755, st_size=11842, ...}) = 0
 old_mmap(NULL, 11044, PROT_READ|PROT_EXEC, MAP_PRIVATE, 3, 0) = 0x516aa000
 old_mmap(0x516ac000, 4096, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED, 3, 0x1000) = 0x516ac000
 close(3)                                = 0
 socket(PF_INET, SOCK_RAW, IPPROTO_RAW)  = 3
 getsockopt(3, SOL_IP, 0x40 /* IP_??? */,
"filter\0\302\0\1772\300\0\0\0\0O\374\26\300L\20q\367\1"..., [84]) = 0
 getsockopt(3, SOL_IP, 0x41 /* IP_??? */,
"filter\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., [21828])
= 0
 open("/lib/iptables/libipt_standard.so", O_RDONLY) = 4
 read(4, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0\200\6\0"...,
512) = 512
 fstat64(4, {st_mode=S_IFREG|0755, st_size=7129, ...}) = 0
 old_mmap(NULL, 6840, PROT_READ|PROT_EXEC, MAP_PRIVATE, 4, 0) = 0x51559000
 old_mmap(0x5155a000, 4096, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED, 4, 0) = 0x5155a000
 close(4)                                = 0
 setsockopt(3, SOL_IP, 0x40 /* IP_??? */,
"filter\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 22276) =
0
 setsockopt(3, SOL_IP, 0x41 /* IP_??? */,
"filter\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 2052) = 0
 close(3)                                = 0
 exit_group(0)

 If I use modprobe ipt_recent ip_list_tot=8192 the strace output are:

 strace /sbin/iptables -A INPUT -m recent --set --name recentlist
 execve("/sbin/iptables", ["/sbin/iptables", "-A", "INPUT", "-m",
"recent", "--set", "--name", "recentlist"], [/* 13 vars */]) = 0
 uname({sys="Linux", node="beta", ...})  = 0
 brk(0)                                  = 0x80636a4
 old_mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS,
-1, 0) = 0x52a5b000
 access("/etc/ld.so.nohwcap", F_OK)      = -1 ENOENT (No such file or directory)
 open("/etc/ld.so.preload", O_RDONLY)    = -1 ENOENT (No such file or directory)
 open("/etc/ld.so.cache", O_RDONLY)      = 3
 fstat64(3, {st_mode=S_IFREG|0644, st_size=16124, ...}) = 0
 old_mmap(NULL, 16124, PROT_READ, MAP_PRIVATE, 3, 0) = 0x52a57000
 close(3)                                = 0
 access("/etc/ld.so.nohwcap", F_OK)      = -1 ENOENT (No such file or directory)
 open("/lib/tls/libdl.so.2", O_RDONLY)   = 3
 read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0\320\32"..., 512) = 512
 fstat64(3, {st_mode=S_IFREG|0644, st_size=9872, ...}) = 0
 old_mmap(NULL, 8632, PROT_READ|PROT_EXEC, MAP_PRIVATE, 3, 0) = 0x52a54000
 old_mmap(0x52a56000, 4096, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED, 3, 0x2000) = 0x52a56000
 close(3)                                = 0
 access("/etc/ld.so.nohwcap", F_OK)      = -1 ENOENT (No such file or directory)
 open("/lib/tls/libnsl.so.1", O_RDONLY)  = 3
 read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0 <\0\000"...,
512) = 512
 fstat64(3, {st_mode=S_IFREG|0644, st_size=73304, ...}) = 0
 old_mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS,
-1, 0) = 0x52a53000
 old_mmap(NULL, 80544, PROT_READ|PROT_EXEC, MAP_PRIVATE, 3, 0) = 0x52a3f000
 old_mmap(0x52a50000, 4096, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED, 3, 0x11000) = 0x52a50000
 old_mmap(0x52a51000, 6816, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x52a51000
 close(3)                                = 0
 access("/etc/ld.so.nohwcap", F_OK)      = -1 ENOENT (No such file or directory)
 open("/lib/tls/libc.so.6", O_RDONLY)    = 3
 read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0`Z\1\000"...,
512) = 512
 fstat64(3, {st_mode=S_IFREG|0755, st_size=1254660, ...}) = 0
 old_mmap(NULL, 1264972, PROT_READ|PROT_EXEC, MAP_PRIVATE, 3, 0) = 0x5290a000
 old_mmap(0x52a34000, 36864, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED, 3, 0x129000) = 0x52a34000
 old_mmap(0x52a3d000, 7500, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x52a3d000
 close(3)                                = 0
 old_mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS,
-1, 0) = 0x52909000
 set_thread_area({entry_number:-1 -> 6, base_addr:0x52a53ba0,
limit:1048575, seg_32bit:1, contents:0, read_exec_only:0,
limit_in_pages:1, seg_not_present:0, useable:1}) = 0
 munmap(0x52a57000, 16124)               = 0
 brk(0)                                  = 0x80636a4
 brk(0x80846a4)                          = 0x80846a4
 brk(0)                                  = 0x80846a4
 brk(0x8085000)                          = 0x8085000
 open("/lib/iptables/libipt_recent.so", O_RDONLY) = 3
 read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0`\10\0\000"...,
512) = 512
 fstat64(3, {st_mode=S_IFREG|0755, st_size=11842, ...}) = 0
 old_mmap(NULL, 11044, PROT_READ|PROT_EXEC, MAP_PRIVATE, 3, 0) = 0x52a58000
 old_mmap(0x52a5a000, 4096, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED, 3, 0x1000) = 0x52a5a000
 close(3)                                = 0
 socket(PF_INET, SOCK_RAW, IPPROTO_RAW)  = 3
 getsockopt(3, SOL_IP, 0x40 /* IP_??? */,
"filter\0\315DW\24\300\0\0\0\0\0\0\0\0x\277\6\343\1\0\0"..., [84]) = 0
 getsockopt(3, SOL_IP, 0x41 /* IP_??? */,
"filter\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., [21828])
= 0
 open("/lib/iptables/libipt_standard.so", O_RDONLY) = 4
 read(4, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0\200\6\0"...,
512) = 512
 fstat64(4, {st_mode=S_IFREG|0755, st_size=7129, ...}) = 0
 old_mmap(NULL, 6840, PROT_READ|PROT_EXEC, MAP_PRIVATE, 4, 0) = 0x52907000
 old_mmap(0x52908000, 4096, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED, 4, 0) = 0x52908000
 close(4)                                = 0
 setsockopt(3, SOL_IP, 0x40 /* IP_??? */,
"filter\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 22276) =
-1 EINVAL (Invalid argument)
 write(2, "iptables: Invalid argument\n", 27iptables: Invalid argument
 ) = 27
 exit_group(1)                           = ?

 Thanks in advance
 NeuronicLapse
