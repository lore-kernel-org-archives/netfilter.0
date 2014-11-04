From: Ricardo Klein <klein.rfk@gmail.com>
Subject: Re: ipset 6.23 hangs on CentOS6 with hash:mac
Date: Mon, 3 Nov 2014 23:55:41 -0200
Message-ID: <CADuigkUWQrXZ_N1gHE67aP5JKRfFbgpX5guLLJe__28cWCgFnw@mail.gmail.com>
References: <CADuigkVMK8T12S=k4iAj=wX7m7bNna8fW4ZDK_PX5apZjoZWsw@mail.gmail.com>
	<alpine.DEB.2.10.1410302157320.30524@blackhole.kfki.hu>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=4gCZku6E9py0MITIHiGw7A+qj+hQ2TYbN3Gnipy1SH8=;
        b=DIjCmEbEFSLOleekg88p12CPNV1+oRdEx0oGG/Qw+PdwunM8vN9GB3976x7m10LPVZ
         4U3hAe4YwRHongDojG4rCCUuotUlxH9FiaZPVa7EOlhIoDM98D5AUZN7zo0mVNDN/nrA
         IRKGHo1oh36PEdXY69e/8nwwqG2kd+r3ItV+WZPAM9ZozNjUWqXrBeC5rf9Zx9M9sbOX
         43bAOGlbkgVS52owr6nmZ5+88R7juikBwBHZGLLgG9fwspTs98s1JGaT8g/fmiPOSYNk
         05gJun8Zu84zMkTc45uWzk/Z2ietqmZI6IOm3oFNAlwMhMt9wRTKCE53+lWiYb8Icc7Q
         NIww==
In-Reply-To: <alpine.DEB.2.10.1410302157320.30524@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter <netfilter@vger.kernel.org>

Hi Jozsef,

with the option "--enable-debug" I get make errors (I dont get them
when I run ./configure without this option)
[root@r2d2 ipset-6.23]# make -j 8
make  all-recursive
make[1]: Entering directory `/root/div/ipset-6.23'
Making all in include/libipset
make[2]: Entering directory `/root/div/ipset-6.23/include/libipset'
make[2]: Nothing to be done for `all'.
make[2]: Leaving directory `/root/div/ipset-6.23/include/libipset'
Making all in lib
make[2]: Entering directory `/root/div/ipset-6.23/lib'
  CC       parse.lo
cc1: warnings being treated as errors
parse.c: In function 'ipset_strchr':
parse.c:53: error: logical '&&' with non-zero constant will always
evaluate as true
make[2]: *** [parse.lo] Error 1
make[2]: Leaving directory `/root/div/ipset-6.23/lib'
make[1]: *** [all-recursive] Error 1
make[1]: Leaving directory `/root/div/ipset-6.23'
make: *** [all] Error 2


And my kernel is the default one from CentOS 6.6:
2.6.32-504.el6.x86_64


--
Att...

Ricardo Felipe Klein
klein.rfk@gmail.com


On Thu, Oct 30, 2014 at 7:07 PM, Jozsef Kadlecsik
<kadlec@blackhole.kfki.hu> wrote:
> On Thu, 30 Oct 2014, Ricardo Klein wrote:
>
>> If I try to create a hash:mac set, like this:
>> ipset create MACSFREE hash:mac
>>
>> The console never returns, only if I hit CTRL+C, it works for other
>> types of sets, here is the strace:
>>
>> strace ipset create MACSFREE hash:mac
>> execve("/usr/local/sbin/ipset", ["ipset", "create", "MACSFREE",
>> "hash:mac"], [/* 30 vars */]) = 0
>> brk(0)                                  = 0x247e000
>> mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1,
>> 0) = 0x7f45b83d5000
>> access("/etc/ld.so.preload", R_OK)      = -1 ENOENT (No such file or directory)
>> open("/etc/ld.so.cache", O_RDONLY)      = 3
>> fstat(3, {st_mode=S_IFREG|0644, st_size=31216, ...}) = 0
>> mmap(NULL, 31216, PROT_READ, MAP_PRIVATE, 3, 0) = 0x7f45b83cd000
>> close(3)                                = 0
>> open("/usr/lib64/libmnl.so.0", O_RDONLY) = 3
>> read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0
>> \31\0\0\0\0\0\0"..., 832) = 832
>> fstat(3, {st_mode=S_IFREG|0755, st_size=18056, ...}) = 0
>> mmap(NULL, 2113224, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3,
>> 0) = 0x7f45b7fb3000
>> mprotect(0x7f45b7fb7000, 2093056, PROT_NONE) = 0
>> mmap(0x7f45b81b6000, 4096, PROT_READ|PROT_WRITE,
>> MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x3000) = 0x7f45b81b6000
>> close(3)                                = 0
>> open("/lib64/libdl.so.2", O_RDONLY)     = 3
>> read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\340\r\0\0\0\0\0\0"...,
>> 832) = 832
>> fstat(3, {st_mode=S_IFREG|0755, st_size=19536, ...}) = 0
>> mmap(NULL, 2109696, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3,
>> 0) = 0x7f45b7daf000
>> mprotect(0x7f45b7db1000, 2097152, PROT_NONE) = 0
>> mmap(0x7f45b7fb1000, 8192, PROT_READ|PROT_WRITE,
>> MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x2000) = 0x7f45b7fb1000
>> close(3)                                = 0
>> open("/lib64/libc.so.6", O_RDONLY)      = 3
>> read(3, "\177ELF\2\1\1\3\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0p\356\1\0\0\0\0\0"...,
>> 832) = 832
>> fstat(3, {st_mode=S_IFREG|0755, st_size=1921176, ...}) = 0
>> mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1,
>> 0) = 0x7f45b83cc000
>> mmap(NULL, 3750152, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3,
>> 0) = 0x7f45b7a1b000
>> mprotect(0x7f45b7ba5000, 2097152, PROT_NONE) = 0
>> mmap(0x7f45b7da5000, 20480, PROT_READ|PROT_WRITE,
>> MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x18a000) = 0x7f45b7da5000
>> mmap(0x7f45b7daa000, 18696, PROT_READ|PROT_WRITE,
>> MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x7f45b7daa000
>> close(3)                                = 0
>> mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1,
>> 0) = 0x7f45b83cb000
>> mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1,
>> 0) = 0x7f45b83ca000
>> arch_prctl(ARCH_SET_FS, 0x7f45b83cb700) = 0
>> mprotect(0x7f45b7da5000, 16384, PROT_READ) = 0
>> mprotect(0x7f45b7fb1000, 4096, PROT_READ) = 0
>> mprotect(0x7f45b83d6000, 4096, PROT_READ) = 0
>> munmap(0x7f45b83cd000, 31216)           = 0
>> brk(0)                                  = 0x247e000
>> brk(0x24a2000)                          = 0x24a2000
>> socket(PF_NETLINK, SOCK_RAW, 12)        = 3
>> bind(3, {sa_family=AF_NETLINK, pid=0, groups=00000000}, 12) = 0
>> getsockname(3, {sa_family=AF_NETLINK, pid=42575, groups=00000000}, [12]) = 0
>> sendto(3, "\34\0\0\0\1\6\1\0\27\214RT\0\0\0\0\2\0\0\0\5\0\1\0\6\0\0\0",
>> 28, 0, {sa_family=AF_NETLINK, pid=0, groups=00000000}, 12) = 28
>> recvmsg(3, {msg_name(12)={sa_family=AF_NETLINK, pid=0,
>> groups=00000000},
>> msg_iov(1)=[{"\34\0\0\0\1\6\0\0\27\214RTO\246\0\0\2\0\0\0\5\0\1\0\6\0\0\0\0\0\0\0"...,
>> 256}], msg_controllen=0, msg_flags=0}, 0) = 28
>> sendto(3, "4\0\0\0\r\6\1\0\30\214RT\0\0\0\0\2\0\0\0\5\0\1\0\6\0\0\0\r\0\3\0"...,
>> 52, 0, {sa_family=AF_NETLINK, pid=0, groups=00000000}, 12
>
> What is your kernel version? Isn't there any message logged by the kernel?
>
> I'm unable to reproduce this at my system, so please recompile ipset with
> debugging enabled ("configure --enable-debug") and re-run the command
> above.
>
> Best regards,
> Jozsef
> -
> E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
> PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
> Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
>           H-1525 Budapest 114, POB. 49, Hungary
