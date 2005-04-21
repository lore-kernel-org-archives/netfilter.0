From: =?UTF-8?B?QXJ0xatyYXMgxaBsYWp1cw==?= <x11@kitas.arturas.net>
Subject: [Fwd: Re: POM raw patch for 2.4.30]
Date: Thu, 21 Apr 2005 21:27:45 +0300
Message-ID: <4267F0A1.9050207@kitas.arturas.net>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------070003090403040805070104"
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
To: netfilter@lists.netfilter.org

This is a multi-part message in MIME format.
--------------070003090403040805070104
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Forwarding my mail... netfilter-devel doesn't get much attention :)

--------------070003090403040805070104
Content-Type: message/rfc822;
 name="Re: POM raw patch for 2.4.30"
Content-Transfer-Encoding: 8bit
Content-Disposition: inline;
 filename="Re: POM raw patch for 2.4.30"

Return-path: <netfilter-devel-bounces@lists.netfilter.org>
Envelope-to: x11@kitas.arturas.net
Delivery-date: Thu, 21 Apr 2005 20:22:56 +0300
Received: from vishnu.netfilter.org ([213.95.27.115])
	by fs.lan with esmtp (Exim 4.50) id 1DOfOC-0003vq-8I
	for x11@kitas.arturas.net; Thu, 21 Apr 2005 20:22:56 +0300
Received: from localhost ([127.0.0.1] helo=vishnu.netfilter.org)
	by vishnu.netfilter.org with esmtp (Exim 4.41 #1 (Debian))
	id 1DOfST-00051N-N4; Thu, 21 Apr 2005 19:27:21 +0200
Received: from 82-135-206-225.ip.takas.lt ([82.135.206.225] helo=fs.lan)
	by vishnu.netfilter.org with esmtp (Exim 4.41 #1 (Debian))
	id 1DOfSP-00051F-Hw for <netfilter-devel@lists.netfilter.org>;
	Thu, 21 Apr 2005 19:27:19 +0200
Received: from h2o.lan ([192.168.0.3] ident=arturaz)
	by fs.lan with esmtp (Exim 4.50) id 1DOfNx-0003vg-QD
	for netfilter-devel@lists.netfilter.org; Thu, 21 Apr 2005 20:22:42 +0300
Message-ID: <4267E105.7040304@kitas.arturas.net>
Date: Thu, 21 Apr 2005 20:21:09 +0300
From: =?UTF-8?B?QXJ0xatyYXMgxaBsYWp1cw==?= <x11@kitas.arturas.net>
User-Agent: Mozilla Thunderbird 1.0 (Windows/20041206)
X-Accept-Language: en-us, en
MIME-Version: 1.0
CC: netfilter-devel@lists.netfilter.org
References: <4267B6FE.7000400@kitas.arturas.net>
In-Reply-To: <4267B6FE.7000400@kitas.arturas.net>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.5 (--)
Subject: Re: POM raw patch for 2.4.30
X-BeenThere: netfilter-devel@lists.netfilter.org
X-Mailman-Version: 2.1.5
Precedence: list
List-Id: discussion about netfilter development
	<netfilter-devel.lists.netfilter.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter-devel>, 
	<mailto:netfilter-devel-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter-devel>
List-Post: <mailto:netfilter-devel@lists.netfilter.org>
List-Help: <mailto:netfilter-devel-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter-devel>, 
	<mailto:netfilter-devel-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-devel-bounces@lists.netfilter.org
Errors-To: netfilter-devel-bounces@lists.netfilter.org

Artūras Šlajus wrote:
> Hello,
> 
> Just including 'raw' patch for Linux 2.4.30. This works for me (original 
> did not..).

Hmm. I'm expierencing same errors as this guy:
https://lists.netfilter.org/pipermail/netfilter-devel/2003-November/013193.html

20:17 gw:/var/log# strace iptables -I FORWARD -d 192.168.0.3
execve("/sbin/iptables", ["iptables", "-I", "FORWARD", "-d", 
"192.168.0.3"], [/* 17 vars */]) = 0
uname({sys="Linux", node="gw.lan", ...}) = 0
brk(0)                                  = 0x8054834
old_mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, 
-1, 0) = 0x40017000
access("/etc/ld.so.nohwcap", F_OK)      = -1 ENOENT (No such file or 
directory)
open("/etc/ld.so.preload", O_RDONLY)    = -1 ENOENT (No such file or 
directory)
open("/etc/ld.so.cache", O_RDONLY)      = 3
fstat64(3, {st_mode=S_IFREG|0644, st_size=11699, ...}) = 0
old_mmap(NULL, 11699, PROT_READ, MAP_PRIVATE, 3, 0) = 0x40018000
close(3)                                = 0
access("/etc/ld.so.nohwcap", F_OK)      = -1 ENOENT (No such file or 
directory)
open("/lib/libdl.so.2", O_RDONLY)       = 3
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0p\34\0\000"..., 
512) = 512
fstat64(3, {st_mode=S_IFREG|0644, st_size=9872, ...}) = 0
old_mmap(NULL, 8632, PROT_READ|PROT_EXEC, MAP_PRIVATE, 3, 0) = 0x4001b000
old_mmap(0x4001d000, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 
3, 0x2000) = 0x4001d000
close(3)                                = 0
access("/etc/ld.so.nohwcap", F_OK)      = -1 ENOENT (No such file or 
directory)
open("/lib/libnsl.so.1", O_RDONLY)      = 3
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0000<\0\000"..., 
512) = 512
fstat64(3, {st_mode=S_IFREG|0644, st_size=73528, ...}) = 0
old_mmap(NULL, 84864, PROT_READ|PROT_EXEC, MAP_PRIVATE, 3, 0) = 0x4001e000
old_mmap(0x40030000, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 
3, 0x11000) = 0x40030000
old_mmap(0x40031000, 7040, PROT_READ|PROT_WRITE, 
MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x40031000
close(3)                                = 0
access("/etc/ld.so.nohwcap", F_OK)      = -1 ENOENT (No such file or 
directory)
open("/lib/libc.so.6", O_RDONLY)        = 3
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0\200^\1"..., 
512) = 512
fstat64(3, {st_mode=S_IFREG|0644, st_size=1244016, ...}) = 0
old_mmap(NULL, 1254180, PROT_READ|PROT_EXEC, MAP_PRIVATE, 3, 0) = 0x40033000
old_mmap(0x4015b000, 32768, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 
3, 0x127000) = 0x4015b000
old_mmap(0x40163000, 8996, PROT_READ|PROT_WRITE, 
MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x40163000
close(3)                                = 0
old_mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, 
-1, 0) = 0x40166000
munmap(0x40018000, 11699)               = 0
brk(0)                                  = 0x8054834
brk(0x8075834)                          = 0x8075834
brk(0)                                  = 0x8075834
brk(0x8076000)                          = 0x8076000
socket(PF_INET, SOCK_RAW, IPPROTO_RAW)  = 3
getsockopt(3, SOL_IP, 0x40 /* IP_??? */, 
"filter\0@p\373\377\277\26\272\0@\324o\1@h\177\1@\1\0\0"..., [84]) = 0
getsockopt(3, SOL_IP, 0x41 /* IP_??? */, 
"filter\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., [28112]) = 0
open("/lib/iptables/libipt_standard.so", O_RDONLY) = 4
read(4, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0\220\3\0"..., 
512) = 512
fstat64(4, {st_mode=S_IFREG|0644, st_size=2136, ...}) = 0
old_mmap(NULL, 5596, PROT_READ|PROT_EXEC, MAP_PRIVATE, 4, 0) = 0x40018000
old_mmap(0x40019000, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 
4, 0) = 0x40019000
close(4)                                = 0
setsockopt(3, SOL_IP, 0x40 /* IP_??? */, 
"filter\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 28324) = -1 
ELOOP (Too many levels of symbolic links)
write(2, "iptables: Too many levels of sym"..., 44iptables: Too many 
levels of symbolic links
) = 44
exit_group(1)                           = ?

But:
20:19 gw:/var/log# iptables -I FORWARD -d 192.168.0.3 -j ACCEPT
20:21 gw:/var/log#

and in my kern.log i've got:
Apr 21 20:16:01 gw kernel: ip_tables: table screwed up!
Apr 21 20:17:20 gw kernel: ip_tables: table screwed up!

Could anyone look up what's causing this?


--------------070003090403040805070104--

