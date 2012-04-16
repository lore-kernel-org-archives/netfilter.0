From: Ed W <lists@wildgooses.com>
Subject: Re: ipset causes reverse dns lookups?
Date: Mon, 16 Apr 2012 14:14:11 +0100
Message-ID: <4F8C1B23.8040400@wildgooses.com>
References: <4F8B5925.5020307@wildgooses.com> <4F8B72BB.4010307@wildgooses.com> <4F8B90C4.3070600@wildgooses.com> <alpine.DEB.2.00.1204161001040.20321@blackhole.kfki.hu> <4F8BDA57.4090701@wildgooses.com> <alpine.DEB.2.00.1204161126050.20321@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.00.1204161126050.20321@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter <netfilter@vger.kernel.org>

On 16/04/2012 10:55, Jozsef Kadlecsik wrote:
> Try the following untested patch:
>

Thanks for the idea.  I'm not 100% sure I'm testing correctly, but I 
rebuilt and I see no change...


Does the following strace help any?

$ /tmp/strace /tmp/ipset add cp2 192.168.105.56,58:b0:35:78:0d:f5
execve("/tmp/ipset", ["/tmp/ipset", "add", "cp2", 
"192.168.105.56,58:b0:35:78:0d:f5"], [/* 16 vars */]) = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, 
MAP_PRIVATE|MAP_ANONYMOUS|0x4000000, -1, 0) = 0x4f9cc000
stat("/etc/ld.so.cache", {st_mode=S_IFREG|0644, st_size=6754, ...}) = 0
open("/etc/ld.so.cache", O_RDONLY|O_CLOEXEC) = 3
mmap2(NULL, 6754, PROT_READ, MAP_SHARED, 3, 0) = 0x4f9ca000
close(3)                                = 0
stat("/etc/ld.so.preload", 0x5cc84aec)  = -1 ENOENT (No such file or 
directory)
open("/lib/libmnl.so.0", O_RDONLY)      = 3
fstat(3, {st_mode=S_IFREG|0755, st_size=17580, ...}) = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, 
MAP_PRIVATE|MAP_ANONYMOUS|0x4000000, -1, 0) = 0x4f9c9000
read(3, 
"\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0L\25\0\0004\0\0\0"..., 
4096) = 4096
mmap2(NULL, 24576, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x4f9c3000
mmap2(0x4f9c3000, 13016, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED, 3, 
0) = 0x4f9c3000
mmap2(0x4f9c7000, 4100, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 3, 
0x3) = 0x4f9c7000
close(3)                                = 0
munmap(0x4f9c9000, 4096)                = 0
open("/lib/libgcc_s.so.1", O_RDONLY)    = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=91276, ...}) = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, 
MAP_PRIVATE|MAP_ANONYMOUS|0x4000000, -1, 0) = 0x4f9c9000
read(3, 
"\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0|\"\0\0004\0\0\0"..., 
4096) = 4096
mmap2(NULL, 94208, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x4f9ac000
mmap2(0x4f9ac000, 85844, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED, 3, 
0) = 0x4f9ac000
mmap2(0x4f9c1000, 4120, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 3, 
0x15) = 0x4f9c1000
close(3)                                = 0
munmap(0x4f9c9000, 4096)                = 0
open("/lib/libc.so.0", O_RDONLY)        = 3
fstat(3, {st_mode=S_IFREG|0755, st_size=372132, ...}) = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, 
MAP_PRIVATE|MAP_ANONYMOUS|0x4000000, -1, 0) = 0x4f9c9000
read(3, 
"\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0@\333\0\0004\0\0\0"..., 
4096) = 4096
mmap2(NULL, 397312, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 
0x4f94b000
mmap2(0x4f94b000, 365288, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED, 3, 
0) = 0x4f94b000
mmap2(0x4f9a5000, 4904, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 3, 
0x59) = 0x4f9a5000
mmap2(0x4f9a7000, 19752, PROT_READ|PROT_WRITE, 
MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x4f9a7000
close(3)                                = 0
munmap(0x4f9c9000, 4096)                = 0
open("/lib/libgcc_s.so.1", O_RDONLY)    = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=91276, ...}) = 0
close(3)                                = 0
open("/lib/libc.so.0", O_RDONLY)        = 3
fstat(3, {st_mode=S_IFREG|0755, st_size=372132, ...}) = 0
close(3)                                = 0
open("/lib/libc.so.0", O_RDONLY)        = 3
fstat(3, {st_mode=S_IFREG|0755, st_size=372132, ...}) = 0
close(3)                                = 0
stat("/lib/ld-uClibc.so.0", {st_mode=S_IFREG|0755, st_size=25236, ...}) = 0
munmap(0x4f9ca000, 6754)                = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, 
MAP_PRIVATE|MAP_ANONYMOUS|0x4000000, -1, 0) = 0x4f9cb000
set_thread_area({entry_number:-1 -> 6, base_addr:0x4f9cb6a0, 
limit:1048575, seg_32bit:1, contents:0, read_exec_only:0, 
limit_in_pages:1, seg_not_present:0, useable:1}) = 0
open("/dev/urandom", O_RDONLY)          = 3
read(3, "\254#\3\273", 4)               = 4
close(3)                                = 0
mprotect(0x1409c000, 8192, PROT_READ)   = 0
mprotect(0x4f9c7000, 4096, PROT_READ)   = 0
mprotect(0x4f9c1000, 4096, PROT_READ)   = 0
mprotect(0x4f9a5000, 4096, PROT_READ)   = 0
mprotect(0x4f9d4000, 4096, PROT_READ)   = 0
ioctl(0, SNDCTL_TMR_TIMEBASE or SNDRV_TIMER_IOCTL_NEXT_DEVICE or TCGETS, 
{B38400 opost isig icanon echo ...}) = 0
ioctl(1, SNDCTL_TMR_TIMEBASE or SNDRV_TIMER_IOCTL_NEXT_DEVICE or TCGETS, 
{B38400 opost isig icanon echo ...}) = 0
brk(0)                                  = 0x142dc390
brk(0x142e0390)                         = 0x142e0390
brk(0x142e1000)                         = 0x142e1000
socket(PF_NETLINK, SOCK_RAW, 12)        = 3
bind(3, {sa_family=AF_NETLINK, pid=0, groups=00000000}, 12) = 0
getsockname(3, {sa_family=AF_NETLINK, pid=11097, groups=00000000}, [12]) = 0
time(NULL)                              = 1334580838
sendto(3, "\34\0\0\0\1\6\1\0g\26\214O\0\0\0\0\2\0\0\0\5\0\1\0\6\0\0\0", 
28, 0, {sa_family=AF_NETLINK, pid=0, groups=00000000}, 12) = 28
recvmsg(3, {msg_name(12)={sa_family=AF_NETLINK, pid=0, groups=00000000}, 
msg_iov(1)=[{"\34\0\0\0\1\6\0\0g\26\214OY+\0\0\2\0\0\0\5\0\1\0\6\0\0\0\0\0\0\0"..., 
256}], msg_controllen=0, msg_flags=0}, 0) = 28
sendto(3, 
"$\0\0\0\f\6\1\0h\26\214O\0\0\0\0\2\0\0\0\5\0\1\0\6\0\0\0\10\0\2\0"..., 
36, 0, {sa_family=AF_NETLINK, pid=0, groups=00000000}, 12) = 36
recvmsg(3, {msg_name(12)={sa_family=AF_NETLINK, pid=0, groups=00000000}, 
msg_iov(1)=[{"H\0\0\0\f\6\0\0h\26\214OY+\0\0\2\0\0\0\5\0\1\0\6\0\0\0\10\0\2\0"..., 
256}], msg_controllen=0, msg_flags=0}, 0) = 72
socket(PF_NETLINK, SOCK_RAW, 0)         = 4
bind(4, {sa_family=AF_NETLINK, pid=0, groups=00000000}, 12) = 0
getsockname(4, {sa_family=AF_NETLINK, pid=11097, groups=00000000}, [12]) = 0
time(NULL)                              = 1334580838
sendto(4, "\24\0\0\0\22\0\1\3f\26\214O\0\0\0\0\0\0\0\0", 20, 0, 
{sa_family=AF_NETLINK, pid=0, groups=00000000}, 12) = 20
recvmsg(4, {msg_name(12)={sa_family=AF_NETLINK, pid=0, groups=00000000}, 
msg_iov(1)=[{"\340\3\0\0\20\0\2\0f\26\214OY+\0\0\0\0\4\3\1\0\0\0I\0\1\0\0\0\0\0"..., 
4096}], msg_controllen=0, msg_flags=0}, 0) = 3012
recvmsg(4, {msg_name(12)={sa_family=AF_NETLINK, pid=0, groups=00000000}, 
msg_iov(1)=[{"\360\3\0\0\20\0\2\0f\26\214OY+\0\0\0\0\1\0\4\0\0\0\3\20\0\0\0\0\0\0"..., 
4096}], msg_controllen=0, msg_flags=0}, 0) = 2996
brk(0x142e2000)                         = 0x142e2000
recvmsg(4, {msg_name(12)={sa_family=AF_NETLINK, pid=0, groups=00000000}, 
msg_iov(1)=[{"\334\3\0\0\20\0\2\0f\26\214OY+\0\0\0\0\0\3\7\0\0\0\200\0\0\0\0\0\0\0"..., 
4096}], msg_controllen=0, msg_flags=0}, 0) = 2988
recvmsg(4, {msg_name(12)={sa_family=AF_NETLINK, pid=0, groups=00000000}, 
msg_iov(1)=[{"\360\3\0\0\20\0\2\0f\26\214OY+\0\0\0\0\1\0\n\0\0\0C\20\1\0\0\0\0\0"..., 
4096}], msg_controllen=0, msg_flags=0}, 0) = 2984
brk(0x142e3000)                         = 0x142e3000
recvmsg(4, {msg_name(12)={sa_family=AF_NETLINK, pid=0, groups=00000000}, 
msg_iov(1)=[{"\320\3\0\0\20\0\2\0f\26\214OY+\0\0\0\0\0\2\r\0\0\0\321\20\1\0\0\0\0\0"..., 
4096}], msg_controllen=0, msg_flags=0}, 0) = 2972
brk(0x142e4000)                         = 0x142e4000
recvmsg(4, {msg_name(12)={sa_family=AF_NETLINK, pid=0, groups=00000000}, 
msg_iov(1)=[{"\360\3\0\0\20\0\2\0f\26\214OY+\0\0\0\0\1\0\20\0\0\0C\20\1\0\0\0\0\0"..., 
4096}], msg_controllen=0, msg_flags=0}, 0) = 1008
recvmsg(4, {msg_name(12)={sa_family=AF_NETLINK, pid=0, groups=00000000}, 
msg_iov(1)=[{"\24\0\0\0\3\0\2\0f\26\214OY+\0\0\0\0\0\0\20\0\0\0C\20\1\0\0\0\0\0"..., 
4096}], msg_controllen=0, msg_flags=0}, 0) = 20
sendto(4, "\24\0\0\0\26\0\1\3g\26\214O\0\0\0\0\0\0\0\0", 20, 0, 
{sa_family=AF_NETLINK, pid=0, groups=00000000}, 12) = 20
recvmsg(4, {msg_name(12)={sa_family=AF_NETLINK, pid=0, groups=00000000}, 
msg_iov(1)=[{"0\0\0\0\24\0\2\0g\26\214OY+\0\0\2\10\200\376\1\0\0\0\10\0\1\0\177\0\0\1"..., 
4096}], msg_controllen=0, msg_flags=0}, 0) = 268
recvmsg(4, {msg_name(12)={sa_family=AF_NETLINK, pid=0, groups=00000000}, 
msg_iov(1)=[{"@\0\0\0\24\0\2\0g\26\214OY+\0\0\n\200\200\376\1\0\0\0\24\0\1\0\0\0\0\0"..., 
4096}], msg_controllen=0, msg_flags=0}, 0) = 384
recvmsg(4, {msg_name(12)={sa_family=AF_NETLINK, pid=0, groups=00000000}, 
msg_iov(1)=[{"\24\0\0\0\3\0\2\0g\26\214OY+\0\0\0\0\0\0\1\0\0\0\24\0\1\0\0\0\0\0"..., 
4096}], msg_controllen=0, msg_flags=0}, 0) = 20
brk(0x142e5000)                         = 0x142e5000
close(4)                                = 0
open("/etc/hosts", O_RDONLY)            = 4
ioctl(4, SNDCTL_TMR_TIMEBASE or SNDRV_TIMER_IOCTL_NEXT_DEVICE or TCGETS, 
0x5cc842c8) = -1 ENOTTY (Inappropriate ioctl for device)
read(4, "# /etc/hosts: Local Host Databas"..., 4096) = 1061
read(4, "", 4096)                       = 0
close(4)                                = 0
stat64("/etc/resolv.conf", {st_mode=S_IFREG|0644, st_size=174, ...}) = 0
open("/etc/resolv.conf", O_RDONLY)      = 4
ioctl(4, SNDCTL_TMR_TIMEBASE or SNDRV_TIMER_IOCTL_NEXT_DEVICE or TCGETS, 
0x5cc83f70) = -1 ENOTTY (Inappropriate ioctl for device)
read(4, "# Generated by resolvconf\nsearch"..., 4096) = 174
read(4, "", 4096)                       = 0
close(4)                                = 0
socket(PF_INET, SOCK_DGRAM, IPPROTO_UDP) = 4
connect(4, {sa_family=AF_INET, sin_port=htons(53), 
sin_addr=inet_addr("127.0.0.1")}, 28) = 0
send(4, "\0\2\1\0\0\1\0\0\0\0\0\0\00256\003105\003168\003192\7in-a"..., 
45, 0) = 45
poll([{fd=4, events=POLLIN}], 1, 5000)  = 1 ([{fd=4, revents=POLLIN}])
recv(4, 
"\0\2\205\203\0\1\0\0\0\0\0\0\00256\003105\003168\003192\7in-a"..., 512, 
MSG_DONTWAIT) = 45
close(4)                                = 0
stat64("/etc/resolv.conf", {st_mode=S_IFREG|0644, st_size=174, ...}) = 0
socket(PF_INET, SOCK_DGRAM, IPPROTO_UDP) = 4
connect(4, {sa_family=AF_INET, sin_port=htons(53), 
sin_addr=inet_addr("127.0.0.1")}, 28) = 0
send(4, "\0\3\1\0\0\1\0\0\0\0\0\0\00256\003105\003168\003192\7in-a"..., 
65, 0) = 65
poll([{fd=4, events=POLLIN}], 1, 5000)  = 0 (Timeout)
close(4)                                = 0
stat64("/etc/resolv.conf", {st_mode=S_IFREG|0644, st_size=174, ...}) = 0
socket(PF_INET, SOCK_DGRAM, IPPROTO_UDP) = 4
connect(4, {sa_family=AF_INET, sin_port=htons(53), 
sin_addr=inet_addr("192.168.105.212")}, 28) = 0
send(4, "\0\4\1\0\0\1\0\0\0\0\0\0\00256\003105\003168\003192\7in-a"..., 
45, 0) = 45
poll([{fd=4, events=POLLIN}], 1, 5000)  = 0 (Timeout)
close(4)                                = 0
stat64("/etc/resolv.conf", {st_mode=S_IFREG|0644, st_size=174, ...}) = 0
socket(PF_INET, SOCK_DGRAM, IPPROTO_UDP) = 4
connect(4, {sa_family=AF_INET, sin_port=htons(53), 
sin_addr=inet_addr("8.8.8.8")}, 28) = 0
send(4, "\0\5\1\0\0\1\0\0\0\0\0\0\00256\003105\003168\003192\7in-a"..., 
45, 0) = 45
poll([{fd=4, events=POLLIN}], 1, 5000)  = 0 (Timeout)
close(4)                                = 0
stat64("/etc/resolv.conf", {st_mode=S_IFREG|0644, st_size=174, ...}) = 0
socket(PF_INET, SOCK_DGRAM, IPPROTO_UDP) = 4
connect(4, {sa_family=AF_INET, sin_port=htons(53), 
sin_addr=inet_addr("8.8.4.4")}, 28) = 0
send(4, "\0\6\1\0\0\1\0\0\0\0\0\0\00256\003105\003168\003192\7in-a"..., 
45, 0) = 45
poll([{fd=4, events=POLLIN}], 1, 5000)  = 0 (Timeout)
close(4)                                = 0
stat64("/etc/resolv.conf", {st_mode=S_IFREG|0644, st_size=174, ...}) = 0
socket(PF_INET, SOCK_DGRAM, IPPROTO_UDP) = 4
connect(4, {sa_family=AF_INET, sin_port=htons(53), 
sin_addr=inet_addr("127.0.0.1")}, 28) = 0
send(4, "\0\7\1\0\0\1\0\0\0\0\0\0\00256\003105\003168\003192\7in-a"..., 
45, 0) = 45
poll([{fd=4, events=POLLIN}], 1, 5000)  = 1 ([{fd=4, revents=POLLIN}])
recv(4, 
"\0\7\205\203\0\1\0\0\0\0\0\0\00256\003105\003168\003192\7in-a"..., 512, 
MSG_DONTWAIT) = 45
close(4)                                = 0
stat64("/etc/resolv.conf", {st_mode=S_IFREG|0644, st_size=174, ...}) = 0
socket(PF_INET, SOCK_DGRAM, IPPROTO_UDP) = 4
connect(4, {sa_family=AF_INET, sin_port=htons(53), 
sin_addr=inet_addr("127.0.0.1")}, 28) = 0
send(4, "\0\10\1\0\0\1\0\0\0\0\0\0\00256\003105\003168\003192\7in-a"..., 
65, 0) = 65
poll([{fd=4, events=POLLIN}], 1, 5000)  = 0 (Timeout)
close(4)                                = 0
stat64("/etc/resolv.conf", {st_mode=S_IFREG|0644, st_size=174, ...}) = 0
socket(PF_INET, SOCK_DGRAM, IPPROTO_UDP) = 4
connect(4, {sa_family=AF_INET, sin_port=htons(53), 
sin_addr=inet_addr("192.168.105.212")}, 28) = 0
send(4, "\0\t\1\0\0\1\0\0\0\0\0\0\00256\003105\003168\003192\7in-a"..., 
45, 0) = 45
poll([{fd=4, events=POLLIN}], 1, 5000^C <unfinished ...>
