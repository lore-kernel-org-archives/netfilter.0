From: "Chris Aseltine" <ophidian@newsnation.com>
Subject: trouble with DNAT on linux 2.6.23.1 and iptables 1.4.0rc1
Date: Sat, 27 Oct 2007 23:31:44 -0500
Message-ID: <002101c8191b$72204cf0$0902a8c0@mystery1>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

I'm trying to forward a TCP port from my public IP address to a private IP
address on my LAN, with a command like this:

/usr/sbin/iptables -t nat -A PREROUTING -p tcp --dport 8089 -j DNAT --to
192.168.224.2:8089

I believe the syntax is correct, as it works on an older 2.4 system without
a problem.

When I ran it on another system running kernel 2.6.23.1, with iptables 1.3.5
(which is what was already installed on the machine), I got:

iptables: Unknown error 4294967295

I upgraded to 1.4.0rc1, and now I get:

iptables: No chain/target/match by that name

I got the impression from searching around that this meant I am missing a
kernel module, but I don't know which one it could be as I believe I've
built/loaded every one that could possibly be relevant.

The strace and lsmod output follows.  Hope someone has an idea.

lsmod:

[root@linux /home/caseltine]# lsmod
Module                  Size  Used by
ipt_NETMAP              5888  0
ppp_synctty            11136  0
ppp_async              12420  1
crc_ccitt               6016  1 ppp_async
ppp_generic            21396  6 ppp_synctty,ppp_async
slhc                    9344  1 ppp_generic
iptable_filter          6404  1
xt_state                6144  2
iptable_nat             9860  1
nf_conntrack_ipv4      16776  3 iptable_nat
nf_nat_ftp              6788  0
nf_conntrack_ftp       11048  1 nf_nat_ftp
ipt_MASQUERADE          6784  2
nf_nat                 19116  4
ipt_NETMAP,iptable_nat,nf_nat_ftp,ipt_MASQUERADE
nf_conntrack           51408  7
xt_state,iptable_nat,nf_conntrack_ipv4,nf_nat_ftp,nf_conntrack_ftp,ipt_MASQU
ERADE,nf_nat
nfnetlink               8344  3 nf_conntrack_ipv4,nf_nat,nf_conntrack
ip_tables              14036  2 iptable_filter,iptable_nat
x_tables               14596  5
ipt_NETMAP,xt_state,iptable_nat,ipt_MASQUERADE,ip_tables
ide_scsi               17548  0
vfat                   13696  0
ntfs                  198336  0
fat                    46364  1 vfat
bridge                 48792  0
llc                     9620  1 bridge
tun                    11904  1
usb_storage            37124  0
cdc_acm                16544  0
usbhid                 21552  0
hid                    28548  1 usbhid
sd_mod                 25216  0
sg                     24868  0
uhci_hcd               23828  0
ohci_hcd               20108  0
ehci_hcd               28952  0
usbcore               110344  7
usb_storage,cdc_acm,usbhid,uhci_hcd,ohci_hcd,ehci_hcd
tulip                  48544  0
8139too                23824  0
[root@linux /home/caseltine]#

strace:

[root@linux /home/caseltine]# strace /usr/sbin/iptables -t nat -A
PREROUTING -p tcp --dport 8089 -j DNAT --to 192.168.224.2:8089
execve("/usr/sbin/iptables", ["/usr/sbin/iptables", "-t", "nat", "-A",
"PREROUTING", "-p", "tcp", "--dport", "8089", "-j", "DNAT", "--to",
"192.168.224.2:8089"], [/* 28 vars */]) = 0
uname({sys="Linux", node="linux", ...}) = 0
brk(0)                                  = 0x8054000
access("/etc/ld.so.preload", R_OK)      = -1 ENOENT (No such file or
directory)
open("/etc/ld.so.cache", O_RDONLY)      = 3
fstat64(3, {st_mode=S_IFREG|0644, st_size=51165, ...}) = 0
mmap2(NULL, 51165, PROT_READ, MAP_PRIVATE, 3, 0) = 0xb7f90000
close(3)                                = 0
open("/lib/tls/libdl.so.2", O_RDONLY)   = 3
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0\320\v\0"..., 512) =
512
fstat64(3, {st_mode=S_IFREG|0755, st_size=13120, ...}) = 0
mmap2(NULL, 12392, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) =
0xb7f8c000
mmap2(0xb7f8e000, 8192, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x1) = 0xb7f8e000
close(3)                                = 0
open("/lib/tls/libc.so.6", O_RDONLY)    = 3
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0\20O\1\000"..., 512)
= 512
fstat64(3, {st_mode=S_IFREG|0755, st_size=1441201, ...}) = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) =
0xb7f8b000
mmap2(NULL, 1240284, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) =
0xb7e5c000
mmap2(0xb7f85000, 16384, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x128) = 0xb7f85000
mmap2(0xb7f89000, 7388, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0xb7f89000
close(3)                                = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) =
0xb7e5b000
mprotect(0xb7f85000, 4096, PROT_READ)   = 0
set_thread_area({entry_number:-1 -> 6, base_addr:0xb7e5b6c0, limit:1048575,
seg_32bit:1, contents:0, read_exec_only:0, limit_in_pages:1,
seg_not_present:0, useable:1}) = 0
munmap(0xb7f90000, 51165)               = 0
brk(0)                                  = 0x8054000
brk(0x8075000)                          = 0x8075000
open("/etc/nsswitch.conf", O_RDONLY)    = 3
fstat64(3, {st_mode=S_IFREG|0644, st_size=1083, ...}) = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) =
0xb7f9c000
read(3, "#\n# /etc/nsswitch.conf\n#\n# An ex"..., 4096) = 1083
read(3, "", 4096)                       = 0
close(3)                                = 0
munmap(0xb7f9c000, 4096)                = 0
open("/etc/ld.so.cache", O_RDONLY)      = 3
fstat64(3, {st_mode=S_IFREG|0644, st_size=51165, ...}) = 0
mmap2(NULL, 51165, PROT_READ, MAP_PRIVATE, 3, 0) = 0xb7f90000
close(3)                                = 0
open("/lib/tls/libnss_files.so.2", O_RDONLY) = 3
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0P\33\0\000"..., 512)
= 512
fstat64(3, {st_mode=S_IFREG|0755, st_size=45361, ...}) = 0
mmap2(NULL, 41612, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) =
0xb7e50000
mmap2(0xb7e59000, 8192, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x8) = 0xb7e59000
close(3)                                = 0
munmap(0xb7f90000, 51165)               = 0
open("/etc/protocols", O_RDONLY)        = 3
fcntl64(3, F_GETFD)                     = 0
fcntl64(3, F_SETFD, FD_CLOEXEC)         = 0
fstat64(3, {st_mode=S_IFREG|0644, st_size=5748, ...}) = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) =
0xb7f9c000
read(3, "#\n# Internet protocols\n#\n# $Free"..., 4096) = 4096
close(3)                                = 0
munmap(0xb7f9c000, 4096)                = 0
open("/usr/lib/iptables/libxt_tcp.so", O_RDONLY) = 3
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0\300\10"..., 512) =
512
fstat64(3, {st_mode=S_IFREG|0755, st_size=12672, ...}) = 0
mmap2(NULL, 11136, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) =
0xb7f9a000
mmap2(0xb7f9c000, 4096, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x1) = 0xb7f9c000
close(3)                                = 0
open("/usr/lib/iptables/libxt_DNAT.so", O_RDONLY) = -1 ENOENT (No such file
or directory)
open("/usr/lib/iptables/libipt_DNAT.so", O_RDONLY) = 3
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0p\7\0\000"..., 512)
= 512
fstat64(3, {st_mode=S_IFREG|0755, st_size=10094, ...}) = 0
mmap2(NULL, 8900, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) =
0xb7f97000
mmap2(0xb7f99000, 4096, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x1) = 0xb7f99000
close(3)                                = 0
socket(PF_INET, SOCK_RAW, IPPROTO_RAW)  = 3
getsockopt(3, SOL_IP, 0x40 /* IP_??? */, "nat\0Y\2\0\0\0\0\0\0\0\0
\0\0\0\0\0\1\0\0\0\2\0\0\0\250"..., [84]) = 0
getsockopt(3, SOL_IP, 0x41 /* IP_??? */,
"nat\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., [984]) = 0
setsockopt(3, SOL_IP, 0x40 /* IP_??? */,
"nat\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 1248) = -1
ENOENT (No such file or directory)
write(2, "iptables: No chain/target/match "..., 45iptables: No
chain/target/match by that name
) = 45
exit_group(1)                           = ?
Process 17039 detached
[root@linux /home/caseltine]#

