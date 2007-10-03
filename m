From: "Vass Viktor" <vass.viktor@zuriel.hu>
Subject: RE: Iptables complains about kernel after filesystem damage
Date: Wed, 3 Oct 2007 15:52:54 +0200
Message-ID: <000401c805c4$b2bb7e20$0946010a@IBM26B52F62DB0>
References: <20071003113525.GA6865@sch.bme.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20071003113525.GA6865@sch.bme.hu>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'KOVACS Krisztian' <hidden@sch.bme.hu>
Cc: =?iso-8859-2?Q?'G=E1sp=E1r_Lajos'?= <swifty@freemail.hu>, 'Netfilter list' <netfilter@vger.kernel.org>

KOVACS Krisztian wrote:
> Have you tried stracing the iptables binary to find out where 
> it goes wrong?

I've just made one (thought this would be an easier question...):

access("/etc/ld.so.nohwcap", F_OK)      = -1 ENOENT (No such file or
directory)
open("/lib/tls/libc.so.6", O_RDONLY)    = 3
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0`Z\1\000"..., 512) =
512
fstat64(3, {st_mode=S_IFREG|0755, st_size=1254660, ...}) = 0
old_mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0)
= 0x50ea6000
old_mmap(NULL, 1264972, PROT_READ|PROT_EXEC, MAP_PRIVATE, 3, 0) = 0x50d71000
old_mmap(0x50e9b000, 36864, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 3,
0x129000) = 0x50e9b000
old_mmap(0x50ea4000, 7500, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x50ea4000
close(3)                                = 0
set_thread_area({entry_number:-1 -> 6, base_addr:0x50ea6900, limit:1048575,
seg_32bit:1, contents:0, read_exec_only:0, limit_in_pages:1,
seg_not_present:0, useable:1}) = 0
munmap(0x50ebe000, 15300)               = 0
socket(PF_INET, SOCK_RAW, IPPROTO_RAW)  = 3
getsockopt(3, SOL_IP, 0x40 /* IP_??? */, 0x5f873f30, 0x5f873f2c) = -1
ENOPROTOOPT (Protocol not available)
open("/proc/sys/kernel/modprobe", O_RDONLY) = -1 ENOENT (No such file or
directory)

So it fails at getsockopt. Does thid definitely mean, it is a kernel issue
somehow?

--
Viktor Vass

