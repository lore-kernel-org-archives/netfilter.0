From: "Diego Sarasua" <debian@sarasuasys.com.ar>
Subject: Re: pptp+masq fsckup! PLEASE help...
Date: Tue, 7 Jan 2003 12:54:22 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <010901c2b665$1d078760$6400a8c0@diego>
References: <200301061926.49827.roy@karlsbakk.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"
To: Roy Sigurd Karlsbakk <roy@karlsbakk.net>, Netfilter mailinglist <netfilter@lists.netfilter.org>

Roy ! - i was trying to compile the kernel 2.4.20 and i have the same
problem that U have ..... really i don=B4t know why.
But , becuase i really need the solution quicly as U need too.I was tryin=
g
with another kernels , and i was surprised because the same thing that
happends on 2.4.20 dont happend on  2.4.17 , and now im using that kernel
and it works awesome.-
i know thath is not an correctly solution ok ?
but IT works Correctly .- Why ? really dont know , if U can givme an ftp =
or
something  i have a 2.4.17 already patched i can upload it to You.-


p/d : I know thats is not a right way , but i U need a solution now , tha=
t
help i can give U , as I say U before , i have a 2.4.20 kernel working , =
but
when i try to make the same compilation in another machine , i don't know
waths go wrong... and invalid arguments apears.....

Thats all
Please forgive my very bad english
Diego  : )
San Juan
Sol y buen Vino (Sun , and very good Wines)

----- Original Message -----
From: "Roy Sigurd Karlsbakk" <roy@karlsbakk.net>
To: "Netfilter mailinglist" <netfilter@lists.netfilter.org>
Sent: Monday, January 06, 2003 3:26 PM
Subject: pptp+masq fsckup! PLEASE help...


> hi all
>
> still I can't make it
>
> compiled in the patch at http://roeder.goe.net/~koepi/newnat.html, as
Diego
> Sarasua pointed to, but getting the same ole crap as the only time I've
ever
> managed to patch-o-maticize the kernel. As I try to add the following
rule, I
> just get an 'invalid argument' message. The following shows an strace o=
f
> iptables.
>
> thanks
>
> roy
>
> nyfw:~# strace iptables -t nat -A POSTROUTING -s
192.168.0.0/255.255.0.0 -d !
> 192.168.0.0/255.255.0.0 -j MASQUERADE
> execve("/sbin/iptables", ["iptables", "-t", "nat", "-A", "POSTROUTING",
"-s",
> "192.168.0.0/255.255.0.0", "-d", "!", "192.168.0.0/255.255.0.0", "-j",
> "MASQUERADE"], [/* 13 vars */]) =3D 0
> uname({sys=3D"Linux", node=3D"nyfw", ...})  =3D 0
> brk(0)                                  =3D 0x8056a5c
> open("/etc/ld.so.preload", O_RDONLY)    =3D -1 ENOENT (No such file or
> directory)
> open("/etc/ld.so.cache", O_RDONLY)      =3D 3
> fstat64(3, {st_mode=3DS_IFREG|0644, st_size=3D11871, ...}) =3D 0
> old_mmap(NULL, 11871, PROT_READ, MAP_PRIVATE, 3, 0) =3D 0x40014000
> close(3)                                =3D 0
> open("/lib/libdl.so.2", O_RDONLY)       =3D 3
> read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0T\27\0\000"...,
1024)
> =3D 1024
> fstat64(3, {st_mode=3DS_IFREG|0644, st_size=3D8008, ...}) =3D 0
> old_mmap(NULL, 11004, PROT_READ|PROT_EXEC, MAP_PRIVATE, 3, 0) =3D 0x400=
17000
> mprotect(0x40019000, 2812, PROT_NONE)   =3D 0
> old_mmap(0x40019000, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED,=
 3,
> 0x1000) =3D 0x40019000
> close(3)                                =3D 0
> open("/lib/libc.so.6", O_RDONLY)        =3D 3
> read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0\30\222"..., 10=
24)
=3D
> 1024
> fstat64(3, {st_mode=3DS_IFREG|0755, st_size=3D1153784, ...}) =3D 0
> old_mmap(NULL, 1166560, PROT_READ|PROT_EXEC, MAP_PRIVATE, 3, 0) =3D
0x4001a000
> mprotect(0x4012d000, 40160, PROT_NONE)  =3D 0
> old_mmap(0x4012d000, 24576, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED=
,
3,
> 0x113000) =3D 0x4012d000
> old_mmap(0x40133000, 15584, PROT_READ|PROT_WRITE,
> MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) =3D 0x40133000
> close(3)                                =3D 0
> old_mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -=
1,
0) =3D
> 0x40137000
> munmap(0x40014000, 11871)               =3D 0
> brk(0)                                  =3D 0x8056a5c
> brk(0x8056a94)                          =3D 0x8056a94
> brk(0x8057000)                          =3D 0x8057000
> open("/lib/iptables/libipt_MASQUERADE.so", O_RDONLY) =3D 3
> read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0\220\4\0"...,
1024) =3D
> 1024
> fstat64(3, {st_mode=3DS_IFREG|0644, st_size=3D3276, ...}) =3D 0
> old_mmap(NULL, 6720, PROT_READ|PROT_EXEC, MAP_PRIVATE, 3, 0) =3D 0x4001=
4000
> mprotect(0x40015000, 2624, PROT_NONE)   =3D 0
> old_mmap(0x40015000, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED,=
 3,
0)
> =3D 0x40015000
> close(3)                                =3D 0
> socket(PF_INET, SOCK_RAW, IPPROTO_RAW)  =3D 3
> getsockopt(3, SOL_IP, 0x40 /* IP_??? */, [7627118], [84]) =3D 0
> brk(0x8058000)                          =3D 0x8058000
> getsockopt(3, SOL_IP, 0x41 /* IP_??? */, [7627118], [656]) =3D 0
> setsockopt(3, SOL_IP, 0x40 /* IP_??? */, [7627118], 876) =3D -1 EINVAL
(Invalid
> argument)
> write(2, "iptables: Invalid argument\n", 27iptables: Invalid argument
> ) =3D 27
> _exit(1)                                =3D ?
>
> --
> Roy Sigurd Karlsbakk, Datavaktmester
> ProntoTV AS - http://www.pronto.tv/
> Tel: +47 9801 3356
>
> Computers are like air conditioners.
> They stop working when you open Windows.
>
>


