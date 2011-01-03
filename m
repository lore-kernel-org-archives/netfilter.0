From: =?ISO-8859-1?Q?Salih_G=F6n=FCll=FC?= <sag@open.ch>
Subject: Re: ulogd2 segfault
Date: Mon, 03 Jan 2011 19:12:03 +0100
Message-ID: <4D221173.3060009@open.ch>
References: <4D1E0374.3090008@open.ch>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4D1E0374.3090008@open.ch>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Hi,

my last ulogd.conf was not complete. And I think I found out the cause:

stack=3Dlog2:NFLOG,base1:BASE,ifi1:IFINDEX,ip2str1:IP2STR,print1:PRINTP=
KT,emu0:LOGEMU
stack=3Dlog2:NFLOG,base1:BASE,ifi1:IFINDEX,ip2str1:IP2STR,print1:PRINTP=
KT,syslog1:SYSLOG=20


having other stacks is not a problem as long as the log2:NFLOG is not=20
present, could it be that stop_pluginstances() in this case is doing a=20
double free() ?

Thanks,

    -salih


On 12/31/2010 05:23 PM, Salih G=F6n=FCll=FC wrote:
>
> Hi,
>
> ulogd2 is segfaulting upon receipt of sigint or sigterm
>
>
> Program received signal SIGTERM, Terminated.
> 0xb78c4430 in __kernel_vsyscall ()
> (gdb) cont
> Continuing.
>
> Program received signal SIGSEGV, Segmentation fault.
> 0xb78b71ba in main_arena () from /lib/libc.so.6
> (gdb) bt
> #0 0xb78b71ba in main_arena () from /lib/libc.so.6
> #1 0x0804a35d in ulogd_propagate_results ()
> #2 0xb777256c in interp_packet (upi=3D0x80630f0, pf_family=3D2 '\002'=
,
> ldata=3D0xbff01390)
> at ulogd_inppkt_NFLOG.c:400
> #3 0xb7772149 in msg_cb (gh=3D0x8062f58, nfmsg=3D0xbff01470, nfa=3D0x=
bff01390,
> data=3D0x805f270)
> at ulogd_inppkt_NFLOG.c:472
> #4 0xb78bf7d5 in __nflog_rcv_pkt () from /usr/lib/libnetfilter_log.so=
=2E1
> #5 0xb7767b00 in nfnl_step () from /usr/lib/libnfnetlink.so.0
> #6 0xbff013b0 in ?? ()
> #7 0x08062f28 in ?? ()
> #8 0x00000001 in ?? ()
> #9 0xbff01474 in ?? ()
> #10 0x00000000 in ?? ()
>
> I have tried with beta4 and with git
> 4f652cc32aebeac20f46009f146ad973a1ed0e99
>
>
> Is there a way to avoid this ?
>
> #ulogd.conf
>
> stack=3Dlog2:NFLOG,base1:BASE,ifi1:IFINDEX,ip2str1:IP2STR,print1:PRIN=
TPKT,emu0:LOGEMU
>
>
>
> [log2]
> group=3D42
>
> emu0]
> file=3D"/var/log/ulogd_sysemu.log"
>
>
> Regards,
>
> -salih
>
>
