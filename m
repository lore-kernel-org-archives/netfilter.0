From: Ricardo Klein <klein.rfk@gmail.com>
Subject: ipset 6.23 hangs on CentOS6 with hash:mac
Date: Thu, 30 Oct 2014 17:11:02 -0200
Message-ID: <CADuigkVMK8T12S=k4iAj=wX7m7bNna8fW4ZDK_PX5apZjoZWsw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=amJHtJHQae/BT1HdeGOJgzsdU4uKqJf9VgvLfn3rInw=;
        b=aDmKEEBJAVoxllf+UrzxIW4ojQZPS7soGUvdy/Amm5TMEDoqWSgScMrab3A2KK42hk
         77zCKQrBbg8j336dKtCYYn7ztKzT2seuEmsku5wfoKtqaGYJT0WLagpjfGI5IsocqtIX
         kPNC4p6Zl/ujSE11c1RWVZJbDV3ojkl8/60rPF50cD4iVd6ZK/H2Qo2gkwcqBsjEIg/L
         FUVax5ZlIU2CfX+Z/K4SZ4DYQIlUkTvC12z41iwa/mnvxBm4uMS3byRzULqb59RJ/dAR
         d1bZTlVwcQ7htOXvb10G3FD4D5+VoI1b9opVDYBfatOHPq5kKr1rsiKta17P6dcDmZGK
         UmdQ==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter <netfilter@vger.kernel.org>

If I try to create a hash:mac set, like this:
ipset create MACSFREE hash:mac

The console never returns, only if I hit CTRL+C, it works for other
types of sets, here is the strace:

strace ipset create MACSFREE hash:mac
execve("/usr/local/sbin/ipset", ["ipset", "create", "MACSFREE",
"hash:mac"], [/* 30 vars */]) = 0
brk(0)                                  = 0x247e000
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1,
0) = 0x7f45b83d5000
access("/etc/ld.so.preload", R_OK)      = -1 ENOENT (No such file or directory)
open("/etc/ld.so.cache", O_RDONLY)      = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=31216, ...}) = 0
mmap(NULL, 31216, PROT_READ, MAP_PRIVATE, 3, 0) = 0x7f45b83cd000
close(3)                                = 0
open("/usr/lib64/libmnl.so.0", O_RDONLY) = 3
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0
\31\0\0\0\0\0\0"..., 832) = 832
fstat(3, {st_mode=S_IFREG|0755, st_size=18056, ...}) = 0
mmap(NULL, 2113224, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3,
0) = 0x7f45b7fb3000
mprotect(0x7f45b7fb7000, 2093056, PROT_NONE) = 0
mmap(0x7f45b81b6000, 4096, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x3000) = 0x7f45b81b6000
close(3)                                = 0
open("/lib64/libdl.so.2", O_RDONLY)     = 3
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\340\r\0\0\0\0\0\0"...,
832) = 832
fstat(3, {st_mode=S_IFREG|0755, st_size=19536, ...}) = 0
mmap(NULL, 2109696, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3,
0) = 0x7f45b7daf000
mprotect(0x7f45b7db1000, 2097152, PROT_NONE) = 0
mmap(0x7f45b7fb1000, 8192, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x2000) = 0x7f45b7fb1000
close(3)                                = 0
open("/lib64/libc.so.6", O_RDONLY)      = 3
read(3, "\177ELF\2\1\1\3\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0p\356\1\0\0\0\0\0"...,
832) = 832
fstat(3, {st_mode=S_IFREG|0755, st_size=1921176, ...}) = 0
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1,
0) = 0x7f45b83cc000
mmap(NULL, 3750152, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3,
0) = 0x7f45b7a1b000
mprotect(0x7f45b7ba5000, 2097152, PROT_NONE) = 0
mmap(0x7f45b7da5000, 20480, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x18a000) = 0x7f45b7da5000
mmap(0x7f45b7daa000, 18696, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x7f45b7daa000
close(3)                                = 0
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1,
0) = 0x7f45b83cb000
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1,
0) = 0x7f45b83ca000
arch_prctl(ARCH_SET_FS, 0x7f45b83cb700) = 0
mprotect(0x7f45b7da5000, 16384, PROT_READ) = 0
mprotect(0x7f45b7fb1000, 4096, PROT_READ) = 0
mprotect(0x7f45b83d6000, 4096, PROT_READ) = 0
munmap(0x7f45b83cd000, 31216)           = 0
brk(0)                                  = 0x247e000
brk(0x24a2000)                          = 0x24a2000
socket(PF_NETLINK, SOCK_RAW, 12)        = 3
bind(3, {sa_family=AF_NETLINK, pid=0, groups=00000000}, 12) = 0
getsockname(3, {sa_family=AF_NETLINK, pid=42575, groups=00000000}, [12]) = 0
sendto(3, "\34\0\0\0\1\6\1\0\27\214RT\0\0\0\0\2\0\0\0\5\0\1\0\6\0\0\0",
28, 0, {sa_family=AF_NETLINK, pid=0, groups=00000000}, 12) = 28
recvmsg(3, {msg_name(12)={sa_family=AF_NETLINK, pid=0,
groups=00000000},
msg_iov(1)=[{"\34\0\0\0\1\6\0\0\27\214RTO\246\0\0\2\0\0\0\5\0\1\0\6\0\0\0\0\0\0\0"...,
256}], msg_controllen=0, msg_flags=0}, 0) = 28
sendto(3, "4\0\0\0\r\6\1\0\30\214RT\0\0\0\0\2\0\0\0\5\0\1\0\6\0\0\0\r\0\3\0"...,
52, 0, {sa_family=AF_NETLINK, pid=0, groups=00000000}, 12


--
Att...

Ricardo Felipe Klein
klein.rfk@gmail.com
