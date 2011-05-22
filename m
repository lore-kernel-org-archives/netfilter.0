From: Mr Dash Four <mr.dash.four@googlemail.com>
Subject: Re: [ANNOUNCE] ipset 6.5 released
Date: Sun, 22 May 2011 14:57:58 +0100
Message-ID: <4DD91666.6010007@googlemail.com>
References: <alpine.DEB.2.00.1105151540340.25248@blackhole.kfki.hu> <4DD145C0.4060705@googlemail.com> <alpine.DEB.2.00.1105170941590.31848@blackhole.kfki.hu> <4DD8158D.4040306@googlemail.com> <alpine.DEB.2.00.1105212323230.23769@blackhole.kfki.hu> <alpine.LNX.2.01.1105212331570.16146@frira.zrqbmnf.qr> <4DD83187.2060301@googlemail.com> <alpine.LNX.2.01.1105212349310.18080@frira.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:message-id:disposition-notification-to:date
         :from:user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=7qTZkaYgQKQjplLHNXvg5wMsK4bzghUay5uUdZUgKaw=;
        b=TzyB74BgkFMtHGRc5N2oJsq03APGeJMVAuKJwKXmdacLmFWFTtN5fRNOzPIrtsjyqo
         KFizs/DCSNrH0r3i8qTtvg1IOMh4BSfrcyu0p9mJZiZQWO6rFYP58TVaGutOlquMwqdV
         ZWzjy3uKnW99sRR0gyMGr6llZnnQoMV0LOFVk=
In-Reply-To: <alpine.LNX.2.01.1105212349310.18080@frira.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>, netfilter@vger.kernel.org


> Get libmnl source (either git or tarball), and get ipset source 
> likewise, and for each, ./configure CFLAGS="-O0 -ggdb3" and make - no 
> install.
>
> Subsequently (substitute by appropriate paths/actions):
>
> LD_LIBRARY_PATH=$HOME/src/libmnl/src/.libs \
> libtool --mode=execute valgrind $HOME/src/ipset/src/ipset $action
>
> Reasonable recipe for any program :)
>   
[me@test1 src]$ cat ipset-6.5-segfault.ips
n priviledged-ports bitmap:port range 1-1023 timeout 0
a priviledged-ports 1-1023
n test-net bitmap:ip range 10.1.1.172/29 timeout 0
a test-net 10.1.1.172/29
n test-ports bitmap:port range 12770-19999 timeout 0
a test-ports 12770-12784
a test-ports 19999
n test-port bitmap:port range 29950-29950 timeout 0
a test-port 29950
COMMIT
[me@test1 src]$ LD_LIBRARY_PATH=/home/me/src/libmnl-1.0.1/src/.libs 
libtool --mode=execute valgrind --track-origins=yes -v 
/home/me/src/ipset-6.5/src/ipset restore < ipset-6.5-segfault.ips
==10502== Memcheck, a memory error detector
==10502== Copyright (C) 2002-2009, and GNU GPL'd, by Julian Seward et al.
==10502== Using Valgrind-3.5.0 and LibVEX; rerun with -h for copyright info
==10502== Command: /home/me/src/ipset-6.5/src/ipset restore
==10502==
--10502-- Valgrind options:
--10502--    --track-origins=yes
--10502--    -v
--10502-- Contents of /proc/version:
--10502--   Linux version 2.6.35.13-91.fc13.x86_64 (me@test1.my.net) 
(gcc version 4.4.5 20101112 (Red Hat 4.4.5-2) (GCC) ) #1 SMP Sat May 21 
02:33:34 BST 2011
--10502-- Arch and hwcaps: AMD64, amd64-sse3-cx16
--10502-- Page sizes: currently 4096, max supported 4096
--10502-- Valgrind library directory: /usr/lib64/valgrind
--10502-- Reading syms from /home/me/src/ipset-6.5/src/ipset (0x400000)
--10502-- Reading syms from /usr/lib64/valgrind/memcheck-amd64-linux 
(0x38000000)
--10502--    object doesn't have a dynamic symbol table
--10502-- Reading syms from /lib64/ld-2.12.2.so (0x3c86600000)
--10502-- Reading suppressions file: /usr/lib64/valgrind/default.supp
--10502-- REDIR: 0x3c86617350 (strlen) redirected to 0x3803f6f7 
(vgPlain_amd64_linux_REDIR_FOR_strlen)
--10502-- Reading syms from 
/usr/lib64/valgrind/vgpreload_core-amd64-linux.so (0x4801000)
--10502-- Reading syms from 
/usr/lib64/valgrind/vgpreload_memcheck-amd64-linux.so (0x4a02000)
==10502== WARNING: new redirection conflicts with existing -- ignoring it
--10502--     new: 0x3c86617350 (strlen              ) R-> 0x04a06340 strlen
--10502-- REDIR: 0x3c866171c0 (index) redirected to 0x4a05f80 (index)
--10502-- REDIR: 0x3c86617240 (strcmp) redirected to 0x4a06900 (strcmp)
--10502-- Reading syms from 
/home/me/src/libmnl-1.0.1/src/.libs/libmnl.so.0.0.1 (0x4c0a000)
--10502-- Reading syms from /lib64/libc-2.12.2.so (0x3c86a00000)
--10502-- REDIR: 0x3c86a815a0 (__GI_strrchr) redirected to 0x4a05e00 
(__GI_strrchr)
--10502-- REDIR: 0x3c86a7fab0 (strlen) redirected to 0x480155c 
(_vgnU_ifunc_wrapper)
==10502== WARNING: new redirection conflicts with existing -- ignoring it
--10502--     new: 0x3c86a7fae0 (__GI_strlen         ) R-> 0x04a062e0 strlen
--10502-- REDIR: 0x3c86a7fae0 (__GI_strlen) redirected to 0x4a06300 
(__GI_strlen)
--10502-- REDIR: 0x3c86a7e070 (strcmp) redirected to 0x480155c 
(_vgnU_ifunc_wrapper)
--10502-- REDIR: 0x3c86b26cc0 (__strcmp_ssse3) redirected to 0x4a06860 
(strcmp)
--10502-- REDIR: 0x3c86a79180 (calloc) redirected to 0x4a043d3 (calloc)
--10502-- REDIR: 0x3c86a7fcb0 (strncmp) redirected to 0x480155c 
(_vgnU_ifunc_wrapper)
--10502-- REDIR: 0x3c86b27f20 (__strncmp_ssse3) redirected to 0x4a067a0 
(strncmp)
--10502-- REDIR: 0x3c86a81cb0 (memchr) redirected to 0x4a069a0 (memchr)
--10502-- REDIR: 0x3c86a83730 (memcpy) redirected to 0x4a069d0 (memcpy)
--10502-- REDIR: 0x3c86a81540 (strncpy) redirected to 0x480155c 
(_vgnU_ifunc_wrapper)
--10502-- REDIR: 0x3c86b24140 (???) redirected to 0x4a06500 (strncpy)
--10502-- REDIR: 0xffffffffff600400 (???) redirected to 0x3803f6ed 
(vgPlain_amd64_linux_REDIR_FOR_vtime)
--10502-- REDIR: 0x3c86a82320 (memset) redirected to 0x4a07540 (memset)
==10502== Syscall param socketcall.sendto(msg) points to uninitialised 
byte(s)
==10502==    at 0x3C86AE1973: __sendto_nocancel (in /lib64/libc-2.12.2.so)
==10502==    by 0x4C0BBAB: mnl_socket_sendto (socket.c:183)
==10502==    by 0x40CAFA: ipset_mnl_query (mnl.c:95)
==10502==    by 0x40AE28: build_send_private_msg (session.c:1567)
==10502==    by 0x40B897: ipset_cmd (session.c:1843)
==10502==    by 0x40C0FB: create_type_get (types.c:239)
==10502==    by 0x40C5D1: ipset_type_get (types.c:382)
==10502==    by 0x4065BA: ipset_parse_typename (parse.c:1389)
==10502==    by 0x40306E: parse_commandline (ipset.c:618)
==10502==    by 0x402204: restore (ipset.c:197)
==10502==    by 0x4031DF: parse_commandline (ipset.c:667)
==10502==    by 0x403485: main (ipset.c:742)
==10502==  Address 0x7fefffe09 is on thread 1's stack
==10502==  Uninitialised value was created by a stack allocation
==10502==    at 0x40ABE7: build_send_private_msg (session.c:1526)
==10502==
--10502-- REDIR: 0x3c86a7fcf0 (__GI_strncmp) redirected to 0x4a06800 
(__GI_strncmp)
--10502-- REDIR: 0x3c86a83490 (__GI_stpcpy) redirected to 0x4a072d0 
(__GI_stpcpy)
--10502-- REDIR: 0x3c86a82e50 (mempcpy) redirected to 0x4a07690 (mempcpy)
--10502-- REDIR: 0x3c86a84bb0 (strchrnul) redirected to 0x4a07620 
(strchrnul)
--10502-- REDIR: 0x3c86a7de00 (strcat) redirected to 0x4a05fb0 (strcat)
ipset v6.5: Error in line 1: Kernel error received: Operation not permitted
--10502-- REDIR: 0x3c86a7a2c0 (free) redirected to 0x4a04ceb (free)
==10502==
==10502== HEAP SUMMARY:
==10502==     in use at exit: 0 bytes in 0 blocks
==10502==   total heap usage: 4 allocs, 4 frees, 13,744 bytes allocated
==10502==
==10502== All heap blocks were freed -- no leaks are possible
==10502==
==10502== ERROR SUMMARY: 1 errors from 1 contexts (suppressed: 6 from 6)
==10502==
==10502== 1 errors in context 1 of 1:
==10502== Syscall param socketcall.sendto(msg) points to uninitialised 
byte(s)
==10502==    at 0x3C86AE1973: __sendto_nocancel (in /lib64/libc-2.12.2.so)
==10502==    by 0x4C0BBAB: mnl_socket_sendto (socket.c:183)
==10502==    by 0x40CAFA: ipset_mnl_query (mnl.c:95)
==10502==    by 0x40AE28: build_send_private_msg (session.c:1567)
==10502==    by 0x40B897: ipset_cmd (session.c:1843)
==10502==    by 0x40C0FB: create_type_get (types.c:239)
==10502==    by 0x40C5D1: ipset_type_get (types.c:382)
==10502==    by 0x4065BA: ipset_parse_typename (parse.c:1389)
==10502==    by 0x40306E: parse_commandline (ipset.c:618)
==10502==    by 0x402204: restore (ipset.c:197)
==10502==    by 0x4031DF: parse_commandline (ipset.c:667)
==10502==    by 0x403485: main (ipset.c:742)
==10502==  Address 0x7fefffe09 is on thread 1's stack
==10502==  Uninitialised value was created by a stack allocation
==10502==    at 0x40ABE7: build_send_private_msg (session.c:1526)
==10502==
--10502--
--10502-- used_suppression:      4 dl-hack3-cond-1
--10502-- used_suppression:      2 glibc-2.5.x-on-SUSE-10.2-(PPC)-2a
==10502==
==10502== ERROR SUMMARY: 1 errors from 1 contexts (suppressed: 6 from 6)

Quite revealing this!
