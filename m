From: Thomas Reinhold <mail@thomasreinhold.de>
Subject: conntrack delete problem
Date: Fri, 12 May 2006 13:51:23 +0200
Message-ID: <200605121351.23310.mail@thomasreinhold.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: netfilter@lists.netfilter.org

Hi folks, 

I'v got a question concerning the conntrack userspace tool. Each time I try to 
delete an entry, conntrack displays the following error message (I'm using 
the latest svn versions of both the userspace tool and the conntrack and 
nfnetlink libraries):

>$:conntrack -D conntrack -s XXX.XXX.XXX.XXX -d XXX.XXX.XXX.XXX -i XXX
>NFNETLINK answers: No such file or directory
>Operation failed: such conntrack doesn't exist

Is my syntax for deleting correct? The error message appears each time, 
regardless of what ip addresses I use (i.e. regardless if the ip addresses 
belong to an existing conntrack entry).

An strace of the command listed above brings up the following:


> strace conntrack -D conntrack -s 134.96.60.203 -d 62.178.187.30 -i 983
> execve("/usr/bin/conntrack", ["conntrack", "-D", "conntrack", "-s",
> "134.96.60.203", "-d", "62.178.187.30", "-i", "983"], [/* 56 vars */]) = 0
> uname({sys="Linux", node="thomas", ...}) = 0
> brk(0)                                  = 0x804e000
> access("/etc/ld.so.preload", R_OK)      = -1 ENOENT (No such file or
> directory) open("/etc/ld.so.cache", O_RDONLY)      = 3
> fstat64(3, {st_mode=S_IFREG|0644, st_size=121783, ...}) = 0
> mmap2(NULL, 121783, PROT_READ, MAP_PRIVATE, 3, 0) = 0xb7efe000
> close(3)                                = 0
> open("/usr/local/lib/libnetfilter_conntrack.so.1", O_RDONLY) = 3
> read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0\320\22"..., 512) =
> 512 fstat64(3, {st_mode=S_IFREG|0755, st_size=70223, ...}) = 0
> mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) =
> 0xb7efd000 mmap2(NULL, 22352, PROT_READ|PROT_EXEC,
> MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0xb7ef7000 madvise(0xb7ef7000, 22352,
> MADV_SEQUENTIAL|0x1) = 0
> mmap2(0xb7efc000, 4096, PROT_READ|PROT_WRITE,
> MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x4) = 0xb7efc000 close(3)         
>                       = 0
> open("/lib/libdl.so.2", O_RDONLY)       = 3
> read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0\0\f\0\000"...,
> 512) = 512 fstat64(3, {st_mode=S_IFREG|0755, st_size=10440, ...}) = 0
> mmap2(NULL, 12392, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) =
> 0xb7ef3000 madvise(0xb7ef3000, 12392, MADV_SEQUENTIAL|0x1) = 0
> mmap2(0xb7ef5000, 8192, PROT_READ|PROT_WRITE,
> MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x1) = 0xb7ef5000 close(3)         
>                       = 0
> open("/lib/libc.so.6", O_RDONLY)        = 3
> read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0\360U\1"..., 512) =
> 512 fstat64(3, {st_mode=S_IFREG|0755, st_size=1191456, ...}) = 0
> mmap2(NULL, 1138036, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0)
> = 0xb7ddd000 madvise(0xb7ddd000, 1138036, MADV_SEQUENTIAL|0x1) = 0
> mmap2(0xb7eed000, 16384, PROT_READ|PROT_WRITE,
> MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x10f) = 0xb7eed000
> mmap2(0xb7ef1000, 7540, PROT_READ|PROT_WRITE,
> MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0xb7ef1000 close(3)          
>                      = 0
> open("/usr/local/lib/libnfnetlink.so.0", O_RDONLY) = 3
> read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0\20\v\0"..., 512) =
> 512 fstat64(3, {st_mode=S_IFREG|0755, st_size=42000, ...}) = 0
> mmap2(NULL, 13676, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) =
> 0xb7dd9000 madvise(0xb7dd9000, 13676, MADV_SEQUENTIAL|0x1) = 0
> mmap2(0xb7ddc000, 4096, PROT_READ|PROT_WRITE,
> MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x2) = 0xb7ddc000 close(3)         
>                       = 0
> mprotect(0xb7eed000, 4096, PROT_READ)   = 0
> mprotect(0xb7f31000, 4096, PROT_READ)   = 0
> munmap(0xb7efe000, 121783)              = 0
> open("/dev/urandom", O_RDONLY)          = 3
> read(3, "v@y\270", 4)                   = 4
> close(3)                                = 0
> brk(0)                                  = 0x804e000
> brk(0x806f000)                          = 0x806f000
> socket(PF_NETLINK, SOCK_RAW, 12)        = 3
> bind(3, {sa_family=AF_NETLINK, pid=0, groups=00000000}, 12) = 0
> getsockname(3, {sa_family=AF_NETLINK, pid=18942, groups=00000000}, [12]) =
> 0 time(NULL)                              = 1147434493
> open("/usr/local/lib/libnetfilter_conntrack//nfct_l3proto_ipv4-0.0.30.so",
> O_RDONLY) = 4 read(4,
> "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0p\5\0\000"..., 512) = 512
> fstat64(4, {st_mode=S_IFREG|0755, st_size=28443, ...}) = 0
> mmap2(NULL, 6728, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 4, 0) =
> 0xb7f1a000 madvise(0xb7f1a000, 6728, MADV_SEQUENTIAL|0x1) = 0
> mmap2(0xb7f1b000, 4096, PROT_READ|PROT_WRITE,
> MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 4, 0) = 0xb7f1b000 close(4)           
>                     = 0
> sendmsg(3, {msg_name(12)={sa_family=AF_NETLINK, pid=0, groups=00000000},
> msg_iov(1)=[{"@\0\0\0\2\1\5\3\377udD\0\0\0\0\2\0\0\0$\0\1\200\24\0\1"...,
> 64}], msg_controllen=0, msg_flags=0}, 0) = 64 recvmsg(3,
> {msg_name(12)={sa_family=AF_NETLINK, pid=0, groups=00000000},
> msg_iov(1)=[{"$\0\0\0\2\0\0\0\377udD\376I\0\0\376\377\377\377@\0\0\0"...,
> 8192}], msg_controllen=0, msg_flags=0}, 0) = 36 dup(2)                     
>             = 4
> fcntl64(4, F_GETFL)                     = 0x2 (flags O_RDWR)
> fstat64(4, {st_mode=S_IFCHR|0600, st_rdev=makedev(136, 1), ...}) = 0
> mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) =
> 0xb7f19000 _llseek(4, 0, 0xbfc2aec4, SEEK_CUR)     = -1 ESPIPE (Illegal
> seek) write(4, "NFNETLINK answers: No such file "..., 45NFNETLINK answers:
> No such file or directory ) = 45
> close(4)                                = 0
> munmap(0xb7f19000, 4096)                = 0
> close(3)                                = 0
> write(2, "Operation failed: such conntrack"..., 47Operation failed: such
> conntrack doesn't exist ) = 47
> exit_group(1)                           = ?

Could anybody please help me out? 
  
    Thanx in advance,

             Thomas

