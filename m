From: Evan Borgstrom <evan@fatbox.ca>
Subject: conntrackd: segfault at ignore_pool.c:37
Date: Wed, 02 Jul 2008 01:38:18 -0400
Message-ID: <486B144A.8070707@fatbox.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi,

I'm setting up a pair of active-active bridging firewalls that are also 
LVS directors. The last thing I need to get working is connection 
tracking synchronization through conntrackd, but I'm having repeated 
segfaults on only one of the nodes.

They are both running conntrackd from conntrack-tools 0.9.7 which I 
compiled using the Debian control files from 0.9.6.

Both nodes are set with CacheWriteThrough on. When I run Sync in FTFW 
mode the segfault usually takes a little while to occur. If I switch to 
NOTRACK or ALARM mode the segfault happens almost immediately.

In all instances the segfault looks the same and happens at the same 
point at ignore_pool.c. Here's a backtrace from gdb.

(gdb) attach 12436
Attaching to process 12436
Reading symbols from /home/evan/conntrack-tools-0.9.7/src/conntrackd...done.
Using host libthread_db library "/lib/i686/cmov/libthread_db.so.1".
Reading symbols from /usr/lib/libnetfilter_conntrack.so.1...done.
Loaded symbols for /usr/lib/libnetfilter_conntrack.so.1
Reading symbols from /usr/lib/libnfnetlink.so.0...done.
Loaded symbols for /usr/lib/libnfnetlink.so.0
Reading symbols from /lib/i686/cmov/libc.so.6...done.
Loaded symbols for /lib/i686/cmov/libc.so.6
Reading symbols from /lib/i686/cmov/libdl.so.2...done.
Loaded symbols for /lib/i686/cmov/libdl.so.2
Reading symbols from /lib/ld-linux.so.2...done.
Loaded symbols for /lib/ld-linux.so.2
0xffffe410 in __kernel_vsyscall ()
(gdb) continue
Continuing.

Program received signal SIGSEGV, Segmentation fault.
hash (data=0x0, table=0x806c280) at ignore_pool.c:37
37              return jhash_1word(*ip, 0) % table->hashsize;
(gdb) bt full
#0  hash (data=0x0, table=0x806c280) at ignore_pool.c:37
No locals.
#1  0x0804b0e9 in hashtable_test (table=0x806c280, data=0x0) at hash.c:122
         e = <value optimized out>
         id = <value optimized out>
#2  0x0804d4de in ignore_pool_test (ip=0x806c270, ct=0x807ddf0) at 
ignore_pool.c:119
         ret = <value optimized out>
#3  0x0804d12d in ignore_conntrack (ct=0x807ddf0) at netlink.c:47
No locals.
#4  0x0804d152 in dump_handler (type=NFCT_T_UPDATE, ct=0x807ddf0, 
data=0x0) at netlink.c:131
No locals.
#5  0xb7f139e1 in __callback () from /usr/lib/libnetfilter_conntrack.so.1
No symbol table info available.
#6  0xb7f07e80 in ?? () from /usr/lib/libnfnetlink.so.0
No symbol table info available.
#7  0xbf84d5b0 in ?? ()
No symbol table info available.
#8  0xbf84d4f0 in ?? ()
No symbol table info available.
#9  0x0807cac8 in ?? ()
No symbol table info available.
#10 0x00000078 in ?? ()
No symbol table info available.
#11 0xbf84d5c4 in ?? ()
No symbol table info available.
#12 0xbf84d5d8 in ?? ()
No symbol table info available.
#13 0xbf84d5ec in ?? ()
No symbol table info available.
#14 0x00000000 in ?? ()
No symbol table info available.
(gdb)

Has anyone encountered this before?

Let me know if more info is needed or you would like to see my 
conntrackd.conf file.

Thanks,
-Evan

-- 
Evan Borgstrom <evan@fatbox.ca>
FatBox Inc.
255 Richmond St East, Suite 1213
Toronto, Ontario, M5A 4T7
t:416.833.3763 | f:888.829.5963
msn: evan@fatbox.ca | aim: evan@fatbox.ca
