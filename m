From: Byoungyoung Lee <override@postech.ac.kr>
Subject: structure padding mismatches
Date: Fri, 13 Nov 2009 20:57:00 +0900
Message-ID: <ba3207a80911130357r401977dapf2cc5cddc6319eca@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:sender:received:date
         :x-google-sender-auth:message-id:subject:from:to:content-type;
        bh=Q/7MtUhc1aqwtFP+Ugs1X/myXFM4hlzGCZ/oaQSYWdY=;
        b=bS4GEehDpvVVPvPqsjvd1HnLp6G58zK4SmIHrtLWH0UGcn4EQsIf5EZJblEvpCwM5o
         PP/lM7i1mbE9GZdeedlL3+tbV+4JHtWgynxJhN6DUsQIOo5vPD5mMhP8/ktHh9qJZlsk
         2z7EevwKOLQlsjHWeRQAPIuEuAguEtHbfl4H4=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

I'm trying to install iptables 1.4.5 on embedded ARM machine, which
runs Linux kernel 2.6.15.7,
but I have a problem that kernel module (netfilter) and iptables see
the structure in a different way.


----------------------------------------------------------------------
// in ip_tables.h
/* The argument to IPT_SO_GET_ENTRIES. */
struct ipt_get_entries
{
   /* Which table: user fills this in. */
   char name[IPT_TABLE_MAXNAMELEN];

   /* User fills this in: total entry size. */
   unsigned int size;

   /* The entries. */
   struct ipt_entry entrytable[0];
};
----------------------------------------------------------------------
For example, from the above codes, iptables thinks the size of the
structure as '40',
but netfilter thiks the size of it as '36'.

I tried to solve this problem by appending '__attributed ((packed))'
to the structure,
and I could force iptables to think the structure size as '36',
but it turned out that so many structures which have such size mismatches !

I also tried to give the same compiling option (definitely I'm using
the same compiler, arm-linux-gcc, to build),
but iptables still have a structure padding problem.

The below dumps are what I got when I compiled iptables. It complains
that there are structure padding problems.
-------------------------------------------------------------
arm-linux-gcc -DHAVE_CONFIG_H -I.    -D_LARGEFILE_SOURCE=1
-D_LARGE_FILES -D_FILE_OFFSET_BITS=64   -D_REENTRANT -Wall
-Waggregate-return -Wmissing-declarations       -Wmissing-prototypes
-Wredundant-decls -Wshadow -Wstrict-prototypes  -Winline -pipe
       -DXTABLES_LIBDIR=\"/home/takkyun/trunk/iptables-1.4.5/my_install/libexec/xtables\"
-DXTABLES_INTERNAL -I./include -I./include -I
/home/takkyun/CMEST/PATH/linux-2.6.15.7_2008-01-31/include -I
/home/takkyun/CMEST/PATH/linux-2.6.15.7_2008-01-31/include
-DIPTABLES_MULTI -DALL_INCLUSIVE -ggdb3 -O2 -Wpadded -Wpacked
-mlittle-endian -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs
-fno-strict-aliasing -fno-common -ffreestanding -g -O2
-fno-omit-frame-pointer -fno-optimize-sibling-calls
-fno-omit-frame-pointer -mapcs -mno-sched-prolog -mapcs-32
-mno-thumb-interwork -march=armv5te -mtune=xscale -Wa,-mcpu=xscale
-malignment-traps -msoft-float -Uarm -Wdeclaration-after-statement
-MT iptables_multi-xshared.o -MD -MP -MF
.deps/iptables_multi-xshared.Tpo -c -o iptables_multi-xshared.o `test
-f 'xshared.c' || echo './'`xshared.c
In file included from ./include/xtables.h:17,
                from xshared.c:2:
./include/linux/netfilter/x_tables.h:22: warning: padding struct to
align 'match'
./include/linux/netfilter/x_tables.h:47: warning: padding struct to
align 'target'
./include/linux/netfilter/x_tables.h:78: warning: padding struct size
to alignment boundary
./include/linux/netfilter/x_tables.h:94: warning: padding struct to align 'u16'
-------------------------------------------------------------

How could I make these two programs see the structure as the same?


-- 
Byoungyoung Lee
HPC Lab., Dept. of Computer Science & Engineering, POSTECH, Pohang
Korea 790-784
Tel: +82-54-279-2915, Mobile: +82-10-9260-6720
