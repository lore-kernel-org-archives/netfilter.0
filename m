From: develop.olivier@caramail.com
Subject: How to filter Oracle connection?
Date: Thu, 10 Oct 2002 19:59:45 GMT+1
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1034272785007742@caramail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=_NextPart_Caramail_0077421034272785_ID"
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: netfilter@lists.netfilter.org

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

--=_NextPart_Caramail_0077421034272785_ID
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello dear folks,

I have installed the netfilter patch on my 2.4.19 linux 
kernel.

(((( iptables -m conntrack --help give me
conntrack match v1.2.7a options:
 [!] --ctstate 
[INVALID|ESTABLISHED|NEW|RELATED|SNAT|DNAT][,...]
 State(s) to match
 [!] --ctproto proto Protocol to match; by 
number or name, eg. `tcp'
 --ctorigsrc [!] address[/mask]
 Original source 
specification
 --ctorigdst [!] address[/mask]
 Original destination 
specification
 --ctreplsrc [!] address[/mask]
 Reply source specification
 --ctrepldst [!] address[/mask]
 Reply destination 
specification
 [!] --ctstatus [NONE|EXPECTED|SEEN_REPLY|ASSURED][,...]
 Status(es) to match
 [!] --ctexpire time[:time] Match remaining lifetime 
in seconds against
 value or range of values 
(inclusive) )))



But when I try the example :

iptables -A FORWARD -m conntrack --ctstate RELATED 
--ctproto tcp -j ACCEPT
answer is: iptables: No chain/target/match by that name

I can not understand the error.....


Here it is strace output:
 strace iptables -A FORWARD -m conntrack --ctstate RELATED 
--ctproto tcp -j ACCEPT
execve("/usr/local/sbin/iptables", ["iptables", "-A", 
"FORWARD", "-m", "conntrack", "--ctstate", "RELATED", 
"--ctproto", "tcp", "-j", "ACCEPT"], [/* 30 vars */]) = 0
uname({sys="Linux", node="fw.itlink.fr", ...}) = 0
brk(0) = 0x8056b28
open("/etc/ld.so.preload", O_RDONLY) = -1 ENOENT (No 
such file or directory)
open("/etc/ld.so.cache", O_RDONLY) = 3
fstat64(3, {st_mode=S_IFREG|0644, st_size=58019, ...}) = 0
old_mmap(NULL, 58019, PROT_READ, MAP_PRIVATE, 3, 0) = 
0x40017000
close(3) = 0
open("/lib/libdl.so.2", O_RDONLY) = 3
read(3, 
"\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0`\36\0\000"..., 
1024) = 1024
fstat64(3, {st_mode=S_IFREG|0755, st_size=65873, ...}) = 0
old_mmap(NULL, 12780, PROT_READ|PROT_EXEC, MAP_PRIVATE, 3, 
0) = 0x40026000
mprotect(0x40029000, 492, PROT_NONE) = 0
old_mmap(0x40029000, 4096, PROT_READ|PROT_WRITE, 
MAP_PRIVATE|MAP_FIXED, 3, 0x2000) = 0x40029000
close(3) = 0
open("/lib/i686/libc.so.6", O_RDONLY) = 3
read(3, 
"\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0\340\310"..., 
1024) = 1024
fstat64(3, {st_mode=S_IFREG|0755, st_size=5761921, ...}) = 
0
old_mmap(NULL, 4096, PROT_READ|PROT_WRITE, 
MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x4002a000
old_mmap(NULL, 1285704, PROT_READ|PROT_EXEC, MAP_PRIVATE, 
3, 0) = 0x4002b000
mprotect(0x4015c000, 36424, PROT_NONE) = 0
old_mmap(0x4015c000, 20480, PROT_READ|PROT_WRITE, 
MAP_PRIVATE|MAP_FIXED, 3, 0x130000) = 0x4015c000
old_mmap(0x40161000, 15944, PROT_READ|PROT_WRITE, 
MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x40161000
close(3) = 0
munmap(0x40017000, 58019) = 0
getpid() = 1446
brk(0) = 0x8056b28
brk(0x8056b68) = 0x8056b68
brk(0x8057000) = 0x8057000
open("/usr/local/lib/iptables/libipt_conntrack.so", 
O_RDONLY) = 3
read(3, 
"\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0\24\10\0"..., 
1024) = 1024
fstat64(3, {st_mode=S_IFREG|0755, st_size=9776, ...}) = 0
old_mmap(NULL, 11264, PROT_READ|PROT_EXEC, MAP_PRIVATE, 3, 
0) = 0x40017000
mprotect(0x40019000, 3072, PROT_NONE) = 0
old_mmap(0x40019000, 4096, PROT_READ|PROT_WRITE, 
MAP_PRIVATE|MAP_FIXED, 3, 0x1000) = 0x40019000
close(3) = 0
brk(0x8058000) = 0x8058000
open("/etc/nsswitch.conf", O_RDONLY) = 3
fstat64(3, {st_mode=S_IFREG|0644, st_size=1750, ...}) = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, 
MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x4001a000
read(3, "#\n# /etc/nsswitch.conf\n#\n# An ex"..., 4096) = 
1750
read(3, "", 4096) = 0
close(3) = 0
munmap(0x4001a000, 4096) = 0
open("/etc/ld.so.cache", O_RDONLY) = 3
fstat64(3, {st_mode=S_IFREG|0644, st_size=58019, ...}) = 0
old_mmap(NULL, 58019, PROT_READ, MAP_PRIVATE, 3, 0) = 
0x40165000
close(3) = 0
open("/lib/libnss_files.so.2", O_RDONLY) = 3
read(3, 
"\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0\240 
\0"..., 1024) = 1024
fstat64(3, {st_mode=S_IFREG|0755, st_size=261588, ...}) = 0
old_mmap(NULL, 42448, PROT_READ|PROT_EXEC, MAP_PRIVATE, 3, 
0) = 0x4001a000
mprotect(0x40024000, 1488, PROT_NONE) = 0
old_mmap(0x40024000, 4096, PROT_READ|PROT_WRITE, 
MAP_PRIVATE|MAP_FIXED, 3, 0x9000) = 0x40024000
close(3) = 0
munmap(0x40165000, 58019) = 0
brk(0x8059000) = 0x8059000
open("/etc/protocols", O_RDONLY) = 3
fcntl64(0x3, 0x1, 0, 0x1) = 0
fcntl64(0x3, 0x2, 0x1, 0x1) = 0
fstat64(3, {st_mode=S_IFREG|0644, st_size=5834, ...}) = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, 
MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x40025000
read(3, "# /etc/protocols:\n# $Id: protoco"..., 4096) = 
4096
close(3) = 0
munmap(0x40025000, 4096) = 0
open("/usr/local/lib/iptables/libipt_standard.so", 
O_RDONLY) = 3
read(3, 
"\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0\220\3\0"..., 
1024) = 1024
fstat64(3, {st_mode=S_IFREG|0755, st_size=3201, ...}) = 0
old_mmap(NULL, 5588, PROT_READ|PROT_EXEC, MAP_PRIVATE, 3, 
0) = 0x40165000
mprotect(0x40166000, 1492, PROT_NONE) = 0
old_mmap(0x40166000, 4096, PROT_READ|PROT_WRITE, 
MAP_PRIVATE|MAP_FIXED, 3, 0) = 0x40166000
close(3) = 0
socket(PF_INET, SOCK_RAW, IPPROTO_RAW) = 3
getsockopt(3, SOL_IP, 0x40 /* IP_??? */, [1953261926], 
[84]) = 0
brk(0x805c000) = 0x805c000
getsockopt(3, SOL_IP, 0x41 /* IP_??? */, [1953261926], 
[9736]) = 0
brk(0x805f000) = 0x805f000
setsockopt(3, SOL_IP, 0x40 /* IP_??? */, [1953261926], 
10040) = -1 ENOSYS (Function not implemented)
setsockopt(3, SOL_IP, 0x40 /* IP_??? */, [1953261926], 
10040) = -1 ENOSYS (Function not implemented)
setsockopt(3, SOL_IP, 0x40 /* IP_??? */, [1953261926], 
10040) = -1 ENOENT (No such file or directory)
write(2, "iptables: No chain/target/match "..., 
45iptables: No chain/target/match by that name
) = 45
_exit(1) = ?


Could you, PLEASE, explain me how to correct it?



Moreover, I want to allow the following traffic into my 
INPUT table.
(Only server_Oracle_IP is known)
Client_IP:port_C_1 ----> server_Oracle_IP:1521 Syn (TNS 
connect)
server_Oracle_IP:1521 ----> Client_IP:port_C_1 Ack
...
server_Oracle_IP:1521 ----> Client_IP:port_C_1 (TNS 
redirect to port S1)
Client_IP:port_C_1 ----> server_Oracle_IP:port_S1 
(...,SQL request)
...

I have tried this:
$IPTABLES -A INPUT -p TCP -d $server_Oracle_IP --dport 
1521 -j ACCEPT
$IPTABLES -A INPUT -p TCP -m state --state 
ESTABLISHED,RELATED -j ACCEPT
but it does not work !!!

I suppose that
$IPTABLES -A INPUT -m conntrack -ctrepldst 
$server_Oracle_IP -j ACCEPT
would be better, but I am not sure...

Could you also help me?

I will be very pleased to read you.

Olivier.


_________________________________________________________ 
Envoyez des messages musicaux sur le portable de vos amis 
 http://mobile.lycos.fr/mobile/local/sms_musicaux/


--=_NextPart_Caramail_0077421034272785_ID--


