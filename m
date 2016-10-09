From: Frank Reppin <frank@undermydesk.org>
Subject: ulogd2 / segfault in ulogd_raw2packet_BASE.c with kernel 4.8.1
Date: Sun, 9 Oct 2016 23:31:19 +0200
Message-ID: <de2d542d-c543-d254-beae-990a988effcf@undermydesk.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hellos,

at first - sorry if this is the complete wrong place to
come up with this issue...

OS details:
=============
Debian Jessie 8.6 x64
   ulogd2            -> 2.0.4-2+deb8u1
   iptables          -> 1.4.21-2+b1
   libnetfilter-log1 -> 1.0.1-1.1
   libnfnetlink0      -> 1.0.1-3

Problem:
==========
It segfaults... really soon after I connect via WLAN/hostapd
and some iptables log rule kicks in.

backtrace:
===========
Program received signal SIGSEGV, Segmentation fault.
_interp_iphdr (pi=0x555555768b50, len=0) at ulogd_raw2packet_BASE.c:718
718     ulogd_raw2packet_BASE.c: No such file or directory.
(gdb) bt
#0  _interp_iphdr (pi=0x555555768b50, len=0) at ulogd_raw2packet_BASE.c:718
#1  0x0000555555558dcb in ulogd_propagate_results 
(pi=pi@entry=0x555555766090) at ulogd.c:518
#2  0x00007ffff740d1fb in interp_packet (ldata=0x7fffffffe290, 
pf_family=2 '\002', upi=0x555555766090) at ulogd_inppkt_NFLOG.c:400
#3  msg_cb (gh=<optimized out>, nfmsg=0x7ffff7fc67d8, 
nfa=0x7fffffffe290, data=0x555555766090) at ulogd_inppkt_NFLOG.c:483
#4  0x00007ffff7208307 in ?? () from 
/usr/lib/x86_64-linux-gnu/libnetfilter_log.so.1
#5  0x00007ffff7003627 in nfnl_handle_packet () from 
/usr/lib/x86_64-linux-gnu/libnfnetlink.so.0
#6  0x00007ffff740cafe in nful_read_cb (fd=<optimized out>, 
what=<optimized out>, param=0x555555766090) at ulogd_inppkt_NFLOG.c:463
#7  0x00005555555594a8 in ulogd_select_main (tv=<optimized out>) at 
select.c:105
#8  0x0000555555556ed7 in ulogd_main_loop () at ulogd.c:934
#9  main (argc=<optimized out>, argv=<optimized out>) at ulogd.c:1477

Additional details:
====================
ulogd2 used to behave fine here (no segfaults/no issues at all) with 
previous kernel releases (for example 4.7.7 is OK)


Thankyou for any insights!
Frank Reppin

-- 
43rd Law of Computing:
         Anything that can go wr
fortune: Segmentation violation -- Core dumped
