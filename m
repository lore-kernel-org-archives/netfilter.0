From: Saravanan Chanemouganandam <schane@osmozis.com>
Subject: iptables library loading problem
Date: Tue, 18 Dec 2007 16:05:27 +0100
Message-ID: <200712181605.28712.schane@osmozis.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1628437386=="
Return-path: <busybox-bounces@busybox.net>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://busybox.net/cgi-bin/mailman/listinfo/busybox>,
	<mailto:busybox-request@busybox.net?subject=unsubscribe>
List-Archive: <http://busybox.net/lists/busybox>
List-Post: <mailto:busybox@busybox.net>
List-Help: <mailto:busybox-request@busybox.net?subject=help>
List-Subscribe: <http://busybox.net/cgi-bin/mailman/listinfo/busybox>,
	<mailto:busybox-request@busybox.net?subject=subscribe>
Mime-version: 1.0
Sender: busybox-bounces@busybox.net
Errors-To: busybox-bounces@busybox.net
To: netfilter@vger.kernel.org
Cc: busybox@busybox.net, linux@arm.linux.org.uk

--===============1628437386==
Content-Type: multipart/alternative;
  boundary="Boundary-00=_4G+ZHFhfIXaQ706"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--Boundary-00=_4G+ZHFhfIXaQ706
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi all,

I have an issue in using netfilter iptables and xtables support built into the 
linux 2.6.16 kernel image on the arm target platform. The problem is that 
when a iptables command is executed with xtables supports, it doesn't find 
the required libraries installed in /lib/iptables and instead it looks 
into /lib [ open("/lib/libipt_MASQUERADE.so", O_RDONLY) = -1 ENOENT (No such 
file or directory) ] and throws 
sara# iptables -t nat -A POSTROUTING -o br_wan -j MASQUERADE
iptables v1.3.8: Couldn't load target `MASQUERADE':File not found

Try `iptables -h' or 'iptables --help' for more information.

Where as it works fine, if I move all /lib/iptables/*.so to /lib. Is there 
anything Iam missing like symbolic links or PATH, while installing iptables 
using  make BINDIR=../root/sbin LIBDIR=../root/lib install

Here is the strace message of 
sara#strace iptables -t nat -A POSTROUTING -o br_wan -j MASQUERADE
execve("/sbin/iptables", ["iptables", "-t", "nat", "-A", "POSTROUTING", "-o", 
"br_wan", "-j", "MASQUERADE"],0
mmap2(NULL, 20, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 
0x40005000
stat("/etc/ld.so.cache", {st_mode=S_IFREG|0644, st_size=698, ...}) = 0
open("/etc/ld.so.cache", O_RDONLY)      = 3
mmap2(NULL, 698, PROT_READ, MAP_SHARED, 3, 0) = 0x40006000
close(3)                                = 0
open("/lib/libdl.so.0", O_RDONLY)       = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=8900, ...}) = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 
0x40007000
read(3, "\177ELF\1\1\1a\0\0\0\0\0\0\0\0\3\0(\0\1\0\0\0(\10\0\000"..., 4096) = 
4096
mmap2(NULL, 40960, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x4000e000
mmap2(0x4000e000, 5824, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED, 3, 0) = 
0x4000e000
mmap2(0x40017000, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 3, 0x1) = 
0x40017000
close(3)                                = 0
munmap(0x40007000, 4096)                = 0
open("/lib/libgcc_s.so.1", O_RDONLY)    = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=60315, ...}) = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 
0x40007000
read(3, "\177ELF\1\1\1a\0\0\0\0\0\0\0\0\3\0(\0\1\0\0\0\320\31\0"..., 4096) = 
4096
mmap2(NULL, 69632, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x40018000
mmap2(0x40018000, 34728, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED, 3, 0) = 
0x40018000
mmap2(0x40028000, 2380, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 3, 0x8) = 
0x40028000
close(3)                                = 0
munmap(0x40007000, 4096)                = 0
open("/lib/libc.so.0", O_RDONLY)        = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=227484, ...}) = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 
0x40007000
read(3, "\177ELF\1\1\1a\0\0\0\0\0\0\0\0\3\0(\0\1\0\0\0\0\201\0\000"..., 4096) 
= 4096
mmap2(NULL, 278528, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x40029000
mmap2(0x40029000, 222048, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED, 3, 0) = 
0x40029000
mmap2(0x40067000, 4960, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 3, 0x36) 
= 0x40067000
mmap2(0x40069000, 13592, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|
MAP_ANONYMOUS, -1, 0) = 0x40069000
close(3)                                = 0
munmap(0x40007000, 4096)                = 0
open("/lib/libc.so.0", O_RDONLY)        = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=227484, ...}) = 0
close(3)                                = 0
open("/lib/libc.so.0", O_RDONLY)        = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=227484, ...}) = 0
close(3)                                = 0
munmap(0x40006000, 698)                 = 0
stat("/lib/ld-uClibc.so.0", {st_mode=S_IFREG|0755, st_size=21096, ...}) = 0
mprotect(0x40017000, 4096, PROT_READ)   = 0
mprotect(0x40067000, 4096, PROT_READ)   = 0
mprotect(0x4000c000, 4096, PROT_READ)   = 0
ioctl(0, SNDCTL_TMR_TIMEBASE or TCGETS, {B38400 opost isig icanon echo ...}) = 
0
ioctl(1, SNDCTL_TMR_TIMEBASE or TCGETS, {B38400 opost isig icanon echo ...}) = 
0
stat("/etc/ld.so.cache", {st_mode=S_IFREG|0644, st_size=698, ...}) = 0
open("/etc/ld.so.cache", O_RDONLY)      = 3
mmap2(NULL, 698, PROT_READ, MAP_SHARED, 3, 0) = 0x40006000
close(3)                                = 0
open("/home/sara/BuildRoot/buildroot/project_build_arm/uclibc/root/lib/iptables/libipt_MASQUERADE.so", 
O_RDO)
open("/lib/libipt_MASQUERADE.so", O_RDONLY) = -1 ENOENT (No such file or 
directory)
open("/lib/libipt_MASQUERADE.so", O_RDONLY) = -1 ENOENT (No such file or 
directory)
open("/usr/lib/libipt_MASQUERADE.so", O_RDONLY) = -1 ENOENT (No such file or 
directory)
munmap(0x40006000, 698)                 = 0
brk(0)                                  = 0x1c000
brk(0x1d000)                            = 0x1d000
socket(PF_INET, SOCK_RAW, IPPROTO_RAW)  = 3
getsockopt(3, SOL_IP, 0x40 /* IP_??? */, 
"nat\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., [84])0
getsockopt(3, SOL_IP, 0x41 /* IP_??? */, 
"nat\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., [656]0
stat("/etc/ld.so.cache", {st_mode=S_IFREG|0644, st_size=698, ...}) = 0
open("/etc/ld.so.cache", O_RDONLY)      = 4
mmap2(NULL, 698, PROT_READ, MAP_SHARED, 4, 0) = 0x40006000
close(4)                                = 0
open("/home/sara/BuildRoot/buildroot/project_build_arm/uclibc/root/lib/iptables/libipt_MASQUERADE.so", 
O_RDO)
open("/lib/libipt_MASQUERADE.so", O_RDONLY) = -1 ENOENT (No such file or 
directory)
open("/lib/libipt_MASQUERADE.so", O_RDONLY) = -1 ENOENT (No such file or 
directory)
open("/usr/lib/libipt_MASQUERADE.so", O_RDONLY) = -1 ENOENT (No such file or 
directory)
munmap(0x40006000, 698)                 = 0
write(2, "iptables", 8iptables)                 = 8
write(2, " v", 2 v)                       = 2
write(2, "1.3.8", 51.3.8)                    = 5
write(2, ": ", 2: )                       = 2
write(2, "Couldn\'t load target `", 22Couldn't load target `) = 22
write(2, "MASQUERADE", 10MASQUERADE)              = 10
write(2, "\':", 2':)                      = 2
write(2, "File not found", 14File not found)          = 14
write(2, "\n", 1
)                       = 1

Can anybody tell me why it doesnt find the needed libraries in 
the /lib/iptables ? 

Thanks
Sara
--Boundary-00=_4G+ZHFhfIXaQ706
Content-Type: text/html;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

<html><head><meta name="qrichtext" content="1" /></head><body style="font-size:12pt;font-family:Bitstream Vera Sans">
<p>Hi all,</p>
<p></p>
<p>I have an issue in using netfilter iptables and xtables support built into the linux 2.6.16 kernel image on the arm target platform. The problem is that when a iptables command is executed with xtables supports, it doesn't find the required libraries installed in /lib/iptables and instead it looks into /lib <span style="font-weight:600">[ open(&quot;/lib/libipt_MASQUERADE.so&quot;, O_RDONLY) = -1 ENOENT (No such file or directory) ] </span>and throws </p>
<p>sara# iptables -t nat -A POSTROUTING -o br_wan -j MASQUERADE</p>
<p>iptables v1.3.8: Couldn't load target `MASQUERADE':File not found</p>
<p></p>
<p>Try `iptables -h' or 'iptables --help' for more information.</p>
<p></p>
<p>Where as it works fine, if I move all /lib/iptables/*.so to /lib. Is there anything Iam missing like symbolic links or PATH, while installing iptables using  make BINDIR=../root/sbin LIBDIR=../root/lib install</p>
<p></p>
<p>Here is the strace message of </p>
<p>sara#strace iptables -t nat -A POSTROUTING -o br_wan -j MASQUERADE</p>
<p>execve(&quot;/sbin/iptables&quot;, [&quot;iptables&quot;, &quot;-t&quot;, &quot;nat&quot;, &quot;-A&quot;, &quot;POSTROUTING&quot;, &quot;-o&quot;, &quot;br_wan&quot;, &quot;-j&quot;, &quot;MASQUERADE&quot;],0</p>
<p>mmap2(NULL, 20, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x40005000</p>
<p>stat(&quot;/etc/ld.so.cache&quot;, {st_mode=S_IFREG|0644, st_size=698, ...}) = 0</p>
<p>open(&quot;/etc/ld.so.cache&quot;, O_RDONLY)      = 3</p>
<p>mmap2(NULL, 698, PROT_READ, MAP_SHARED, 3, 0) = 0x40006000</p>
<p>close(3)                                = 0</p>
<p>open(&quot;/lib/libdl.so.0&quot;, O_RDONLY)       = 3</p>
<p>fstat(3, {st_mode=S_IFREG|0644, st_size=8900, ...}) = 0</p>
<p>mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x40007000</p>
<p>read(3, &quot;\177ELF\1\1\1a\0\0\0\0\0\0\0\0\3\0(\0\1\0\0\0(\10\0\000&quot;..., 4096) = 4096</p>
<p>mmap2(NULL, 40960, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x4000e000</p>
<p>mmap2(0x4000e000, 5824, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED, 3, 0) = 0x4000e000</p>
<p>mmap2(0x40017000, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 3, 0x1) = 0x40017000</p>
<p>close(3)                                = 0</p>
<p>munmap(0x40007000, 4096)                = 0</p>
<p>open(&quot;/lib/libgcc_s.so.1&quot;, O_RDONLY)    = 3</p>
<p>fstat(3, {st_mode=S_IFREG|0644, st_size=60315, ...}) = 0</p>
<p>mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x40007000</p>
<p>read(3, &quot;\177ELF\1\1\1a\0\0\0\0\0\0\0\0\3\0(\0\1\0\0\0\320\31\0&quot;..., 4096) = 4096</p>
<p>mmap2(NULL, 69632, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x40018000</p>
<p>mmap2(0x40018000, 34728, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED, 3, 0) = 0x40018000</p>
<p>mmap2(0x40028000, 2380, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 3, 0x8) = 0x40028000</p>
<p>close(3)                                = 0</p>
<p>munmap(0x40007000, 4096)                = 0</p>
<p>open(&quot;/lib/libc.so.0&quot;, O_RDONLY)        = 3</p>
<p>fstat(3, {st_mode=S_IFREG|0644, st_size=227484, ...}) = 0</p>
<p>mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x40007000</p>
<p>read(3, &quot;\177ELF\1\1\1a\0\0\0\0\0\0\0\0\3\0(\0\1\0\0\0\0\201\0\000&quot;..., 4096) = 4096</p>
<p>mmap2(NULL, 278528, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x40029000</p>
<p>mmap2(0x40029000, 222048, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED, 3, 0) = 0x40029000</p>
<p>mmap2(0x40067000, 4960, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 3, 0x36) = 0x40067000</p>
<p>mmap2(0x40069000, 13592, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x40069000</p>
<p>close(3)                                = 0</p>
<p>munmap(0x40007000, 4096)                = 0</p>
<p>open(&quot;/lib/libc.so.0&quot;, O_RDONLY)        = 3</p>
<p>fstat(3, {st_mode=S_IFREG|0644, st_size=227484, ...}) = 0</p>
<p>close(3)                                = 0</p>
<p>open(&quot;/lib/libc.so.0&quot;, O_RDONLY)        = 3</p>
<p>fstat(3, {st_mode=S_IFREG|0644, st_size=227484, ...}) = 0</p>
<p>close(3)                                = 0</p>
<p>munmap(0x40006000, 698)                 = 0</p>
<p>stat(&quot;/lib/ld-uClibc.so.0&quot;, {st_mode=S_IFREG|0755, st_size=21096, ...}) = 0</p>
<p>mprotect(0x40017000, 4096, PROT_READ)   = 0</p>
<p>mprotect(0x40067000, 4096, PROT_READ)   = 0</p>
<p>mprotect(0x4000c000, 4096, PROT_READ)   = 0</p>
<p>ioctl(0, SNDCTL_TMR_TIMEBASE or TCGETS, {B38400 opost isig icanon echo ...}) = 0</p>
<p>ioctl(1, SNDCTL_TMR_TIMEBASE or TCGETS, {B38400 opost isig icanon echo ...}) = 0</p>
<p>stat(&quot;/etc/ld.so.cache&quot;, {st_mode=S_IFREG|0644, st_size=698, ...}) = 0</p>
<p>open(&quot;/etc/ld.so.cache&quot;, O_RDONLY)      = 3</p>
<p>mmap2(NULL, 698, PROT_READ, MAP_SHARED, 3, 0) = 0x40006000</p>
<p>close(3)                                = 0</p>
<p><span style="font-weight:600">open(&quot;/home/sara/BuildRoot/buildroot/project_build_arm/uclibc/root/lib/iptables/libipt_MASQUERADE.so&quot;, O_RDO)</span></p>
<p><span style="font-weight:600">open(&quot;/lib/libipt_MASQUERADE.so&quot;, O_RDONLY) = -1 ENOENT (No such file or directory)</span></p>
<p><span style="font-weight:600">open(&quot;/lib/libipt_MASQUERADE.so&quot;, O_RDONLY) = -1 ENOENT (No such file or directory)</span></p>
<p><span style="font-weight:600">open(&quot;/usr/lib/libipt_MASQUERADE.so&quot;, O_RDONLY) = -1 ENOENT (No such file or directory)</span></p>
<p>munmap(0x40006000, 698)                 = 0</p>
<p>brk(0)                                  = 0x1c000</p>
<p>brk(0x1d000)                            = 0x1d000</p>
<p>socket(PF_INET, SOCK_RAW, IPPROTO_RAW)  = 3</p>
<p>getsockopt(3, SOL_IP, 0x40 /* IP_??? */, &quot;nat\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0&quot;..., [84])0</p>
<p>getsockopt(3, SOL_IP, 0x41 /* IP_??? */, &quot;nat\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0&quot;..., [656]0</p>
<p>stat(&quot;/etc/ld.so.cache&quot;, {st_mode=S_IFREG|0644, st_size=698, ...}) = 0</p>
<p>open(&quot;/etc/ld.so.cache&quot;, O_RDONLY)      = 4</p>
<p>mmap2(NULL, 698, PROT_READ, MAP_SHARED, 4, 0) = 0x40006000</p>
<p>close(4)                                = 0</p>
<p><span style="font-weight:600">open(&quot;/home/sara/BuildRoot/buildroot/project_build_arm/uclibc/root/lib/iptables/libipt_MASQUERADE.so&quot;, O_RDO)</span></p>
<p><span style="font-weight:600">open(&quot;/lib/libipt_MASQUERADE.so&quot;, O_RDONLY) = -1 ENOENT (No such file or directory)</span></p>
<p><span style="font-weight:600">open(&quot;/lib/libipt_MASQUERADE.so&quot;, O_RDONLY) = -1 ENOENT (No such file or directory)</span></p>
<p><span style="font-weight:600">open(&quot;/usr/lib/libipt_MASQUERADE.so&quot;, O_RDONLY) = -1 ENOENT (No such file or directory)</span></p>
<p>munmap(0x40006000, 698)                 = 0</p>
<p>write(2, &quot;iptables&quot;, 8iptables)                 = 8</p>
<p>write(2, &quot; v&quot;, 2 v)                       = 2</p>
<p>write(2, &quot;1.3.8&quot;, 51.3.8)                    = 5</p>
<p>write(2, &quot;: &quot;, 2: )                       = 2</p>
<p>write(2, &quot;Couldn\'t load target `&quot;, 22Couldn't load target `) = 22</p>
<p>write(2, &quot;MASQUERADE&quot;, 10MASQUERADE)              = 10</p>
<p>write(2, &quot;\':&quot;, 2':)                      = 2</p>
<p>write(2, &quot;File not found&quot;, 14File not found)          = 14</p>
<p>write(2, &quot;\n&quot;, 1</p>
<p>)                       = 1</p>
<p></p>
<p>Can anybody tell me why it doesnt find the needed libraries in the /lib/iptables ? </p>
<p></p>
<p>Thanks</p>
<p>Sara</p>
</body></html>
--Boundary-00=_4G+ZHFhfIXaQ706--

--===============1628437386==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
busybox mailing list
busybox@busybox.net
http://busybox.net/cgi-bin/mailman/listinfo/busybox
--===============1628437386==--
