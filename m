From: Akshat Kakkar <akshat.1984@gmail.com>
Subject: Re: make modules_install Error : Can't read private key
Date: Fri, 21 Aug 2015 10:32:11 +0530
Message-ID: <CAA5aLPhJ7H6oYQM4L2Cv1_Wbz-93YxPERVO6c9H8i1gcrsVrYA@mail.gmail.com>
References: <CAA5aLPiSBfyEqymTJ0rBU2zjBV2k1ruw9x9N3tJuKWhF8vCe9Q@mail.gmail.com>
	<alpine.DEB.2.10.1508202024190.2398@blackhole.kfki.hu>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=vKViCCI+zD8lt2/Nh21R7+xP/ES4CVb1XDiFF5fME+4=;
        b=bAVqr/CR/4X9UId7UbFcyqNaxBMTv1qQEQrwYppap6R7cBn/tdJ9lD/ZOSp0kLYGsk
         WIdPavvBWq32ziVXkgHBX+BYhY9Dwekd8O9nkcFLMaWdsEiMwBX9NitcBZdMiMjMUHjE
         5eo8fyBvcArIzIfByEFbjZtO5eXaxfLN1l91sp+s+Qey8D9rivciV0wdGBSmgoj6Xuxp
         b3QnSgwiPGS7/mGX3MKP0mazO8rgUbzweZRzpVPXme5NS8SjGozGnEyDLx54LAqqvavZ
         +KmkowHGaLMrH+ACaKBokRJ5e0eUnkVsJqEliYbQt1z3R761x8XnXMpXipNFc1VaQi2j
         1m1A==
In-Reply-To: <alpine.DEB.2.10.1508202024190.2398@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

o/p of  strace -f make install_modules


execve("/bin/make", ["make", "install_modules"], [/* 23 vars */]) = 0
brk(0)                                  = 0x15e2000
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1,
0) = 0x7f27d1db7000
access("/etc/ld.so.preload", R_OK)      = -1 ENOENT (No such file or directory)
open("/etc/ld.so.cache", O_RDONLY|O_CLOEXEC) = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=77094, ...}) = 0
mmap(NULL, 77094, PROT_READ, MAP_PRIVATE, 3, 0) = 0x7f27d1d98000
close(3)                                = 0
open("/lib64/libc.so.6", O_RDONLY|O_CLOEXEC) = 3
read(3, "\177ELF\2\1\1\3\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\0\34\2\0\0\0\0\0"...,
832) = 832
fstat(3, {st_mode=S_IFREG|0755, st_size=2107640, ...}) = 0
mmap(NULL, 3932736, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3,
0) = 0x7f27d17c8000
mprotect(0x7f27d197e000, 2097152, PROT_NONE) = 0
mmap(0x7f27d1b7e000, 24576, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x1b6000) = 0x7f27d1b7e000
mmap(0x7f27d1b84000, 16960, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x7f27d1b84000
close(3)                                = 0
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1,
0) = 0x7f27d1db6000
mmap(NULL, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1,
0) = 0x7f27d1db4000
arch_prctl(ARCH_SET_FS, 0x7f27d1db4740) = 0
mprotect(0x7f27d1b7e000, 16384, PROT_READ) = 0
mprotect(0x629000, 4096, PROT_READ)     = 0
mprotect(0x7f27d1db1000, 4096, PROT_READ) = 0
munmap(0x7f27d1d98000, 77094)           = 0
getrlimit(RLIMIT_STACK, {rlim_cur=8192*1024, rlim_max=RLIM64_INFINITY}) = 0
setrlimit(RLIMIT_STACK, {rlim_cur=RLIM64_INFINITY,
rlim_max=RLIM64_INFINITY}) = 0
brk(0)                                  = 0x15e2000
brk(0x1603000)                          = 0x1603000
brk(0)                                  = 0x1603000
open("/usr/lib/locale/locale-archive", O_RDONLY|O_CLOEXEC) = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=106065056, ...}) = 0
mmap(NULL, 106065056, PROT_READ, MAP_PRIVATE, 3, 0) = 0x7f27cb2a0000
close(3)                                = 0
rt_sigaction(SIGHUP, {0x406060, [HUP], SA_RESTORER|SA_RESTART,
0x7f27d17fd660}, {SIG_DFL, [], 0}, 8) = 0
rt_sigaction(SIGQUIT, {0x406060, [QUIT], SA_RESTORER|SA_RESTART,
0x7f27d17fd660}, {SIG_DFL, [], 0}, 8) = 0
rt_sigaction(SIGINT, {0x406060, [INT], SA_RESTORER|SA_RESTART,
0x7f27d17fd660}, {SIG_DFL, [], 0}, 8) = 0
rt_sigaction(SIGTERM, {0x406060, [TERM], SA_RESTORER|SA_RESTART,
0x7f27d17fd660}, {SIG_DFL, [], 0}, 8) = 0
rt_sigaction(SIGXCPU, {0x406060, [XCPU], SA_RESTORER|SA_RESTART,
0x7f27d17fd660}, {SIG_DFL, [], 0}, 8) = 0
rt_sigaction(SIGXFSZ, {0x406060, [XFSZ], SA_RESTORER|SA_RESTART,
0x7f27d17fd660}, {SIG_DFL, [], 0}, 8) = 0
rt_sigaction(SIGCHLD, {SIG_DFL, [CHLD], SA_RESTORER|SA_RESTART,
0x7f27d17fd660}, {SIG_DFL, [], 0}, 8) = 0
getcwd("/home/akshat/ipset-6.25.1", 4096) = 26
stat("/usr/include", {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0
stat("/usr/gnu/include", 0x7ffd39450dc0) = -1 ENOENT (No such file or directory)
stat("/usr/local/include", {st_mode=S_IFDIR|0755, st_size=34, ...}) = 0
stat("/usr/include", {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0
rt_sigaction(SIGCHLD, {0x40ec10, [CHLD], SA_RESTORER|SA_RESTART,
0x7f27d17fd660}, {SIG_DFL, [CHLD], SA_RESTORER|SA_RESTART,
0x7f27d17fd660}, 8) = 0
rt_sigaction(SIGUSR1, {0x411680, [USR1], SA_RESTORER|SA_RESTART,
0x7f27d17fd660}, {SIG_DFL, [], 0}, 8) = 0
stat(".", {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0
openat(AT_FDCWD, ".", O_RDONLY|O_NONBLOCK|O_DIRECTORY|O_CLOEXEC) = 3
brk(0)                                  = 0x1603000
brk(0x162b000)                          = 0x162b000
getdents(3, /* 36 entries */, 32768)    = 1152
getdents(3, /* 0 entries */, 32768)     = 0
close(3)                                = 0
open("Makefile", O_RDONLY)              = 3
fcntl(3, F_SETFD, FD_CLOEXEC)           = 0
fstat(3, {st_mode=S_IFREG|0644, st_size=35100, ...}) = 0
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1,
0) = 0x7f27d1db0000
read(3, "# Makefile.in generated by autom"..., 4096) = 4096
read(3, "ELEVEL)'\nam__make_running_with_o"..., 4096) = 4096
read(3, "ursive installcheck-recursive \\\n"..., 4096) = 4096
read(3, "EE_POSTORDER_FOR_EACH_ENTRY_SAFE"..., 4096) = 4096
read(3, "dir) && $(AUTOMAKE) --foreign Ma"..., 4096) = 4096
read(3, "les \\\n\t  || $(CSCOPE) -b -q $(AM"..., 4096) = 4096
read(3, "ost_remove_distdir='@:'\n\t$(am__p"..., 4096) = 4096
read(3, "eneric:\n\nclean-generic:\n\ndistcle"..., 4096) = 4096
read(3, "set-bashcompl/files/latest/downl"..., 4096) = 2332
read(3, "", 4096)                       = 0
close(3)                                = 0
munmap(0x7f27d1db0000, 4096)            = 0
stat("RCS", 0x7ffd39450d70)             = -1 ENOENT (No such file or directory)
stat("SCCS", 0x7ffd39450d70)            = -1 ENOENT (No such file or directory)
stat("Makefile", {st_mode=S_IFREG|0644, st_size=35100, ...}) = 0
clock_gettime(CLOCK_REALTIME, {1440133258, 318487748}) = 0
stat("Makefile.in", {st_mode=S_IFREG|0644, st_size=35884, ...}) = 0
stat("Makefile.am", {st_mode=S_IFREG|0644, st_size=4416, ...}) = 0
stat("Make_global.am", {st_mode=S_IFREG|0644, st_size=3936, ...}) = 0
stat("m4/argz.m4", {st_mode=S_IFREG|0644, st_size=2617, ...}) = 0
stat("m4", {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0
openat(AT_FDCWD, "m4", O_RDONLY|O_NONBLOCK|O_DIRECTORY|O_CLOEXEC) = 3
getdents(3, /* 11 entries */, 32768)    = 360
getdents(3, /* 0 entries */, 32768)     = 0
close(3)                                = 0
stat("m4/RCS", 0x7ffd3944f800)          = -1 ENOENT (No such file or directory)
stat("m4/SCCS", 0x7ffd3944f800)         = -1 ENOENT (No such file or directory)
stat("m4/ax_cflags_gcc_option.m4", {st_mode=S_IFREG|0644,
st_size=9102, ...}) = 0
stat("m4/libtool.m4", {st_mode=S_IFREG|0644, st_size=286490, ...}) = 0
stat("m4/ltdl.m4", {st_mode=S_IFREG|0644, st_size=27059, ...}) = 0
stat("m4/ltoptions.m4", {st_mode=S_IFREG|0644, st_size=12347, ...}) = 0
stat("m4/ltsugar.m4", {st_mode=S_IFREG|0644, st_size=4372, ...}) = 0
stat("m4/ltversion.m4", {st_mode=S_IFREG|0644, st_size=690, ...}) = 0
stat("m4/lt~obsolete.m4", {st_mode=S_IFREG|0644, st_size=6126, ...}) = 0
stat("configure.ac", {st_mode=S_IFREG|0644, st_size=16974, ...}) = 0
stat("aclocal.m4", {st_mode=S_IFREG|0644, st_size=47204, ...}) = 0
stat("config.status", {st_mode=S_IFREG|0755, st_size=64897, ...}) = 0
stat("configure", {st_mode=S_IFREG|0755, st_size=566842, ...}) = 0
stat("install_modules", 0x7ffd3944eba0) = -1 ENOENT (No such file or directory)
open("/usr/share/locale/locale.alias", O_RDONLY|O_CLOEXEC) = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=2502, ...}) = 0
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1,
0) = 0x7f27d1db0000
read(3, "# Locale name alias data base.\n#"..., 4096) = 2502
read(3, "", 4096)                       = 0
close(3)                                = 0
munmap(0x7f27d1db0000, 4096)            = 0
open("/usr/share/locale/en_US.UTF-8/LC_MESSAGES/make.mo", O_RDONLY) =
-1 ENOENT (No such file or directory)
open("/usr/share/locale/en_US.utf8/LC_MESSAGES/make.mo", O_RDONLY) =
-1 ENOENT (No such file or directory)
open("/usr/share/locale/en_US/LC_MESSAGES/make.mo", O_RDONLY) = -1
ENOENT (No such file or directory)
open("/usr/share/locale/en.UTF-8/LC_MESSAGES/make.mo", O_RDONLY) = -1
ENOENT (No such file or directory)
open("/usr/share/locale/en.utf8/LC_MESSAGES/make.mo", O_RDONLY) = -1
ENOENT (No such file or directory)
open("/usr/share/locale/en/LC_MESSAGES/make.mo", O_RDONLY) = -1 ENOENT
(No such file or directory)
write(2, "make: *** ", 10make: *** )              = 10
write(2, "No rule to make target `install_"..., 40No rule to make
target `install_modules') = 40
write(2, ".  Stop.\n", 9.  Stop.
)               = 9
chdir("/home/akshat/ipset-6.25.1")      = 0
close(1)                                = 0
exit_group(2)                           = ?
+++ exited with 2 +++

On Thu, Aug 20, 2015 at 11:58 PM, Jozsef Kadlecsik
<kadlec@blackhole.kfki.hu> wrote:
> On Thu, 20 Aug 2015, Akshat Kakkar wrote:
>
>> I am on SL 7, kernel 3.10.0-229
>>
>> I am installing ipset
>>
>> everyrthing went fine, but just in the last step "make
>> modules_install" I am geting o/p as
>>
>> make -C /lib/modules/`uname -r`/build M=$PWD/kernel/net \
>>                 KDIR=$PWD/kernel modules_install
>> make[1]: Entering directory `/usr/src/kernels/3.10.0-229.11.1.el7.x86_64'
>>   INSTALL /home/akshat/ipset-6.25.1/kernel/net/netfilter/ipset/ip_set.ko
>> Can't read private key
>
> I have no idea what's this, the ipset package handles no keys whatsoever.
> Run "strace -f make install_modules" and that may shed light on what kind
> of key can't be read by the system.
>
> Best regards,
> Jozsef
> -
> E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
> PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
> Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
>           H-1525 Budapest 114, POB. 49, Hungary
