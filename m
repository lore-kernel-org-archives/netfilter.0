From: Ray Van Dolson <rayvd@digitalpath.net>
Subject: iptables: Invalid argument when using -t nat on CentOS 4.2
Date: Wed, 26 Oct 2005 22:01:48 -0700
Message-ID: <20051027050148.GA3298@digitalpath.net>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Running CentOS 4.2, I wanted to add the pptp/gre conntrack features to my
kernel (2.6.9-22.EL).

Downloaded the latest POM and installed the kernel-sourcecode RPM for CentOS.
Ran patch-o-matic, selected the patches, applied -- no problems yet.

Successfully rebuild kernel with the PPTP/GRE options for netfilter.
Installed kernel & modules and rebooted.

Now is where the fun begins...

Running the following gives me an error now:

/sbin/iptables -A POSTROUTING -t nat -o eth0 -s 192.168.11.0/24 -j MASQUERADE
iptables: Invalid argument

Ok, whoops, forgot to rebuild iptables.  I retrieve the iptables src rpm and
rebuild it and reinstall iptables.  Same problem.

I download the iptables source code and build it manually, installing to
/usr/local.  Run /usr/local/sbin/iptables ... (as above).  Same error.

I note that iptables is probably picking up headers from /usr/include/linux
which are part of the glibc-kernheaders package in CentOS/RHES.  The
/usr/include/linux/netfilter_ipv4 do not include the headers added by the
pptp/gre patches above.  Shot in the dark...

Try and build iptables against /usr/src/linux-2.6.9-22.EL's includes.  No go
-- tells me to use the glibc-kernelheders ones.  So I copy the newly added
pptp/gre headers out of the kernel source dir into
/usr/include/linux/netfilter_ipv4 and rebuild.

Still getting the same invalid argument as above.

Well, maybe kernel modules aren't loading correctly?

[root@langw rc.d]# lsmod
Module                  Size  Used by
ipt_MASQUERADE          3968  0
ip_nat_tftp             4272  0
ip_conntrack_tftp       4464  0
md5                     4352  1
ipv6                  235968  12
autofs4                23684  0
i2c_dev                11776  0
i2c_core               22528  1 i2c_dev
tun                     9472  1
sunrpc                160100  1
iptable_nat            23612  2 ipt_MASQUERADE,ip_nat_tftp
ipt_limit               3200  5
ipt_REJECT              6912  2
ipt_LOG                 6784  2
ipt_multiport           2304  2
ipt_state               2176  5
ip_conntrack           41140  5 ipt_MASQUERADE,ip_nat_tftp,ip_conntrack_tftp,iptable_nat,ipt_state
iptable_filter          3200  1
ip_tables              17152  8 ipt_MASQUERADE,iptable_nat,ipt_limit,ipt_REJECT,ipt_LOG,ipt_multiport,ipt_state,iptable_filter
button                  6928  0
battery                 9220  0
ac                      5124  0
snd_via82xx            26756  0
snd_ac97_codec         64336  1 snd_via82xx
snd_pcm_oss            49592  0
snd_mixer_oss          18432  1 snd_pcm_oss
snd_pcm                97416  2 snd_via82xx,snd_pcm_oss
snd_timer              30340  1 snd_pcm
snd_page_alloc         10120  2 snd_via82xx,snd_pcm
snd_mpu401_uart         9088  1 snd_via82xx
snd_rawmidi            27044  1 snd_mpu401_uart
snd_seq_device          8584  1 snd_rawmidi
snd                    56164  9 snd_via82xx,snd_ac97_codec,snd_pcm_oss,snd_mixer_oss,snd_pcm,snd_timer,snd_mpu401_uart,snd_rawmidi,snd_seq_device
soundcore              10336  1 snd
8139too                26368  0
via_rhine              23560  0
mii                     4992  2 8139too,via_rhine
floppy                 58800  0
dm_snapshot            16836  0
dm_zero                 2304  0
dm_mirror              27632  0
ext3                  116744  2
jbd                    71192  1 ext3
dm_mod                 56468  6 dm_snapshot,dm_zero,dm_mirror

Everything looks good.  I see iptable_nat and ipt_MASQUERADE too!

strace on iptables...

[root@langw iptables-1.2.11.orig]# strace /usr/local/sbin/iptables -A POSTROUTING -t nat -o eth0 -s 192.168.10.0/24 -j MASQUERADE
execve("/usr/local/sbin/iptables", ["/usr/local/sbin/iptables", "-A", "POSTROUTING", "-t", "nat", "-o", "eth0", "-s", "192.168.10.0/24", "-j", "MASQUERADE"], [/* 19 vars */]) = 0
uname({sys="Linux", node="langw.digitalpath.net", ...}) = 0
brk(0)                                  = 0x89e5000
access("/etc/ld.so.preload", R_OK)      = -1 ENOENT (No such file or directory)
open("/etc/ld.so.cache", O_RDONLY)      = 3
fstat64(3, {st_mode=S_IFREG|0644, st_size=35116, ...}) = 0
old_mmap(NULL, 35116, PROT_READ, MAP_PRIVATE, 3, 0) = 0xb7ff7000
close(3)                                = 0
open("/lib/libdl.so.2", O_RDONLY)       = 3
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0\260+c\000"..., 512) = 512
fstat64(3, {st_mode=S_IFREG|0755, st_size=15324, ...}) = 0
old_mmap(0x632000, 12388, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x632000
old_mmap(0x634000, 8192, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x1000) = 0x634000
close(3)                                = 0
open("/lib/libnsl.so.1", O_RDONLY)      = 3
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0\320To\000"..., 512) = 512
fstat64(3, {st_mode=S_IFREG|0755, st_size=95148, ...}) = 0
old_mmap(0x6f2000, 88064, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x6f2000
old_mmap(0x704000, 8192, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x11000) = 0x704000
old_mmap(0x706000, 6144, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x706000
close(3)                                = 0
open("/lib/tls/libc.so.6", O_RDONLY)    = 3
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0\20\257"..., 512) = 512
fstat64(3, {st_mode=S_IFREG|0755, st_size=1454462, ...}) = 0
old_mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0xb7ff6000
old_mmap(0x506000, 1219772, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x506000
old_mmap(0x62a000, 16384, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x124000) = 0x62a000
old_mmap(0x62e000, 7356, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x62e000
close(3)                                = 0
old_mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0xb7ff5000
mprotect(0x62a000, 4096, PROT_READ)     = 0
mprotect(0x502000, 4096, PROT_READ)     = 0
set_thread_area({entry_number:-1 -> 6, base_addr:0xb7ff56c0, limit:1048575, seg_32bit:1, contents:0, read_exec_only:0, limit_in_pages:1, seg_not_present:0, useable:1}) = 0
munmap(0xb7ff7000, 35116)               = 0
brk(0)                                  = 0x89e5000
brk(0x8a06000)                          = 0x8a06000
open("/usr/local/lib/iptables/libipt_MASQUERADE.so", O_RDONLY) = 3
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0\34\4\0"..., 512) = 512
fstat64(3, {st_mode=S_IFREG|0755, st_size=4103, ...}) = 0
old_mmap(NULL, 6432, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) =
0xd54000
old_mmap(0xd55000, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0) = 0xd55000
close(3)                                = 0
socket(PF_INET, SOCK_RAW, IPPROTO_RAW)  = 3
getsockopt(3, SOL_IP, 0x40 /* IP_??? */, "nat\0\264\3545\300\264\3545\300U\0\0\0\305\267\24\300\340"..., [84]) = 0
getsockopt(3, SOL_IP, 0x41 /* IP_??? */, "nat\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., [656]) = 0
setsockopt(3, SOL_IP, 0x40 /* IP_??? */, "nat\0\300\332b\0RADE\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 876) = -1 EINVAL (Invalid argument)
write(2, "iptables: Invalid argument\n", 27iptables: Invalid argument) = 27
exit_group(1)                           = ?
Process 19506 detached

What am I missing here?

This all works perfectly again if I revert to the stock CentOS 2.6.9-22.EL
kernel (without the GRE/PPTP conntrack patches).

gdb on iptables perhaps?

Ray

