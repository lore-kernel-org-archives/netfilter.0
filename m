From: =?ISO-8859-1?Q?Salih_G=F6n=FCll=FC?= <sag@open.ch>
Subject: ulogd2 segfault
Date: Fri, 31 Dec 2010 17:23:16 +0100
Message-ID: <4D1E0374.3090008@open.ch>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org


Hi,

ulogd2 is segfaulting upon receipt of sigint or sigterm


Program received signal SIGTERM, Terminated.
0xb78c4430 in __kernel_vsyscall ()
(gdb) cont
Continuing.

Program received signal SIGSEGV, Segmentation fault.
0xb78b71ba in main_arena () from /lib/libc.so.6
(gdb) bt
#0  0xb78b71ba in main_arena () from /lib/libc.so.6
#1  0x0804a35d in ulogd_propagate_results ()
#2  0xb777256c in interp_packet (upi=0x80630f0, pf_family=2 '\002', 
ldata=0xbff01390)
     at ulogd_inppkt_NFLOG.c:400
#3  0xb7772149 in msg_cb (gh=0x8062f58, nfmsg=0xbff01470, 
nfa=0xbff01390, data=0x805f270)
     at ulogd_inppkt_NFLOG.c:472
#4  0xb78bf7d5 in __nflog_rcv_pkt () from /usr/lib/libnetfilter_log.so.1
#5  0xb7767b00 in nfnl_step () from /usr/lib/libnfnetlink.so.0
#6  0xbff013b0 in ?? ()
#7  0x08062f28 in ?? ()
#8  0x00000001 in ?? ()
#9  0xbff01474 in ?? ()
#10 0x00000000 in ?? ()

I have tried with beta4 and with git 
4f652cc32aebeac20f46009f146ad973a1ed0e99


Is there a way to avoid this ?

#ulogd.conf

stack=log2:NFLOG,base1:BASE,ifi1:IFINDEX,ip2str1:IP2STR,print1:PRINTPKT,emu0:LOGEMU


[log2]
group=42

emu0]
file="/var/log/ulogd_sysemu.log"


Regards,

     -salih


-- 
salih goenuellue
security engineer

open systems ag
raeffelstrasse 29
ch-8045 zurich
t +41 44 455 74 00
f +41 44 455 74 01
sag@open.ch

http://www.open.ch
