From: Adishesh M <adisheshsm@gmail.com>
Subject: ip6tables command aborts with user defined chain
Date: Wed, 18 Jan 2012 23:46:44 +0530
Message-ID: <CA+f1OFpUv+MKK=Ai0DEMAqKG0Rqt_OWLtLjMZpynOwcXdnGrvQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=sQfauKOzw27J6qaW5GCDYIe9W2+bJg/sWkDTMOwAJ6o=;
        b=FC04frIjwldC34Y0/wZJbm4gJrA6qPSls2AcM2smxgawqAE+Ixnb7Ft5Lm3gQIgt6N
         VCvwNJPKZRshaGlS2SwLzx6TWUL2vYMjUzux11QHQRPrWbCYb1wjVaeTLpR1N+teqSnP
         LEXrWeP1aewQNkX7OIOKZp3dkN9rvQc0UnIlA=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

Below sequence of commands will give ip6tables command abort

it is bug in the ip6table command or i am providing wrong input?


/sbin/ip6tables  -N SERVER_fdb1_b54a_b4d8_2171_a0_
/sbin/ip6tables  -A INPUT -d fdb1:b54a:b4d8:2171:a0:a533:4268:d1d0 -j
SERVER_fdb1_b54a_b4d8_2171_a0_

[root@adim hbfw2]# /sbin/ip6tables  -A INPUT -d
fdb1:b54a:b4d8:2171:a0:a533:4268:d1d0 -j
SERVER_fdb1_b54a_b4d8_2171_a0_
*** buffer overflow detected ***: /sbin/ip6tables terminated
======= Backtrace: =========
/lib/libc.so.6(__fortify_fail+0x4d)[0xae540d]
/lib/libc.so.6[0xae343a]
/lib/libc.so.6(__strcpy_chk+0x44)[0xae2714]
/sbin/ip6tables(do_command6+0x1aa9)[0x804e039]
/sbin/ip6tables(ip6tables_main+0x58)[0x804ad98]
/sbin/ip6tables(main+0xef)[0x8049c8f]
/lib/libc.so.6(__libc_start_main+0xe6)[0xa03cc6]
/sbin/ip6tables[0x8049b01]
======= Memory map: ========
00691000-00692000 r-xp 00000000 fd:00 916610     /lib/xtables/libxt_standard.so
00692000-00693000 rw-p 00000000 fd:00 916610     /lib/xtables/libxt_standard.so
00820000-0083d000 r-xp 00000000 fd:00 935495
/lib/libgcc_s-4.4.5-20110214.so.1
0083d000-0083e000 rw-p 0001d000 fd:00 935495
/lib/libgcc_s-4.4.5-20110214.so.1
009c7000-009e5000 r-xp 00000000 fd:00 935462     /lib/ld-2.12.so
009e5000-009e6000 r--p 0001d000 fd:00 935462     /lib/ld-2.12.so
009e6000-009e7000 rw-p 0001e000 fd:00 935462     /lib/ld-2.12.so
009ed000-00b77000 r-xp 00000000 fd:00 935463     /lib/libc-2.12.so
00b77000-00b79000 r--p 0018a000 fd:00 935463     /lib/libc-2.12.so
00b79000-00b7a000 rw-p 0018c000 fd:00 935463     /lib/libc-2.12.so
00b7a000-00b7d000 rw-p 00000000 00:00 0
00b7f000-00ba7000 r-xp 00000000 fd:00 935489     /lib/libm-2.12.so
00ba7000-00ba8000 r--p 00027000 fd:00 935489     /lib/libm-2.12.so
00ba8000-00ba9000 rw-p 00028000 fd:00 935489     /lib/libm-2.12.so
00bab000-00bae000 r-xp 00000000 fd:00 935469     /lib/libdl-2.12.so
00bae000-00baf000 r--p 00002000 fd:00 935469     /lib/libdl-2.12.so
00baf000-00bb0000 rw-p 00003000 fd:00 935469     /lib/libdl-2.12.so
00bb2000-00bb9000 r-xp 00000000 fd:00 916669     /lib/libxtables.so.4.0.0
00bb9000-00bba000 rw-p 00006000 fd:00 916669     /lib/libxtables.so.4.0.0
00bbc000-00bc2000 r-xp 00000000 fd:00 922985     /lib/libip6tc.so.0.0.0
00bc2000-00bc3000 rw-p 00005000 fd:00 922985     /lib/libip6tc.so.0.0.0
00d96000-00d97000 r-xp 00000000 00:00 0          [vdso]
08048000-08052000 r-xp 00000000 fd:00 397817     /sbin/ip6tables-multi
08052000-08054000 rw-p 0000a000 fd:00 397817     /sbin/ip6tables-multi
0873b000-0875c000 rw-p 00000000 00:00 0          [heap]
b787d000-b787f000 rw-p 00000000 00:00 0
b7897000-b7898000 rw-p 00000000 00:00 0
bfa14000-bfa29000 rw-p 00000000 00:00 0          [stack]
Aborted (core dumped)
[root@adim hbfw2]#

Thanks,
Adishesh
